CREATE DATABASE BellaNapoli;
GO

USE BellaNapoli;
GO

IF OBJECT_ID(N'Cliente') IS NOT NULL DROP TABLE Cliente;
IF OBJECT_ID(N'Pizza') IS NOT NULL DROP TABLE Pizza;
IF OBJECT_ID(N'Pedido') IS NOT NULL DROP TABLE Pedido;

CREATE TABLE Cliente(
  id_Cliente INT PRIMARY KEY IDENTITY(1,1),
  nome VARCHAR(100) NOT NULL,
  logradouro VARCHAR(100) NOT NULL,
  numero_residencia INT NOT NULL,
  bairro VARCHAR(100) NOT NULL,
  telefone VARCHAR(20) NOT NULL
)

CREATE TABLE Pizza(
  id_Pizza INT PRIMARY KEY IDENTITY(1,1),
  sabor_pizza VARCHAR(100) NOT NULL,
  descricao VARCHAR(100),
  preco_unitario DECIMAL(10,2) DEFAULT 0.00 NOT NULL,
)

CREATE TABLE Pedido(
  id_Pedido INT PRIMARY KEY IDENTITY(1,1),
  id_Cliente INT,
  total_pedido DECIMAL(10,2) DEFAULT 0.00 NOT NULL,
  data_registro DATETIME DEFAULT GETDATE(),

  CONSTRAINT FK_Pedido_Cliente
    FOREIGN KEY (id_Cliente)
    REFERENCES Cliente(id_Cliente)
)

INSERT INTO Pizza (sabor_pizza, descricao, preco_unitario) VALUES('Mussarela', NULL, 40.00)
INSERT INTO Pizza (sabor_pizza, descricao, preco_unitario) VALUES('Calabresa', NULL, 40.00)
INSERT INTO Pizza (sabor_pizza, descricao, preco_unitario) VALUES('Margueritta', NULL, 40.00)

INSERT INTO Cliente (
    nome,
    logradouro,
    numero_residencia,
    bairro,
    telefone
  ) 
VALUES('Bruno', 'Rua dos Bobos', 0, 'Jd. dos Sonhos', '1191234-5678')

INSERT INTO Cliente (
    nome,
    logradouro,
    numero_residencia,
    bairro,
    telefone
  ) 
VALUES('Caroline', 'Rua da Casinha Torta', 55, 'Jd. das Esperanças', '1191234-5678')

INSERT INTO Pedido (
    total_pedido,
    id_Cliente
  ) 
VALUES(80.00, 1)

CREATE TABLE Item_Pedido(
  id_Item_Pedido INT PRIMARY KEY IDENTITY(1,1),
  id_Pedido INT NOT NULL,
  quantidade INT NOT NULL,
  id_Pizza INT NOT NULL,
  preco_unit DECIMAL(10,2) DEFAULT 00.00 NOT NULL,
  subtotal DECIMAL(10,2) DEFAULT 00.00 NOT NULL,
  CONSTRAINT FK_Pedido
    FOREIGN KEY(id_Pedido)
    REFERENCES Pedido(id_Pedido),

  CONSTRAINT FK_Pizza
    FOREIGN KEY(id_Pizza)
    REFERENCES Pizza(id_Pizza)
);

INSERT INTO Item_Pedido(
  id_pedido, id_Pizza, quantidade, preco_unit, subtotal)
VALUES(1, 2, 2, 40.00, 80.00) 

-- Ampliação do desafio
UPDATE Pizza
SET preco_unitario = preco_unitario * 1.1
WHERE sabor_pizza = 'Mussarela'

UPDATE Cliente
SET fidelidade = 1
WHERE id_Cliente = 1;

UPDATE Cliente
SET logradouro = 'Rua da Fidelidade' 
WHERE fidelidade > 0

ALTER TABLE Pedido ADD status VARCHAR(100) DEFAULT 'Aguarde, aceitar o pedio'
UPDATE Pedido
SET status = 'Cancelado'
WHERE id_Pedido = 1

DELETE FROM Item_Pedido
WHERE id_Pedido IN (SELECT id_Pedido FROM Pedido WHERE status = 'Cancelado');

DELETE Pedido
WHERE status = 'Cancelado'

INSERT INTO Pizza(sabor_pizza, descricao, preco_unitario) VALUES('Pizza da Casa', NULL, 65.67)

UPDATE Pizza
SET sabor_pizza = 'Promoção Relâmpago'
WHERE id_Pizza = 4

UPDATE Pizza
SET preco_unitario = preco_unitario / 1.1
WHERE id_Pizza = 4
