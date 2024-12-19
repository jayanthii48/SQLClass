DROP TABLE departments
DROP TABLE employees

-- Create Departments Table
CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);

-- Create Employees Table
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    name VARCHAR(50),
    dept_id INT,
    salary DECIMAL(10, 2),
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);

-- Insert Values into Departments
INSERT INTO departments (dept_id, dept_name) VALUES
(1, 'HR'),
(2, 'IT'),
(3, 'Finance'),
(4, 'Marketing');

-- Insert Values into Employees
INSERT INTO employees (emp_id, name, dept_id, salary) VALUES
(101, 'Alice', 1, 50000.00),
(102, 'Bob', 2, 60000.00),
(103, 'Charlie', 2, 70000.00),
(104, 'David', 3, 80000.00),
(105, 'Eve', NULL, 55000.00);

-- Queries

-- Find Employees Who Do Not Belong to Any Department
SELECT e.emp_id, e.name, e.salary
FROM employees e
LEFT JOIN departments d ON e.dept_id = d.dept_id
WHERE d.dept_id IS NULL;

-- Find Employees Without a Department
SELECT emp_id, name, salary
FROM employees
WHERE dept_id IS NULL;

-- Find Departments Without Employees
SELECT d.dept_id, d.dept_name
FROM departments d
LEFT JOIN employees e ON d.dept_id = e.dept_id
WHERE e.dept_id IS NULL;

-- Find Employees and Departments They Belong To
SELECT e.emp_id, e.name, d.dept_name
FROM employees e
JOIN departments d ON e.dept_id = d.dept_id;


SELECT e.emp_id, e.name
FROM employees e
WHERE NOT EXISTS (
    SELECT *
    FROM departments d
    WHERE e.dept_id = d.dept_id
);


