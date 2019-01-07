CREATE TABLE Test(id INT NOT NULL, city varchar(255) DEFAULT 'New York')

SELECT
INSERT
UPDATE
DELETE


Clause & Operators
WHERE - Limits rows returned by a condition
JOIN - Combine rows from 2 or more tables
LIKE - Used in a WHERE clause to search for a specific pattern
IN - Allow us to specify multiple values in a WHERE clause
BETWEEN - Select values whitin a range



ONLINE STORE SQL
CREATE DATABASE mystore

CREATE TABLE Customers(
	id INT NOT NULL AUTO_INCREMENT,
	first_name VARCHAR(255),
	last_name VARCHAR(255),email VARCHAR(255),password VARCHAR(255),
	street_address VARCHAR(255),city VARCHAR(255),
	state VARCHAR(255),zip VARCHAR(255),
	PRIMARY KEY(id)
);

INSERT INTO Customers(first_name, last_name,email,password,street_address,city,state,zip)
VALUES('Guilherme', 'Queiroz', 'guihqueiroz.15@gmail.com', '123456', '20 main st', 'Boston', 'MA', '012904'),
('Guilherme', 'Queiroz', 'guihqueiroz.15@gmail.com', '123456', '20 main st', 'Boston', 'MA', '012904'),
('Guilherme', 'Queiroz', 'guihqueiroz.15@gmail.com', '123456', '20 main st', 'Boston', 'MA', '012904');


SELECT * FROM Customers;

SELECT first_name, last_name FROM Customers;

SELECT * FROM Customers WHERE state = 'MA';
SELECT * FROM Customers WHERE id = 2;
SELECT * FROM Customers WHERE id > 3;

SELECT id, email FROM Customers WHERE id BETWEEN 2 AND 4;

SELECT * FROM Customers WHERE city LIKE 'B%';
SELECT * FROM Customers WHERE city LIKE 'Bo%';

SELECT * FROM Customers WHERE city = 'Amesburry' OR city = 'Salisbury';

SELECT * FROM Customers WHERE city IN('Amsbury', 'Salisbury');


#DISTINcT VALUES
SELECT DISTINcT city FROM Customers 

#Format querys
SELECT first_name AS 'First Name', last_name AS 'Last Name' FROM Customers;

#CONCAT
SELECT CONCAT(first_name,' ',last_name) AS 'Name', CONCAT(street_address,' ',city,' ',state) AS 'Address' FROM Customers;


#UPDATE and DELETE
UPDATE Customers 
SET last_name = 'Smith'
WHERE id = 4;

DELETE FROM Customers WHERE id = 7;

#ALTER TABLE
ALTER TABLE Customers ADD balance VARCHAR(255);

ALTER TABLE Customers REMOVE balance;

ALTER TABLE Customers MODIFY COLUMN balance float;

UPDATE Customers 
SET balance = 500
WHERE id = 1;


#Create new tables
CREATE TABLE products(
	id INT NOT NULL AUTO_INCREMENT,
	name VARCHAR(255),
	price INT,
	PRIMARY KEY(id)
);

INSERT INTO products (name, price)
VALUES('Product1', 10),
('Product2', 15),
('Product3', 20),
('Product4', 5);


#TABLE de pedidos
CREATE TABLE orders(
	id INT NOT NULL AUTO_INCREMENT,
	order_number INT,
	product_id INT,
	Customer_id INT,
	order_date DATETIME default CURRENT_TIMESTAMP,
	PRIMARY KEY(id),
	FOREIGN KEY(Customer_id) REFERENCES Customers(id),
	FOREIGN KEY(product_id) REFERENCES products(id)
);


INSERT INTO orders(
	order_number,
	product_id,
	Customer_id
) VALUES(
	001,
	1,
	1
);


#JOINS pegar dados de outras tabelas e juntar
#PRIMARY KEY OF ONE TABLE AND FOREIGN KEY OF ANOTHER
SELECT customers.first_name, customers.last_name, orders.id, orders.order_number 
FROM customers 
INNER JOIN orders

ON Customers.id = orders.Customer_id


SELECT customers.first_name, customers.last_name, orders.order_number,orders.order_date
FROM customers
LEFT JOIN orders ON customers.id = orders.customer_id
ORDER BY customers.last_name

SELECT customers.first_name, customers.last_name, orders.order_number,orders.order_date
FROM customers
RIGHT JOIN orders ON customers.id = orders.customer_id
ORDER BY customers.last_name

#get the product whit JOIN
SELECT customers.first_name, customers.last_name, orders.order_number,orders.order_date,products.name
FROM orders
INNER JOIN products ON orders.product_id = products.id
INNER JOIN customers ON order.customer_id = customer.id
ORDER BY orders.order_number


SELECT CONCAT(customers.first_name,' ',customers.last_name) AS 'Name', CONCAT(orders.order_number,' ',orders.order_date) AS 'Order' , products.name AS 'Product'
FROM orders
INNER JOIN products ON orders.product_id = products.id
INNER JOIN customers ON order.customer_id = customers.id
ORDER BY orders.order_number

