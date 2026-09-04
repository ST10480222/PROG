-- =========================================================
-- CREATING THE DATABASE
-- =========================================================

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
-- 2. CREATING THE TABLE ORGANISERS
-- =========================================================

CREATE TABLE Organisers (
    OrganiserID INT IDENTITY(1,1) PRIMARY KEY,
    Reference VARCHAR(100) NOT NULL
);


-- =========================================================
-- 3. CREATING THE TABLE CATEGORIES
-- =========================================================

CREATE TABLE Categories (
    CategoryID INT IDENTITY(1,1) PRIMARY KEY,
    CategoryName VARCHAR(100) NOT NULL,
    CategoryType VARCHAR(50) NOT NULL,
    UserID INT NOT NULL,
    OrganisorID INT NOT NULL,

    CONSTRAINT FK_Categories_Users
        FOREIGN KEY (UserID)
        REFERENCES Users(UserID),

    CONSTRAINT FK_Categories_Organisers
        FOREIGN KEY (OrganisorID)
        REFERENCES Organisers(OrganiserID)
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
    EventID INT NOT NULL,

    CONSTRAINT FK_Participants_Events
        FOREIGN KEY (EventID)
        REFERENCES Events(EventID)
);


-- =========================================================
-- 6. CREATING THE TABLE RESULTS
-- =========================================================

CREATE TABLE Results (
    ResultID INT IDENTITY(1,1) PRIMARY KEY,
    FinishTime TIME,
    FinishPosition INT,
    ParticipantID INT NOT NULL,

    CONSTRAINT FK_Results_Participants
        FOREIGN KEY (ParticipantID)
        REFERENCES Participants(ParticipantID)
);


-- =========================================================
-- 7. CREATING THE TABLE ENROLMENTS
-- =========================================================

CREATE TABLE Enrolments (
    EnrolmentID INT IDENTITY(1,1) PRIMARY KEY,
    EventID INT NOT NULL,
    ResultID INT NOT NULL,
    EnrolmentDate DATE NOT NULL,

    CONSTRAINT FK_Enrolments_Events
        FOREIGN KEY (EventID)
        REFERENCES Events(EventID),

    CONSTRAINT FK_Enrolments_Results
        FOREIGN KEY (ResultID)
        REFERENCES Results(ResultID),

    CONSTRAINT UQ_Enrolments_ResultID
        UNIQUE (ResultID)
);


-- =========================================================
-- INSERTING THE VALUES INTO USERS
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
-- INSERTING THE VALUES INTO ORGANISERS
-- =========================================================

INSERT INTO Organisers
(Reference)
VALUES
('ORG001'),
('ORG002'),
('ORG003'),
('ORG004');


-- =========================================================
-- INSERTING THE VALUES INTO CATEGORIES
-- =========================================================

INSERT INTO Categories
(CategoryName, CategoryType, UserID, OrganisorID)
VALUES
('Running', 'Road Race', 1, 1),
('Cycling', 'Road Cycling', 1, 2),
('Swimming', 'Open Water', 4, 3),
('Triathlon', 'Multi-Sport', 4, 4);


-- =========================================================
-- INSERTING THE VALUES INTO EVENTS
-- =========================================================

INSERT INTO Events
(EventName, Description, EventDate, Location, Distance, EventType, CategoryID)
VALUES
(
    'City 10K Run',
    'Annual 10 kilometre running event',
    '2026-10-10',
    'Johannesburg',
    10.00,
    'Running',
    1
),
(
    'Cape Cycle Challenge',
    'Road cycling competition',
    '2026-11-15',
    'Cape Town',
    50.00,
    'Cycling',
    2
),
(
    'Open Water Challenge',
    'Open water swimming competition',
    '2026-12-05',
    'Durban',
    5.00,
    'Swimming',
    3
),
(
    'National Triathlon',
    'Swimming, cycling and running event',
    '2027-01-20',
    'Pretoria',
    51.50,
    'Triathlon',
    4
);


-- =========================================================
-- INSERTING THE VALUES INTO PARTICIPANTS
-- =========================================================

INSERT INTO Participants
(EventID)
VALUES
(1),
(1),
(2),
(3),
(4);


-- =========================================================
-- INSERTING THE VALUES INTO RESULTS
-- =========================================================

INSERT INTO Results
(FinishTime, FinishPosition, ParticipantID)
VALUES
('00:52:30', 1, 1),
('01:05:45', 2, 2),
('02:15:20', 1, 3),
('01:10:35', 1, 4),
('02:45:10', 3, 5);


-- =========================================================
-- INSERTING THE VALUES INTO ENROLMENTS
-- =========================================================

INSERT INTO Enrolments
(EventID, ResultID, EnrolmentDate)
VALUES
(1, 1, '2026-09-01'),
(1, 2, '2026-09-02'),
(2, 3, '2026-09-03'),
(3, 4, '2026-09-04'),
(4, 5, '2026-09-05');


-- =========================================================
-- DOING A QUIRY TO TEST MY TABLES
-- =========================================================

SELECT * FROM Users;

SELECT * FROM Organisers;

SELECT * FROM Categories;

SELECT * FROM Events;

SELECT * FROM Participants;

SELECT * FROM Enrolments;

SELECT * FROM Results;


