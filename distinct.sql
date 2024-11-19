
-- Create the `employees` table
CREATE TABLE employees (
    employee_id INT AUTO_INCREMENT PRIMARY KEY,
    department VARCHAR(50),
    job_title VARCHAR(50)
);

-- Insert sample data into `employees`
INSERT INTO employees (department, job_title)
VALUES
    ('HR', 'Manager'),
    ('HR', 'Recruiter'),
    ('IT', 'Developer'),
    ('IT', 'Developer'),
    ('Finance', 'Analyst'),
    ('Finance', 'Analyst');

-- Create the `customers` table
CREATE TABLE customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    city VARCHAR(50)
);

-- Insert sample data into `customers`
INSERT INTO customers (city)
VALUES
    ('New York'),
    ('Los Angeles'),
    ('New York'),
    ('Chicago'),
    ('Los Angeles');

-- Create the `orders` table
CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT,
    status VARCHAR(20)
);

-- Insert sample data into `orders`
INSERT INTO orders (product_id, status)
VALUES
    (101, 'shipped'),
    (102, 'pending'),
    (103, 'shipped'),
    (101, 'shipped'),
    (102, 'pending');

-- Create the `user_logs` table
CREATE TABLE user_logs (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    action VARCHAR(50)
);

-- Insert sample data into `user_logs`
INSERT INTO user_logs (user_id, action)
VALUES
    (1, 'login'),
    (2, 'logout'),
    (1, 'login'),
    (3, 'login'),
    (2, 'login');

-- Query examples with `DISTINCT`

-- 1. Retrieve unique departments from the `employees` table
SELECT DISTINCT department
FROM employees;

-- 2. Retrieve unique combinations of department and job title
SELECT DISTINCT department, job_title
FROM employees;

-- 3. Count the number of unique departments
SELECT COUNT(DISTINCT department) AS unique_departments
FROM employees;

-- 4. Retrieve a list of unique cities from the `customers` table
SELECT DISTINCT city
FROM customers;

-- 5. Retrieve unique product IDs for shipped orders
SELECT DISTINCT product_id
FROM orders
WHERE status = 'shipped';

-- 6. Retrieve unique user actions (user_id and action) from `user_logs`
SELECT DISTINCT user_id, action
FROM user_logs
WHERE action = 'login';
