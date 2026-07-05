-- questão 1
-- lista os produtos com descrição, unidade e valor unitário
select descricao, unidade, valorUnitario
from Produto;


-- questão 2
-- lista o cgc, nome e endereço de todos os clientes
select cgc, nome, endereco
from Cliente;


-- questão 3
-- seleciona todas as colunas da tabela vendedor
select *
from Vendedor;


-- questão 4
-- muda o cabeçalho do resultado usando apelidos nas colunas
select codV as codigo_do_vendedor,
       nome as nome,
       salario as salario_base
from Vendedor;


-- questão 5
-- mostra o nome dos vendedores e o salário multiplicado por 2
select nome,
       salario * 2 as salario_multiplicado
from Vendedor;


-- questão 6
-- lista os itens de pedido vendidos com quantidade maior que 35
select codP, codProd, quantidade
from ItemPedido
where quantidade > 35;


-- questão 7
-- lista os clientes de niterói com código maior que 1000
select nome
from Cliente
where cidade = 'Niterói'
  and codC > 1000;


-- questão 24
-- lista a quantidade de pedidos por estado dos clientes
select c.estado,
       count(p.codP) as quantidade_de_pedidos
from Cliente c
join Pedido p on c.codC = p.codC
group by c.estado;


-- questão 25
-- conta os clientes do rio de janeiro e niterói que fizeram pedido com o vendedor joão
select c.cidade,
       count(distinct c.codC) as total_de_clientes
from Cliente c
join Pedido p on c.codC = p.codC
join Vendedor v on p.codV = v.codV
where c.cidade in ('Rio de Janeiro', 'Niterói')
  and v.nome = 'João'
group by c.cidade;


-- questão 26
-- lista os produtos que aparecem em algum pedido com quantidade igual a 10
select distinct pr.descricao
from Produto pr
join ItemPedido ip on pr.codProd = ip.codProd
where ip.quantidade = 10;


-- questão 27
-- lista os produtos que não aparecem em nenhum pedido
select pr.descricao
from Produto pr
left join ItemPedido ip on pr.codProd = ip.codProd
where ip.codP is null;


-- questão 28
-- apresenta apenas os salários multiplicados por 2
select salario * 2 as salario_dobrado
from Vendedor;


-- questão 29
-- lista nome e endereço dos clientes da cidade de são paulo
select nome, endereco
from Cliente
where cidade = 'São Paulo';


-- questão 30
-- mostra todos os pedidos com prazo de entrega igual a 15 dias
select *
from Pedido
where prazoEntrega = 15;

-- questão 31
-- lista s nomes dos clientes que moram em São Paulo e estejam na faixa de CEP entre 30077000 e 30079000
select nome
from Cliente
where cidade = 'São Paulo'
    and cep between 30077000 and 30079000;

-- =========================================================

-- padrão usado nas respostas
-- cliente(codc, nome, endereco, cidade, uf, cep, cgc, ie)
-- vendedor(codv, nomev, faixacomissao, salariofixo)
-- produto(codprod, descricao, unidade, valorunit)
-- pedido(codp, codc, codv, prazoentrega)
-- itempedido(codp, codprod, qtd)

-- questão 1
-- lista todos os produtos com descrição, unidade e valor unitário
select descricao, unidade, valorunit
from produto;


-- questão 2
-- lista o cgc, nome e endereço de todos os clientes
select cgc, nome, endereco
from cliente;


-- questão 3
-- seleciona todas as colunas da tabela vendedor
select *
from vendedor;


-- questão 4
-- muda o cabeçalho do resultado da consulta anterior
select codv as numero,
       nomev as nome,
       salariofixo as rendimentos,
       faixacomissao as comissao
from vendedor;


-- questão 5
-- mostra os nomes dos vendedores e os salários multiplicados por 2
select nomev,
       salariofixo * 2 as salario_dobrado
from vendedor;


