/* 
TABELAS 

Cliente (id, nome, nacionalidade, idade)
Voo (id, destino, data, duracao, preco)
Reserva (id, cliente_idfk, voo_id fk, status)

PERGUNTAS QUE DEVO FAZER:
O que eu quero mostrar?
De onde vem os dados?
Qual filtro?
*/ 


-- 1. Liste os nomes dos clientes que possuem pelo menos uma reserva confirmada (status = 'Confirmada').

-- O que eu quero mostrar? => nomes dos clientes -> projeção focada na coluna nomes
-- De onde vem os dados? => nome está em cliente mas status está em reserva => vai precisar juntar
-- Qual o filtro? => status tem que ser confirmada

SELECT DISTINCT nome 
FROM Cliente c
INNER JOIN Reserva r ON c.id = r.cliente_id
WHERE status = 'confirmada';

-- obs da correção: Como um cliente pode ter várias reservas confirmadas, o nome dele apareceria várias vezes. É uma boa prática usar SELECT DISTINCT nome para que cada cliente apareça apenas uma vez

-- 2. Liste a informação dos voos cujo preço esteja entre 46.000 e 90.000 créditos espaciais e que o destino seja Marte, Lua ou Saturno. Ordene de forma descendente por destino

-- dados de voos (tudo)
-- tabela voos
-- preco entre 46000 e 90000 e destino deve ser marte lua ou saturno. Ordenar por duracao
SELECT * 
FROM Voo
WHERE preco BETWEEN 46000 AND 90000
    AND destino IN ('Marte', 'Lua', 'Saturno')
ORDER BY duracao DESC;

-- 3. Liste os destinos que possuem mais de 10 clientes diferentes com reservas confirmadas.

-- destinos
-- voos e reservas
-- mais de 10 clientes diferentes e com reservas confirmadas

-- obs correção: ele pediu clientes diferentes tem que colocar o distinct

SELECT destino
FROM Voo v
INNER JOIN Reserva r ON v.id=r.voo_id
GROUP BY destino
WHERE status = 'confirmada'
HAVING COUNT(DISTINCT r.cliente_id) > 10;

-- 4. Para cada destino, calcule o preço máximo, mínimo, médio e a soma total dos preços dos voos.

SELECT destino, MAX(preco) AS preco_max, MIN(preco) AS preco_min, AVG(preco) AS preco_medio, SUM(preco) AS soma_preco 
FROM Voo
GROUP BY destino;

-- 5. Mostre os destinos que possuem mais de 12 reservas confirmadas.

SELECT destino
FROM Voo v
INNER JOIN Reserva r ON v.id=r.voo_id
WHERE status='Confirmada'
GROUP BY destinos
HAVING COUNT(DISTINCT r.id) > 12

-- 6.Liste o nome dos clientes, o destino do voo e o status da reserva para os quais o destino não é desconhecido (é diferente de null).

SELECT nome, destino, status
FROM Cliente c
INNER JOIN Reserva r ON r.cliente_id=c.id
INNER JOIN Voo v ON v.id=r.voo_id
WHERE destino IS NOT NULL;

-- obs: Você só é obrigado a usar o prefixo da tabela (como c.nome ou Cliente.nome) quando o nome da coluna se repete em mais de uma tabela que você está juntando

-- 7. Mostre todos os clientes e, caso tenham reservas, os destinos correspondentes. Inclua também os clientes sem reservas.

SELECT nome, destino
FROM Cliente c
LEFT JOIN Reserva r ON r.cliente_id=c.id
LEFT JOIN Voo v ON v.id=r.voo_id;

-- 8. Liste os clientes (nome, idade) cuja idade seja maior que a idade média de todos os clientes.

SELECT nome, idade
FROM Cliente
WHERE idade > (
    SELECT AVG(idade) AS media_idade
    FROM Cliente
);

-- 9. Mostre os destinos de voos que custam menos de 50.000 créditos OU que tenham duração inferior a 20 dias.

SELECT DISTINCT destino
FROM Voo
WHERE preco < 50000 OR duracao < 20;
