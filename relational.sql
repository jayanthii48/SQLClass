-- Create a table named "employees"
create database emp
use emp
CREATE TABLE employees (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    age INT,
    salary DECIMAL(10, 2),
    department VARCHAR(50),
    join_date DATE
);

-- Insert sample data into the "employees" table
INSERT INTO employees (name, age, salary, department, join_date) VALUES
('Alice', 30, 50000.00, 'HR', '2022-06-15'),
('Bob', 40, 75000.00, 'Engineering', '2019-03-25'),
('Charlie', 35, 60000.00, 'Engineering', '2020-08-01'),
('David', 28, 48000.00, 'HR', '2021-07-10'),
('Eve', 45, 90000.00, 'Management', '2018-12-10'),
('Frank', 50, 110000.00, 'Management', '2017-05-15');

-- 1. Equal to (=) operator - Find employees in the 'HR' department
SELECT * FROM employees WHERE department = 'HR';

-- 2. Not equal to (<>) operator - Find employees who are not in the 'HR' department
SELECT * FROM employees WHERE department <> 'HR';

-- 3. Less than (<) operator - Find employees with salary less than 60000
SELECT * FROM employees WHERE salary < 60000;

-- 4. Greater than (>) operator - Find employees older than 40
SELECT * FROM employees WHERE age > 40;

-- 5. Less than or equal to (<=) operator - Find employees with age less than or equal to 35
SELECT * FROM employees WHERE age <= 35;

-- 6. Greater than or equal to (>=) operator - Find employees with a salary of 75000 or more
SELECT * FROM employees WHERE salary >= 75000;

-- 7. BETWEEN operator - Find employees whose salaries are between 50000 and 100000
SELECT * FROM employees WHERE salary BETWEEN 50000 AND 100000;

-- 8. LIKE operator (pattern matching with wildcards) - Find employees whose names start with 'A'
SELECT * FROM employees WHERE name LIKE 'A%';

-- 9. IN operator - Find employees whose IDs are either 2, 4, or 6
SELECT * FROM employees WHERE id IN (2, 4, 6);

-- 1. AND operator - Find employees in the 'Engineering' department with a salary greater than 60000
SELECT * FROM employees WHERE department = 'Engineering' AND salary > 60000;

-- 2. OR operator - Find employees who are in either the 'HR' or 'Management' department
SELECT * FROM employees WHERE department = 'HR' OR department = 'Management';

-- 3. NOT operator - Find employees who are not in the 'HR' department
SELECT * FROM employees WHERE NOT department = 'HR';

-- 4. AND operator with multiple conditions - Find employees in 'Management' with age greater than 40 and salary less than 100000
SELECT * FROM employees WHERE department = 'Management' AND age > 40 AND salary < 100000;

-- 5. OR operator with range - Find employees with either a salary above 70000 or age less than 30
SELECT * FROM employees WHERE salary > 70000 OR age < 30;

-- 6. NOT operator combined with AND - Find employees who are neither in the 'HR' department nor older than 40
SELECT * FROM employees WHERE NOT (department = 'HR' AND age > 40);

-- 7. AND operator for date range - Find employees who joined after '2019-01-01' and have a salary greater than 55000
SELECT * FROM employees WHERE join_date > '2019-01-01' AND salary > 55000;
