-- Crie a tabela de clientes
CREATE TABLE IF NOT EXISTS customers (
	id SERIAL PRIMARY KEY,
	name VARCHAR(100) NOT NULL,
	email VARCHAR(100) UNIQUE NOT NULL
);

-- Crie a tabela de pedidos
CREATE TABLE IF NOT EXISTS orders (
	id SERIAL PRIMARY KEY,
	total DECIMAL(10, 2),
  
	customer_id INT,
	FOREIGN KEY (customer_id) REFERENCES customers (id)
      ON DELETE CASCADE -- O Cascade serve para caso haja alguma alteração ou excluzão na tabela clientes ocorra o mesmo para os itens referenciados na tabela pedidos
      ON UPDATE CASCADE -- Existe o comando RESTRICT que caso haja vinculo entre as tabelas e você tente fazer alguma alteração essa ação é cancelada
);

-- Insira dados na tabela de clientes
INSERT INTO customers (name, email) VALUES
	('Clark Kent', 'clark@email.com'),
	('Bruce Wayne', 'bruce@email.com'),
	('Diana Prince', 'diana@email.com');

-- Insira dados na tabela de pedidos
INSERT INTO orders (total, customer_id) VALUES
	(100.00, 1),
	(240.00, 2),
	(200.00, 1),
	(420.00, 3),
	(700.00, 2);

-- Exclua um cliente e observe o efeito nos pedidos
DELETE FROM customers WHERE id = 1;

-- Verifique os pedidos restantes
SELECT * FROM orders JOIN customers ON customers.id = orders.customer_id;

-- Atualize um cliente e observe o efeito nos pedidos
UPDATE customers SET id = 40 WHERE id = 2;

-- Verifique os pedidos atualizados
SELECT * FROM orders JOIN customers ON customers.id = orders.customer_id;