-- questão 6
-- lista os produtos vendidos com quantidade igual a 35 unidades
select codp,
       codprod,
       qtd
from itempedido
where qtd = 35;


-- questão 7
-- lista os clientes de niterói com código maior que 1000
select nome
from cliente
where cidade = 'Niterói'
  and codc > 1000;


-- questão 8
-- lista os produtos com unidade igual a m e valor unitário igual a 1.05
select descricao
from produto
where unidade = 'M'
  and valorunit = 1.05;


-- questão 9
-- lista clientes e endereços de são paulo ou com cep dentro da faixa informada
select nome,
       endereco
from cliente
where cidade = 'São Paulo'
   or cep between '30077000' and '30079000';


-- questão 10
-- mostra todos os pedidos que não têm prazo de entrega igual a 15 dias
select *
from pedido
where prazoentrega <> 15;


-- questão 11
-- lista o código e a descrição dos produtos com valor entre 0.32 e 2.00
select codprod,
       descricao
from produto
where valorunit between 0.32 and 2.00;


-- questão 12
-- lista os produtos cuja descrição começa com q
select codprod,
       descricao
from produto
where descricao like 'Q%';


-- questão 13
-- lista os vendedores cujo nome não começa com jo
select codv,
       nomev
from vendedor
where nomev not like 'Jo%';


-- questão 14
-- lista nome e endereço dos clientes de são paulo
select nome,
       endereco
from cliente
where cidade = 'São Paulo';


-- questão 15
-- mostra todos os pedidos com prazo de entrega igual a 15 dias
select *
from pedido
where prazoentrega = 15;


-- questão 16
-- lista clientes de são paulo com cep dentro da faixa informada
select nome
from cliente
where cidade = 'São Paulo'
  and cep between '30077000' and '30079000';


-- questão 17
-- lista produtos cuja descrição começa com m ou n
select codprod,
       descricao
from produto
where descricao like 'M%'
   or descricao like 'N%';


-- =========================================================

-- padrão usado nas respostas
-- cliente(codc, nome, endereco, cidade, uf, cep, cgc, ie)
-- vendedor(codv, nomev, faixacomissao, salariofixo)
-- produto(codprod, descricao, unidade, valorunit)
-- pedido(codp, codc, codv, prazoentrega)
-- itempedido(codp, codprod, qtd)

-- questão 1
-- mostra os clientes que não têm inscrição estadual
select *
from cliente
where ie is null;


-- questão 2
-- mostra os vendedores e salários em ordem alfabética
select nomev,
       salariofixo
from vendedor
order by nomev;


-- questão 3
-- mostra clientes, cidades e estados ordenados por estado e cidade de forma decrescente
select nome,
       cidade,
       uf
from cliente
order by uf desc,
         cidade desc;


-- questão 4
-- mostra produtos em kg ordenados pelo valor unitário
select descricao,
       valorunit
from produto
where unidade = 'KG'
order by valorunit;


-- questão 5
-- mostra o novo salário dos vendedores da faixa c com reajuste de 75 por cento e bonificação
select nomev,
       salariofixo * 1.75 + 120 as novo_salario
from vendedor
where faixacomissao = 'C'
order by nomev;


-- questão 6
-- mostra o menor e o maior salário dos vendedores
select min(salariofixo) as menor_salario,
       max(salariofixo) as maior_salario
from vendedor;


-- questão 7
-- mostra a quantidade total pedida para o produto de código 78
select sum(qtd) as quantidade_total
from itempedido
where codprod = 78;


-- questão 8
-- mostra a média dos salários dos vendedores
select avg(salariofixo) as media_salario
from vendedor;


-- questão 9
-- conta quantos vendedores ganham acima de 2500
select count(*) as total_vendedores
from vendedor
where salariofixo > 2500.00;


-- questão 10
-- lista as unidades diferentes existentes na tabela produto
select distinct unidade
from produto;


-- questão 11
-- lista o número de produtos que cada pedido contém
select codp as num_pedido,
       count(*) as quant_itens
