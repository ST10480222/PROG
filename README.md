RaceDay System
1. Introduction

The RaceDay System is a relational database and RESTful API solution designed to manage running events, organisers, participants, event categories, enrolments, and race results.

Part 1 focuses on planning and designing the system before application development begins in Part 2.

2. System Objective

The objective of the RaceDay System is to provide a structured system that allows organisers to manage events and categories while allowing participants to take part in events and have their enrolments and results recorded.

The database is designed to provide:

Reliable relationships between entities
Data integrity
Accurate event and participant information
Efficient enrolment and result management
A clear foundation for the RESTful API

3. Database Design

The database contains seven entities:

Users

Stores user information, including names, email address, password, role, and phone number.

Organisers

Stores information about race organisers and their reference details.

Categories

Stores race category names and category types. Categories are associated with users and organisers.

Events

Stores race event information, including the event name, description, date, location, distance, event type, and category.

Participants

Stores participant records and links participants to events.

Enrolments

Stores event enrolment information, including the event, result, and enrolment date.

Results

Stores race results, including finish time, finish position, and the participant associated with the result.

4. Database Relationships

The main relationships in the database are:

One User can be associated with many Categories; each Category is associated with one User.
One Organiser can manage many Categories; each Category is managed by one Organiser.
One Category can have many Events; each Event belongs to one Category.
One Event can have many Participants; each Participant belongs to one Event.
One Event can have many Enrolments; each Enrolment belongs to one Event.
One Enrolment has one Result; each Result is associated with one Enrolment.
One Participant can have many Results; each Result belongs to one Participant.

Primary keys (PK) uniquely identify records, while foreign keys (FK) maintain relationships between related tables.

5. API Plan

The RESTful API will provide endpoints for authentication, participant profiles, events, categories, enrolments, and results.

Authentication
POST /api/auth/register – Register a participant.
POST /api/auth/login – Authenticate a participant and return a token.
Profile
GET /api/profile – Retrieve the logged-in participant profile.
Events
GET /api/events – Retrieve all events.
GET /api/events/{id} – Retrieve a specific event.
Categories
GET /api/events/{id}/categories – Retrieve categories for a specific event.
Enrolments
POST /api/events/{id}/enrolments – Enrol a participant in an event.
GET /api/enrolments/my – Retrieve the participant's enrolments.
Results
GET /api/results/event/{id} – Retrieve results for a specific event.
GET /api/results/{id} – Retrieve a specific result.
6. Data Integrity

The database uses constraints to maintain data quality and consistency.

These include:

PRIMARY KEY – uniquely identifies each record.
FOREIGN KEY – maintains relationships between tables.
NOT NULL – ensures required information is provided.
UNIQUE – prevents duplicate values where required.
IDENTITY – automatically generates unique IDs.
CHECK – ensures values meet specified conditions where appropriate.

Sample data is included to demonstrate the database functionality. The data contains multiple users, organisers, categories, events, participants, enrolments, and results.

7. SQL Script

The SQL script contains:

Database creation
Table creation
Primary key definitions
Foreign key definitions
Sample data insertion
SELECT statements for viewing table data

The database is named:

EventManagementDB

8. How to Run the Database
Open Microsoft SQL Server Management Studio (SSMS).
Open the RaceDay SQL script.
Execute the script.
The EventManagementDB database will be created.
The seven tables will be created.
Sample data will be inserted.
The SELECT statements can be used to view the records.
9. Technologies Used
SQL
Microsoft SQL Server
SQL Server Management Studio (SSMS)
RESTful API
GitHub
10. Project Purpose

The purpose of the RaceDay System is to provide a structured database solution for managing running events.

The system provides a foundation for managing:

Users
Organisers
Categories
Events
Participants
Enrolments
Race results

The database design and API plan are intended to remain aligned during Part 2 development so that the final application correctly reflects the approved ERD and database structure.

11. Conclusion

The RaceDay System provides a clear relational database and API structure for managing running events and their associated information.


CI BUILD
<img width="1917" height="782" alt="CI Build" src="https://github.com/user-attachments/assets/7098813e-cf07-4371-b859-f92eb6bc9eb7" />


YOUTUBE LINK:https://youtu.be/oEInMSG5Pd8

