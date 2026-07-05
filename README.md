<h1 align="center">CADERNO SQL — PROVA</h1>

<i><p align="center">Mapa de leitura em ordem incremental. Use como vault: cada arquivo é um assunto, com navegação para voltar, índice e seguir.</p></i>

---


## Ordem recomendada

| Ordem | Assunto | Arquivo |
|:--:|---|---|
| 00 | Guia de estudo e modelo mental | [00-guia-de-estudo-sql.md](./00-guia-de-estudo-sql.md) |
| 01 | Introdução, padrões e SGBDs | [01-introducao-e-padroes-sql.md](./01-introducao-e-padroes-sql.md) |
| 02 | Categorias: DDL, DML, DQL, DCL e DTL | [02-categorias-de-instrucoes-sql.md](./02-categorias-de-instrucoes-sql.md) |
| 03 | `SELECT`, projeção, `DISTINCT` e aliases | [03-select-projecao-distinct-alias.md](./03-select-projecao-distinct-alias.md) |
| 04 | `WHERE` e operadores | [04-where-operadores-filtros.md](./04-where-operadores-filtros.md) |
| 05 | Joins, produto cartesiano e autojunção | [05-joins-produto-cartesiano-auto-juncao.md](./05-joins-produto-cartesiano-auto-juncao.md) |
| 06 | Subconsultas, `CASE`, `EXISTS`, `IN` e `ALL` | [06-subconsultas-case-exists-in-all.md](./06-subconsultas-case-exists-in-all.md) |
| 07 | Funções agregadas, `GROUP BY`, `HAVING`, `ORDER BY` | [07-agregacao-group-by-having-order-by.md](./07-agregacao-group-by-having-order-by.md) |
| 08 | DDL: `CREATE`, `ALTER`, `DROP`, constraints | [08-ddl-create-alter-drop-constraints.md](./08-ddl-create-alter-drop-constraints.md) |
| 09 | Autoincremento por SGBD | [09-autoincremento-sgbds.md](./09-autoincremento-sgbds.md) |
| 10 | DML: `INSERT`, `UPDATE`, `DELETE` | [10-dml-insert-update-delete.md](./10-dml-insert-update-delete.md) |
| 11 | Views e controle de acesso | [11-views-e-controle-de-acesso.md](./11-views-e-controle-de-acesso.md) |
| 12 | Transações, ACID, `COMMIT`, `ROLLBACK`, `SAVEPOINT` | [12-transacoes-acid-commit-rollback-savepoint.md](./12-transacoes-acid-commit-rollback-savepoint.md) |
| 13 | Índices | [13-indices.md](./13-indices.md) |
| 14 | Procedures, functions e triggers | [14-procedures-functions-triggers.md](./14-procedures-functions-triggers.md) |
| 15 | Cheatsheet de prova | [15-cheatsheet-sql-prova.md](./15-cheatsheet-sql-prova.md) |
| 16 | Exercícios de treino | [16-exercicios-treino-sql.md](./16-exercicios-treino-sql.md) |

## Como usar antes da prova

1. Leia os arquivos 01 a 14 em ordem.
2. Refaça os exemplos digitando, não apenas lendo.
3. Use o cheatsheet apenas depois de ter entendido os assuntos.
4. Resolva os exercícios sem olhar as respostas primeiro.
5. Corrija principalmente estes erros: esquecer `WHERE` em `UPDATE`/`DELETE`, misturar coluna comum com agregação sem `GROUP BY`, usar `= NULL` em vez de `IS NULL`, e gerar produto cartesiano sem condição de junção.

## Convenções adotadas

- Palavras-chave SQL em maiúsculas: `SELECT`, `FROM`, `WHERE`.
- Tabelas e colunas em minúsculas nos exemplos novos.
- Strings com aspas simples.
- Exemplos escritos em SQL padrão quando possível, com observações quando a sintaxe muda entre SGBDs.


---

<tr>
<td width="33%" align="left">
<a href="./README.md">
<img src="https://img.shields.io/badge/⬅_Voltar-0d1117?style=for-the-badge&labelColor=0d1117&color=39d353" alt="Voltar">
</a>
</td>
<td width="33%" align="center">
<a href="./README.md">
<img src="https://img.shields.io/badge/Índice-0d1117?style=for-the-badge&labelColor=0d1117&color=58a6ff" alt="Índice">
</a>
</td>
<td width="33%" align="right">
<a href="./00-guia-de-estudo-sql.md">
<img src="https://img.shields.io/badge/Seguir_➔-0d1117?style=for-the-badge&labelColor=0d1117&color=39d353" alt="Seguir">
</a>
</td>
</tr>


