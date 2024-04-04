CREATE DATABASE Guia
USE Guia

CREATE TABLE Clientes
(
    id INT PRIMARY KEY IDENTITY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    telefone VARCHAR(15) NOT NULL,
    endereco VARCHAR(100) NOT NULL
);

CREATE TABLE Produtos
(
    id INT PRIMARY KEY IDENTITY,
    nome VARCHAR(100) NOT NULL,
    descricao VARCHAR(100) NOT NULL,
    preco DECIMAL(10,2) NOT NULL
);

CREATE TABLE Pedidos
(
    id INT PRIMARY KEY IDENTITY,
    id_cliente INT NOT NULL,
    id_produto INT NOT NULL,
    quantidade INT NOT NULL,
    data_pedido DATE NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id),
    FOREIGN KEY (id_produto) REFERENCES Produtos(id)
);