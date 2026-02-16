CREATE DATABASE aula_relacionamentos;

CREATE TABLE  employees (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  phone VARCHAR(30),
  
  departament_id INT NOT NULL, -- Relacionamento 1 para n
  FOREIGN KEY (departament_id) REFERENCES departaments (id)
);

CREATE TABLE addresses (
  id SERIAL PRIMAY KEY,
  street VARCHAR(255) NOT NULL,
  number VARCHAR(10),
  complement VARCHAR(255),
  city VARCHAR(255) NOT NULL,

  employee_id INT UNIQUE, -- Relacionamento 1 para 1
  FOREIGN KEY (employee_id) REFERENCES employees (id)
);

CREATE TABLE departaments (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL
);

-- INSERTs
-- Comece pelos departamentos, a tabela mais simples
INSERT INTO departaments (name) VALUES ('Imprensa'), ('Investigação'), ('Diplomacia');

-- Confira os IDs de cada um para usarmos na hora de inserir funcionários
SELECT * FROM departments;


-- Insira os funcionários
INSERT INTO employees (name, phone, departament_id) 
	VALUES ('Clark Kent', '1111-1111', 1);

INSERT INTO employees (name, phone, departament_id)
	VALUES ('Bruce Wayne', '2222-2222', 2);

INSERT INTO employees (name, phone, departament_id)
	VALUES ('Diana Prince', '3333-3333', 3);

INSERT INTO employees (name, phone, departament_id)
	VALUES ('John Jones', '4444-4444', 2);

-- Confira os IDs de cada um
SELECT * FROM employees;

-- A partir disso, insira os endereços
INSERT INTO addresses (street, city, employee_id)
	VALUES ('Rua A', 'Metropolis', 1);

INSERT INTO addresses (street, city, employee_id)
	VALUES ('Rua B', 'Gotham', 2);

INSERT INTO addresses (street, city, employee_id)
	VALUES ('Rua C', 'Themyscira', 3);

SELECT * FROM addresses;

-- Muito importante, forma de consultar dados que estão viculados atráves das chaves
SELECT * FROM employees JOIN addresses ON employees.id = addresses.employee_id;

SELECT * FROM  employees JOIN departaments ON employees.departament_id = departaments.id;

-- É possível fazer a chamada inversa também
SELECT * FROM departaments JOIN employees ON departaments.id = employees.departament_id;

-- Forma de consultar os dados mudando o nome de exibição das colunas
SELECT 
  employees.id AS ID_do_funcionario,
  employees.name AS nome_do_funcionario,
  employees.phone AS Telefone,
  departaments.id AS ID_do_departamento,
  departaments.name AS Departamento
FROM employees JOIN departaments ON employees.departament_id = departaments.id;