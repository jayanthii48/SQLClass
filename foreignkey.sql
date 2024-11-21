-- Example of ON DELETE CASCADE and ON UPDATE CASCADE

CREATE TABLE Course_Cascade (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(50)
);

CREATE TABLE Student_Cascade (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(50),
    CourseID INT,
    FOREIGN KEY (CourseID) REFERENCES Course_Cascade(CourseID)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

INSERT INTO Course_Cascade (CourseID, CourseName) VALUES (101, 'Mathematics');
INSERT INTO Course_Cascade (CourseID, CourseName) VALUES (102, 'Science');

INSERT INTO Student_Cascade (StudentID, StudentName, CourseID) VALUES (1, 'Alice', 101);
INSERT INTO Student_Cascade (StudentID, StudentName, CourseID) VALUES (2, 'Bob', 102);
INSERT INTO Student_Cascade (StudentID, StudentName, CourseID) VALUES (3, 'Charlie', 101);

SELECT * FROM Course_Cascade
SELECT * FROM Student_Cascade
-- Queries to Test the Behavior
-- ON DELETE CASCADE: Deleting a course deletes all its students.
DELETE FROM Course_Cascade WHERE CourseID = 101;

-- ON UPDATE CASCADE: Updating a course ID updates all its students' CourseID.
UPDATE Course_Cascade SET CourseID = 103 WHERE CourseID = 102;


-- Example of ON DELETE SET NULL and ON UPDATE SET NULL

CREATE TABLE Course_SetNull (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(50)
);

CREATE TABLE Student_SetNull (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(50),
    CourseID INT,
    FOREIGN KEY (CourseID) REFERENCES Course_SetNull(CourseID)
    ON DELETE SET NULL
    ON UPDATE SET NULL
);

INSERT INTO Course_SetNull (CourseID, CourseName) VALUES (201, 'History');
INSERT INTO Course_SetNull (CourseID, CourseName) VALUES (202, 'Geography');

INSERT INTO Student_SetNull (StudentID, StudentName, CourseID) VALUES (4, 'David', 201);
INSERT INTO Student_SetNull (StudentID, StudentName, CourseID) VALUES (5, 'Emma', 202);
INSERT INTO Student_SetNull (StudentID, StudentName, CourseID) VALUES (6, 'Frank', 201);
SELECT * FROM Course_SetNull
SELECT * FROM Student_SetNull
-- ON DELETE SET NULL: Deleting a course sets CourseID to NULL for its students.
DELETE FROM Course_SetNull WHERE CourseID = 201;

-- ON UPDATE SET NULL: Updating a course ID sets CourseID to NULL for its students.
UPDATE Course_SetNull SET CourseID = 203 WHERE CourseID = 202;
-- Example of ON DELETE RESTRICT and ON UPDATE RESTRICT

CREATE TABLE Course_Restrict (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(50)
);

CREATE TABLE Student_Restrict (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(50),
    CourseID INT,
    FOREIGN KEY (CourseID) REFERENCES Course_Restrict(CourseID)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT
);

INSERT INTO Course_Restrict (CourseID, CourseName) VALUES (301, 'Art');
INSERT INTO Course_Restrict (CourseID, CourseName) VALUES (302, 'Music');

INSERT INTO Student_Restrict (StudentID, StudentName, CourseID) VALUES (7, 'Grace', 301);
INSERT INTO Student_Restrict (StudentID, StudentName, CourseID) VALUES (8, 'Hannah', 302);
INSERT INTO Student_Restrict (StudentID, StudentName, CourseID) VALUES (9, 'Isaac', 301);
SELECT * FROM Course_Restrict
SELECT * FROM Student_Restrict

-- ON DELETE RESTRICT: Deleting a course fails if it has dependent students.
DELETE FROM Course_Restrict WHERE CourseID = 301;



-- Example of ON DELETE NO ACTION and ON UPDATE NO ACTION

CREATE TABLE Course_NoAction (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(50)
);

CREATE TABLE Student_NoAction (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(50),
    CourseID INT,
    FOREIGN KEY (CourseID) REFERENCES Course_NoAction(CourseID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);

INSERT INTO Course_NoAction (CourseID, CourseName) VALUES (401, 'Physics');
INSERT INTO Course_NoAction (CourseID, CourseName) VALUES (402, 'Chemistry');

INSERT INTO Student_NoAction (StudentID, StudentName, CourseID) VALUES (10, 'Jack', 401);
INSERT INTO Student_NoAction (StudentID, StudentName, CourseID) VALUES (11, 'Lily', 402);
INSERT INTO Student_NoAction (StudentID, StudentName, CourseID) VALUES (12, 'Mike', 401);
SELECT * FROM Course_NoAction
SELECT * FROM Student_NoAction
-- ON DELETE NO ACTION: Same as RESTRICT, deletion is blocked.
DELETE FROM Course_NoAction WHERE CourseID = 401;




