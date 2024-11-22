use emp
-- Drop the table if it exists (for re-testing purposes)
DROP TABLE IF EXISTS employees;
SELECT VERSION();

-- Create the table with CHECK constraints
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,                       -- Primary Key
    emp_name VARCHAR(100) NOT NULL,              -- Employee Name cannot be NULL
    age INT CHECK (age >= 18),                   -- Age must be 18 or older
    salary DECIMAL(10, 2) CHECK (salary > 0),    -- Salary must be positive
    department VARCHAR(50) DEFAULT 'General',    -- Default department
    CONSTRAINT check_age_salary CHECK (age * 100 <= salary) -- Age * 100 <= Salary
);
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(100),
    age INT,
    salary DECIMAL(10, 2),
    CONSTRAINT check_age CHECK (age >= 18)
);




-- Insert valid data
INSERT INTO employees (emp_id, emp_name, age, salary, department)
VALUES (1, 'Alice', 25, 5000, 'HR');

INSERT INTO employees (emp_id, emp_name, age, salary)
VALUES (2, 'Bob', 30, 3000); 

-- Insert invalid data to test CHECK constraints
-- Uncomment one at a time to see errors

-- 1. Age < 18
INSERT INTO employees (emp_id, emp_name, age, salary) 
VALUES (3, 'Charlie', 16, 4000);

-- 2. Negative Salary
INSERT INTO employees (emp_id, emp_name, age, salary) 
VALUES (4, 'Dave', 40, -2000);

-- 3. Age * 100 > Salary
INSERT INTO employees (emp_id, emp_name, age, salary) 
VALUES (5, 'Eve', 50, 4000);

-- View the valid records
SELECT * FROM employees;

-- Try to drop a constraint (use its name)
ALTER TABLE employees DROP CONSTRAINT check_age_salary;

