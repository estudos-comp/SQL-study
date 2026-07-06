Se cair uma questão de **Trigger (Gatilho)**, o segredo é manter a calma e aplicar a mesma técnica de "tradução de enunciados" que usamos nas questões de `SELECT`.

Os seus materiais trazem regras bem claras sobre Triggers. Aqui está o resumo e o "Dicionário de Tradução" focado neles para você gabaritar:

### 1. O que é um Trigger?
É um objeto associado a uma tabela que executa um bloco de código **automaticamente** em resposta a uma ação (um `INSERT`, `UPDATE` ou `DELETE`) que ocorreu nela. O usuário da aplicação não chama o Trigger, ele simplesmente "dispara" sozinho.

### 2. Dicionário de Tradução para Triggers
Quando você ler o enunciado da prova, procure por estas palavras-chave para montar o cabeçalho do seu Trigger:

*   **O Momento (BEFORE ou AFTER):**
    *   *"Valide se...", "Impeça que...", "Verifique antes..."*: Indica que você quer testar o dado antes dele entrar no banco. Você deve usar **`BEFORE`**.
    *   *"Gere um log...", "Faça uma auditoria...", "Atualize o histórico..."*: Indica que a ação principal já aconteceu com sucesso e agora você quer registrar as consequências. Você deve usar **`AFTER`**.
*   **Os Valores (NEW vs OLD):**
    *   Se você precisa acessar o valor que o usuário acabou de digitar (em um `INSERT` ou o novo valor de um `UPDATE`), você usa o prefixo **`NEW.`** seguido do nome da coluna (ex: `NEW.salario`).
    *   Se você precisa acessar o valor antigo que já estava gravado no banco (em um `DELETE` ou o valor anterior de um `UPDATE`), você usa o prefixo **`OLD.`**.

### 3. Esqueleto do Código
A estrutura sintática cobrada nos seus slides é sempre esta:

```sql
CREATE TRIGGER nome_do_trigger 
[BEFORE | AFTER] [INSERT | UPDATE | DELETE] ON nome_da_tabela 
FOR EACH ROW 
BEGIN 
    -- lógica SQL vai aqui dentro
END;
```

### 4. Casos Clássicos de Prova

**Cenário A: Barrar uma ação errada (Validação)**
Se a questão pedir para "evitar que um cliente seja inserido sem e-mail", você usará um `BEFORE INSERT`.
*   **O "Pulo do Gato":** Para abortar a transação e jogar um erro na tela, os seus slides mostram o uso do comando `SIGNAL SQLSTATE '45000'`. 
*   *Lógica:* `IF NEW.Email IS NULL THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Erro'; END IF;`.

**Cenário B: Criar Log de Auditoria**
Se a questão pedir para "gravar em uma tabela de Log quem foi atualizado", você usará um `AFTER UPDATE`.
*   *Lógica:* Você fará um `INSERT INTO` na tabela de logs pegando o ID antigo (`OLD.id`) e o novo (`NEW.id`), além de salvar a hora atual usando `CURRENT_TIMESTAMP`.

### Pegadinhas Teóricas que podem cair em Múltipla Escolha:
Se a questão for teórica (V ou F), tenha muito cuidado com estas três regras absolutas dos seus materiais:
1.  **Regra de Unicidade:** Você **não pode** criar mais de um trigger para o mesmo evento e momento na mesma tabela. Ou seja, é impossível criar dois gatilhos `AFTER INSERT` na mesma tabela `Clientes`.
2.  **Regra de Alteração:** Um trigger **não pode ser alterado**. Não existe `ALTER TRIGGER`. Se você errou ou precisa mudar a lógica, você é obrigado a apagá-lo (`DROP TRIGGER`) e recriá-lo do zero.
3.  **Execução:** Eles rodam para cada linha afetada, por isso o uso obrigatório da cláusula `FOR EACH ROW`.

Se você lembrar do `BEFORE` para validar, do `AFTER` para auditar, e souber usar o `NEW` e o `OLD`, você tira qualquer questão de Trigger de letra!
