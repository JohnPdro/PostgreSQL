-- CREATE DATABASE db_burguer_queen;

CREATE TABLE IF NOT EXISTS clientes (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT null,
  phone VARCHAR(20),
  address VARCHAR(255),
  created_at DATE NOT NULL DEFAULT CURRENT_DATE
);

CREATE TABLE IF NOT EXISTS suppliers (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  phone VARCHAR(20),
  email VARCHAR(100),
  hiring_date DATE NOT NULL DEFAULT CURRENT_DATE,
  notes TEXT
);

CREATE TABLE IF NOT EXISTS snacks (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  description TEXT,
  price DECIMAL(10, 2) NOT NULL --Pesquisar o que significa essa linha
);

CREATE TABLE IF NOT EXISTS orders (
  id SERIAL PRIMARY KEY,
  table_number INT NOT NULL,
  order_datetime TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  status VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS stock_ingredients (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  category VARCHAR(50),
  quantity INT NOT NULL DEFAULT 0
);

-- INSERT
INSERT INTO clientes (name, phone, address, created_at) VALUES ('João', '(11)91929-1312', 'Ruan B, nº 13', '2026-01-23');

INSERT INTO suppliers (name, phone, email, notes) VALUES ('ACME Inc.', '(11) 11111-1111', 'acme@email.com', 'N/a');

INSERT INTO snacks (name, price, description) VALUES('Hamburguer', 8, 'Pão, carne, alface, tomate, molho especial, batata palha');

INSERT INTO stock_ingredients (name, category, quantity) VALUES ('Ovos', 'Diversos', 24), ('Tomate', 'Frutas', 14), ('Queijo', 'Diversos', 40), ('Presunto', 'Carnes', 40);