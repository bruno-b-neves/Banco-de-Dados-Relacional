USE bellanapoli
GO

SELECT * FROM pedido;
SELECT * FROM cliente;

UPDATE pizza 
SET preco = preco * 1.1;

UPDATE cliente
SET logradouro = 'Rua C, 2048'
WHERE id_cliente = 1;

UPDATE pedido
SET status = 'CANCELADO'
WHERE id_pedido = 1;

DELETE FROM pedido WHERE status = 'CANCELADO'

UPDATE pizza
SET sabor = 'SUPER PROMOÇÃO',
    preco = preco * 0.90
WHERE id_pizza = 4
