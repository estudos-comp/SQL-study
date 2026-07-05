<h1 align="center">DDL: CREATE, ALTER, DROP E CONSTRAINTS</h1>

<i><p align="center">Como definir estrutura, tipos, chaves e restrições de integridade.</p></i>

---


## `CREATE TABLE`

Forma geral:

```sql
CREATE TABLE nome_da_tabela (
    nome_do_atributo tipo_de_dado [restricoes],
    ...,
    PRIMARY KEY (atributo_ou_atributos),
    FOREIGN KEY (atributo_ou_atributos)
        REFERENCES tabela_referenciada(atributo_correspondente)
        ON DELETE {RESTRICT | CASCADE | SET NULL}
        ON UPDATE {RESTRICT | CASCADE | SET NULL}
);
```

## Tipos e restrições comuns

| Elemento | Função |
|---|---|
| `INT` / `INTEGER` | Número inteiro. |
| `VARCHAR(n)` | Texto variável com tamanho máximo `n`. |
| `CHAR(n)` | Texto de tamanho fixo. |
| `DATE` | Data. |
| `REAL`, `DECIMAL(p,s)` | Valores numéricos com casas decimais. |
| `NOT NULL` | Campo obrigatório. |
| `UNIQUE` | Valor não pode se repetir. |
| `CHECK` | Regra booleana sobre o valor. |
| `PRIMARY KEY` | Identificador único da linha. |
| `FOREIGN KEY` | Referência para outra tabela. |

## Exemplo: tabelas independentes

```sql
CREATE TABLE fornecedor (
    cod_fornecedor INT NOT NULL,
    nome_fornecedor VARCHAR(40) NOT NULL,
    cidade VARCHAR(20),
    PRIMARY KEY (cod_fornecedor)
);

CREATE TABLE peca (
    cod_peca INT NOT NULL,
    nome_peca VARCHAR(30) NOT NULL,
    peso REAL,
    PRIMARY KEY (cod_peca)
);
```

## Exemplo: tabela associativa

```sql
CREATE TABLE fornece (
    cod_fornecedor INT NOT NULL,
    cod_peca INT NOT NULL,
    quantidade INT NOT NULL,
    PRIMARY KEY (cod_fornecedor, cod_peca),
    FOREIGN KEY (cod_fornecedor)
        REFERENCES fornecedor(cod_fornecedor)
        ON DELETE CASCADE,
    FOREIGN KEY (cod_peca)
        REFERENCES peca(cod_peca)
        ON DELETE RESTRICT
);
```

`fornece` usa chave primária composta porque a identidade do fornecimento depende do par `(cod_fornecedor, cod_peca)`.

## Integridade referencial

A cláusula `REFERENCES` estabelece integridade referencial entre tabela filha e tabela mãe.

Regra importante: a tabela referenciada precisa existir antes da criação da chave estrangeira. Caso contrário, ocorre erro. Alternativa: criar a tabela sem a `FOREIGN KEY` e depois adicionar a restrição com `ALTER TABLE`.

## `ON DELETE`

```sql
FOREIGN KEY (...) REFERENCES ...
ON DELETE {CASCADE | SET NULL | RESTRICT}
```

| Ação | Efeito |
|---|---|
| `RESTRICT` | Impede excluir a linha da tabela mãe se houver linhas filhas dependentes. É o padrão em muitos casos. |
| `CASCADE` | Ao excluir a linha mãe, exclui também as linhas filhas. |
| `SET NULL` | Ao excluir a linha mãe, coloca `NULL` na chave estrangeira da tabela filha. |

Exemplo de interpretação:

- Não deve ser possível excluir vendedor que possui pedidos → `ON DELETE RESTRICT`.
- Ao excluir cliente, todos os pedidos e itens devem ser excluídos → `ON DELETE CASCADE`.
- Ao excluir funcionário, dependentes continuam cadastrados sem funcionário associado → `ON DELETE SET NULL`.

## `ON UPDATE`

```sql
FOREIGN KEY (...) REFERENCES ...
ON UPDATE {CASCADE | SET NULL | RESTRICT}
```

