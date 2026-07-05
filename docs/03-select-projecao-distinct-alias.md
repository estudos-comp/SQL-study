<h1 align="center">SELECT, PROJEÇÃO, DISTINCT E ALIASES</h1>

<i><p align="center">Base das consultas SQL: escolher colunas, remover duplicatas e renomear resultados.</p></i>

---


## Estrutura básica de uma consulta

```sql
SELECT lista_de_atributos
FROM lista_de_tabelas
WHERE condicao;
```

Significado:

| Parte | Função |
|---|---|
| `SELECT` | Define quais colunas, expressões ou funções serão exibidas. |
| `FROM` | Define de quais tabelas ou views os dados serão recuperados. |
| `WHERE` | Define quais linhas serão mantidas. |

A forma geral apresentada no material é:

```sql
SELECT [DISTINCT] nome_de_atributos_ou_funcoes_agregadas
FROM nome_da_tabela_ou_visao
[WHERE bloco_de_condicao];
```

## Projeção

**Projeção** é selecionar apenas algumas colunas da tabela.

```sql
SELECT codigo, nome
FROM cliente;
```

Exemplo: listar nome e salário de todos os empregados.

```sql
SELECT nome, salario
FROM empregado;
```

## Selecionar todas as colunas

```sql
SELECT *
FROM empregado;
```

Use `*` para inspeção rápida. Em consultas de prova e sistemas reais, prefira listar colunas explicitamente. Isso evita ambiguidade e reduz dependência da ordem física da tabela.

## `DISTINCT`

`DISTINCT` remove linhas duplicadas do resultado final.

```sql
SELECT DISTINCT salario
FROM empregado;
```

Para contar valores distintos:

```sql
SELECT COUNT(DISTINCT pais)
FROM cliente;
```

### Regra importante

`DISTINCT` considera o conjunto de colunas selecionadas, não uma coluna isolada mantendo as demais livres.

```sql
SELECT DISTINCT curso, turma
FROM aluno;
```

Essa consulta remove duplicatas do par `(curso, turma)`. Duas linhas com mesmo curso, mas turmas diferentes, continuam aparecendo.

## Aliases

Aliases renomeiam colunas ou tabelas no resultado/consulta.

```sql
SELECT mat AS matricula
FROM aluno;
```

`AS` pode ser omitido:

```sql
SELECT mat matricula
FROM aluno;
```

Para nomes com espaços, use aspas conforme o SGBD:

```sql
SELECT mat AS "Numero de matricula"
FROM aluno;
```

## Expressões calculadas no `SELECT`

É possível criar uma coluna derivada de cálculo.

```sql
SELECT nome, salario * 1.60 AS novo_salario
FROM empregado
WHERE salario < 10000;
```

Essa coluna não precisa existir fisicamente na tabela. Ela é calculada na saída da consulta.

## Padrão de prova

Quando o enunciado disser:

- “listar nome e salário” → `SELECT nome, salario`;
- “listar todos os dados” → `SELECT *`;
- “listar os diferentes salários” → `SELECT DISTINCT salario`;
- “mostrar como matrícula” → alias com `AS`.

## Erros comuns

```sql
-- ERRO conceitual: DISTINCT não se aplica só a salario aqui.
SELECT DISTINCT salario, nome
FROM empregado;
```

A consulta remove duplicatas do par `(salario, nome)`. Se dois empregados têm mesmo salário e nomes diferentes, ambos aparecem.

```sql
-- Evite em prova se o enunciado pedir colunas específicas.
SELECT *
FROM aluno;
```

Se o enunciado pede `nome` e `curso`, retorne apenas isso.

## Fontes usadas

- `04 - SQL _2026.pptx`, slides 2 a 11 e 25 a 28.
- `sintaxe-SELECT.md` e `sintaxe-SQL.md`, arquivos enviados como modelo de caderno.


---

<tr>
<td width="33%" align="left">
<a href="./02-categorias-de-instrucoes-sql.md">
<img src="https://img.shields.io/badge/⬅_Voltar-0d1117?style=for-the-badge&labelColor=0d1117&color=39d353" alt="Voltar">
</a>
</td>
<td width="33%" align="center">
<a href="./README.md">
<img src="https://img.shields.io/badge/Índice-0d1117?style=for-the-badge&labelColor=0d1117&color=58a6ff" alt="Índice">
</a>
</td>
<td width="33%" align="right">
<a href="./04-where-operadores-filtros.md">
<img src="https://img.shields.io/badge/Seguir_➔-0d1117?style=for-the-badge&labelColor=0d1117&color=39d353" alt="Seguir">
</a>
</td>
</tr>


