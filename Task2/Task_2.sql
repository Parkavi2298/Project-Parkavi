--Task2
--Student DBMS (PostGre SQL)

--1.Database Setup
CREATE DATABASE student_database;

CREATE TABLE student_table (    
student_id INTEGER PRIMARY KEY,    
stu_name TEXT NOT NULL,    
department TEXT,    
email_id TEXT UNIQUE NOT NULL,
phone_no NUMERIC, 
address VARCHAR(50),
date_of_birth DATE,
gender TEXT,
major TEXT,
GPA NUMERIC,
grade TEXT); 

--2.Data Entry
INSERT INTO student_table VALUES (101, 'John', 'Arts', 'john.flex@gmail.com','8626812576','5, Richie Street, Mumbai','01-MAR-1995','Male','Commerce','7.8','C');
INSERT INTO student_table VALUES (102, 'Anuj', 'Science', 'anuj.mittal@gmail.com','9756812098','7, Marine Street, Mumbai','21-JUN-1997','Male','Botany','6.5','D');
INSERT INTO student_table VALUES (103, 'Rakesh', 'Engineering', 'rakesh.ranj@gmail.com','7656562576','9, Brigade Road, Delhi','05-MAY-1993','Male','Computer Science','9.5','A');
INSERT INTO student_table VALUES (104, 'Sonal', 'Arts', 'sonal.shah@gmail.com','9056812576','2, Kalakshetra Street, Chennai','15-JAN-1991','Female','Accounts','8.0','B');
INSERT INTO student_table VALUES (105, 'Amrit', 'Engineering', 'amrit.kaur@gmail.com','6776812576','5, Gangai Street, Kerala','25-JUN-1999','Female','Civil','4.9','E');
INSERT INTO student_table VALUES (106, 'Kavi', 'Science', 'kavi.moxie@gmail.com','9676812576','9, Besant Nagar, Chennai','22-MAR-1998','Female','Chemistry','9.0','A');
INSERT INTO student_table VALUES (107, 'Ajay', 'Arts', 'ajay.krish@gmail.com','8628902576','2, Dennie Street, Mumbai','28-JAN-1995','Male','Economics','6.9','D');
INSERT INTO student_table VALUES (108, 'Vignesh', 'Engineering', 'vignesh.raj@gmail.com','7106812576','11, MLM Street, Chennai','19-JUL-1990','Male','Automobile','9.6','A');
INSERT INTO student_table VALUES (109, 'Akshara', 'Engineering', 'akshara.r@gmail.com','9756812576','8, Divine Port, Delhi','01-OCT-1989','Female','Bio-Technology','6.7','D');
INSERT INTO student_table VALUES (110, 'Kevin', 'Science', 'kevin.s@gmail.com','6906812576','10, Mirchi Street, Chennai','01-APR-1992','Male','Physics','4.0','E');

--3.Student Information Retrieval
SELECT * FROM student_table ORDER BY grade DESC; 

--4.Query for Male students
SELECT * FROM student_table WHERE gender = 'Male'; 

--5.Query for students with GPA less than 5.0
SELECT * FROM student_table WHERE GPA < 5.0; 

--6.Update Student email and grade
UPDATE student_table SET email_id = 'Akshara.revi@gmail.com', grade = 'C'
WHERE student_id = 109;

--7.Query for students with grade 'B'
SELECT * FROM student_table WHERE grade = 'B';

--8.Grouping and Calculation
SELECT department, gender, AVG(GPA) as Average_GPA
FROM student_table
GROUP BY department, gender
ORDER by department;

--9.Table Renaming
ALTER TABLE student_table RENAME TO student_info;

--10.Retrieve Student with Highest GPA
SELECT * FROM student_table 
WHERE GPA = (SELECT MAX(GPA) FROM student_table);