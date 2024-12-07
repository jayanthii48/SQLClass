drop database gp
create database gp
use gp
CREATE TABLE  table1 (
    id INT NOT NULL,
    name VARCHAR(50) NOT NULL,
    PRIMARY KEY (id)
);


INSERT INTO table1 (id, name) VALUES
(1, 'Alice'),
(2, 'Bob'),
(3, 'Charlie'),
(4, 'David'),
(5, 'Eve'),
(6, 'Frank'),
(7, 'Grace'),
(8, 'Hannah'),
(9, 'Ivy'),
(10, 'Jack');


CREATE TABLE table2 (
    id INT NOT NULL,
    name VARCHAR(50) NOT NULL,
    PRIMARY KEY (id)
);

INSERT INTO table2 (id, name) VALUES
(2, 'Bob'),
(3, 'Charlie'),
(11, 'Kate'),
(12, 'Leo'),
(13, 'Mona'),
(14, 'Nina'),
(15, 'Oliver'),
(16, 'Paul'),
(17, 'Quinn'),
(18, 'Rachel');


CREATE TABLE  employees (
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    department VARCHAR(50) NOT NULL,
    PRIMARY KEY (id)
);


INSERT INTO employees (name, department) VALUES
('Alice', 'HR'),
('Bob', 'HR'),
('Charlie', 'IT'),
('David', 'IT'),
('Eve', 'Finance'),
('Frank', 'HR'),
('Grace', 'IT'),
('Hannah', 'Marketing'),
('Ivy', 'Marketing'),
('Jack', 'Finance');

-- UNION
-- Combine results from table1 and table2, removing duplicates
SELECT id, name FROM table1
UNION
SELECT id, name FROM table2;

--  UNION ALL
-- Combine results from table1 and table2, including duplicates
SELECT id, name FROM table1
UNION ALL
SELECT id, name FROM table2;

--  Combining results with conditions
-- Get employees from HR and IT departments, removing duplicates
SELECT id, name , department FROM employees WHERE department = 'HR'
UNION
SELECT id, name , department FROM employees WHERE department = 'IT';

--  Using ORDER BY with UNION
-- Combine results from table1 and table2, and sort the result set
SELECT id, name FROM table1
UNION
SELECT id, name FROM table2
ORDER BY name;

--  Fetching results with different conditions
-- Fetch employees from HR department and those named 'Grace'
SELECT id, name FROM employees WHERE department = 'HR'
UNION
SELECT id, name FROM employees WHERE name = 'Grace';
