-- 01_create_tables.sql
-- Criação do banco de dados e das tabelas do projeto La Proti Pizzaria

CREATE DATABASE IF NOT EXISTS laproti_pizzaria;
USE laproti_pizzaria;

-- Tabela Fornecedor
CREATE TABLE IF NOT EXISTS Fornecedor (
    id_fornecedor INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    telefone VARCHAR(20)
);

-- Tabela Insumo
CREATE TABLE IF NOT EXISTS Insumo (
    id_insumo INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    unidade_medida VARCHAR(20) NOT NULL
);

-- Tabela Estoque
CREATE TABLE IF NOT EXISTS Estoque (
    id_estoque INT PRIMARY KEY,
    id_insumo INT NOT NULL,
    quantidade DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (id_insumo) REFERENCES Insumo(id_insumo)
);

-- Tabela Compra
CREATE TABLE IF NOT EXISTS Compra (
    id_compra INT PRIMARY KEY,
    id_fornecedor INT NOT NULL,
    data_compra DATE NOT NULL,
    valor_total DECIMAL(10,2),
    FOREIGN KEY (id_fornecedor) REFERENCES Fornecedor(id_fornecedor)
);

-- Tabela Pizza
CREATE TABLE IF NOT EXISTS Pizza (
    id_pizza INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    preco DECIMAL(10,2) NOT NULL
);

-- Tabela Receita (relaciona pizza e insumo)
CREATE TABLE IF NOT EXISTS Receita (
    id_receita INT PRIMARY KEY,
    id_pizza INT NOT NULL,
    id_insumo INT NOT NULL,
    quantidade DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (id_pizza) REFERENCES Pizza(id_pizza),
    FOREIGN KEY (id_insumo) REFERENCES Insumo(id_insumo)
);

-- Tabela Venda
CREATE TABLE IF NOT EXISTS Venda (
    id_venda INT PRIMARY KEY,
    data_venda DATE NOT NULL,
    valor_total DECIMAL(10,2)
);

-- Tabela Item_Venda
CREATE TABLE IF NOT EXISTS Item_Venda (
    id_item_venda INT PRIMARY KEY,
    id_venda INT NOT NULL,
    id_pizza INT NOT NULL,
    quantidade INT NOT NULL,
    subtotal DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (id_venda) REFERENCES Venda(id_venda),
    FOREIGN KEY (id_pizza) REFERENCES Pizza(id_pizza)
);
