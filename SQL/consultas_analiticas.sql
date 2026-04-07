select  * from vendas

select  * from produtos

select  * from clientes


/*
v = VENDAS
P = PRODUTOS
C = CLIENTES
*/


--Clientes que mais gastaram e o preço total

SELECT 
    c.Nome_Cliente,
    SUM(v.Receita) AS Receita_Total
FROM Vendas v
JOIN Clientes c
ON v.Id_Cliente = c.Id_Cliente
GROUP BY c.Nome_Cliente
ORDER BY Receita_Total DESC;

-- Mostrar apenas nome e cidade dos clientes.
select nome_cliente, cidade from clientes

--Mostrar produtos com preço maior que 1000.

select nome_produto, preco from produtos where Preco > 1000;

--Mostrar clientes do estado SP.

select nome_cliente, estado from clientes where estado = 'SP';


-- Mostrar todas as vendas com nome do cliente.

SELECT 
v.Id_Venda,
c.Nome_Cliente,
v.Data_Venda
FROM Vendas v
JOIN Clientes c
ON v.Id_Cliente = c.Id_Cliente;

--Mostrar todas as vendas com nome do produto  (Relaciona vendas com produtos usando JOIN, permitindo visualizar o nome do produto em vez do ID)

SELECT v.id_venda, p.nome_produto, v.data_venda, v.quantidade, v.receita
FROM vendas v
JOIN produtos p ON v.id_produto = p.id_produto;

--Mostrar cliente e produto comprados 
-- (Une as três tabelas para mostrar quem comprou o quê, Select Distinct para ver apenas qual produto que o cliente comprou, mas não a quantiade)

SELECT DISTINCT c.nome_cliente as cliente, p.nome_produto as produto
FROM vendas v
INNER JOIN clientes c ON v.id_cliente = c.id_cliente
INNER JOIN produtos p ON v.id_produto = p.id_produto
ORDER BY cliente ASC;

--Mostrar total de vendas por cliente

SELECT c.nome_cliente, COUNT(v.id_venda) AS total_vendas
FROM vendas v
JOIN clientes c ON v.id_cliente = c.id_cliente
GROUP BY c.nome_cliente;

-- Quantidade de vendas por produto

SELECT p.nome_produto, COUNT(v.id_venda) AS qtd_vendas
FROM vendas v
JOIN produtos p ON v.id_produto = p.id_produto
GROUP BY p.nome_produto;

--Receita total por cliente

SELECT c.nome_cliente, SUM(v.receita) AS receita_total
FROM vendas v
JOIN clientes c ON v.id_cliente = c.id_cliente
GROUP BY c.nome_cliente;

--Receita total por categoria de produto

SELECT p.categoria, SUM(v.receita) AS receita_total
FROM vendas v
JOIN produtos p ON v.id_produto = p.id_produto
GROUP BY p.categoria;

--Produto mais vendido

SELECT TOP 1 p.nome_produto, SUM(v.quantidade) AS total_vendido
FROM vendas v
JOIN produtos p ON v.id_produto = p.id_produto
GROUP BY p.nome_produto
ORDER BY total_vendido DESC;

--Cliente que mais comprou

SELECT TOP 1 c.nome_cliente, COUNT(v.id_venda) AS total_compras
FROM vendas v
JOIN clientes c ON v.id_cliente = c.id_cliente
GROUP BY c.nome_cliente
ORDER BY total_compras DESC;

--Média de valor das vendas

SELECT AVG(receita) AS media_vendas
FROM vendas;

--Top 3 clientes que mais compraram

SELECT TOP 3 c.nome_cliente, SUM(v.receita) AS total_gasto
FROM vendas v
JOIN clientes c ON v.id_cliente = c.id_cliente
GROUP BY c.nome_cliente
ORDER BY total_gasto DESC;

--Receita por mês

SELECT 
    YEAR(data_venda) AS ano,
    MONTH(data_venda) AS mes,
    SUM(receita) AS receita_total
FROM vendas
GROUP BY YEAR(data_venda), MONTH(data_venda)
ORDER BY ano, mes;

--Produto mais vendido em cada categoria

SELECT categoria, nome_produto, total_vendido
FROM (
    SELECT 
        p.categoria,
        p.nome_produto,
        SUM(v.quantidade) AS total_vendido,
        ROW_NUMBER() OVER (PARTITION BY p.categoria ORDER BY SUM(v.quantidade) DESC) AS ranking
    FROM vendas v
    JOIN produtos p ON v.id_produto = p.id_produto
    GROUP BY p.categoria, p.nome_produto
) AS sub
WHERE ranking = 1;

--Clientes que nunca compraram

SELECT c.nome_cliente
FROM clientes c
LEFT JOIN vendas v ON c.id_cliente = v.id_cliente
WHERE v.id_cliente IS NULL;

--Ranking de clientes por receita

SELECT 
    c.nome_cliente,
    SUM(v.receita) AS receita_total,
    RANK() OVER (ORDER BY SUM(v.receita) DESC) AS ranking
FROM vendas v
JOIN clientes c ON v.id_cliente = c.id_cliente
GROUP BY c.nome_cliente;

