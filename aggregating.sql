-- Drop table if exists
use emp
DROP TABLE IF EXISTS Employees;

-- Create Employees table
CREATE TABLE Employees (
    EmployeeID INT AUTO_INCREMENT PRIMARY KEY,
    EmployeeName VARCHAR(255) NOT NULL,
    Department VARCHAR(255),
    Salary DECIMAL(10, 2),
    Bonus DECIMAL(10, 2)
);

-- Insert sample data
INSERT INTO Employees (EmployeeName, Department, Salary, Bonus) VALUES
('John Doe', 'HR', 60000, 5000),
('Jane Smith', 'IT', 75000, 7000),
('Alice Johnson', 'Sales', 50000, 3000),
('Bob Brown', 'IT', 70000, NULL),
('Charlie White', 'HR', 45000, 2000),
('Emily Davis', 'Sales', 65000, 4000);

-- 1. Count the number of employees in each department
SELECT Department, COUNT(*) AS EmployeeCount
FROM Employees
GROUP BY Department;

-- 2. Calculate total salary and bonus for each department
SELECT 
    Department,
    SUM(Salary) AS TotalSalary,
    SUM(Bonus) AS TotalBonus
FROM Employees
GROUP BY Department;

-- 3. Find the average salary in each department
SELECT 
    Department,
    AVG(Salary) AS AverageSalary
FROM Employees
GROUP BY Department;

-- 4. Find the lowest and highest salary in each department
SELECT 
    Department,
    MIN(Salary) AS LowestSalary,
    MAX(Salary) AS HighestSalary
FROM Employees
GROUP BY Department;

-- 5. Concatenate employee names in each department

SELECT Department, GROUP_CONCAT(EmployeeName) AS EmployeeNames
FROM Employees
GROUP BY Department;

SELECT Department,GROUP_CONCAT(EmployeeName SEPARATOR ';') AS EmployeeNames
FROM Employees
GROUP BY Department;

SELECT Department, GROUP_CONCAT(EmployeeName ORDER BY EmployeeName ASC) AS EmployeeNames
FROM Employees
GROUP BY Department;


SELECT Department, GROUP_CONCAT(EmployeeName) AS EmployeeNames
FROM Employees
WHERE Department IN ('HR', 'IT')
GROUP BY Department;
