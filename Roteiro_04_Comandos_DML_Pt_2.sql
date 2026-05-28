USE BellaNapoli

SELECT * FROM Pedido;

-- Tarefa 1 - Inserção com Verificação Relacional

-- Populando as pizzas

INSERT Pizza(
	nome_pizza,
	preco_unit,
	observacao
)
VALUES('Portuguesa', 55.00, NULL)

INSERT Pizza(
	nome_pizza,
	preco_unit,
	observacao
)
VALUES('Camarão', 65.00, NULL)

INSERT Pizza(
	nome_pizza,
	preco_unit,
	observacao
)
VALUES('Aliche', 45.00, NULL)

-- Consulta com operador ">", estamos listando as pizzas com valores maiores que 50

SELECT * FROM Pizza
WHERE preco_unit > 50

/*  ..:: Ampliação do Desafio ::..*/

-- 1. Cadastrar Clientes

INSERT INTO Cliente(
	nome, logradouro, numero_residencia, bairro, telefone)
VALUES('Erick', 'Rua Qualquer', 55, 'Bairro Norte', '(11) 1234-5678')

INSERT INTO Cliente(
	nome, logradouro, numero_residencia, bairro, telefone)
VALUES('Felipe', 'Rua das Alamedas', 115, 'Bairro Oeste', '(11) 91234-5678')

INSERT INTO Cliente(
	nome, logradouro, numero_residencia, bairro, telefone)
VALUES('Mirian', 'Rua das Rosas', 556, 'Bairro Sul', '(11) 91234-5678')

INSERT INTO Cliente(
	nome, logradouro, numero_residencia, bairro, telefone)
VALUES('Gilson', 'Rua dos Correias', 556, 'Bairro Centro', '(11) 91234-5678')

-- 2. Consulta com Operador Lógico

SELECT * FROM Cliente
WHERE bairro = 'Bairro Centro' AND id_Cliente = 6

SELECT * FROM Cliente
WHERE bairro = 'Bairro Sul' OR bairro = 'Bairro Norte'

-- 3. Registro de Venda Condicional

CREATE TABLE Item_Pedido(
	id_Item_Pedido INT PRIMARY KEY IDENTITY,
	id_Pizza INT,
	id_Pedido INT,
	quantidade INT NOT NULL,
	observacao VARCHAR(100),
	data_registro DATETIME DEFAULT GETDATE(),

	CONSTRAINT FK_Id_Pedido
		FOREIGN KEY (id_Pedido)
		REFERENCES Pedido(id_Pedido),
	
	CONSTRAINT FK_Id_Pizza
		FOREIGN KEY (id_Pizza)
		REFERENCES Pizza(id_Pizza)
);

-- Verifica o status do pedido com o operador lógico "<> ou !="

SELECT * FROM Pedido
WHERE status != 'Finalizado'
