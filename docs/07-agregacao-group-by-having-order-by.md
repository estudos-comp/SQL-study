<h1 align="center">AGREGAÇÃO, GROUP BY, HAVING E ORDER BY</h1>

<i><p align="center">Resumo de dados por grupos e organização da saída.</p></i>

---


## `ORDER BY`

`ORDER BY` ordena o resultado final da consulta.

```sql
SELECT nome
FROM cliente
ORDER BY nome;
```

Ordem decrescente:

```sql
SELECT nomed
FROM disc
ORDER BY nomed DESC;
```

Se não for especificado, muitos SGBDs usam `ASC` como padrão, mas não dependa de ordem sem `ORDER BY`.

## Funções agregadas

Funções agregadas produzem um valor a partir de várias linhas.

| Função | Função |
|---|---|
| `AVG()` | Média. |
| `MAX()` | Maior valor. |
| `MIN()` | Menor valor. |
| `SUM()` | Soma. |
| `COUNT()` | Contagem. |

Exemplos:

```sql
SELECT AVG(renda)
FROM cliente;
```

```sql
SELECT MAX(renda)
FROM cliente;
```

```sql
SELECT COUNT(renda)
FROM cliente;
```

```sql
SELECT COUNT(*)
FROM cliente;
```

## `COUNT(coluna)` vs `COUNT(*)`

| Forma | O que conta |
|---|---|
| `COUNT(*)` | Conta linhas, inclusive linhas com valores nulos em alguma coluna. |
| `COUNT(coluna)` | Conta valores não nulos daquela coluna. |
| `COUNT(DISTINCT coluna)` | Conta valores distintos e não nulos da coluna. |

Exemplo do material: quando `quantidade` tem `NULL`, `COUNT(*)` conta a linha, mas `COUNT(quantidade)` não conta o valor nulo.

## `GROUP BY`

`GROUP BY` agrupa linhas que possuem o mesmo valor em uma ou mais colunas. Depois, as funções agregadas são calculadas para cada grupo.

```sql
SELECT nome, SUM(quantidade)
FROM x
GROUP BY nome;
```

Exemplo: listar, para cada pedido, o número de produtos.

```sql
SELECT num_pedido, COUNT(*) AS total_produtos
FROM item_pedido
GROUP BY num_pedido;
```

Exemplo: para cada departamento, recuperar número de empregados e média salarial.

```sql
SELECT nodepto,
       COUNT(*) AS numero_empregados,
       AVG(salario) AS media_salarios
FROM empregado
GROUP BY nodepto;
```

## Regra central do `GROUP BY`

Se uma coluna aparece no `SELECT` e não está dentro de uma função agregada, ela precisa aparecer no `GROUP BY`.

Errado:

```sql
SELECT id_gerente,
       nome,
       MAX(limite_credito)
FROM empregados
GROUP BY id_gerente;
```

`nome` não está agregado e não está no `GROUP BY`.

Certo:

```sql
SELECT id_gerente,
       nome,
       MAX(limite_credito)
FROM empregados
GROUP BY id_gerente, nome;
```

Mas atenção: adicionar `nome` muda o nível de agrupamento. Agora o grupo é `(id_gerente, nome)`, não apenas `id_gerente`.

## `WHERE` antes do `GROUP BY`

`WHERE` filtra linhas antes da formação dos grupos.

```sql
SELECT id_gerente,
       COUNT(id_empreg) AS num_de_empreg,
       MIN(limite_credito) AS credito_minimo,
       MAX(limite_credito) AS credito_maximo
FROM empregado
WHERE id_gerente IS NOT NULL
GROUP BY id_gerente;
```

Fluxo:

1. remove empregados sem gerente;
2. agrupa por `id_gerente`;
3. calcula contagem, mínimo e máximo por grupo.

## `HAVING`

`HAVING` filtra grupos já formados.

```sql
SELECT codproduto,
       SUM(qtd) AS total_itens_vendidos
FROM itempedido
GROUP BY codproduto
HAVING SUM(qtd) >= 50;
```

Exemplo: listar departamentos com mais de 5 empregados que recebem salário superior a R$ 1.000,00.

```sql
SELECT num_dep, COUNT(*)
FROM empregado
WHERE salario > 1000
GROUP BY num_dep
HAVING COUNT(*) > 5;
```

Aqui:

- `WHERE salario > 1000` remove linhas antes do agrupamento;
- `GROUP BY num_dep` agrupa por departamento;
- `HAVING COUNT(*) > 5` mantém apenas grupos com mais de 5 empregados.

## Ordem completa com agregação

```sql
SELECT coluna_grupo,
       COUNT(*) AS total
FROM tabela
WHERE condicao_de_linha
GROUP BY coluna_grupo
HAVING COUNT(*) > 1
ORDER BY coluna_grupo DESC;
```

## Padrão de prova

- “para cada” → quase sempre `GROUP BY`.
- “quantos” → `COUNT`.
- “soma total” → `SUM`.
- “média” → `AVG`.
- “maior/menor” → `MAX`/`MIN`.
- “somente grupos com...” → `HAVING`.
- “ordenado por...” → `ORDER BY`.

## Fontes usadas

- `04 - SQL _2026.pptx`, slides 27, 28 e 56 a 60.
- `05 - SQL _2026.pdf`, páginas 2 a 29.


---

<tr>
<td width="33%" align="left">
<a href="./06-subconsultas-case-exists-in-all.md">
<img src="https://img.shields.io/badge/⬅_Voltar-0d1117?style=for-the-badge&labelColor=0d1117&color=39d353" alt="Voltar">
</a>
</td>
<td width="33%" align="center">
<a href="./README.md">
<img src="https://img.shields.io/badge/Índice-0d1117?style=for-the-badge&labelColor=0d1117&color=58a6ff" alt="Índice">
</a>
</td>
<td width="33%" align="right">
<a href="./08-ddl-create-alter-drop-constraints.md">
<img src="https://img.shields.io/badge/Seguir_➔-0d1117?style=for-the-badge&labelColor=0d1117&color=39d353" alt="Seguir">
</a>
</td>
</tr>


