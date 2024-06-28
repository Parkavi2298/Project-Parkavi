--Task 3
--1.Database creation

CREATE DATABASE EventsManagement;

---Create the Events table
CREATE TABLE Events( 
    Event_Id SERIAL PRIMARY KEY, 
    Event_Name VARCHAR(150) NOT NULL, 
    Event_Date Date NOT NULL, 
    Event_Location VARCHAR(255), 
    Event_Description TEXT 
);

--Create the Attendees table
CREATE TABLE Attendees( 
    Attendee_Id SERIAL PRIMARY KEY, 
    Attendee_Name VARCHAR(255) NOT NULL, 
    Attendee_Phone VARCHAR(15), 
    Attendee_Email VARCHAR(255), 
    Attendee_City VARCHAR(255)
);

--Create the Registrations table
CREATE TABLE Registrations( 
    Registration_ID SERIAL PRIMARY KEY, 
    Event_Id INT REFERENCES Events(Event_Id), 
    Attendee_Id INT REFERENCES Attendees(Attendee_Id), 
    Registration_Date DATE, 
    Registration_Amount NUMERIC(10,2)
);

--2.Data Creation
INSERT INTO Events(Event_Id,Event_Name,Event_Date,Event_Location,Event_Description) 
VALUES 
(5001,'Melody Mania','12-JUN-2024','Chennai','Pradeep Music concert'), 
(5002,'Harmony Fest','15-JUN-2024','Kerala','Rahman Music concert'), 
(5003,'Rhythm Rave','18-JUN-2024','Goa','Yuvan Music concert'), 
(5004,'Groove Gala','20-JUN-2024','Hyderabad','VJ Antony Music concert'), 
(5005,'Beats Bash','22-JUN-2024','Bangalore','Anirudh Music concert');

INSERT INTO Attendees(Attendee_Id,Attendee_Name,Attendee_Phone,Attendee_Email,Attendee_City) 
VALUES 
(101,'John','8626812576','john.flex@gmail.com','Mumbai'),
(102,'Anuj','9756812098','anuj.mittal@gmail.com','Mumbai'),
(103,'Rakesh','7656562576','rakesh.ranj@gmail.com','Delhi'),
(104,'Sonal','9056812576','sonal.shah@gmail.com','Chennai'),
(105,'Amrit','6776812576','amrit.kaur@gmail.com','Kerala'),
(106,'Kavi','9676812576','kavi.moxie@gmail.com','Chennai'),
(107,'Ajay','8628902576','ajay.krish@gmail.com','Mumbai'),
(108,'Vignesh','7106812576','vignesh.raj@gmail.com','Chennai'),
(109,'Akshara','9756812576','akshara.r@gmail.com','Delhi'),
(110,'Kevin','6906812576','kevin.s@gmail.com','Chennai');

INSERT INTO Registrations(Event_Id,Attendee_Id,Registration_Date,Registration_Amount) 
VALUES 
(5001,101,'12-JUN-2024',500.00), 
(5001,102,'12-JUN-2024',500.00), 
(5003,103,'18-JUN-2024',700.00), 
(5003,104,'18-JUN-2024',700.00),
(5004,103,'20-JUN-2024',1000.00), 
(5004,104,'20-JUN-2024',1000.00);


--3.Manage Event Details
--3.a
INSERT INTO Events(Event_Id,Event_Name,Event_Date,Event_Location,Event_Description) 
VALUES 
(5006,'Starry Night','24-JUN-2024','Mumbai','Karthik Music concert')

--3.b
UPDATE Events 
SET Event_Location = 'Kolkata' 
WHERE Event_Id = 5004;

--3.c
DELETE FROM Events 
WHERE Event_Id = 5005;

--4.Manage, Track Attendees and handle events
--4.a
INSERT INTO Attendees (Attendee_Id,Attendee_Name,Attendee_Phone,Attendee_Email,Attendee_City) 
VALUES (111,'Dinesh','9750712527','dinesh.msd@gmail.com','Chennai');

--4.b
INSERT INTO Registrations(Event_Id,Attendee_Id,Registration_Date,Registration_Amount) 
VALUES 
(5004,105,'20-JUN-2024',700.00);

--5
SELECT * FROM Events WHERE Event_Id = 5001;

SELECT COUNT(*) FROM Events;

SELECT * FROM Attendees;

SELECT COUNT(*) FROM Attendees;

SELECT COUNT(*) FROM Registrations WHERE Event_Id = 5003;

SELECT COUNT(*) FROM Registrations;