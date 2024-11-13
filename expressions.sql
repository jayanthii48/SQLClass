-- Create Students Table
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    Name VARCHAR(100),
    Age INT,
    Department VARCHAR(50),
    EnrollmentDate DATE,
    Marks DECIMAL(5, 2)
);

-- Insert Sample Data into Students Table
INSERT INTO Students (StudentID, Name, Age, Department, EnrollmentDate, Marks) VALUES
(1, 'Alice', 22, 'Computer Science', '2020-08-15', 85.5),
(2, 'Bob', 20, 'Mathematics', '2021-01-20', 92.0),
(3, 'Charlie', 23, 'Physics', '2019-09-10', 78.5),
(4, 'David', 21, 'Computer Science', '2020-07-15', 88.0),
(5, 'Eve', 24, 'Mathematics', '2018-11-25', 94.5),
(6, 'Frank', 20, 'Physics', '2021-02-10', 76.0),
(7, 'Grace', 22, 'Computer Science', '2019-03-18', 82.5),
(8, 'Hannah', 21, 'Mathematics', '2020-06-01', 89.0),
(9, 'Ivy', 23, 'Physics', '2018-12-05', 91.0),
(10, 'Jack', 20, 'Computer Science', '2021-09-15', 80.5);

-- 1. Boolean Expression Example
-- Find all students who are either in Computer Science or have Marks greater than 90.
SELECT * 
FROM Students
WHERE Department = 'Computer Science' OR Marks > 90;

-- 2. Numeric Expression Example
-- Increase the Marks of all students by 10% and show the updated value.
SELECT Name, Marks, Marks * 1.10 AS Increased_Marks
FROM Students;

-- 3. Date Expression Example
-- Find students who enrolled within the last 2 years.
SELECT * 
FROM Students
WHERE EnrollmentDate > DATEADD(year, -2, GETDATE());

-- 4. More Date Expression Examples

-- Example 1: Find students who enrolled before a specific date
SELECT * 
FROM Students
WHERE EnrollmentDate < '2021-01-01';

-- Example 2: Find students who enrolled after a specific date
SELECT * 
FROM Students
WHERE EnrollmentDate > '2020-01-01';

-- Example 3: Find students who enrolled in 2020
SELECT * 
FROM Students
WHERE YEAR(EnrollmentDate) = 2020;

-- Example 4: Find students who enrolled in the same month and year (e.g., August 2020)
SELECT * 
FROM Students
WHERE MONTH(EnrollmentDate) = 8 AND YEAR(EnrollmentDate) = 2020;


-- Example 1: Find students who enrolled within the last 6 months
SELECT * 
FROM Students
WHERE EnrollmentDate > DATE_SUB(CURDATE(), INTERVAL 30 MONTH);

-- Example 2: Find students who enrolled within the last 1 year from today
SELECT * 
FROM Students
WHERE DATEDIFF(CURDATE(), EnrollmentDate) <= 365;

-- Example 3: Find students whose EnrollmentDate is NULL
SELECT * 
FROM Students
WHERE EnrollmentDate IS NULL;

-- Example 4: Calculate the number of days since each student enrolled
SELECT Name, EnrollmentDate, DATEDIFF(CURDATE(), EnrollmentDate) AS Days_Enrolled
FROM Students;
