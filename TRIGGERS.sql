
CREATE TRIGGER trigger_name
{ BEFORE | AFTER } { INSERT | UPDATE | DELETE }
ON table_name
FOR EACH ROW
BEGIN
trigger_body;
END




OLD: Refers to the existing values before the operation.
Applicable in UPDATE and DELETE.
NEW: Refers to the new values after the operation.
Applicable in INSERT and UPDATE.




DROP DATABASE GP
CREATE DATABASE GP
USE GP
--  Create the employees table
CREATE TABLE employees (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    salary DECIMAL(10, 2),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create a log table
CREATE TABLE log_table (
    id INT AUTO_INCREMENT PRIMARY KEY,
    action VARCHAR(10),
    emp_id INT,
    log_time TIMESTAMP
);

--  Insert initial values into employees
INSERT INTO employees (name, salary) VALUES
('Alice', 50000),
('Bob', 60000),
('Charlie', 70000),
('Diana', 80000),
('Eve', 90000);


--  Create a trigger for logging inserts
CREATE TRIGGER log_insert
AFTER INSERT ON employees
FOR EACH ROW
INSERT INTO log_table (action, emp_id, log_time)
VALUES ('INSERT', NEW.id, NOW());

SELECT* FROM employees

-- Insert new employee (Log trigger will activate)
INSERT INTO employees (name, salary) VALUES ('Frank', 55000);

SELECT* FROM log_table


--  Create an audit table
CREATE TABLE audit_log (
    id INT AUTO_INCREMENT PRIMARY KEY,
    emp_id INT,
    old_salary DECIMAL(10, 2),
    new_salary DECIMAL(10, 2),
    updated_at TIMESTAMP
);

SELECT * FROM audit_log

--  Create a trigger for auditing updates
CREATE TRIGGER audit_updates
BEFORE UPDATE ON employees
FOR EACH ROW
INSERT INTO audit_log (emp_id, old_salary, new_salary, updated_at)
VALUES (OLD.id, OLD.salary, NEW.salary, NOW());

UPDATE employees SET salary = 60000 WHERE id = 1;

SELECT * FROM audit_log


--  Create a customers table for the calculation example
CREATE TABLE customers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    total_spent DECIMAL(10, 2) DEFAULT 0
);

--  Create an orders table for the calculation example

CREATE TABLE orders (
    id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    amount DECIMAL(10, 2),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (customer_id) REFERENCES customers(id)
);


--  Insert initial values into customers
INSERT INTO customers (name, total_spent) VALUES
('Customer A', 0),
('Customer B', 0);


SELECT * FROM customers
SELECT * FROM orders


--  Create a trigger to update total spent
CREATE TRIGGER update_total
AFTER INSERT ON orders
FOR EACH ROW
UPDATE customers  SET total_spent = total_spent + NEW.amount   WHERE id = NEW.customer_id;

-- Add an order (Calculation trigger will activate)
INSERT INTO orders (customer_id, amount) VALUES (1, 200);

SHOW TRIGGERS;






