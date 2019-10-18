-- CREATE TABLE favorite_foods (
-- food_id SERIAL PRIMARY KEY,
-- food_name TEXT,
-- user_id INT
-- );
-- create Table people (
-- people_id SERIAL PRIMARY KEY,
-- person_name TEXT,
-- person_id INT
-- );

-- SELECT * FROM favorite_foods f
-- JOIN people p ON P.person_id = f.user_id;

CREATE TABLE student (
    student_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50)
);

CREATE TABLE classes (
    class_id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    teacher VARCHAR(50)
);

CREATE TABLE student_classes (
    class_id FOREIGN KEY REFERENCES classes,
    student_id FOREIGN KEY REFERENCES student
);

--Getting all students for a class?
SELECT s.student_id, last_name
FROM student_classes sc 
INNER JOIN students s ON s.student_id = sc.student_id
WHERE sc.class_id = ${1}

--Getting all classes for a student?
SELECT c.class_id, name
FROM student_classes sc 
INNER JOIN classes c ON c.class_id = sc.class_id
WHERE sc.student_id = ${1}
