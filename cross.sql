-- 1. Create the first table: employees
use gp
DROP TABLE IF EXISTS employees;
CREATE TABLE employees (
    employee_id INT PRIMARY KEY AUTO_INCREMENT,
    employee_name VARCHAR(50) NOT NULL
);

-- Insert sample data into employees
INSERT INTO employees (employee_name)
VALUES 
    ('Alice'),
    ('Bob'),
    ('Charlie');

-- Create the second table: projects
CREATE TABLE projects (
    project_id INT PRIMARY KEY AUTO_INCREMENT,
    project_name VARCHAR(50) NOT NULL
);

-- Insert sample data into projects
INSERT INTO projects (project_name)
VALUES 
    ('Project X'),
    ('Project Y'),
    ('Project Z');

-- Perform a basic CROSS JOIN
SELECT 
    e.employee_name,
    p.project_name
FROM 
    employees e
CROSS JOIN 
    projects p;

--  Add a filter to the CROSS JOIN
SELECT 
    e.employee_name,
    p.project_name
FROM 
    employees e
CROSS JOIN 
    projects p
WHERE 
    e.employee_name = 'Alice';

-- 7. Query 3: Generate row combinations with an additional column
SELECT 
    e.employee_name,
    p.project_name,
    CONCAT(e.employee_name, ' works on ', p.project_name) AS assignment
FROM 
    employees e
CROSS JOIN 
    projects p;

-- 8. Query 4: Use a CROSS JOIN to calculate combinations (e.g., possible task pairs)
SELECT 
    e1.employee_name AS employee1,
    e2.employee_name AS employee2
FROM 
    employees e1
CROSS JOIN 
    employees e2;

-- End of script
