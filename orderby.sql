use emp
-- Drop tables if they exist
DROP TABLE IF EXISTS Employees;
DROP TABLE IF EXISTS Products;

-- Create Employees table
CREATE TABLE Employees (
    EmployeeID INT AUTO_INCREMENT PRIMARY KEY,
    EmployeeName VARCHAR(255) NOT NULL,
    Department VARCHAR(255),
    JobRole VARCHAR(255),
    Salary DECIMAL(10, 2)
);

-- Insert sample data into Employees
INSERT INTO Employees (EmployeeName, Department, JobRole, Salary) VALUES
('John Doe', 'HR', 'Manager', 60000),
('Jane Smith', 'IT', 'Developer', 75000),
('Alice Johnson', 'Sales', 'Executive', 50000),
('Bob Brown', 'IT', 'Developer', 70000),
('Charlie White', 'HR', 'Executive', 45000),
('Emily Davis', 'Sales', 'Manager', 65000);

-- Create Products table
CREATE TABLE Products (
    ProductID INT AUTO_INCREMENT PRIMARY KEY,
    ProductName VARCHAR(255) NOT NULL,
    Price DECIMAL(10, 2)
);

-- Insert sample data into Products
INSERT INTO Products (ProductName, Price) VALUES
('Laptop', 1200),
('Smartphone', 800),
('Tablet', 600),
('Monitor', 300),
('Keyboard', NULL);

-- Basic Grouping

SELECT  COUNT(*) AS EmployeeCount
FROM Employees


SELECT Department, COUNT(*) AS EmployeeCount
FROM Employees
GROUP BY Department;

-- Grouping with Aggregate Functions
SELECT Department, SUM(Salary) AS TotalSalary
FROM Employees
GROUP BY Department;

-- Grouping by Multiple Columns
SELECT Department, JobRole, COUNT(*) AS RoleCount
FROM Employees
GROUP BY Department, JobRole;

-- Using HAVING Clause
SELECT Department, SUM(Salary) AS TotalSalary
FROM Employees
GROUP BY Department
HAVING TotalSalary > 110000;

-- Grouping with WHERE
SELECT Department, AVG(Salary) AS AverageSalary
FROM Employees
WHERE Salary > 40000
GROUP BY Department;

-- Combining GROUP BY and ORDER BY
SELECT Department, SUM(Salary) AS TotalSalary
FROM Employees
GROUP BY Department
ORDER BY TotalSalary DESC;


