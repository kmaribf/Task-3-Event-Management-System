-- Task 3: Event Management System

-- 1. Database Creation: 

-- Creating a Database
Create database EventsManagement;
use EventsManagement;

-- a) Creating first table 'Events'

CREATE TABLE Events (
    Event_Id INT PRIMARY KEY,
    Event_Name VARCHAR(100),
    Event_Date DATE,
    Event_Location VARCHAR(100),
    Event_Description TEXT
);

-- b) Creating second table 'Attendees'

CREATE TABLE Attendees (
    Attendee_Id INT PRIMARY KEY,
    Attendee_Name VARCHAR(100),
    Attendee_Phone BIGINT,
    Attendee_Email VARCHAR(100),
    Attendee_City VARCHAR(100)
);

-- c) Creating third table 'Registration'

CREATE TABLE Registrations (
    Registration_Id INT PRIMARY KEY,
    Event_Id INT,
    Attendee_Id INT,
    Registration_Date DATE,
    Registration_Amount DECIMAL(10,2),
    FOREIGN KEY (Event_Id) REFERENCES Events(Event_Id),
    FOREIGN KEY (Attendee_Id) REFERENCES Attendees(Attendee_Id)
);

-- 2. Data Creation:

-- a) Inserting values in the table 'Events'

INSERT INTO Events VALUES
(301, 'Comedy Nights Live', '2025-08-20', 'Delhi', 'Live stand-up comedy with top comedians.'),
(302, 'LOL India Tour', '2025-09-05', 'Mumbai', 'Multi-comedian performance evening.'),
(303, 'The Roast Show', '2025-10-10', 'Bangalore', 'Roasting Indian celebrities with humor.'),
(304, 'Laugh-a-thon', '2025-11-25', 'Hyderabad', 'A full-day festival of laughter.');

-- b) Inserting values in the table 'Attendees'

INSERT INTO Attendees VALUES
(1, 'Zakir Khan', 9876543210, 'zakir@comedy.in', 'Indore'),
(2, 'Kenny Sebastian', 9812345678, 'kenny@comedy.in', 'Bangalore'),
(3, 'Biswa Kalyan Rath', 9123456780, 'biswa@comedy.in', 'Odisha'),
(4, 'Abish Mathew', 9988776655, 'abish@comedy.in', 'Delhi'),
(5, 'Neeti Palta', 9874501234, 'neeti@comedy.in', 'Delhi');

-- c) Inserting values in the table 'Registrations'

INSERT INTO Registrations VALUES
(401, 301, 1, '2025-07-25', 1200.00),
(402, 301, 2, '2025-07-26', 1200.00),
(403, 302, 3, '2025-08-10', 1500.00),
(404, 303, 4, '2025-09-15', 1800.00),
(405, 303, 5, '2025-09-16', 1800.00),
(406, 301, 3, '2025-07-27', 1200.00);

-- 3. Manage Event Details

-- a) Inserting a new event

INSERT INTO Events VALUES
(305, 'Standup Shots Special', '2025-12-05', 'Ahmedabad', 'Special acts by rising comedians.');

-- b) Updating an event's information

UPDATE Events
SET Event_Location = 'Ahmedabad Comedy Arena'
WHERE Event_Id = 305;

-- c) Deleting an event

DELETE FROM Events
WHERE Event_Id = 304;

-- 4. Manage Track Attendees & Handle Events

-- a) Inserting a New Atteendee

INSERT INTO Attendees VALUES
(6, 'Rahul Subramanian', 9090909090, 'rahul@comedy.in', 'Mumbai');

-- b) Registering an attendee for an event

INSERT INTO Registrations VALUES
(407, 302, 6, '2025-08-15', 1500.00);

-- 5. Multiple Query

-- a) Retrieve all Events

SELECT * FROM Events;

-- b) Generate attendees lists for each event

SELECT 
    e.Event_Name,
    a.Attendee_Name,
    a.Attendee_Email,
    r.Registration_Date
FROM Registrations r
JOIN Events e ON r.Event_Id = e.Event_Id
JOIN Attendees a ON r.Attendee_Id = a.Attendee_Id
ORDER BY e.Event_Name, a.Attendee_Name;

-- c) Calculate Event Attendance Statistics

SELECT 
    e.Event_Name,
    COUNT(r.Attendee_Id) AS Total_Attendees,
    SUM(r.Registration_Amount) AS Total_Revenue
FROM Events e
JOIN Registrations r ON e.Event_Id = r.Event_Id
GROUP BY e.Event_Name;

-- ---------------------------THE END ------------------------------------------
