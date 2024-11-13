-- 1. Table Creation
use userss
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(50),
    Age INT,
    Department VARCHAR(50),
    Salary INT,
    Location VARCHAR(50)
);

-- 2. Insert Values with Some NULL Entries
INSERT INTO Employees (EmployeeID, Name, Age, Department, Salary, Location) VALUES
(1, 'Alice', 25, 'HR', 50000, 'New York'),
(2, 'Bob', 30, 'IT', 60000, 'San Francisco'),
(3, 'Charlie', 28, 'Finance', 45000, 'Chicago'),
(4, 'Diana', 35, 'IT', 75000, 'New York'),
(5, 'Eve', 32, 'Marketing', 52000, 'San Francisco'),
(6, 'Frank', 45, 'HR', 80000, 'Chicago'),
(7, 'Grace', NULL, 'Finance', 55000, NULL),
(8, 'Henry', 40, NULL, 70000, 'Boston'),
(9, 'Ivy', NULL, 'IT', NULL, 'Chicago'),
(10, NULL, 33, 'HR', 60000, 'Los Angeles');

-- AND: Find employees in the IT department with a salary over 60,000.
SELECT * FROM Employees
WHERE Department = 'IT' AND Salary > 60000;

-- OR: Find employees who work in HR or live in Chicago.
SELECT * FROM Employees
WHERE Department = 'HR' OR Location = 'Chicago';

-- NOT: Find employees who do not work in the IT department.
SELECT * FROM Employees
WHERE NOT Department = 'IT';

-- BETWEEN: Find employees aged between 30 and 40.
SELECT * FROM Employees
WHERE Age BETWEEN 30 AND 40;

-- IN: Find employees in the HR or Marketing departments.
SELECT * FROM Employees
WHERE Department IN ('HR', 'Marketing');

-- LIKE: Find employees whose names start with 'A'.
SELECT * FROM Employees
WHERE Name LIKE 'A%';

-- IS NULL: Find employees whose location is not specified.
SELECT * FROM Employees
WHERE Location IS NULL;

-- ALL: Find employees whose salary is greater than the salary of all employees in the HR department.
SELECT * FROM Employees
WHERE Salary > ALL (SELECT Salary FROM Employees WHERE Department = 'HR');


-- ANY: Find employees whose salary is greater than any salary in the HR department.
SELECT * FROM Employees
WHERE Salary > ANY (SELECT Salary FROM Employees WHERE Department = 'HR');

-- EXISTS: Find employees who have colleagues in the same department.
SELECT * FROM Employees e1
WHERE EXISTS (SELECT * FROM Employees e2 WHERE e1.Department = e2.Department AND e1.EmployeeID <> e2.EmployeeID);
