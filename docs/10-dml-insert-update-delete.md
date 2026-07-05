<h1 align="center">DML: INSERT, UPDATE E DELETE</h1>

<i><p align="center">Comandos que alteram o conteúdo das tabelas.</p></i>

---


## Visão geral

SQL possui três instruções centrais para atualização do conteúdo de tabelas já criadas:

| Comando | Função |
|---|---|
| `INSERT` | Insere uma ou mais linhas. |
| `UPDATE` | Altera dados de uma ou mais linhas. |
| `DELETE` | Exclui uma ou mais linhas. |

## `INSERT`

Forma geral:

```sql
INSERT INTO tabela (lista_de_atributos)
VALUES (lista_de_valores);
```

Exemplo sem listar colunas:

```sql
INSERT INTO fornec
VALUES ('F10', 'Ambrósio', 12, 'Curitiba');
```

Problema: você precisa lembrar exatamente a ordem das colunas definida no `CREATE TABLE`.

Forma preferível:

```sql
INSERT INTO fornec (cod_fornec, nome_fornec, cidade_fornec, status_fornec)
VALUES ('F10', 'Ambrósio', 'Curitiba', 12);
```

Vantagens:

- não depende da ordem física da tabela;
- permite omitir atributos que aceitam `NULL` ou possuem valor padrão;
- melhora legibilidade;
- reduz erro quando a tabela muda.

## `INSERT` com `NULL` ou valor atual

```sql
INSERT INTO ator (ator, nome, data_nascimento)
VALUES (101, 'Teste 101', NULL);
```

```sql
INSERT INTO ator (ator, nome, data_nascimento)
VALUES (102, 'Teste 102', CURRENT_DATE);
```

O material cita `NOW`; essa função existe em vários SGBDs, mas a forma exata varia. `CURRENT_DATE` e `CURRENT_TIMESTAMP` são mais portáveis.

## Restrições são verificadas no `INSERT`

A criação da linha só é efetivada se as restrições forem obedecidas:

- `NOT NULL`;
- `PRIMARY KEY`;
- `UNIQUE`;
- `FOREIGN KEY`;
- `CHECK`.

Se uma chave estrangeira aponta para uma linha inexistente, o `INSERT` falha.

## `UPDATE`

Forma geral:

```sql
UPDATE tabela
SET campo = valor
WHERE condicao;
```

Exemplos:

```sql
UPDATE empregado
SET salario = 1500
WHERE cad = 15;
```

```sql
UPDATE ator
SET sexo = 'M'
WHERE ator = 1;
```

```sql
UPDATE aluno
SET curso = 'Informática'
WHERE curso = 'Ciência da Computação';
```

```sql
UPDATE depto
SET nome_depto = NULL
WHERE nome_depto = 'Direito';
```

## Cuidado com `UPDATE` sem `WHERE`

```sql
UPDATE empregado
SET salario = 1500;
```

Essa consulta altera todas as linhas da tabela. Só faça isso quando a intenção for realmente atualizar a tabela inteira.

## `DELETE`

Forma geral:

```sql
DELETE FROM tabela
WHERE condicao;
```

Exemplos:

```sql
DELETE FROM aluno
WHERE mat = 1;
```

```sql
DELETE FROM empregado
WHERE salario > 5000;
```

Apagar todas as linhas:

```sql
DELETE FROM ator;
```

O material observa que `DELETE` gera registro de log para cada linha. Em geral, isso permite controle transacional e recuperação, dependendo do SGBD.

## `DELETE` vs `DROP TABLE`

```sql
DELETE FROM ator;
```

Remove as linhas, mas a tabela continua existindo.

```sql
DROP TABLE ator;
```

Remove a tabela do banco.

## Padrão seguro para prova e prática

Antes de `UPDATE` ou `DELETE`, rode um `SELECT` com o mesmo `WHERE`.

```sql
SELECT *
FROM aluno
WHERE mat = 1;
```

Depois:

```sql
DELETE FROM aluno
WHERE mat = 1;
```

Para alterações importantes, use transação:

```sql
BEGIN TRANSACTION;

UPDATE venda_produto
SET quantidade = 0
WHERE cod_produto = 1;

-- Se estiver correto:
COMMIT;

-- Se estiver errado:
-- ROLLBACK;
```

## Fontes usadas

- `03 - SQL - DML -2026.pdf`, páginas 2 a 12.


---

<tr>
<td width="33%" align="left">
<a href="./09-autoincremento-sgbds.md">
<img src="https://img.shields.io/badge/⬅_Voltar-0d1117?style=for-the-badge&labelColor=0d1117&color=39d353" alt="Voltar">
</a>
</td>
<td width="33%" align="center">
<a href="./README.md">
<img src="https://img.shields.io/badge/Índice-0d1117?style=for-the-badge&labelColor=0d1117&color=58a6ff" alt="Índice">
</a>
</td>
<td width="33%" align="right">
<a href="./11-views-e-controle-de-acesso.md">
<img src="https://img.shields.io/badge/Seguir_➔-0d1117?style=for-the-badge&labelColor=0d1117&color=39d353" alt="Seguir">
</a>
</td>
</tr>


