DROP DATABASE GP
CREATE DATABASE GP
USE GP

-- Create students table
CREATE TABLE students (
    student_id INT PRIMARY KEY,
    name VARCHAR(100)
);

-- Create courses table
CREATE TABLE courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100),
    student_id INT
);

-- Insert data into students table
INSERT INTO students (student_id, name) VALUES
(1, 'Alice'),
(2, 'Bob'),
(3, 'Charlie');

-- Insert data into courses table
INSERT INTO courses (course_id, course_name, student_id) VALUES
(101, 'Math', 1),
(102, 'Science', NULL),
(103, 'History', 3);

-- Query 1: Fetch all students and their enrolled courses
SELECT 
    students.name AS Student,
    courses.course_name AS Course
FROM 
    courses
left JOIN 
    students
ON 
    courses.student_id = students.student_id;

-- Query 2: Find students who have not enrolled in any course
SELECT 
    students.name AS Student
FROM 
    students
LEFT JOIN 
    courses
ON 
    students.student_id = courses.student_id
WHERE 
    courses.course_id IS NULL;

-- Query 3: List all courses and their respective students
SELECT 
    courses.course_name AS Course,
    students.name AS Student
FROM 
    courses
LEFT JOIN 
    students
ON 
    courses.student_id = students.student_id;

-- Query 4: Calculate the number of students enrolled in each course
SELECT 
    courses.course_name AS Course,
    COUNT(students.student_id) AS Enrolled_Students
FROM 
    courses
LEFT JOIN 
    students
ON 
    courses.student_id = students.student_id
GROUP BY 
    courses.course_name;

-- Query 5: Find courses with no students enrolled
SELECT 
    courses.course_name AS Course
FROM 
    courses
LEFT JOIN 
    students
ON 
    courses.student_id = students.student_id
WHERE 
    students.student_id IS NULL;
