
# A instrução SQL SELECT

Essa instrução é usada para selecionar dados de um banco de
dados

## Sintaxe SELECT

```SQL
SELECT column1, column2, ...
FROM table_name
```
Aqui, *coluna1*, *coluna2*, ... são os **nomes das colunas** na tabela da qual
você deseja selecionar os dados.

O parâmetro `table_name` representa o **nome da tabela** da qual você deseja
selecionar os dados.

**EXEMPLO**: Selecionar **todas** as colunas da tabela customers

```SQL
SELECT * FROM Customers;
```

### A instrução SQL SELECT DISTINCT

A instrução é usada para retornar apenas valores distintos (únicos).
Em uma tabela, uma coluna pode conter vários valores duplicados, e as vezes
precisar listar apenas valores únicos.

```SQL
SELECT DISTINCT column1, column2, ...
FROM table_name;
```

**EXEMPLO**: Selecionar todos os países distinntos (únicos) da tabela "customers"

```SQL
SELECT DISTINCT Country FROM Customers;
```

### Contar valores distintos

Ao utilizar `COUNT()` com `DISTINCT`, podemos contar o número de países únicos.

**EXEMPLO**

```SQL
SELECT COUNT(DISTINCT Country) FROM Customers;
```

---
<table width="100%">
<tr>
<td width="33%" align="left">
<a href="./sintaxe-SQL.md">
<img src="https://img.shields.io/badge/⬅_Voltar-0d1117?style=for-the-badge&labelColor=0d1117&color=39d353" alt="Voltar">
</a>
</td>
<td width="33%" align="right">
<a href="./clausula-WHERE.md">
<img src="https://img.shields.io/badge/Seguir_➔-0d1117?style=for-the-badge&labelColor=0d1117&color=39d353" alt="Seguir">
</a>
</td>
</tr>
</table>
