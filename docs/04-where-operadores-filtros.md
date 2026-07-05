<h1 align="center">WHERE E OPERADORES</h1>

<i><p align="center">Como filtrar linhas antes de agregações e antes da formação do resultado final.</p></i>

---


## Função da cláusula `WHERE`

`WHERE` filtra registros. Ela mantém apenas as linhas que satisfazem uma condição booleana.

```sql
SELECT coluna1, coluna2
FROM tabela
WHERE condicao;
```

Exemplo:

```sql
SELECT *
FROM cliente
WHERE pais = 'Mexico';
```

`WHERE` também aparece em `UPDATE` e `DELETE`.

```sql
UPDATE aluno
SET curso = 'Informática'
WHERE curso = 'Ciência da Computação';

DELETE FROM aluno
WHERE mat = 1;
```

## Texto vs número

Textos usam aspas simples.

```sql
SELECT *
FROM cliente
WHERE nome = 'Maria';
```

Números não precisam de aspas.

```sql
SELECT *
FROM cliente
WHERE id_cliente = 1;
```

## Operadores relacionais

| Operador | Significado |
|:--:|---|
| `=` | Igual. |
| `<>` ou `!=` | Diferente. |
| `>` | Maior que. |
| `<` | Menor que. |
| `>=` | Maior ou igual. |
| `<=` | Menor ou igual. |

Exemplo:

```sql
SELECT nome, salario
FROM empregado
WHERE salario > 1000;
```

## Operadores lógicos

| Operador | Função |
|---|---|
| `AND` | Todas as condições precisam ser verdadeiras. |
| `OR` | Pelo menos uma condição precisa ser verdadeira. |
| `NOT` | Nega a condição. |

Use parênteses quando misturar `AND` e `OR`.

```sql
SELECT *
FROM empregado
WHERE salario > 1000
  AND (depto = 1 OR depto = 2);
```

## `BETWEEN` e `NOT BETWEEN`

`BETWEEN` substitui combinações com `>=` e `<=`.

```sql
SELECT *
FROM empregado
WHERE salario BETWEEN 1000 AND 2000;
```

Equivalente conceitual:

```sql
WHERE salario >= 1000 AND salario <= 2000
```

## `LIKE` e `NOT LIKE`

`LIKE` busca padrões em campos de texto.

| Símbolo | Significado |
|:--:|---|
| `%` | Zero ou mais caracteres. |
| `_` | Exatamente um caractere. |

Exemplos:

```sql
SELECT codv, nomev, endereco
FROM vendedor
WHERE endereco LIKE '%Boa Viagem%';
```

```sql
SELECT codv, nomev
FROM vendedor
WHERE nomev LIKE 'C%';
```

```sql
SELECT *
FROM disc
WHERE nomed LIKE '%Maria%';
```

```sql
SELECT *
FROM disc
WHERE nomed LIKE '%_aria%';
```

No último caso, `_aria` exige um caractere antes de `aria`.

## `IS NULL` e `IS NOT NULL`

`NULL` não é igual a nada, nem a outro `NULL`. Por isso, não use `= NULL`.

```sql
SELECT codv, nomev, gerente
FROM vendedor
WHERE gerente IS NULL;
```

```sql
SELECT nomev, gerente
FROM vendedor
WHERE gerente IS NOT NULL;
```

## `IN` e `NOT IN`

`IN` testa se um valor pertence a um conjunto.

```sql
SELECT nome, data_nasc
FROM dependentes
WHERE grau_parentesco IN ('M', 'P');
```

Também pode receber uma subconsulta:

```sql
SELECT d.nome
FROM departamento d
WHERE d.numero IN (
    SELECT p.num_dep
    FROM projeto p
    WHERE p.local = 'RJ'
);
```

## Padrão de prova

- “entre X e Y” → `BETWEEN X AND Y`.
- “começa com Maria” → `LIKE 'Maria%'`.
- “contém Maria” → `LIKE '%Maria%'`.
- “não tem gerente” → `IS NULL`.
- “grau M ou P” → `IN ('M', 'P')`.

## Erros comuns

```sql
-- ERRADO
WHERE gerente = NULL;
```

```sql
-- CERTO
WHERE gerente IS NULL;
```

```sql
-- Ambíguo sem parênteses
WHERE depto = 1 OR depto = 2 AND salario > 1000;
```

Escreva:

```sql
WHERE (depto = 1 OR depto = 2)
  AND salario > 1000;
```

## Fontes usadas

- `clausula-WHERE.md`, arquivo enviado como modelo de caderno.
- `04 - SQL _2026.pptx`, slides 29 a 42.
- `03 - SQL - DML -2026.pdf`, páginas 8 a 12.


---

<tr>
<td width="33%" align="left">
<a href="./03-select-projecao-distinct-alias.md">
<img src="https://img.shields.io/badge/⬅_Voltar-0d1117?style=for-the-badge&labelColor=0d1117&color=39d353" alt="Voltar">
</a>
</td>
<td width="33%" align="center">
<a href="./README.md">
<img src="https://img.shields.io/badge/Índice-0d1117?style=for-the-badge&labelColor=0d1117&color=58a6ff" alt="Índice">
</a>
</td>
<td width="33%" align="right">
<a href="./05-joins-produto-cartesiano-auto-juncao.md">
<img src="https://img.shields.io/badge/Seguir_➔-0d1117?style=for-the-badge&labelColor=0d1117&color=39d353" alt="Seguir">
</a>
</td>
</tr>


