CREATE DATABASE laproti_pizzaria;
USE laproti_pizzaria;
-- Tabela Fornecedor
CREATE TABLE Fornecedor (
    id_fornecedor INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    telefone VARCHAR(20)
);

-- Tabela Insumo
CREATE TABLE Insumo (
    id_insumo INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    unidade_medida VARCHAR(20) NOT NULL
);

-- Tabela Estoque
CREATE TABLE Estoque (
    id_estoque INT PRIMARY KEY,
    id_insumo INT NOT NULL,
    quantidade DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (id_insumo) REFERENCES Insumo(id_insumo)
);

-- Tabela Compra
CREATE TABLE Compra (
    id_compra INT PRIMARY KEY,
    id_fornecedor INT NOT NULL,
    data_compra DATE NOT NULL,
    valor_total DECIMAL(10,2),
    FOREIGN KEY (id_fornecedor) REFERENCES Fornecedor(id_fornecedor)
);

-- Tabela Pizza
CREATE TABLE Pizza (
    id_pizza INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    preco DECIMAL(10,2) NOT NULL
);

-- Tabela Receita
CREATE TABLE Receita (
    id_receita INT PRIMARY KEY,
    id_pizza INT NOT NULL,
    id_insumo INT NOT NULL,
    quantidade DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (id_pizza) REFERENCES Pizza(id_pizza),
    FOREIGN KEY (id_insumo) REFERENCES Insumo(id_insumo)
);

-- Tabela Venda
CREATE TABLE Venda (
    id_venda INT PRIMARY KEY,
    data_venda DATE NOT NULL,
    valor_total DECIMAL(10,2)
);

-- Tabela Item_Venda
CREATE TABLE Item_Venda (
    id_item_venda INT PRIMARY KEY,
    id_venda INT NOT NULL,
    id_pizza INT NOT NULL,
    quantidade INT NOT NULL,
    subtotal DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (id_venda) REFERENCES Venda(id_venda),
    FOREIGN KEY (id_pizza) REFERENCES Pizza(id_pizza)
);
INSERT INTO Fornecedor VALUES
(1, 'Fornos Brasil', '(33) 99999-1234'),
(2, 'Laticínios Minas', '(33) 98888-4567');

INSERT INTO Insumo VALUES
(1, 'Farinha de Trigo', 'kg'),
(2, 'Molho de Tomate', 'kg'),
(3, 'Mussarela', 'kg'),
(4, 'Calabresa', 'kg');

INSERT INTO Estoque VALUES
(1, 1, 50),
(2, 2, 30),
(3, 3, 20),
(4, 4, 10);

INSERT INTO Compra VALUES
(1, 2, '2025-11-10', 850.00),
(2, 1, '2025-11-18', 1200.00);

INSERT INTO Pizza VALUES
(1, 'Calabresa', 45.00),
(2, 'Mussarela', 40.00),
(3, 'Frango com Catupiry', 50.00);

INSERT INTO Receita VALUES
(1, 1, 2, 0.5),
(2, 1, 4, 0.4),
(3, 2, 2, 0.4),
(4, 2, 3, 0.6),
(5, 3, 2, 0.5);

INSERT INTO Venda VALUES
(1, '2025-11-23', 135.00),
(2, '2025-11-22', 85.00);

INSERT INTO Item_Venda VALUES
(1, 1, 1, 2, 90.00),
(2, 1, 2, 1, 40.00),
(3, 2, 3, 1, 50.00);
SELECT * FROM Pizza;
SELECT id_pizza, nome, preco
FROM Pizza
ORDER BY preco ASC;
SELECT i.nome, e.quantidade
FROM Estoque e
JOIN Insumo i ON e.id_insumo = i.id_insumo
WHERE e.quantidade < 20;
SELECT v.id_venda,
       v.data_venda,
       p.nome AS pizza,
       iv.quantidade,
       iv.subtotal
FROM Venda v
JOIN Item_Venda iv ON v.id_venda = iv.id_venda
JOIN Pizza p ON iv.id_pizza = p.id_pizza;
SELECT nome, preco 
FROM Pizza
ORDER BY preco DESC
LIMIT 2;
SELECT f.nome AS fornecedor,
       SUM(c.valor_total) AS total_compras
FROM Compra c
JOIN Fornecedor f ON c.id_fornecedor = f.id_fornecedor
GROUP BY f.nome;
UPDATE Pizza
SET preco = 48.00
WHERE id_pizza = 1;
UPDATE Estoque
SET quantidade = quantidade + 5
WHERE id_insumo = 3;
UPDATE Fornecedor
SET telefone = '(33) 97777-1122'
WHERE id_fornecedor = 1;
DELETE FROM Item_Venda
WHERE id_item_venda = 3;
DELETE FROM Compra
WHERE id_compra = 2;
DELETE FROM Receita
WHERE id_receita = 5;


