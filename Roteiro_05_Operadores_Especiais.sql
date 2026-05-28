USE BellaNapoli

SELECT * FROM Cliente


INSERT Pizza(nome_pizza, preco_unit, observacao)
VALUES('Mussarela', 35.00, NULL)

INSERT Pizza(nome_pizza, preco_unit, observacao)
VALUES('Calabresa', 40.00, NULL)

INSERT Pizza(nome_pizza, preco_unit, observacao)
VALUES('Frango Catupiry', 42.50, NULL)

INSERT Pizza(nome_pizza, preco_unit, observacao)
VALUES('Di Parma', 70.00, NULL)

INSERT Pizza(nome_pizza, preco_unit, observacao, categoria)
VALUES('Da Casa', 70.00, NULL, 'Especiais')

-- Busca todas pizzas com nome padrão utilizando "LIKE" 
SELECT * FROM Pizza
WHERE nome_pizza LIKE 'Frango%'

-- Filtra as pizzas de um valor x até o valor y com "BETWEEN"
SELECT * FROM Pizza
WHERE preco_unit BETWEEN 40.00 AND 60.00

-- Seleciona o bairro do cliente por lista com "IN"
SELECT * FROM Cliente
WHERE bairro IN ('Centro', 'Oeste', 'Sul')

/* ..:: Ampliação do Desafio ::..*/

-- Seleciona a data de registro da tabela Pedido e se é NULL utilizando "IS NULL"
SELECT * FROM Pedido
WHERE data_registro IS NULL

-- Seleciona os clientes por nome na tabela Pedido se existir pedidos utilizando "EXISTS"
SELECT nome FROM Cliente C
WHERE EXISTS (
	SELECT 1 
	FROM Pedido P
	WHERE P.id_Cliente = C.id_Cliente
)

-- 
UPDATE Pizza
SET preco_unit = preco_unit * 1.10
WHERE categoria IN ('Doces', 'Especiais')

DELETE Cliente 
WHERE nome LIKE 'TESTE%'


