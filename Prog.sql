--CREATING THE DATABASE
CREATE DATABASE EventManagementDB;

-- USING THE DATABASE--
USE EventManagementDB;


-- =========================================================
-- 1. CREATING THE TABLE USERS
-- =========================================================

CREATE TABLE Users (
    UserID INT IDENTITY(1,1) PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    EmailAddress VARCHAR(100) NOT NULL,
    Password VARCHAR(255) NOT NULL,
    Role VARCHAR(30) NOT NULL,
    PhoneNum VARCHAR(20)
);


-- =========================================================
-- 2. CREATING THE TABLE  CATEGORIES
-- =========================================================

CREATE TABLE Categories (
    CategoryID INT IDENTITY(1,1) PRIMARY KEY,
    CategoryName VARCHAR(100) NOT NULL,
    CategoryType VARCHAR(50) NOT NULL,
    UserID INT NOT NULL,

    CONSTRAINT FK_Categories_Users
        FOREIGN KEY (UserID)
        REFERENCES Users(UserID)
);


-- =========================================================
-- 3. CREATING THE TABLE ORGANISERS
-- =========================================================

CREATE TABLE Organisers (
    OrganiserID INT IDENTITY(1,1) PRIMARY KEY,
    CategoryID INT NOT NULL,
    Reference VARCHAR(100) NOT NULL,

    CONSTRAINT FK_Organisers_Categories
        FOREIGN KEY (CategoryID)
        REFERENCES Categories(CategoryID)
);


-- =========================================================
-- 4. CREATING THE TABLE EVENTS
-- =========================================================

CREATE TABLE Events (
    EventID INT IDENTITY(1,1) PRIMARY KEY,
    EventName VARCHAR(100) NOT NULL,
    Description VARCHAR(500),
    EventDate DATE NOT NULL,
    Location VARCHAR(150) NOT NULL,
    Distance DECIMAL(10,2),
    EventType VARCHAR(50),
    CategoryID INT NOT NULL,

    CONSTRAINT FK_Events_Categories
        FOREIGN KEY (CategoryID)
        REFERENCES Categories(CategoryID)
);


-- =========================================================
-- 5. CREATING THE TABLE PARTICIPANTS
-- =========================================================

CREATE TABLE Participants (
    ParticipantID INT IDENTITY(1,1) PRIMARY KEY,
    UserID INT NOT NULL,
    EventID INT NOT NULL,

    CONSTRAINT FK_Participants_Users
        FOREIGN KEY (UserID)
        REFERENCES Users(UserID),

    CONSTRAINT FK_Participants_Events
        FOREIGN KEY (EventID)
        REFERENCES Events(EventID)
);


-- =========================================================
-- 6. create table ENROLMENTS
-- =========================================================

CREATE TABLE Enrolments (
    EnrolmentID INT IDENTITY(1,1) PRIMARY KEY,
    ParticipantID INT NOT NULL,
    EventID INT NOT NULL,
    CategoryID INT NOT NULL,
    EnrolmentDate DATE NOT NULL,

    CONSTRAINT FK_Enrolments_Participants
        FOREIGN KEY (ParticipantID)
        REFERENCES Participants(ParticipantID),

    CONSTRAINT FK_Enrolments_Events
        FOREIGN KEY (EventID)
        REFERENCES Events(EventID),

    CONSTRAINT FK_Enrolments_Categories
        FOREIGN KEY (CategoryID)
        REFERENCES Categories(CategoryID)
);


-- =========================================================
-- 7. creating the table RESULTS
-- =========================================================

CREATE TABLE Results (
    ResultID INT IDENTITY(1,1) PRIMARY KEY,
    EnrolmentID INT NOT NULL,
    FinishTime TIME,
    FinishPosition INT,

    CONSTRAINT FK_Results_Enrolments
        FOREIGN KEY (EnrolmentID)
        REFERENCES Enrolments(EnrolmentID)
);


-- =========================================================
-- INSERT INTO USERS
-- =========================================================

INSERT INTO Users
(FirstName, LastName, EmailAddress, Password, Role, PhoneNum)
VALUES
('John', 'Smith', 'john@email.com', 'John123', 'Organiser', '0712345678'),
('Sarah', 'Mokoena', 'sarah@email.com', 'Sarah123', 'Participant', '0723456789'),
('David', 'Williams', 'david@email.com', 'David123', 'Participant', '0734567890'),
('Lerato', 'Mahlangu', 'lerato@email.com', 'Lerato123', 'Organiser', '0745678901'),
('Thabo', 'Nkosi', 'thabo@email.com', 'Thabo123', 'Participant', '0756789012');


-- =========================================================
-- INSERT INTO CATEGORIES
-- =========================================================

INSERT INTO Categories
(CategoryName, CategoryType, UserID)
VALUES
('Running', 'Road Race', 1),
('Cycling', 'Road Cycling', 1),
('Swimming', 'Open Water', 4),
('Triathlon', 'Multi-Sport', 4);


-- =========================================================
-- INSERT INTO ORGANISERS
-- =========================================================

INSERT INTO Organisers
(CategoryID, Reference)
VALUES
(1, 'ORG001'),
(2, 'ORG002'),
(3, 'ORG003'),
(4, 'ORG004');


-- =========================================================
-- INSERT INTO EVENTS
-- =========================================================

INSERT INTO Events
(EventName, Description, EventDate, Location, Distance, EventType, CategoryID)
VALUES
('City 10K Run',
 'Annual 10 kilometre running event',
 '2026-10-10',
 'Johannesburg',
 10.00,
 'Running',
 1),

('Cape Cycle Challenge',
 'Road cycling competition',
 '2026-11-15',
 'Cape Town',
 50.00,
 'Cycling',
 2),

('Open Water Challenge',
 'Open water swimming competition',
 '2026-12-05',
 'Durban',
 5.00,
 'Swimming',
 3),

('National Triathlon',
 'Swimming, cycling and running event',
 '2027-01-20',
 'Pretoria',
 51.50,
 'Triathlon',
 4);


-- =========================================================
-- INSERT INTO PARTICIPANTS
-- =========================================================

INSERT INTO Participants
(UserID, EventID)
VALUES
(2, 1),
(3, 1),
(5, 2),
(2, 3),
(3, 4);


-- =========================================================
-- INSERT INTO ENROLMENTS
-- =========================================================

INSERT INTO Enrolments
(ParticipantID, EventID, CategoryID, EnrolmentDate)
VALUES
(1, 1, 1, '2026-09-01'),
(2, 1, 1, '2026-09-02'),
(3, 2, 2, '2026-09-03'),
(4, 3, 3, '2026-09-04'),
(5, 4, 4, '2026-09-05');


-- =========================================================
-- INSERT INTO RESULTS
-- =========================================================

INSERT INTO Results
(EnrolmentID, FinishTime, FinishPosition)
VALUES
(1, '00:52:30', 1),
(2, '01:05:45', 2),
(3, '02:15:20', 1),
(4, '01:10:35', 1),
(5, '02:45:10', 3);


-- =========================================================
-- SELECT ALL TABLES
-- =========================================================

SELECT * FROM Users;

SELECT * FROM Categories;

SELECT * FROM Organisers;

SELECT * FROM Events;

SELECT * FROM Participants;

SELECT * FROM Enrolments;

SELECT * FROM Results;


