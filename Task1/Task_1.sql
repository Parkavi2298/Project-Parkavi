--Task 1
--Academic Management System (using SQL)
-----------------------------------------------------------------------------------------------------------------------------------------
--1. Database Creation 

CREATE TABLE StudentInfo (    
stu_id INT PRIMARY KEY,    
stu_name VARCHAR(255),    
DOB DATE,    
phone_no INT,    
email_id VARCHAR(255),    
address VARCHAR(255)   
);

CREATE TABLE CourseInfo (   
course_id INT PRIMARY KEY,    
course_name VARCHAR(255),  
course_instructor_name VARCHAR(255)  
);

CREATE TABLE EnrollmentInfo (    
enrollment_id INT PRIMARY KEY,    
course_id INT,    
stu_id INT,  
enroll_status VARCHAR(255),  
CONSTRAINT FK_coursenroll   
FOREIGN KEY (course_id)  
REFERENCES CourseInfo(course_id),  
CONSTRAINT FK_studentenroll   
FOREIGN KEY (stu_id)  
REFERENCES StudentInfo(stu_id)  
);

-----------------------------------------------------------------------------------------------------------------------------------------
--2. Data Creation 

INSERT INTO StudentInfo VALUES ('101', 'John', '01-MAR-1995', '8626812576', 'john.flex@gmail.com', '5, Richie Street, Mumbai');
INSERT INTO StudentInfo VALUES ('102', 'Anuj', '21-JUN-1997', '9756812098', 'anuj.mittal@gmail.com', '7, Marine Street, Mumbai');
INSERT INTO StudentInfo VALUES ('103', 'Rakesh', '05-MAY-1993', '7656562576', 'rakesh.ranj@gmail.com', '9, Brigade Road, Delhi');
INSERT INTO StudentInfo VALUES ('104', 'Sonal', '22-MAR-1998', '9056812576', 'sonal.shah@gmail.com', '2, Kalakshetra Street, Chennai');
INSERT INTO StudentInfo VALUES ('105', 'Amrit', '31-OCT-1998', '6776812576', 'amrit.kaur@gmail.com', '5, Gangai Street, Kerala');
INSERT INTO CourseInfo VALUES ('2201','English','Kevin');
INSERT INTO CourseInfo VALUES ('2202','Chemistry','Raj');
INSERT INTO CourseInfo VALUES ('2203','Physics','Karthik');
INSERT INTO CourseInfo VALUES ('2204','Maths','Steven');
INSERT INTO CourseInfo VALUES ('2205','Tamil','Vignesh');


INSERT INTO EnrollmentInfo VALUES ('3011','2201','102', 'Enrolled');
INSERT INTO EnrollmentInfo VALUES ('3012','2204','102', 'Enrolled');
INSERT INTO EnrollmentInfo VALUES ('3013','2205','102', 'Enrolled');
INSERT INTO EnrollmentInfo VALUES ('3014','2202','101', 'Enrolled');
INSERT INTO EnrollmentInfo VALUES ('3015','2205','103', 'Enrolled');
INSERT INTO EnrollmentInfo VALUES ('3016','2204','103', 'Enrolled');
INSERT INTO EnrollmentInfo VALUES ('3017','2203','104', 'Enrolled');
INSERT INTO EnrollmentInfo VALUES ('3018','2202','104', 'Enrolled');
INSERT INTO EnrollmentInfo VALUES ('3019','2201','101', 'Enrolled');
INSERT INTO EnrollmentInfo VALUES ('3020','2204','105', 'Not Enrolled');

-----------------------------------------------------------------------------------------------------------------------------------------
--3. Retrieve the Student Information 
--3.a
SELECT distinct stu_name, phone_no, email_id, address, enroll_status  
FROM StudentInfo sti, EnrollmentInfo eni 
WHERE sti.stu_id = eni.stu_id;

--3.b
SELECT sti.stu_name, coi.course_name, eni.enroll_status 
FROM StudentInfo sti, CourseInfo coi, EnrollmentInfo eni 
WHERE sti.stu_id = eni.stu_id 
AND coi.course_id = eni.course_id 
AND sti.stu_id = 104;

--3.c
SELECT course_name, course_instructor_name 
FROM CourseInfo;

--3.d
SELECT course_name, course_instructor_name 
FROM CourseInfo 
WHERE course_id = 2201;

--3.e
select course_name, course_instructor_name 
FROM CourseInfo 
WHERE course_id IN ('2203','2205','2201');

-----------------------------------------------------------------------------------------------------------------------------------------
--4.Reporting and Analytics 

--a
SELECT COUNT(*) AS count, course_name 
FROM EnrollmentInfo eio 
JOIN CourseInfo cio 
ON eio.course_id = cio.course_id 
WHERE eio.enroll_status <> 'Not Enrolled' 
GROUP BY course_name;

--b
SELECT sti.stu_name, coi.course_name, eni.enroll_status 
FROM StudentInfo sti, CourseInfo coi, EnrollmentInfo eni 
WHERE sti.stu_id = eni.stu_id 
AND eni.enroll_status <> 'Not Enrolled'
AND eni.course_id = coi.course_id  
AND coi.course_id = 2204;

--c
SELECT COUNT(*) AS count, course_instructor_name 
FROM EnrollmentInfo eio 
JOIN CourseInfo cio 
ON eio.course_id = cio.course_id 
WHERE eio.enroll_status <> 'Not Enrolled' 
GROUP BY course_instructor_name;

--d
SELECT sio.stu_name, COUNT(eio.course_id) AS count 
FROM StudentInfo sio 
JOIN EnrollmentInfo eio 
ON sio.stu_id = eio.stu_id 
WHERE eio.enroll_status <> 'Not Enrolled' 
GROUP BY sio.stu_name 
HAVING COUNT(*) > 1;

--e
SELECT cio.course_name, COUNT(eio.course_id) AS count 
FROM CourseInfo cio 
JOIN EnrollmentInfo eio 
ON  eio.course_id = cio.course_id 
WHERE eio.enroll_status <> 'Not Enrolled' 
GROUP BY cio.course_name 
ORDER BY COUNT DESC;
----------------------------------------------------------------------------------------------------
