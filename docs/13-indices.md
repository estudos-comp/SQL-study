<h1 align="center">ÍNDICES</h1>

<i><p align="center">Estruturas auxiliares para acelerar acesso, com custo em escrita e espaço.</p></i>

---


## O que é um índice

Índice é uma estrutura que permite acesso rápido às linhas de uma tabela. Ele se baseia nos valores de uma ou mais colunas e funciona como uma estrutura auxiliar com chaves e ponteiros organizados.

Sem índice, o SGBD pode precisar fazer `table scan`: percorrer a tabela inteira para encontrar linhas.

Com índice, o SGBD pode consultar a estrutura auxiliar e localizar registros de forma mais eficiente.

## Criação

```sql
CREATE INDEX nome_indice
ON nome_tabela (nome_atributo);
```

Exemplo:

```sql
CREATE INDEX idx_cliente_nome
ON clientes (nome);
```

## Índice único

```sql
CREATE UNIQUE INDEX idx_cliente_cpf
ON clientes (cpf);
```

`UNIQUE` impede valores duplicados na coluna ou conjunto de colunas indexadas.

## Índice composto

```sql
CREATE INDEX idx_pedido_cliente_data
ON pedido (id_cliente, data_pedido);
```

A ordem das colunas importa. Em muitos SGBDs, um índice `(id_cliente, data_pedido)` ajuda bem em filtros por `id_cliente` e por `(id_cliente, data_pedido)`, mas não necessariamente ajuda tão bem em filtro só por `data_pedido`.

## Remoção

```sql
DROP INDEX idx_cliente_nome;
```

A sintaxe pode variar. Alguns SGBDs exigem o nome da tabela junto.

## Quando criar índice

Boa prática do material:

- colunas muito usadas em `WHERE`;
- colunas muito usadas em `JOIN`;
- colunas muito usadas em `ORDER BY`;
- colunas com boa seletividade, isto é, muitos valores diferentes.

Exemplos bons:

```sql
CREATE INDEX idx_aluno_curso
ON aluno (curso);
```

```sql
CREATE INDEX idx_aluno_paga_mat
ON aluno_paga (mat);
```

## Quando evitar excesso

Índices demais prejudicam operações de escrita.

Toda vez que ocorre:

```sql
INSERT
UPDATE
DELETE
```

o SGBD precisa atualizar também os índices associados. Por isso, índice acelera leitura, mas cobra custo em escrita e armazenamento.

## Vantagens

- consultas mais rápidas;
- menor carga de processamento em buscas complexas;
- melhor desempenho em joins;
- melhor desempenho em ordenações.

## Desvantagens

- consomem espaço em disco;
- tornam `INSERT`, `UPDATE` e `DELETE` mais lentos;
- excesso de índices pode prejudicar mais do que ajudar;
- índices mal escolhidos podem nunca ser usados pelo otimizador.

## Padrão de prova

- “acesso rápido” → índice.
- “coluna usada em filtro/join/ordenação” → candidata a índice.
- “garantir não duplicidade via índice” → `CREATE UNIQUE INDEX`.
- “custo do índice” → escrita mais lenta e mais espaço em disco.

## Fontes usadas

- `06 - SQL - TransacoesIndices_Indices_Triggers_2026.pdf`, páginas 11 a 15.


---

<tr>
<td width="33%" align="left">
<a href="./12-transacoes-acid-commit-rollback-savepoint.md">
<img src="https://img.shields.io/badge/⬅_Voltar-0d1117?style=for-the-badge&labelColor=0d1117&color=39d353" alt="Voltar">
</a>
</td>
<td width="33%" align="center">
<a href="./README.md">
<img src="https://img.shields.io/badge/Índice-0d1117?style=for-the-badge&labelColor=0d1117&color=58a6ff" alt="Índice">
</a>
</td>
<td width="33%" align="right">
<a href="./14-procedures-functions-triggers.md">
<img src="https://img.shields.io/badge/Seguir_➔-0d1117?style=for-the-badge&labelColor=0d1117&color=39d353" alt="Seguir">
</a>
</td>
</tr>


