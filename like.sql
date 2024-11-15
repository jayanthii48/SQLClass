-- Step 1: Create a table for storing employee information
drop database emp
create database emp
use emp
CREATE TABLE employees (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    age INT,
    department VARCHAR(50)
);

-- Step 2: Insert sample data into the employees table
INSERT INTO employees (name, age, department) VALUES
('John', 28, 'HR'),
('Alice', 32, 'Engineering'),
('James', 45, 'Finance'),
('Andrew', 38, 'Marketing'),
('Samantha', 26, 'Engineering'),
('Tony', 40, 'Finance'),
('Johanna', 31, 'HR'),
('Jack', 35, 'Marketing'),
('Jessica', 29, 'HR'),
('Jordan', 33, 'Engineering');

-- Step 3: Examples using the LIKE clause

-- 3.1 Using % to Match Any Number of Characters
-- Find all employees whose names start with 'A'
SELECT * FROM employees
WHERE name LIKE 'A%';

-- 3.2 Using % in the Middle of a String
-- Find employees whose names contain 'an' anywhere
SELECT * FROM employees
WHERE name LIKE '%an%';

-- 3.3 Using _ to Match a Single Character
-- Find employees whose names have exactly 5 characters and end with 'y'
SELECT * FROM employees
WHERE name LIKE '___y';

-- 3.4 Using LIKE with Wildcards in the Middle
-- Find employees whose names start with 'J' and have 4 characters in total
SELECT * FROM employees
WHERE name LIKE 'J___';

-- 3.5 Using LIKE for Case-Insensitive Search
-- Case-insensitive search for names starting with 'j'
SELECT * FROM employees
WHERE name LIKE 'j%';

-- 3.6 Using NOT LIKE for Excluding Patterns
-- Find employees whose names do NOT start with 'J'
SELECT * FROM employees
WHERE name NOT LIKE 'J%';

-- Step 4: Additional Examples

-- 4.1 Find all employees whose names end with 'a'
SELECT * FROM employees
WHERE name LIKE '%a';

-- 4.2 Find employees whose names have exactly 6 characters
SELECT * FROM employees
WHERE name LIKE '______';  -- 6 underscores for 6 characters


-- Step 5: Combining LIKE with other conditions

-- 5.1 Find employees whose names start with 'J' and their age is greater than 30
SELECT * FROM employees
WHERE name LIKE 'J%' AND age > 30;

-- 5.2 Find employees whose names contain 'an' and belong to the 'Engineering' department
SELECT * FROM employees
WHERE name LIKE '%an%' AND department = 'Engineering';

-- 5.3 Find employees whose names end with 'a' and are from the 'HR' department
SELECT * FROM employees
WHERE name LIKE '%a' AND department = 'HR';

-- 5.4 Sort employees whose names contain 'J', ordered by age
SELECT * FROM employees
WHERE name LIKE '%J%' ORDER BY age;

-- 5.5 Limit the number of records returned
SELECT * FROM employees
WHERE name LIKE 'J%' LIMIT 3;

