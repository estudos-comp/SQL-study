# Cláusula WHERE em SQL

A `WHERE` cláusula é usada para filtrar registros. Ela é usada para extrair
apenas os registros que atendem a uma condição específica.

```SQL
SELECT column1, column2, ...
FROM table_name
WHERE condition;
```

**EXEMPLO**: Selecionando todos os clientes do México

```SQL
SELECT * FROM Customers
WHERE Country = 'Mexico';
```

> A WHERE não é usada apenas em SELECT, mas também em frases
> UPDATE, DELETE, etc.

## Campos de texto versus campos numéricos

O SQL exige aspas simples em torno de valores de texto. No entanto, os campos
numéricos não devem ser colocados entre aspas.

**EXEMPLO**:

```SQL
SELECT * FROM Customers
WHERE CustomerID = 1;
```

## Operadores na cláusula WHERE

É possível utilizar outros operadores além do `=` para filtrar a pesquisa.

| Operador | Descrição |
|:--: | :--: |
| = | Igual |
| > | Maior que |
| < | Menor que |
| >= | Maior ou igual que |
| <= | Menonr ou igual que |
| <> | Diferente (em algumas versões deve ser !=) |
| BETWEEN | Entre um determinado range |
| LIKE | Busca por um padrão |
| IN | Especificar multiplas possibilidades de valor em uma coluna |

---

<tr>
<td width="33%" align="left">
<a href="./sintaxe-SELECT.md">
<img src="https://img.shields.io/badge/⬅_Voltar-0d1117?style=for-the-badge&labelColor=0d1117&color=39d353 alt="Voltar">
</a>
</td>
<td width="33%" align="right">
<a href="./clausula-WHERE.md">
<img src="https://img.shields.io/badge/Seguir_➔-0d1117?style=for-the-badge&labelColor=0d1117&color=39d353 alt="Seguir">
</a>
</td>
</tr>
