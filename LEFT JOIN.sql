DROP DATABASE GP
CREATE DATABASE GP
USE GP

-- Create salesperson table
CREATE TABLE salesperson (
    salesperson_id INT PRIMARY KEY,
    name VARCHAR(100),
    region VARCHAR(50)
);

-- Create product table
CREATE TABLE product (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    price DECIMAL(10, 2)
);

-- Create sales table
CREATE TABLE sales (
    sale_id INT PRIMARY KEY,
    salesperson_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY (salesperson_id) REFERENCES salesperson(salesperson_id),
    FOREIGN KEY (product_id) REFERENCES product(product_id)
);

-- Insert data into salesperson table
INSERT INTO salesperson (salesperson_id, name, region) VALUES
(1, 'Alice', 'North'),
(2, 'Bob', 'South'),
(3, 'Charlie', 'East');

-- Insert data into product table
INSERT INTO product (product_id, product_name, price) VALUES
(101, 'Laptop', 800.00),
(102, 'Tablet', 300.00),
(103, 'Smartphone', 500.00);

-- Insert data into sales table
INSERT INTO sales (sale_id, salesperson_id, product_id, quantity) VALUES
(1, 1, 101, 2),
(2, 1, 103, 1),
(3, 2, 102, 3);

-- Query 1: List all salespersons and their sales details
SELECT 
    salesperson.name AS Salesperson,
    sales.quantity AS Quantity
FROM 
    salesperson
LEFT JOIN 
    sales
ON 
    salesperson.salesperson_id = sales.salesperson_id
LEFT JOIN 
    product
ON 
    sales.product_id = product.product_id;

-- Query 2: Find salespersons who haven't made any sales
SELECT 
    salesperson.name AS Salesperson,
    sales.sale_id AS Sale
FROM 
    salesperson
LEFT JOIN 
    sales
ON 
    salesperson.salesperson_id = sales.salesperson_id
WHERE 
    sales.sale_id IS NULL;

-- Query 3: List all products and their sales details
SELECT 
    product.product_name AS Product,
    salesperson.name AS Salesperson,
    sales.quantity AS Quantity
FROM 
    product
LEFT JOIN 
    sales
ON 
    product.product_id = sales.product_id
LEFT JOIN 
    salesperson
ON 
    sales.salesperson_id = salesperson.salesperson_id;

-- Query 4: Total sales by each salesperson
SELECT 
    salesperson.name AS Salesperson,
    SUM(sales.quantity * product.price) AS TotalSales
FROM 
    salesperson
LEFT JOIN 
    sales
ON 
    salesperson.salesperson_id = sales.salesperson_id
LEFT JOIN 
    product
ON 
    sales.product_id = product.product_id
GROUP BY 
    salesperson.name;

-- Query 5: List all products that haven’t been sold
SELECT 
    product.product_name AS Product
FROM 
    product
LEFT JOIN 
    sales
ON 
    product.product_id = sales.product_id
WHERE 
    sales.sale_id IS NULL;
