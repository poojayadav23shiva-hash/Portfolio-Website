-- Create Database
CREATE DATABASE student_db;

-- Use Database
USE student_db;

-- Create Table
CREATE TABLE students (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    age INT,
    course VARCHAR(50)
);

-- Insert Data
INSERT INTO students VALUES (1, 'Pooja', 19, 'BCA');
INSERT INTO students VALUES (2, 'Riya', 20, 'BCA');

-- Display Data
SELECT * FROM students;

-- Search Student
SELECT * FROM students WHERE id = 1;

-- Update Data
UPDATE students SET age = 21 WHERE id = 2;

-- Delete Data
DELETE FROM students WHERE id = 1;