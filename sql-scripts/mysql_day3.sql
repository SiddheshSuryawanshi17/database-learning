CREATE TABLE student2(
	rollno INT PRIMARY KEY,
    name VARCHAR(50),
    marks INT NOT NULL,
    grade VARCHAR(1),
    city VARCHAR(20)
);
INSERT INTO student2
(rollno, name, marks, grade, city)
VALUES
(101, "anil", 78, "C", "Pune"),
(102, "bhumika", 93, "A", "Mumbai"),
(103, "chetan", 85, "B", "Mumbai"),
(104, "dhruv", 96, "A", "Delhi"),
(105, "emanual", 12, "F", "Delhi"),
(106, "farah", 82, "B", "Delhi");

ALTER TABLE student2
DROP COLUMN grade;
SELECT * FROM student2;

CREATE TABLE stu(
	id INT PRIMARY KEY,
    name VARCHAR(30)
);
INSERT INTO stu
(id, name)
VALUES
(101, "adam"),
(102, "bob"),
(103, "casey");
CREATE TABLE course(
	id INT PRIMARY KEY,
    course VARCHAR(50)
);
INSERT INTO course
(id, course)
VALUES
(102, "english"),
(105, "math"),
(103, "science"),
(107, "computer science");
-- INNER JOIN 
-- alias can be used instead of writing big names of columns repetitively
SELECT * FROM stu as s
INNER JOIN course as c
ON s.id = c.id;

-- OUTER LEFT JOIN 
SELECT * FROM stu as s
LEFT JOIN course as c
ON s.id = c.id;

-- OUTER LEFT JOIN 
SELECT * FROM stu as s
RIGHT JOIN course as c
ON s.id = c.id;

-- OUTER LEFT JOIN 
SELECT * FROM stu as a
LEFT JOIN course as c
ON s.id = c.id
UNION 
SELECT * FROM stu as a
RIGHT JOIN course as c
ON a.id = c.id;

-- LEFT EXCLUSIVE JOIN
SELECT * FROM stu as s
LEFT JOIN course as c
ON s.id = c.id
WHERE c.id IS NULL; 

-- RIGHT EXCLUSIVE JOIN 
SELECT * FROM stu as s
RIGHT JOIN course as c
ON s.id = c.id
WHERE s.id IS NULL;

CREATE TABLE employee(
	id INT PRIMARY KEY,
    name VARCHAR(50),
    manager_id INT
);

INSERT INTO employee
(id, name, manager_id)
VALUES
(101, "Adam", 103),
(102, "Bob", 104),
(103, "Casey", NULL),
(104, "Donald", 103);

-- SELF JOIN
SELECT a.name as manager_name, b.name
FROM employee as a
JOIN employee as b
ON a.id = b.manager_id;

-- UNION ALL
-- SELECT name FROM employee
-- UNION ALL 
-- SELECT name FROM employee

-- UNION 
SELECT name FROM employee
UNION ALL 
SELECT name FROM employee;

-- SQL Subqueries
-- Get the names of all students who scored more than class avg
-- Step 1: Find the avg of class 
-- Step 2: Find the names of students with marks > avg

CREATE TABLE stud(
	rollno INT PRIMARY KEY,
    name VARCHAR(40),
    marks INT NOT NULL, 
    grade VARCHAR(2),
    city VARCHAR(20)
);
INSERT INTO stud
(rollno, name, marks, grade, city)
VALUES
(101, "anil", 78, "C", "Pune"),
(102, "bhumika", 93, "A", "Mumbai"),
(103, "chetan", 85, "B", "Mumbai"),
(104, "dhruv", 96, "A", "Delhi"),
(105, "emanual", 12, "F", "Delhi"),
(106, "farah", 82, "B", "Delhi");
-- SELECT * FROM stud;
-- SELECT AVG(marks) FROM stud;
-- SELECT name, marks FROM stud
-- WHERE marks > 74.3333;

-- In this case, if any changes are made in marks then the avg should also change dynamically; as a result of this Sub Queries are used in mysql

-- SELECT name, marks FROM stud
-- WHERE marks > (SELECT AVG(marks) FROM stud);

-- Find the names of all students with even rollno's 
-- SELECT rollno FROM stud
-- WHERE 
-- rollno%2 = 0;

-- SELECT name, rollno FROM stud
-- WHERE rollno IN (102, 104, 106);

-- SELECT name, rollno FROM stud
-- WHERE rollno IN (SELECT rollno FROM stud
-- WHERE 
-- rollno%2 = 0);

-- SELECT MAX(marks), city 
-- FROM ( SELECT * FROM stud
-- WHERE city = "Delhi") AS temperory
-- (NOTE: Always use alias whenver sub query is written into FROM statement)

-- Sub Query with SELECT statement
-- SELECT(SELECT MAX(marks) FROM stud), name FROM stud; 

-- Virtual table in MySQL
CREATE VIEW view1 AS 
SELECT name, rollno, marks FROM stud;
SELECT * FROM view1
WHERE marks > 80;

DROP VIEW view1;

