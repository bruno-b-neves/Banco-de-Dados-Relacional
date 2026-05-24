USE bellanapoli
GO

SELECT * FROM cliente;

-- CRIA A TABELA CLIENTE
CREATE TABLE cliente(
  id_cliente INT PRIMARY KEY IDENTITY(1,1),
  nome VARCHAR(100) NOT NULL,
  logradouro VARCHAR(100) NOT NULL,
  bairro
  telefone VARCHAR(100) NOT NULL,
  data_cadastro DATETIME DEFAULT GETDATE()
);

-- INSERE O 1º CLIENTE NA TABELA CLIENTE
INSERT INTO cliente(nome, logradouro, telefone)
VALUES('Maria da Silva', 'Rua A, 55', '1191234-5678');

-- INSERE O 2º CLIENTE NA TABELA CLIENTE
INSERT INTO cliente(nome, logradouro, telefone)
VALUES('Pedro Paulo', 'Rua B, 115', '1191234-5678');

-- CRIA A TABELA PIZZA
CREATE TABLE pizza(
  id_pizza INT PRIMARY KEY IDENTITY(1,1),
  sabor VARCHAR(100) NOT NULL,
  preco DECIMAL(10,2) NOT NULL,
  descricao VARCHAR(100),
  observacao VARCHAR(100),
);

-- INSERE A PIZZA DE CALABRESA NA TABELA PIZZA
INSERT INTO pizza(sabor, preco, descricao, observacao)
VALUES('CALABRESA', 40.00, NULL, NULL);

-- INSERE A PIZZA DE MUÇARELA NA TABELA PIZZA
INSERT INTO pizza(sabor, preco, descricao, observacao)
VALUES('MUÇARELA', 40.00, NULL, NULL);

-- INSERE A PIZZA DE PORTUGUESA NA TABELA PIZZA
INSERT INTO pizza(sabor, preco, descricao, observacao)
VALUES('PORTUGUESA', 40.00, NULL, NULL);

-- INSERE A PIZZA DA CASA NA TABELA PIZZA
INSERT INTO pizza(sabor, preco, descricao, observacao)
VALUES('PIZZA DA CASA', 65.00, NULL, NULL);

-- CRIA A TABELA PEDIDO
CREATE TABLE pedido(
  id_pedido INT PRIMARY KEY IDENTITY(1,1),
  id_cliente INT NOT NULL,
  id_pizza INT NOT NULL,
  quantidade INT DEFAULT 1 NOT NULL,
  preco_total DECIMAL(10,2) NOT NULL,
  status VARCHAR(100) DEFAULT 'PREPARANDO' NOT NULL,
  data_pedido DATETIME DEFAULT GETDATE(),

  CONSTRAINT fk_pedido_cliente
    FOREIGN KEY (id_cliente)
    REFERENCES cliente(id_cliente),

  CONSTRAINT fk_pedido_pizza
    FOREIGN KEY (id_pizza)
    REFERENCES pizza(id_pizza)
);

-- CADASTRA UM PEDIDO PARA O CLIENTE (ID)
INSERT INTO pedido(id_cliente, id_pizza, quantidade, preco_total)
VALUES(1, 2, 3, 3 * 40.00)

INSERT INTO pedido(id_cliente, id_pizza, quantidade, preco_total)
VALUES(2, 3, 1, 1 * 40.00)
