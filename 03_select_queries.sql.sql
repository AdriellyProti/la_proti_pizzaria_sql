-- 03_select_queries.sql
-- Consultas de exemplo utilizando SELECT, WHERE, ORDER BY, LIMIT, JOIN e GROUP BY

USE laproti_pizzaria;

-- 1. Listar todas as pizzas ordenadas do menor para o maior preço
SELECT id_pizza, nome, preco
FROM Pizza
ORDER BY preco ASC;

-- 2. Listar insumos que estão com quantidade abaixo de 20 unidades no estoque
SELECT i.nome, e.quantidade
FROM Estoque e
JOIN Insumo i ON e.id_insumo = i.id_insumo
WHERE e.quantidade < 20;

-- 3. Listar todas as vendas com seus itens e pizzas
SELECT v.id_venda,
       v.data_venda,
       p.nome AS pizza,
       iv.quantidade,
       iv.subtotal
FROM Venda v
JOIN Item_Venda iv ON v.id_venda = iv.id_venda
JOIN Pizza p ON iv.id_pizza = p.id_pizza;

-- 4. Buscar apenas as 2 pizzas mais caras
SELECT nome, preco
FROM Pizza
ORDER BY preco DESC
LIMIT 2;

-- 5. Mostrar o total comprado por fornecedor
SELECT f.nome AS fornecedor,
       SUM(c.valor_total) AS total_compras
FROM Compra c
JOIN Fornecedor f ON c.id_fornecedor = f.id_fornecedor
GROUP BY f.nome;
