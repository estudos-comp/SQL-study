<h1 align="center">SUBCONSULTAS, CASE, EXISTS, IN E ALL</h1>

<i><p align="center">Consultas dentro de consultas e expressões condicionais em SQL.</p></i>

---


## Subconsulta

Subconsulta é uma consulta SQL dentro de outra consulta. Ela produz um valor, linha ou tabela intermediária usada pela consulta externa.

Pode aparecer em:

- `SELECT`;
- `FROM`;
- `WHERE`;
- `HAVING`.

## Tipos principais

| Tipo | Retorno | Uso comum |
|---|---|---|
| Escalar | Um único valor. | Comparar com média, máximo ou mínimo. |
| Linha | Uma linha com uma ou mais colunas. | Comparações por tupla, quando suportado. |
| Tabela | Várias linhas e colunas. | Fonte derivada no `FROM` ou conjunto no `IN`. |

## Subconsulta escalar no `SELECT`

```sql
SELECT nome,
       (SELECT AVG(salario) FROM funcionario) AS media_salarial
FROM funcionario;
```

A média é calculada uma vez como valor escalar e aparece em cada linha do resultado.

## Subconsulta no `WHERE`

```sql
SELECT nome, salario
FROM funcionario
WHERE salario > (
    SELECT AVG(salario)
    FROM funcionario
);
```

Interpretação: traga funcionários cujo salário é maior que a média geral.

Outro exemplo:

```sql
SELECT nome, salario
FROM funcionario
WHERE salario = (
    SELECT MAX(salario)
    FROM funcionario
);
```

## `IN` com subconsulta

`IN` verifica se o valor de uma coluna pertence ao conjunto retornado pela subconsulta.

```sql
SELECT d.nome
FROM departamento d
WHERE d.numero IN (
    SELECT p.num_dep
    FROM projeto p
    WHERE p.local = 'RJ'
);
```

A subconsulta retorna departamentos que possuem projetos no RJ. A consulta externa lista os nomes desses departamentos.

Outro exemplo:

```sql
SELECT d.nomed
FROM disc d
WHERE d.d IN (
    SELECT ap.d
    FROM aluno_paga ap
);
```

## Subconsulta com `JOIN`

Exemplo: listar alunos que pagam disciplinas com carga horária diferente de 60h.

```sql
SELECT a.nomea
FROM aluno a
INNER JOIN aluno_paga ap ON ap.mat = a.mat
WHERE ap.d IN (
    SELECT d.d
    FROM disc d
    WHERE d.carga_h != 60
);
```

## Comparação de múltiplos atributos

Alguns SGBDs aceitam tuplas em `IN`:

```sql
SELECT a.nomea
FROM aluno a
WHERE (a.d, a.curso) IN (
    SELECT d.d, d.curso
    FROM disc d
    WHERE d.carga_h != 60
);
```

Isso faz parte do padrão SQL, mas não é implementado igualmente por todos os SGBDs. Em prova, use se o material da disciplina tiver apresentado ou se o professor aceitar padrão SQL.

## Consulta correlacionada

Na consulta correlacionada, a subconsulta depende da linha atual da consulta externa.

```sql
SELECT e.pnome, e.unome
FROM empregado e
WHERE e.enum IN (
    SELECT d.enum
    FROM dependente d
    WHERE e.sexo = d.sexo
);
```

Essa consulta interna usa `e.sexo`, que vem da consulta externa.

Pode ser reescrita como junção:

```sql
SELECT e.pnome, e.unome
FROM empregado e, dependente d
WHERE e.enum = d.enum
  AND e.sexo = d.sexo;
```

## `EXISTS`

`EXISTS` testa se a subconsulta retorna pelo menos uma linha.

```sql
SELECT d.cod_d, d.nome_d
FROM disc d
WHERE EXISTS (
    SELECT *
    FROM aluno_paga ap
    WHERE d.cod_d = ap.cod_d
);
```

`EXISTS(Q)` é verdadeiro quando `Q` retorna ao menos uma tupla. É falso quando `Q` retorna conjunto vazio.

## `EXISTS` vs `IN`

| Operador | Forma | Retorno lógico |
|---|---|---|
| `IN` | `coluna IN (subconsulta)` | Verifica se o valor da coluna pertence à lista retornada. |
| `EXISTS` | `EXISTS (subconsulta)` | Verifica se a subconsulta tem alguma linha. |

Com `EXISTS`, não se coloca nome de coluna antes da cláusula.

```sql
-- IN
WHERE codf IN (SELECT codf FROM dependente)

-- EXISTS
WHERE EXISTS (
    SELECT *
    FROM dependente d
    WHERE d.codf = f.codf
)
```

## `ALL`

`ALL` compara um valor com todos os valores retornados por uma subconsulta.

```sql
SELECT nome, sobrenome
FROM empregado
WHERE salario > ALL (
    SELECT salario
    FROM empregado
    WHERE depto = 5
);
```

Interpretação: traga empregados cujo salário é maior que todos os salários do departamento 5.

## `CASE`

`CASE` cria expressão condicional diretamente em SQL. Funciona como `if/else` dentro da consulta.

```sql
CASE
    WHEN condicao1 THEN resultado1
    WHEN condicao2 THEN resultado2
    ELSE resultado_padrao
END
```

Exemplo: classificar salários.

```sql
SELECT nome,
       salario,
       CASE
           WHEN salario > 4000 THEN 'Alto'
           WHEN salario BETWEEN 2000 AND 4000 THEN 'Médio'
           ELSE 'Baixo'
       END AS faixa_salarial
FROM funcionario;
```

`CASE` também pode aparecer em `ORDER BY`.

```sql
SELECT nome, departamento
FROM funcionario
ORDER BY
    CASE
        WHEN departamento = 'Vendas' THEN 1
        WHEN departamento = 'TI' THEN 2
        ELSE 3
    END;
```

## Padrão de prova

- “maior que a média” → subconsulta escalar com `AVG`.
- “maior salário” → subconsulta escalar com `MAX`.
- “qualquer projeto em RJ” → `IN` com subconsulta.
- “existe dependente” → `EXISTS` correlacionado.
- “maior que todos” → `> ALL`.
- “classificar em faixas” → `CASE`.

## Fontes usadas

- `04 - SQL _2026.pptx`, slides 42 a 55 e 61 a 68.


---

<tr>
<td width="33%" align="left">
<a href="./05-joins-produto-cartesiano-auto-juncao.md">
<img src="https://img.shields.io/badge/⬅_Voltar-0d1117?style=for-the-badge&labelColor=0d1117&color=39d353" alt="Voltar">
</a>
</td>
<td width="33%" align="center">
<a href="./README.md">
<img src="https://img.shields.io/badge/Índice-0d1117?style=for-the-badge&labelColor=0d1117&color=58a6ff" alt="Índice">
</a>
</td>
<td width="33%" align="right">
<a href="./07-agregacao-group-by-having-order-by.md">
<img src="https://img.shields.io/badge/Seguir_➔-0d1117?style=for-the-badge&labelColor=0d1117&color=39d353" alt="Seguir">
</a>
</td>
</tr>


