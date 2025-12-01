-- 04_update_delete.sql
-- Comandos de atualização (UPDATE) e exclusão (DELETE) no banco La Proti Pizzaria

USE laproti_pizzaria;

-- =======================
-- UPDATES
-- =======================

-- 1. Atualizar o preço da pizza de Calabresa
UPDATE Pizza
SET preco = 48.00
WHERE id_pizza = 1;

-- 2. Acrescentar 5 unidades no estoque de Mussarela
UPDATE Estoque
SET quantidade = quantidade + 5
WHERE id_insumo = 3;

-- 3. Atualizar o telefone do fornecedor 1
UPDATE Fornecedor
SET telefone = '(33) 97777-1122'
WHERE id_fornecedor = 1;

-- =======================
-- DELETES
-- =======================

-- 1. Remover um item específico de venda
DELETE FROM Item_Venda
WHERE id_item_venda = 3;

-- 2. Remover uma compra específica (por exemplo, cancelada)
DELETE FROM Compra
WHERE id_compra = 2;

-- 3. Remover um registro de receita específico
DELETE FROM Receita
WHERE id_receita = 5;
