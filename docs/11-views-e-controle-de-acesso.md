<h1 align="center">VIEWS E CONTROLE DE ACESSO</h1>

<i><p align="center">Tabelas virtuais, simplificação de consultas e privilégios.</p></i>

---


## O que é uma view

Uma **view** é uma tabela virtual. Ela não armazena fisicamente os dados como uma tabela comum; armazena a consulta que define como os dados serão vistos.

Usos principais:

- mostrar dados de uma forma diferente do armazenamento real;
- simplificar queries longas;
- restringir o que um usuário consegue ver;
- aumentar independência lógica dos dados;
- apoiar controle de acesso.

## Criar e remover view

```sql
CREATE VIEW nome AS consulta;
```

```sql
DROP VIEW nome;
```

## Exemplo: view sobre embarques

```sql
CREATE VIEW embarquec AS
SELECT p.codp,
       p.nomep,
       p.corp,
       p.pesop,
       p.cidadep,
       e.codf,
       f.nome,
       f.status,
       f.cidade,
       e.qtdeembarq
FROM embarq e, peca p, fornec f
WHERE e.codp = p.codp
  AND e.codf = f.codf;
```

Depois, o usuário pode consultar a view sem reescrever a junção:

```sql
SELECT nomef, nomep
FROM embarquec;
```

A consulta fica mais curta e oculta detalhes da estrutura original.

## View não existe fisicamente como tabela comum

A visão não materializada é expandida pelo SGBD. A consulta da view é misturada à consulta do usuário em tempo de tradução/otimização.

Exemplo conceitual:

```sql
SELECT nomef, nomep
FROM embarquec;
```

O SGBD entende que `embarquec` representa uma consulta sobre `embarq`, `peca` e `fornec`.

## Exemplo com alunos e disciplinas

```sql
CREATE VIEW vw_aluno_disciplina_not60 AS
SELECT a.nomea, d.nomed
FROM aluno a
INNER JOIN aluno_paga ap ON ap.mat = a.mat
INNER JOIN disc d ON d.d = ap.d
WHERE ap.d IN (
    SELECT d2.d
    FROM disc d2
    WHERE d2.carga_h != 60
);
```

## Atualização através de views

Uma view pode permitir `INSERT`, `UPDATE` ou `DELETE`, mas apenas quando o mapeamento para a tabela base é não ambíguo.

Condições típicas para ser atualizável:

- definida sobre uma única tabela;
- sem agregações como `SUM`, `AVG`, `COUNT`;
- sem `GROUP BY`;
- sem `DISTINCT`;
- sem joins que tornem a linha da view ambígua;
- cada linha da view corresponde a uma linha da tabela base.

Exemplo de view potencialmente atualizável:

```sql
CREATE VIEW vw_aluno AS
SELECT mat, nomea, depto, curso
FROM aluno
WHERE curso = 'Ciência da Computação';
```

Atualização:

```sql
UPDATE vw_aluno
SET curso = 'Engenharia da Computação';
```

View não atualizável típica:

```sql
CREATE VIEW resumo_departamento AS
SELECT num_dep, COUNT(*) AS total
FROM empregado
GROUP BY num_dep;
```

Não há uma linha única da tabela base correspondente ao valor agregado `total`.

## Controle de acesso com `GRANT`

`GRANT` concede privilégios.

```sql
GRANT privilegios ON nome_tabela_ou_view TO usuario;
```

Privilégios comuns:

- `SELECT`;
- `INSERT`;
- `UPDATE`;
- `DELETE`;
- `ALL PRIVILEGES`.

Exemplo:

```sql
GRANT SELECT ON empregado TO crp;
```

## Remover privilégios com `REVOKE`

```sql
REVOKE privilegios
ON nome_tabela_ou_view
FROM usuario;
```

Exemplo:

```sql
REVOKE SELECT ON projeto FROM PUBLIC;
```

`PUBLIC` representa todos os usuários.

## Criação de usuários muda por SGBD

O padrão SQL define `GRANT` e `REVOKE`, mas não há uma sintaxe universal de criação de usuários.

| SGBD | Exemplo |
|---|---|
| Oracle | `CREATE USER crp IDENTIFIED BY senha;` |
| PostgreSQL | `CREATE USER crp WITH PASSWORD 'senha';` ou `CREATE ROLE crp LOGIN PASSWORD 'senha';` |
| MySQL/MariaDB | `CREATE USER 'crp'@'localhost' IDENTIFIED BY 'senha';` |
| SQL Server | `CREATE LOGIN crp WITH PASSWORD = 'senha';` e depois `CREATE USER crp FOR LOGIN crp;` |

## Padrão de prova

- “tabela virtual” → view.
- “simplificar query longa” → view.
- “usuário só pode ver algumas colunas/linhas” → view + `GRANT SELECT`.
- “retirar permissão” → `REVOKE`.
- “view com agregação pode atualizar?” → não, em regra.

## Fontes usadas

- `05 - SQL _2026.pdf`, páginas 27, 30 a 42.


---

<tr>
<td width="33%" align="left">
<a href="./10-dml-insert-update-delete.md">
<img src="https://img.shields.io/badge/⬅_Voltar-0d1117?style=for-the-badge&labelColor=0d1117&color=39d353" alt="Voltar">
</a>
</td>
<td width="33%" align="center">
<a href="./README.md">
<img src="https://img.shields.io/badge/Índice-0d1117?style=for-the-badge&labelColor=0d1117&color=58a6ff" alt="Índice">
</a>
</td>
<td width="33%" align="right">
<a href="./12-transacoes-acid-commit-rollback-savepoint.md">
<img src="https://img.shields.io/badge/Seguir_➔-0d1117?style=for-the-badge&labelColor=0d1117&color=39d353" alt="Seguir">
</a>
</td>
</tr>


