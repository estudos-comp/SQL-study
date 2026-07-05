<h1 align="center">CATEGORIAS DE INSTRUÇÕES SQL</h1>

<i><p align="center">Separação dos comandos por responsabilidade: estrutura, dados, consulta, segurança e transação.</p></i>

---


## Visão geral

SQL não é apenas `SELECT`. A linguagem agrupa comandos por finalidade. Essa classificação aparece bastante em prova porque força você a distinguir estrutura, conteúdo, consulta, segurança e controle transacional.

| Categoria | Nome | Função | Comandos típicos |
|---|---|---|---|
| DDL | Data Definition Language | Define estruturas do banco. | `CREATE`, `ALTER`, `DROP` |
| DML | Data Manipulation Language | Manipula dados armazenados. | `INSERT`, `UPDATE`, `DELETE` |
| DQL | Data Query Language | Consulta dados. | `SELECT` |
| DCL | Data Control Language | Controla permissões. | `GRANT`, `REVOKE`, `DENY` |
| DTL/TCL | Data Transaction Language / Transaction Control Language | Controla transações. | `COMMIT`, `ROLLBACK`, `SAVEPOINT` |

## DDL — Linguagem de Definição de Dados

DDL altera a estrutura do banco. Exemplo:

```sql
CREATE TABLE aluno (
    mat INTEGER PRIMARY KEY,
    nome VARCHAR(50) NOT NULL
);
```

A tabela criada passa a existir no dicionário de dados do SGBD. DDL trabalha com objetos como:

- tabelas;
- visões;
- índices;
- constraints;
- sequências;
- esquemas.

## DML — Linguagem de Manipulação de Dados

DML altera o conteúdo das tabelas já criadas.

```sql
INSERT INTO aluno (mat, nome)
VALUES (1, 'Maria');

UPDATE aluno
SET nome = 'Maria Silva'
WHERE mat = 1;

DELETE FROM aluno
WHERE mat = 1;
```

DML deve ser usada com atenção porque altera dados reais. Em bancos transacionais, essas alterações podem ser confirmadas com `COMMIT` ou desfeitas com `ROLLBACK`, dependendo da configuração da transação.

## DQL — Linguagem de Consulta de Dados

DQL recupera dados. A consulta descreve o resultado desejado.

```sql
SELECT mat, nome
FROM aluno
WHERE curso = 'Engenharia da Computação';
```

Na disciplina, `SELECT` aparece como base de vários assuntos: projeção, seleção, joins, subconsultas, agregação, views e funções.

## DCL — Linguagem de Controle de Dados

DCL define quem pode acessar ou modificar objetos.

```sql
GRANT SELECT ON empregado TO crp;

REVOKE SELECT ON projeto FROM PUBLIC;
```

`GRANT` concede privilégios. `REVOKE` retira privilégios. `PUBLIC` representa todos os usuários.

## DTL/TCL — Controle de Transação

Controla a permanência das alterações.

```sql
BEGIN TRANSACTION;
UPDATE conta SET saldo = saldo - 500 WHERE id = 1;
UPDATE conta SET saldo = saldo + 500 WHERE id = 2;
COMMIT;
```

Se algo der errado:

```sql
ROLLBACK;
```

## Erro comum

Confundir `DELETE` com `DROP`:

| Comando | O que remove |
|---|---|
| `DELETE FROM tabela` | Linhas da tabela. A estrutura continua existindo. |
| `DROP TABLE tabela` | A tabela inteira: estrutura e dados. |

## Fontes usadas

- `01- SQL - Introdução_2026_1.pdf`, páginas 8, 9, 12 e 15.
- `03 - SQL - DML -2026.pdf`, páginas 2 e 3.
- `05 - SQL _2026.pdf`, páginas 39 a 42.
- `06 - SQL - TransacoesIndices_Indices_Triggers_2026.pdf`, páginas 2 a 4.


---

<tr>
<td width="33%" align="left">
<a href="./01-introducao-e-padroes-sql.md">
<img src="https://img.shields.io/badge/⬅_Voltar-0d1117?style=for-the-badge&labelColor=0d1117&color=39d353" alt="Voltar">
</a>
</td>
<td width="33%" align="center">
<a href="./README.md">
<img src="https://img.shields.io/badge/Índice-0d1117?style=for-the-badge&labelColor=0d1117&color=58a6ff" alt="Índice">
</a>
</td>
<td width="33%" align="right">
<a href="./03-select-projecao-distinct-alias.md">
<img src="https://img.shields.io/badge/Seguir_➔-0d1117?style=for-the-badge&labelColor=0d1117&color=39d353" alt="Seguir">
</a>
</td>
</tr>


