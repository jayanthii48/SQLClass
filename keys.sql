-- Drop tables if they exist to avoid conflicts
DROP TABLE IF EXISTS Courses;
DROP TABLE IF EXISTS Employees;
DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS Students;

-- Create Students table with Primary Key
CREATE TABLE Students (
    StudentID INT NOT NULL,
    Name VARCHAR(50),
    Age INT,
    PRIMARY KEY (StudentID)
);

-- Insert values into Students
INSERT INTO Students (StudentID, Name, Age) VALUES
(1, 'John', 20),
(2, 'Mary', 22),
(3, 'David', 21);

-- Create Courses table with Foreign Key referencing Students
CREATE TABLE Courses (
    CourseID INT NOT NULL,
    StudentID INT,
    CourseName VARCHAR(50),
    PRIMARY KEY (CourseID),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID)
);

-- Insert values into Courses
INSERT INTO Courses (CourseID, StudentID, CourseName) VALUES
(101, 1, 'Math'),
(102, 2, 'Science'),
(103, 1, 'History');

-- Create Employees table with Unique Key on Email
CREATE TABLE Employees (
    EmployeeID INT NOT NULL,
    Email VARCHAR(100),
    Name VARCHAR(50),
    PRIMARY KEY (EmployeeID),
    UNIQUE (Email)
);

-- Insert values into Employees
INSERT INTO Employees (EmployeeID, Email, Name) VALUES
(1, 'john@email.com', 'John'),
(2, 'mary@email.com', 'Mary'),
(3, NULL, 'David');

-- Create Orders table with Composite Primary Key
CREATE TABLE Orders (
    OrderID INT NOT NULL,
    ProductID INT NOT NULL,
    Quantity INT,
    PRIMARY KEY (OrderID, ProductID)
);

-- Insert values into Orders
INSERT INTO Orders (OrderID, ProductID, Quantity) VALUES
(1, 101, 2),
(1, 102, 1),
(2, 101, 3);

-- Select queries to verify the data
SELECT * FROM Students;
SELECT * FROM Courses;
SELECT * FROM Employees;
SELECT * FROM Orders;
