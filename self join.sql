-- Drop table if it exists
use gp
DROP TABLE IF EXISTS employees;

-- Create the table
CREATE TABLE employees (
    employee_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    manager_id INT DEFAULT NULL
);

-- Insert values
INSERT INTO employees (name, manager_id) VALUES
('Alice', NULL),    -- Alice is the top-level manager
('Bob', 1),         -- Bob reports to Alice
('Charlie', 1),     -- Charlie reports to Alice
('David', 2),       -- David reports to Bob
('Eve', 3);         -- Eve reports to Charlie

--  Find employee-manager relationships
SELECT e1.name AS employee, e2.name AS manager
FROM employees AS e1
LEFT JOIN employees AS e2
ON e1.manager_id = e2.employee_id;

-- Find all employees without managers
SELECT name AS employee
FROM employees
WHERE manager_id IS NULL;

--  Identify employees who manage others
SELECT DISTINCT e1.name AS manager
FROM employees AS e1
JOIN employees AS e2
ON e1.employee_id = e2.manager_id;
drop table sales
-- 1. Create the sales table
CREATE TABLE sales (
    sale_id INT PRIMARY KEY AUTO_INCREMENT,
    sale_date DATE NOT NULL,
    product_name VARCHAR(50) NOT NULL,
    sale_amount DECIMAL(10, 2) NOT NULL,
    employee_id INT NOT NULL,
    manager_id INT
);
DROP TABLE sales
-- 2. Insert sample data into the sales table
INSERT INTO sales (sale_date, product_name, sale_amount, employee_id, manager_id)
VALUES 
    ('2024-12-01', 'Laptop', 1500.00, 1, 1),
    ('2024-12-01', 'Phone', 800.00, 2, 1),
    ('2024-12-02', 'Tablet', 600.00, 3, 2),
    ('2024-12-03', 'Phone', 800.00, 4, 3),
    ('2024-12-03', 'Laptop', 1500.00, 5, 2),
    ('2024-12-04', 'Monitor', 300.00, 6, 1);

--  Find employees and their managers
SELECT 
    e1.employee_id AS employee,
    e1.product_name AS product_sold,
    e2.employee_id AS manager,
    e2.product_name AS product_supervised
FROM 
    sales AS e1
LEFT JOIN 
    sales AS e2
ON 
    e1.manager_id = e2.employee_id;

-- Find duplicate sales (same product and amount, but different employees)
SELECT 
    a.sale_id AS sale1_id,
    b.sale_id AS sale2_id,
    a.product_name,
    a.sale_amount
FROM 
    sales AS a
JOIN 
    sales AS b
ON 
    a.product_name = b.product_name 
    AND a.sale_amount = b.sale_amount 
    AND a.sale_id != b.sale_id;


-- Find all sales that occurred on the same day
SELECT 
    a.sale_id AS sale1_id,
    b.sale_id AS sale2_id,
    a.sale_date,
    a.product_name AS product1,
    b.product_name AS product2
FROM 
    sales AS a
JOIN 
    sales AS b
ON 
    a.sale_date = b.sale_date 
    AND a.sale_id != b.sale_id;

