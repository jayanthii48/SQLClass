
-- Creating a database named 'company_db'
CREATE DATABASE company_db1;

-- Select the database to use
USE company_db1;

-- Creating a 'employees' table with column comments

CREATE TABLE employees (
    id INT AUTO_INCREMENT PRIMARY KEY COMMENT 'Unique identifier for each employee',         -- Unique ID for each employee
    first_name VARCHAR(100) NOT NULL COMMENT 'Full name of the employee',                    -- Employee's first name
    last_name VARCHAR(100) NOT NULL ,                 										 -- Employee's last name
    position VARCHAR(100) COMMENT 'Job position of the employee',                            -- Job position of the employee
    hire_date DATE,                                   										 -- Date of hiring
    salary DECIMAL(10, 2)  COMMENT 'Salary of the employee',                           		 -- Salary of the employee
    department_id INT                                 										 -- Reference to department
);
SHOW FULL COLUMNS FROM employees;

-- Add a comment to the 'employees' table
ALTER TABLE employees COMMENT = 'Table to store employee information';
SHOW TABLE STATUS ;
SHOW TABLE STATUS LIKE 'employees';

-- Creating a 'departments' table with column comments
CREATE TABLE departments (
    department_id INT AUTO_INCREMENT PRIMARY KEY,     -- Unique department ID
    department_name VARCHAR(100) NOT NULL,             -- Name of the department
    location VARCHAR(100)                          -- Location of the department
);





INSERT INTO employees (first_name, last_name, position, hire_date, salary, department_id)
VALUES 
('John', 'Doe', 'Software Engineer', '2020-01-15', 60000.00, 1),
('Jane', 'Smith', 'HR Manager', '2019-04-20', 75000.00, 2);

INSERT INTO employees (first_name, last_name)
VALUES 
('kavi', 'Doe'),
('guru', 'Smith');

select * from employees

INSERT INTO departments (department_name, location)
VALUES 
('IT', 'Building A'),
('HR', 'Building B');

-- Show all tables in the current database
SHOW TABLES;

-- Describe the 'employees' table
DESCRIBE employees;


-- Add a new column 'email' to the 'employees' table
ALTER TABLE employees ADD COLUMN email VARCHAR(100);
ALTER TABLE employees DROP COLUMN email;
=

-- Renaming 'employees' table to 'staff'
RENAME TABLE employees TO staff;



-- Remove all records from the 'staff' table but keep the structure intact
TRUNCATE TABLE staff;
SELECT * FROM STAFF


-- Drop the 'departments' table (removes the table and all its data)
DROP TABLE departments;



-- Add a comment to the 'email' column in the 'staff' table
ALTER TABLE STAFF ADD COLUMN email VARCHAR(100);
ALTER TABLE staff CHANGE email email VARCHAR(100) COMMENT 'Employee email address';


-- Select all data from the 'staff' table
SELECT * FROM staff;

-- Select specific columns (e.g., first name, last name) from the 'staff' table
SELECT first_name, last_name FROM staff;

-- Select with WHERE condition (filter by position)
SELECT * FROM staff WHERE position = 'Software Engineer';


-- Show information about the current database
SHOW DATABASES;

-- Rename column 'department_name' in 'departments' table to 'dept_name'
ALTER TABLE departments CHANGE department_name dept_name VARCHAR(100);

-- Drop the 'company_db' database (removes the database and all tables inside it)
DROP DATABASE company_db;

