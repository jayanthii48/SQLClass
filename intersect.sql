SELECT column1, column2, ...
FROM table1
INTERSECT
SELECT column1, column2, ...
FROM table2;



SELECT column1, column2, ...
FROM table1
INNER JOIN table2 USING (column1, column2, ...);


SELECT column1, column2, ...
FROM table1
WHERE EXISTS (
    SELECT *
    FROM table2
    WHERE table1.column1 = table2.column1
      AND table1.column2 = table2.column2
);

USE GP

-- Create the sales table
CREATE TABLE sales (
    sale_id INT AUTO_INCREMENT PRIMARY KEY,
    branch_id INT NOT NULL,
    product_name VARCHAR(50),
    sale_amount DECIMAL(10, 2)
);

-- Insert sample data into sales table
INSERT INTO sales (branch_id, product_name, sale_amount) VALUES
(1, 'Laptop', 1500.00),
(2, 'Phone', 800.00),
(3, 'Tablet', 600.00),
(1, 'Monitor', 300.00),
(2, 'Keyboard', 50.00);

-- Create the branch table
CREATE TABLE branch (
    branch_id INT PRIMARY KEY,
    branch_name VARCHAR(50),
    location VARCHAR(50)
);

-- Insert sample data into branch table
INSERT INTO branch (branch_id, branch_name, location) VALUES
(1, 'North Branch', 'New York'),
(2, 'South Branch', 'Los Angeles'),
(4, 'East Branch', 'Chicago'),
(5, 'West Branch', 'Houston');

-- Query 1: Simulate INTERSECT using INNER JOIN
SELECT s.branch_id, s.product_name, s.sale_amount
FROM sales s
INNER JOIN branch b ON s.branch_id = b.branch_id;

-- Query 2: Simulate INTERSECT using EXISTS
SELECT s.branch_id, s.product_name, s.sale_amount
FROM sales s
WHERE EXISTS (
    SELECT *
    FROM branch b
    WHERE s.branch_id = b.branch_id
);