from itempedido
group by codp;


-- questão 12
-- lista os pedidos que têm mais de três produtos
select codp as num_pedido,
       count(*) as total_produtos
from itempedido
group by codp
having count(*) > 3;


-- questão 13
-- lista os vendedores que não estão na faixa de comissão b
select codv,
       nomev,
       faixacomissao
from vendedor
where faixacomissao <> 'B';


-- questão 14
-- mostra os vendedores que não têm salário fixo cadastrado
select *
from vendedor
where salariofixo is null;


-- questão 15
-- mostra clientes e endereços em ordem alfabética
select nome,
       endereco
from cliente
order by nome;


-- questão 16
-- mostra vendedores e salários ordenados pelo salário de forma decrescente
select nomev,
       salariofixo
from vendedor
order by salariofixo desc;


-- questão 17
-- mostra código do produto e quantidade dos itens vendidos com mais de 20 unidades
select codprod,
       qtd
from itempedido
where qtd > 20;


-- questão 18
-- mostra o novo salário dos vendedores com reajuste de 50 por cento
select nomev,
       salariofixo * 1.50 as novo_salario
from vendedor
order by nomev;


-- questão 19
-- lista novamente o número de produtos que cada pedido contém
select codp as num_pedido,
       count(*) as total_produtos
from itempedido
group by codp;


-- questão 20
-- mostra o menor e o maior número de pedido na tabela itempedido
select min(codp) as menor_pedido,
       max(codp) as maior_pedido
from itempedido;


-- questão 21
-- mostra a quantidade total pedida para o produto de código 31
select sum(qtd) as quantidade_total
from itempedido
where codprod = 31;


-- questão 22
-- mostra a média dos salários dos vendedores
select avg(salariofixo) as media_salario
from vendedor;


-- questão 23
-- conta quantos vendedores ganham menos de 1500
select count(*) as total_vendedores
from vendedor
where salariofixo < 1500.00;


-- questão 24
-- lista as unidades diferentes da tabela produto
select distinct unidade
from produto;

-- =========================================================

-- padrão usado nas respostas
-- cliente(codc, nome, endereco, cidade, uf, cep, cgc, ie)
-- vendedor(codv, nomev, faixacomissao, salariofixo)
-- produto(codprod, descricao, unidade, valorunit)
-- pedido(codp, codc, codv, prazoentrega)
-- itempedido(codp, codprod, qtd)

-- questão 1
-- lista clientes que têm pedidos, mostrando nome, código do cliente e código do pedido
select c.nome,
       p.codc,
       p.codp
from cliente c
inner join pedido p on c.codc = p.codc;


-- questão 2
-- lista todos os clientes e seus pedidos, incluindo clientes sem pedido
select c.nome,
       c.codc,
       p.codp
from cliente c
left join pedido p on c.codc = p.codc;


-- questão 3
-- lista clientes com pedidos de prazo maior que 15 dias nos estados sp ou rj
select c.nome,
       c.uf,
       p.prazoentrega
from cliente c
join pedido p on c.codc = p.codc
where c.uf in ('SP', 'RJ')
  and p.prazoentrega > 15;


-- questão 4
-- lista clientes e prazos de entrega ordenados do maior para o menor
select c.nome,
       p.prazoentrega
from cliente c
join pedido p on c.codc = p.codc
order by p.prazoentrega desc;


-- questão 5
-- lista vendedores que emitiram pedidos com prazo maior que 15 dias e salário maior ou igual a 1000
select distinct v.nomev,
       v.salariofixo
from vendedor v
join pedido p on v.codv = p.codv
where p.prazoentrega > 15
  and v.salariofixo >= 1000.00
order by v.nomev;

-- =========================================================

-- padrão usado nas respostas
-- cliente(codc, nome, endereco, cidade, uf, cep, cgc, ie)
-- vendedor(codv, nomev, faixacomissao, salariofixo)
-- produto(codprod, descricao, unidade, valorunit)
-- pedido(codp, codc, codv, prazoentrega)
-- itempedido(codp, codprod, qtd)

