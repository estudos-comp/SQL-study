<h1 align="center">TRANSAÇÕES, ACID, COMMIT, ROLLBACK E SAVEPOINT</h1>

<i><p align="center">Como tratar um conjunto de comandos SQL como uma unidade lógica de trabalho.</p></i>

---


## Transação

Uma transação é uma unidade lógica de trabalho composta por uma ou mais instruções SQL executadas como um bloco único.

Objetivo:

- garantir consistência;
- preservar integridade;
- manter confiabilidade dos dados;
- evitar que o banco fique em estado intermediário inválido.

Exemplo clássico: transferência bancária. O débito de uma conta e o crédito em outra precisam acontecer juntos.

## ACID

| Propriedade | Significado |
|---|---|
| Atomicidade | Ou todas as operações são aplicadas, ou nenhuma. |
| Consistência | O banco permanece válido após a transação, respeitando constraints e regras. |
| Isolamento | Transações simultâneas não devem interferir indevidamente entre si. |
| Durabilidade | Depois do `COMMIT`, a alteração é permanente mesmo em caso de falha. |

## Comandos principais

| Comando | Função |
|---|---|
| `BEGIN TRANSACTION` ou `START TRANSACTION` | Inicia uma transação explícita. |
| `COMMIT` | Confirma as alterações e encerra a transação. |
| `ROLLBACK` | Desfaz alterações desde o início da transação ou desde um savepoint. |
| `SAVEPOINT` / `SAVE TRANSACTION` | Cria ponto intermediário para rollback parcial. |

## Exemplo: transferência

```sql
BEGIN TRANSACTION;

UPDATE conta
SET saldo = saldo - 500
WHERE id = 1;

UPDATE conta
SET saldo = saldo + 500
WHERE id = 2;

COMMIT;
```

Se o segundo `UPDATE` falhar, o correto é desfazer tudo, não deixar apenas o débito aplicado.

## Exemplo: pedido e estoque

```sql
BEGIN TRANSACTION;

INSERT INTO pedido (cliente, prod_id, data_pedido)
VALUES ('Maria', 1, CURRENT_TIMESTAMP);

UPDATE estoque
SET qtd = qtd - 1
WHERE id = 1;

COMMIT;
```

Regra: pedido e baixa de estoque devem ser consistentes.

## `ROLLBACK`

```sql
BEGIN TRANSACTION;

DELETE FROM itens
WHERE pedido_id = @pid;

ROLLBACK;
```

O `DELETE` não se torna definitivo. O `ROLLBACK` desfaz a alteração.

## `SAVEPOINT` / rollback parcial

```sql
BEGIN TRANSACTION;

-- Etapa 1
UPDATE venda
SET status = 'PROCESSANDO'
WHERE id = 10;

SAVEPOINT etapa1;

-- Etapa 2
UPDATE estoque
SET qtd = qtd - 1
WHERE produto_id = 5;

-- Se a etapa 2 falhar:
ROLLBACK TO SAVEPOINT etapa1;

COMMIT;
```

O rollback parcial desfaz somente o que ocorreu depois do savepoint.

Em SQL Server, a sintaxe do material aparece como:

```sql
SAVE TRANSACTION Etapa1;
ROLLBACK TRANSACTION Etapa1;
```

## Níveis de isolamento

O material cita os níveis:

| Nível | Ideia geral |
|---|---|
| `READ UNCOMMITTED` | Pode ler dados ainda não confirmados. Menos seguro. |
| `READ COMMITTED` | Lê apenas dados confirmados. Comum como padrão. |
| `REPEATABLE READ` | Evita que uma linha lida mude durante a transação. |
| `SERIALIZABLE` | Maior isolamento, comportamento próximo a execução serial. Mais custo. |

## Quando usar transações

- scripts de criação e carga inicial;
- migrações e alterações de esquema;
- operações de negócio que mexem em várias tabelas;
- procedures e triggers que atualizam tabelas relacionadas;
- testes de consistência com `ROLLBACK`;
- simulações sem alterar permanentemente os dados.

## Padrão de prova

- “tudo ou nada” → atomicidade.
- “confirmar alterações” → `COMMIT`.
- “desfazer alterações” → `ROLLBACK`.
- “desfazer só parte” → `SAVEPOINT`.
- “transações simultâneas” → isolamento.
- “após confirmar, não perde” → durabilidade.

## Fontes usadas

- `06 - SQL - TransacoesIndices_Indices_Triggers_2026.pdf`, páginas 2 a 10.


---

<tr>
<td width="33%" align="left">
<a href="./11-views-e-controle-de-acesso.md">
<img src="https://img.shields.io/badge/⬅_Voltar-0d1117?style=for-the-badge&labelColor=0d1117&color=39d353" alt="Voltar">
</a>
</td>
<td width="33%" align="center">
<a href="./README.md">
<img src="https://img.shields.io/badge/Índice-0d1117?style=for-the-badge&labelColor=0d1117&color=58a6ff" alt="Índice">
</a>
</td>
<td width="33%" align="right">
<a href="./13-indices.md">
<img src="https://img.shields.io/badge/Seguir_➔-0d1117?style=for-the-badge&labelColor=0d1117&color=39d353" alt="Seguir">
</a>
</td>
</tr>


