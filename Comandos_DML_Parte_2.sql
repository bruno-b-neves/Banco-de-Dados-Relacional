USE bellanapoli
GO

-- INSERE 3 PIZZAS NOVAS
INSERT INTO pizza(sabor, preco, descricao, observacao)
VALUES('MARGUERITA', 45.00, NULL, NULL)

INSERT INTO pizza(sabor, preco, descricao, observacao)
VALUES('DE PARMA', 65.00, NULL, NULL)

INSERT INTO pizza(sabor, preco, descricao, observacao)
VALUES('CAMARÃO AO ALHO E ÓLEO', 55.00, NULL, NULL)

-- SELECIONA AS PIZZAS CUJO PREÇO ESTÃO ACIMA DE R$ 50,00
SELECT * FROM pizza WHERE preco > 50.00;

SELECT * FROM pedido;

-- Insere mais 2 clientes
INSERT INTO cliente(nome, logradouro, telefone, bairro)
VALUES('Chico Duarte', 'Rua D, 10', '1191234-5678', 'Centro');

INSERT INTO cliente(nome, logradouro, telefone, bairro)
VALUES('Paulo Visto', 'Rua F, 150', '1191234-5678', 'Sul');

-- SELECIONA A TABELA CLIENTE E FILTRA  BAIRRO = 'CENTRO' E ID_CLIENTE = 1
SELECT * FROM cliente WHERE bairro = 'Centro' AND id_cliente = 1;

-- SELECIONA A TABELA CLIENTE E FILTRA BAIRRO = 'SUL' OU BAIRRO = 'NORTE'
SELECT * FROM cliente WHERE bairro = 'Sul' OR bairro = 'Norte';

INSERT INTO pedido(id_cliente, id_pizza, quantidade, preco_total)
VALUES(3, 5, 2, 2 * 45.00)

INSERT INTO pedido(id_cliente, id_pizza, quantidade, preco_total)
VALUES(5, 7, 3, 3 * 55.00)

UPDATE pedido
SET status = 'FINALIZADO'
WHERE id_pedido = 2;

SELECT * FROM pedido WHERE status <> 'FINALIZADO';
