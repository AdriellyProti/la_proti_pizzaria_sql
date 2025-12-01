-- 02_insert_data.sql
-- Inserção de dados iniciais para testes no banco La Proti Pizzaria

USE laproti_pizzaria;

-- Fornecedores
INSERT INTO Fornecedor (id_fornecedor, nome, telefone) VALUES
(1, 'Fornos Brasil', '(33) 99999-1234'),
(2, 'Laticínios Minas', '(33) 98888-4567');

-- Insumos
INSERT INTO Insumo (id_insumo, nome, unidade_medida) VALUES
(1, 'Farinha de Trigo', 'kg'),
(2, 'Molho de Tomate', 'kg'),
(3, 'Mussarela', 'kg'),
(4, 'Calabresa', 'kg');

-- Estoque
INSERT INTO Estoque (id_estoque, id_insumo, quantidade) VALUES
(1, 1, 50),
(2, 2, 30),
(3, 3, 20),
(4, 4, 10);

-- Compras
INSERT INTO Compra (id_compra, id_fornecedor, data_compra, valor_total) VALUES
(1, 2, '2025-11-10', 850.00),
(2, 1, '2025-11-18', 1200.00);

-- Pizzas
INSERT INTO Pizza (id_pizza, nome, preco) VALUES
(1, 'Calabresa', 45.00),
(2, 'Mussarela', 40.00),
(3, 'Frango com Catupiry', 50.00);

-- Receita das pizzas (uso de insumos)
INSERT INTO Receita (id_receita, id_pizza, id_insumo, quantidade) VALUES
(1, 1, 2, 0.5),
(2, 1, 4, 0.4),
(3, 2, 2, 0.4),
(4, 2, 3, 0.6),
(5, 3, 2, 0.5);

-- Vendas
INSERT INTO Venda (id_venda, data_venda, valor_total) VALUES
(1, '2025-11-23', 135.00),
(2, '2025-11-22', 85.00);

-- Itens das vendas
INSERT INTO Item_Venda (id_item_venda, id_venda, id_pizza, quantidade, subtotal) VALUES
(1, 1, 1, 2, 90.00),
(2, 1, 2, 1, 40.00),
(3, 2, 3, 1, 50.00);