| Ação | Efeito |
|---|---|
| `RESTRICT` | Impede alterar a chave primária se houver referências. |
| `CASCADE` | Propaga a alteração da chave primária para as chaves estrangeiras. |
| `SET NULL` | Coloca `NULL` nas chaves estrangeiras que referenciavam a chave alterada. |

## Exemplo com várias constraints

```sql
CREATE TABLE professor (
    matricula INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    rg NUMERIC(10) UNIQUE,
    sexo CHAR(1) CHECK (sexo IN ('M', 'F')),
    idade INT CHECK (idade BETWEEN 21 AND 80),
    titulacao ENUM ('graduado', 'especialista', 'mestre', 'doutor'),
    categoria VARCHAR(15) CHECK (categoria IN ('auxiliar', 'assistente', 'adjunto', 'titular')),
    no_turmas INT CHECK (no_turmas >= 0),
    CONSTRAINT pk_prof PRIMARY KEY (matricula)
);
```

> `ENUM` e `AUTO_INCREMENT` são específicos de alguns SGBDs, especialmente MySQL. Em SQL padrão ou PostgreSQL, a modelagem pode exigir outra solução.

## `ALTER TABLE`

Usado para alterar a estrutura da tabela.

```sql
ALTER TABLE professor ADD salario INTEGER;
```

```sql
ALTER TABLE professor DROP salario;
```

```sql
ALTER TABLE professor MODIFY nome VARCHAR(40);
```

A sintaxe exata varia por SGBD. PostgreSQL, por exemplo, costuma usar `ALTER COLUMN`/`TYPE`.

## `DROP TABLE`

Remove a tabela do banco.

```sql
DROP TABLE peca;
```

Com `RESTRICT`:

```sql
DROP TABLE professor RESTRICT;
```

Interpretação: remove a tabela somente se não existirem objetos dependentes, como views baseadas nela.

Com `CASCADE`, a exclusão pode ser propagada para objetos dependentes. Use com cuidado.

## Regras do exercício do material

Ao criar tabelas a partir de um modelo, traduza regras de negócio para constraints:

| Regra do enunciado | Tradução provável |
|---|---|
| Todos os campos obrigatórios. | `NOT NULL`. |
| Nome com no máximo 50 caracteres. | `VARCHAR(50)`. |
| UF com 2 caracteres. | `CHAR(2)` ou `VARCHAR(2)` com `CHECK`. |
| CPF único. | `UNIQUE`. |
| Código do pedido gerado automaticamente. | `IDENTITY`, `AUTO_INCREMENT`, `SERIAL` ou sequence. |
| Comissão entre 2% e 10%. | `CHECK (comissao BETWEEN 2 AND 10)`. |
| Quantidade maior ou igual a 1. | `CHECK (quantidade >= 1)`. |
| Valor do produto não inferior a 1. | `CHECK (valor >= 1)`. |
| Não excluir vendedor com pedidos. | `ON DELETE RESTRICT`. |
| Excluir cliente deve excluir pedidos e itens. | `ON DELETE CASCADE`. |

## Fontes usadas

- `02 - SQL - DDL _2026.pdf`, páginas 2 a 15 e 28.


---

<tr>
<td width="33%" align="left">
<a href="./07-agregacao-group-by-having-order-by.md">
<img src="https://img.shields.io/badge/⬅_Voltar-0d1117?style=for-the-badge&labelColor=0d1117&color=39d353" alt="Voltar">
</a>
</td>
<td width="33%" align="center">
<a href="./README.md">
<img src="https://img.shields.io/badge/Índice-0d1117?style=for-the-badge&labelColor=0d1117&color=58a6ff" alt="Índice">
</a>
</td>
<td width="33%" align="right">
<a href="./09-autoincremento-sgbds.md">
<img src="https://img.shields.io/badge/Seguir_➔-0d1117?style=for-the-badge&labelColor=0d1117&color=39d353" alt="Seguir">
</a>
</td>
</tr>


