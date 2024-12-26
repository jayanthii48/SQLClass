
CREATE TABLE employees (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    department VARCHAR(50),
    email VARCHAR(100),
    salary INT
);

--  Table Creation for Products (for Full-Text Index example)
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    name VARCHAR(100),
    description TEXT
);

--  Table Creation for Orders and Customers (for Foreign Key Index example)
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

--  Sample Data Insertion for Employees
INSERT INTO employees (id, name, department, email, salary) VALUES
(1, 'John Doe', 'HR', 'john@example.com', 60000),
(2, 'Jane Smith', 'IT', 'jane@example.com', 70000),
(3, 'Alice Brown', 'Finance', 'alice@example.com', 50000),
(4, 'Bob White', 'HR', 'bob@example.com', 40000),
(5, 'Charlie Black', 'IT', 'charlie@example.com', 80000);

-- Sample Data Insertion for Products
INSERT INTO products (product_id, name, description) VALUES
(1, 'Smartphone', 'A durable smartphone with a long battery life.'),
(2, 'Laptop', 'A lightweight laptop perfect for travel.'),
(3, 'Headphones', 'Noise-canceling headphones with premium sound quality.');

-- Sample Data Insertion for Customers and Orders
INSERT INTO customers (customer_id, name, email) VALUES
(1, 'Alice Green', 'aliceg@example.com'),
(2, 'David Blue', 'davidb@example.com');

INSERT INTO orders (order_id, customer_id, order_date) VALUES
(1, 1, '2024-12-01'),
(2, 2, '2024-12-02');

-- 5. Index Creation

-- Single Column Index
CREATE INDEX idx_name ON employees (name);

-- Composite Index
CREATE INDEX idx_dept_salary ON employees (department, salary);

-- Unique Index
CREATE UNIQUE INDEX idx_email ON employees (email);

-- Full-Text Index
CREATE FULLTEXT INDEX idx_description ON products (description);

-- Index on Foreign Key
-- MySQL automatically creates an index for the customer_id foreign key in the orders table.

-- Index for Sorting
CREATE INDEX idx_salary ON employees (salary);

-- Partial Indexing (Using Prefix)
CREATE INDEX idx_email_prefix ON employees (email(10));

-- Conditional Index (MySQL 8.0+)
ALTER TABLE employees ADD INDEX idx_high_salary (salary) WHERE salary > 50000;

-- Covering Index
CREATE INDEX idx_name_department ON employees (name, department);

--  Query Examples

-- Single Column Index
SELECT * FROM employees WHERE name = 'John Doe';

-- Composite Index
SELECT * FROM employees WHERE department = 'HR' AND salary > 50000;
SELECT * FROM employees WHERE department = 'HR';

-- Unique Index
-- This will throw an error:
-- INSERT INTO employees (id, name, email) VALUES (6, 'John Snow', 'john@example.com');

-- Full-Text Index
SELECT * FROM products WHERE MATCH(description) AGAINST('durable smartphone');

-- Index for Sorting
SELECT * FROM employees ORDER BY salary DESC;

-- Partial Indexing
SELECT * FROM employees WHERE email LIKE 'john%';

-- Conditional Index
SELECT * FROM employees WHERE salary > 50000;

-- Covering Index
SELECT name, department FROM employees WHERE name = 'John Doe';

-- 7. View Indexes
SHOW INDEX FROM employees;
SHOW INDEX FROM products;
SHOW INDEX FROM orders;
