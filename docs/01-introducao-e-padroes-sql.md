<h1 align="center">INTRODUÇÃO E PADRÕES SQL</h1>

<i><p align="center">O que é SQL, de onde veio e por que existe diferença entre padrão e implementação real.</p></i>

---


## Definição

`SQL` significa **Structured Query Language**, ou **Linguagem de Consulta Estruturada**. É uma linguagem comercial de definição, manipulação e consulta de bancos de dados relacionais.

A SQL é própria para operações relacionais, como:

- recuperar linhas e colunas;
- filtrar tuplas;
- combinar tabelas;
- inserir, alterar e remover dados;
- definir estruturas como tabelas, visões, índices e restrições.

## Origem

A origem apresentada no material segue esta linha:

| Ano | Marco |
|:--:|---|
| 1974 | Primeira versão, chamada `SEQUEL`, definida por Chamberlin na IBM. |
| 1975 | Primeiro protótipo implementado. |
| 1986 | Primeira padronização oficial pela ANSI: `SQL-86`. |
| 2023 | Versão recente do padrão: `SQL:2023`. |

## Evolução do padrão

| Padrão | Ideia central |
|---|---|
| `SQL-86` | Comandos básicos de consulta e manipulação. |
| `SQL-89` | Correções e consistência sintática. |
| `SQL-92` | Marco importante: integridade referencial, joins mais robustos e padronização mais rigorosa. |
| `SQL:1999` | SQL/PSM, triggers, suporte a objetos e primeiras funções analíticas. |
| `SQL:2003` | XML e window functions. |
| `SQL:2008` | Melhorias em `MERGE` e dados temporais. |
| `SQL:2011` | Sistemas temporais e consulta sobre histórico. |
| `SQL:2016` | Suporte oficial a JSON. |
| `SQL:2019` | Expansões para big data e integração com linguagens externas. |
| `SQL:2023` | Melhorias para JSON, polymorphic table functions e dados modernos. |

## ANSI SQL vs ISO/IEC 9075

`ANSI SQL` costuma ser usado em livros e disciplinas como sinônimo de SQL padrão, mas tecnicamente se refere às primeiras padronizações feitas pelo **American National Standards Institute**.

`ISO/IEC 9075` é o padrão internacional moderno do SQL. As versões mais recentes são identificadas pelo ano, como `SQL:2016`, `SQL:2019` e `SQL:2023`.

## Padrão não significa implementação idêntica

Nem todo SGBD implementa 100% do padrão. Na prática:

- PostgreSQL costuma ficar próximo do padrão e inclui recursos modernos como JSON e window functions.
- Oracle implementa muitos recursos, mas usa extensões como PL/SQL.
- SQL Server usa T-SQL.
- MySQL/MariaDB têm sintaxes próprias em autoincremento, constraints, triggers e gerenciamento de usuários.

Para prova, se o professor usar uma sintaxe específica dos slides, siga a sintaxe da disciplina. Para projeto real, confira a documentação do SGBD usado.

## Vantagens da padronização

- Independência de fabricante.
- Portabilidade entre sistemas.
- Redução de custo de treinamento.
- Comandos próximos do inglês.
- Consulta interativa.
- Múltiplas visões dos mesmos dados.
- Definição dinâmica das estruturas.

## Ponto crítico

SQL evoluiu muito, mas a base da disciplina permanece nos comandos centrais:

```sql
SELECT
INSERT
UPDATE
DELETE
CREATE
ALTER
DROP
COMMIT
ROLLBACK
GRANT
REVOKE
```

## Fontes usadas

- `01- SQL - Introdução_2026_1.pdf`, páginas 2 a 7, 14, 16, 18 e 19.


---

<tr>
<td width="33%" align="left">
<a href="./00-guia-de-estudo-sql.md">
<img src="https://img.shields.io/badge/⬅_Voltar-0d1117?style=for-the-badge&labelColor=0d1117&color=39d353" alt="Voltar">
</a>
</td>
<td width="33%" align="center">
<a href="./README.md">
<img src="https://img.shields.io/badge/Índice-0d1117?style=for-the-badge&labelColor=0d1117&color=58a6ff" alt="Índice">
</a>
</td>
<td width="33%" align="right">
<a href="./02-categorias-de-instrucoes-sql.md">
<img src="https://img.shields.io/badge/Seguir_➔-0d1117?style=for-the-badge&labelColor=0d1117&color=39d353" alt="Seguir">
</a>
</td>
</tr>


