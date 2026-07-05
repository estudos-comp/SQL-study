<h1 align="center">PROCEDURES, FUNCTIONS E TRIGGERS</h1>

<i><p align="center">Objetos programáveis armazenados no banco para regras, cálculos e automações.</p></i>

---


## Stored procedures

Procedure é um bloco de comandos SQL gravado no banco.

Características:

- tem nome;
- pode ter parâmetros;
- pode declarar variáveis locais;
- possui corpo de comandos;
- pode ser chamada várias vezes;
- encapsula regra de negócio próxima aos dados.

Faz parte do padrão SQL/PSM, embora cada SGBD tenha diferenças de sintaxe.

## Parâmetros de procedure

| Modo | Significado |
|---|---|
| `IN` | Entrada. O chamador passa valor para a procedure. |
| `OUT` | Saída. A procedure devolve valor. |
| `INOUT` | Entrada e saída. |

## Forma geral

```sql
CREATE PROCEDURE nome_procedure (parametros)
BEGIN
    -- comandos SQL e lógica
END;
```

Comandos possíveis no corpo:

- `SELECT`;
- `INSERT`;
- `UPDATE`;
- `DELETE`;
- `IF`;
- `WHILE`;
- `FOR`;
- `CASE`.

## Exemplo: aplicar desconto

```sql
CREATE PROCEDURE aplicar_desconto (
    IN p_id_cliente INTEGER,
    IN p_percentual DECIMAL(5,2)
)
BEGIN
    UPDATE venda
    SET valor_total = valor_total * (1 - p_percentual / 100)
    WHERE id_cliente = p_id_cliente;
END;
```

## Exemplo com variável local e regra de negócio

```sql
CREATE PROCEDURE aplicar_desconto_cliente (
    IN p_id_cliente INTEGER,
    IN p_percentual DECIMAL(5,2)
)
BEGIN
    DECLARE v_total_cliente DECIMAL(12,2);
    DECLARE v_desconto DECIMAL(5,2);

    SET v_total_cliente = CASE
        WHEN (SELECT SUM(valor_total)
              FROM venda
              WHERE id_cliente = p_id_cliente) IS NULL
        THEN 0
        ELSE (SELECT SUM(valor_total)
              FROM venda
              WHERE id_cliente = p_id_cliente)
    END;

    IF v_total_cliente >= 1000.00 THEN
        SET v_desconto = p_percentual;
    ELSE
        SET v_desconto = 0;
    END IF;

    IF v_desconto > 0 THEN
        UPDATE venda
        SET valor_total = valor_total * (1 - v_desconto / 100)
        WHERE id_cliente = p_id_cliente
          AND status = 'ABERTA';
    END IF;
END;
```

## Functions

Function também é bloco SQL gravado no banco, mas sempre retorna um valor.

Forma geral:

```sql
CREATE FUNCTION nome_funcao (parametros)
RETURNS tipo_retorno
BEGIN
    RETURN expressao;
END;
```

Exemplo:

```sql
CREATE FUNCTION calcular_total_item (
    preco DECIMAL(10,2),
    qtd INT
)
RETURNS DECIMAL(10,2)
BEGIN
    RETURN preco * qtd;
END;
```

Uso:

```sql
SELECT calcular_total_item(preco, quantidade)
FROM item_pedido;
```

## Quando usar functions

- encapsular fórmulas recorrentes;
- calcular impostos, comissão ou desconto;
- padronizar texto ou tratar dados;
- reutilizar regras em consultas e views.

Em muitos SGBDs, funções têm restrições para alterar dados. Em geral, use function para cálculo e procedure para processo com efeito colateral.

## Triggers

Trigger é objeto associado a uma tabela. Ele executa automaticamente em resposta a eventos como:

- `INSERT`;
- `UPDATE`;
- `DELETE`.

Pode disparar:

- `BEFORE`: antes da operação;
- `AFTER`: depois da operação.

Forma geral:

```sql
CREATE TRIGGER nome_trigger
BEFORE INSERT ON nome_tabela
FOR EACH ROW
BEGIN
    -- instruções
END;
```

## `BEFORE` vs `AFTER`

| Momento | Uso típico |
|---|---|
| `BEFORE` | Validação ou ajuste antes da gravação. |
| `AFTER` | Auditoria, logs, atualizações em cascata ou backups. |

## `NEW` e `OLD`

| Palavra | Significado |
|---|---|
| `NEW` | Valores novos após `INSERT` ou `UPDATE`. |
| `OLD` | Valores antigos antes de `UPDATE` ou `DELETE`. |

## Exemplo: validar e-mail

```sql
CREATE TRIGGER trg_check_email
BEFORE INSERT ON clientes
FOR EACH ROW
BEGIN
    IF NEW.email IS NULL THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Email não pode ser nulo';
    END IF;
END;
```

`SIGNAL` lança erro personalizado. `SQLSTATE '45000'` representa erro genérico definido pelo usuário.

## SQLSTATEs citados no material

| Código | Significado |
|---|---|
| `23000` | Violação de constraint. |
| `42000` | Erro de sintaxe. |
| `40001` | Deadlock. |
| `45000` | Erro genérico lançado pelo usuário. |

## Exemplo: log após inserção de pedido

```sql
CREATE TRIGGER trg_log_pedido
AFTER INSERT ON pedido
FOR EACH ROW
BEGIN
    INSERT INTO log_pedidos (pedido_id, data_log, acao)
    VALUES (NEW.id, CURRENT_TIMESTAMP, 'INSERT');
END;
```

## Exemplo: log após atualização

```sql
CREATE TRIGGER trg_log_pedido_update
AFTER UPDATE ON pedido
FOR EACH ROW
BEGIN
    INSERT INTO log_pedidos (pedido_id_novo, pedido_id_antigo, data_log, acao)
    VALUES (NEW.id, OLD.id, CURRENT_TIMESTAMP, 'UPDATE');
END;
```

## Remover trigger

```sql
DROP TRIGGER trg_log_pedido;
```

Observação do material: trigger não é alterado diretamente; normalmente é recriado.

## Restrição sobre múltiplos triggers

O material registra que não é possível criar mais de um trigger para o mesmo evento e momento de execução na mesma tabela. Exemplo: não criar dois `AFTER INSERT` na mesma tabela. Essa regra pode variar por SGBD, mas para a prova siga a restrição apresentada.

## Diferença rápida

| Objeto | Chamado por | Retorna valor? | Uso típico |
|---|---|---|---|
| Procedure | Usuário/aplicação | Não necessariamente. | Processo/regra de negócio. |
| Function | Consulta ou expressão | Sim. | Cálculo reutilizável. |
| Trigger | Evento de tabela | Não diretamente. | Validação, log, auditoria, automação. |

## Fontes usadas

- `06 - SQL - TransacoesIndices_Indices_Triggers_2026.pdf`, páginas 16 a 29.


---

<tr>
<td width="33%" align="left">
<a href="./13-indices.md">
<img src="https://img.shields.io/badge/⬅_Voltar-0d1117?style=for-the-badge&labelColor=0d1117&color=39d353" alt="Voltar">
</a>
</td>
<td width="33%" align="center">
<a href="./README.md">
<img src="https://img.shields.io/badge/Índice-0d1117?style=for-the-badge&labelColor=0d1117&color=58a6ff" alt="Índice">
</a>
</td>
<td width="33%" align="right">
<a href="./15-cheatsheet-sql-prova.md">
<img src="https://img.shields.io/badge/Seguir_➔-0d1117?style=for-the-badge&labelColor=0d1117&color=39d353" alt="Seguir">
</a>
</td>
</tr>


