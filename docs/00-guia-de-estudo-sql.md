<h1 align="center">GUIA DE ESTUDO SQL</h1>

<i><p align="center">Modelo mental mínimo para não decorar consulta como texto solto.</p></i>

---


## O que SQL faz

SQL é uma linguagem declarativa para bancos relacionais. Em vez de dizer passo a passo como percorrer dados, você descreve o resultado desejado. O SGBD decide o plano físico: varredura de tabela, uso de índice, ordem de junção, entre outros.

A prova normalmente cobra dois níveis ao mesmo tempo:

- **sintaxe**: escrever comandos válidos;
- **semântica**: entender qual conjunto de linhas a consulta realmente retorna.

## Modelo mental de uma consulta

Forma escrita comum:

```sql
SELECT coluna_1, coluna_2
FROM tabela
WHERE condicao
GROUP BY coluna_1
HAVING condicao_do_grupo
ORDER BY coluna_1;
```

Ordem lógica de avaliação:

1. `FROM`: escolhe a origem dos dados.
2. `JOIN`/condições de junção: combina tabelas.
3. `WHERE`: filtra linhas individuais.
4. `GROUP BY`: forma grupos.
5. Funções agregadas: calculam valores por grupo.
6. `HAVING`: filtra grupos.
7. `SELECT`: escolhe as colunas/expressões finais.
8. `DISTINCT`: remove duplicatas do resultado final.
9. `ORDER BY`: ordena a saída.

Essa ordem explica a maior parte dos erros de prova. `WHERE` não filtra soma de grupo; para isso existe `HAVING`. Uma coluna no `SELECT` junto com agregação precisa estar no `GROUP BY`, salvo quando ela também estiver agregada.

## Divisão do conteúdo da prova

| Bloco | Pergunta que você deve saber responder |
|---|---|
| Introdução | O que é SQL, por que existe padrão ANSI/ISO e por que SGBDs variam? |
| DDL | Como criar, alterar e remover estruturas? |
| DML | Como inserir, atualizar e excluir dados com segurança? |
| DQL/consultas | Como recuperar dados com filtros, joins, subconsultas e agregação? |
| DCL | Como conceder e remover privilégios? |
| DTL/transações | Como confirmar, desfazer ou isolar alterações? |
| Índices | Como acelerar busca e qual o custo disso? |
| Triggers/procedures/functions | Como encapsular lógica dentro do banco? |

## Checklist de prova

Antes de entregar uma consulta, confira:

- `SELECT` tem as colunas pedidas no enunciado?
- `FROM` contém todas as tabelas necessárias?
- Toda junção tem condição de relacionamento?
- Filtro de linha está em `WHERE`?
- Filtro de grupo está em `HAVING`?
- Toda coluna não agregada no `SELECT` aparece no `GROUP BY`?
- `NULL` foi comparado com `IS NULL` ou `IS NOT NULL`?
- `UPDATE` e `DELETE` têm `WHERE`, quando a intenção não é afetar a tabela inteira?
- A chave estrangeira referencia uma tabela que já existe?
- `ON DELETE` e `ON UPDATE` estão coerentes com a regra de negócio?

## Fontes usadas

- `01- SQL - Introdução_2026_1.pdf`, páginas 2, 8, 9, 12 e 15.
- `04 - SQL _2026.pptx`, slides 2, 3, 29 e 30.
- `05 - SQL _2026.pdf`, páginas 2, 6, 21, 24 e 29.
- `06 - SQL - TransacoesIndices_Indices_Triggers_2026.pdf`, páginas 2 a 4, 11 a 15 e 23 a 29.


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
<a href="./01-introducao-e-padroes-sql.md">
<img src="https://img.shields.io/badge/Seguir_➔-0d1117?style=for-the-badge&labelColor=0d1117&color=39d353" alt="Seguir">
</a>
</td>
</tr>


