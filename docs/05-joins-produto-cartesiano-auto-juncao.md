<h1 align="center">JOINS, PRODUTO CARTESIANO E AUTOJUNÇÃO</h1>

<i><p align="center">Como combinar tabelas sem multiplicar linhas de forma errada.</p></i>

---


## Produto cartesiano

Quando você coloca mais de uma tabela no `FROM` sem condição de junção, o resultado é o produto cartesiano.

```sql
SELECT *
FROM estoque, peca;
```

Isso combina cada linha de `estoque` com cada linha de `peca`. Raramente é o que o enunciado quer.

## Junção com sintaxe antiga

O material mostra a junção usando tabelas separadas por vírgula e condição no `WHERE`.

```sql
SELECT e.codp, e.coddep, e.quant, p.nome
FROM estoque e, peca p
WHERE e.codp = p.cod;
```

Aqui:

- `estoque e` cria alias `e` para a tabela `estoque`;
- `peca p` cria alias `p` para `peca`;
- `e.codp = p.cod` é a condição de junção.

## `INNER JOIN`

Forma explícita e mais legível:

```sql
SELECT te.codt, te.descricao, p.codp, p.nome
FROM tipo_embal te
INNER JOIN produto p ON te.codt = p.codt;
```

`INNER JOIN` retorna apenas linhas que possuem correspondência nos dois lados da junção.

## Junção com mais de duas tabelas

Exemplo do material: listar nome dos empregados e seus departamentos quando trabalham mais de 20 horas em algum projeto.

```sql
SELECT e.nome, d.nome
FROM empregado e, departamento d, trabalha_em te
WHERE te.horas > 20
  AND te.cad_emp = e.cad
  AND te.num_dep = d.numero;
```

Forma explícita:

```sql
SELECT e.nome, d.nome
FROM trabalha_em te
INNER JOIN empregado e ON te.cad_emp = e.cad
INNER JOIN departamento d ON te.num_dep = d.numero
WHERE te.horas > 20;
```

## `LEFT OUTER JOIN`

`LEFT OUTER JOIN` mantém todas as linhas da tabela da esquerda. Quando não há correspondência na direita, as colunas da direita aparecem como `NULL`.

```sql
SELECT tc.descricao, c.nome
FROM tipo_cliente tc
LEFT OUTER JOIN cliente c ON tc.tipo = c.tipoc;
```

Outro exemplo:

```sql
SELECT *
FROM empregado e
LEFT OUTER JOIN departamento d ON d.gerente = e.noemp;
```

Interpretação: liste todos os empregados; se o empregado for gerente de algum departamento, traga também os dados do departamento. Caso contrário, as colunas do departamento ficam `NULL`.

## Autojunção

Autojunção é uma tabela relacionada com ela mesma. Usa-se aliases diferentes para representar papéis diferentes.

Exemplo: filmes com mesmo nome e estilos diferentes.

```sql
SELECT f1.codigo,
       f1.nome_filme,
       f1.estilo,
       f1.diretor
FROM filme f1, filme f2
WHERE f1.nome_filme = f2.nome_filme
  AND f1.estilo <> f2.estilo;
```

Forma explícita:

```sql
SELECT f1.nome_filme,
       f1.estilo AS estilo_original,
       f2.estilo AS estilo_alternativo
FROM filme f1
INNER JOIN filme f2
        ON f1.nome_filme = f2.nome_filme
       AND f1.estilo <> f2.estilo;
```

## `JOIN` aninhado

O material também mostra junção encadeada:

```sql
SELECT t.cpf, c.nome, tc.descricao
FROM titular t
JOIN cliente c ON c.cliente = t.cliente
JOIN tipo_cliente tc ON tc.tipo_cliente = c.tipo_cliente;
```

A ideia é a mesma: cada `JOIN` adiciona uma tabela e precisa de uma condição que explique como ela se relaciona com o resultado parcial.

## Padrão de prova

- Se o enunciado cita dados em tabelas diferentes, provavelmente precisa de `JOIN`.
- Se aparecerem linhas repetidas demais, suspeite de produto cartesiano.
- Se o enunciado pede “todos os X mesmo sem Y”, geralmente é `LEFT JOIN`.
- Se a mesma tabela aparece com dois papéis, use autojunção com aliases.

## Erros comuns

```sql
-- ERRADO: gera produto cartesiano se não houver condição de junção.
SELECT *
FROM empregado, departamento;
```

```sql
-- CERTO
SELECT e.nome, d.nome
FROM empregado e
INNER JOIN departamento d ON e.num_dep = d.numero;
```

```sql
-- ERRADO: alias declarado precisa ser usado de forma consistente.
SELECT empregado.nome
FROM empregado e;
```

```sql
-- CERTO
SELECT e.nome
FROM empregado e;
```

## Fontes usadas

- `04 - SQL _2026.pptx`, slides 12 a 24 e 46.
- `05 - SQL _2026.pdf`, páginas 32, 33, 35 e 37.


---

<tr>
<td width="33%" align="left">
<a href="./04-where-operadores-filtros.md">
<img src="https://img.shields.io/badge/⬅_Voltar-0d1117?style=for-the-badge&labelColor=0d1117&color=39d353" alt="Voltar">
</a>
</td>
<td width="33%" align="center">
<a href="./README.md">
<img src="https://img.shields.io/badge/Índice-0d1117?style=for-the-badge&labelColor=0d1117&color=58a6ff" alt="Índice">
</a>
</td>
<td width="33%" align="right">
<a href="./06-subconsultas-case-exists-in-all.md">
<img src="https://img.shields.io/badge/Seguir_➔-0d1117?style=for-the-badge&labelColor=0d1117&color=39d353" alt="Seguir">
</a>
</td>
</tr>