-- questão 1
-- mostra clientes do rj com pedido de queijo e prazo maior que 15 dias
select distinct c.nome,
       p.prazoentrega
from cliente c
join pedido p on c.codc = p.codc
join itempedido i on p.codp = i.codp
join produto pr on i.codprod = pr.codprod
where pr.descricao = 'queijo'
  and p.prazoentrega > 15
  and c.uf = 'RJ'
order by c.nome;


-- questão 2
-- mostra vendedores que venderam chocolate em quantidade superior a 10 kg
select distinct v.nomev
from vendedor v
join pedido p on v.codv = p.codv
join itempedido i on p.codp = i.codp
join produto pr on i.codprod = pr.codprod
where pr.descricao = 'chocolate'
  and i.qtd > 10;


-- questão 3
-- conta quantos clientes fizeram pedidos com o vendedor joão
select count(distinct c.codc) as total_clientes
from cliente c
join pedido p on c.codc = p.codc
join vendedor v on p.codv = v.codv
where v.nomev = 'João';


-- questão 4
-- conta clientes do rio de janeiro e niterói que fizeram pedidos com o vendedor joão, agrupados por cidade
select c.cidade,
       count(distinct c.codc) as total_clientes
from cliente c
join pedido p on c.codc = p.codc
join vendedor v on p.codv = v.codv
where v.nomev = 'João'
  and c.cidade in ('Rio de Janeiro', 'Niterói')
group by c.cidade;


-- questão 5
-- lista produtos que aparecem em qualquer pedido com quantidade igual a 10
select distinct pr.descricao
from produto pr
join itempedido i on pr.codprod = i.codprod
where i.qtd = 10;


-- questão 6
-- lista vendedores que ganham salário fixo abaixo da média
select nomev
from vendedor
where salariofixo < (
    select avg(salariofixo)
    from vendedor
);


-- questão 7
-- lista produtos que não estão presentes em nenhum pedido
select pr.codprod,
       pr.descricao
from produto pr
where not exists (
    select 1
    from itempedido i
    where i.codprod = pr.codprod
);


-- questão 8
-- lista clientes presentes em mais de três pedidos
select c.nome
from cliente c
join pedido p on c.codc = p.codc
group by c.codc,
         c.nome
having count(*) > 3;


-- questão 9
-- adiciona o produto parafuso na tabela produto
insert into produto (codprod, descricao, unidade, valorunit)
values (108, 'parafuso', 'KG', 1.25);


-- questão 10
-- altera o valor unitário do produto parafuso
update produto
set valorunit = 1.62
where descricao = 'parafuso';


-- questão 11
-- acrescenta 2.5 por cento ao preço dos produtos em kg abaixo da média dos produtos em kg
update produto
set valorunit = valorunit * 1.025
where unidade = 'KG'
  and valorunit < (
      select avg(valorunit)
      from produto
      where unidade = 'KG'
  );


-- questão 12
-- apaga vendedores que têm faixa de comissão nula
delete from vendedor
where faixacomissao is null;


-- questão 13
-- apaga pedidos feitos por vendedores que não existem na tabela vendedor
delete from pedido
where not exists (
    select 1
    from vendedor v
    where v.codv = pedido.codv
);


-- questão 14
-- cria uma visão somente com produtos cuja unidade seja metro
create view pr_metro as
select codprod,
       descricao,
       unidade
from produto
where unidade = 'M';


-- questão 15
-- cria uma visão com código, nome do vendedor e salário médio mensal
create view salario_medio as
select codv,
       nomev,
       salariofixo / 12 as salario_medio
from vendedor;


-- questão 16
-- consulta vendedores com salário médio mensal maior que 2000
select nomev,
       salario_medio
from salario_medio
where salario_medio > 2000.00;
