CREATE DATABASE EVENT_MANAGEMENT
use EVENT_MANAGEMENT
CREATE TABLE Event (
    EventID INT PRIMARY KEY,
    EventName VARCHAR(255) NOT NULL,
    EventDescription TEXT,
    EventDate DATE NOT NULL,
    EventTime TIME,
    EventVenue VARCHAR(255) NOT NULL,
    MaxCapacity INT,
);
CREATE TABLE Attendee (
    AttendeeID INT  PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) NOT NULL,
    PhoneNumber VARCHAR(20),
    RegistrationDate DATE,
);
CREATE TABLE Speaker (
    SpeakerID INT  PRIMARY KEY,
    SpeakerName VARCHAR(100) NOT NULL,
    SpeakerBio TEXT,
    SpeakerEmail VARCHAR(100) NOT NULL,
    SpeakerPhoneNumber VARCHAR(20),
    UNIQUE (SpeakerEmail)
);
CREATE TABLE Sponsor (
    SponsorID INT  PRIMARY KEY,
    SponsorName VARCHAR(100) NOT NULL,
    SponsorContactPerson VARCHAR(100),
    SponsorEmail VARCHAR(100) NOT NULL,
    SponsorPhoneNumber VARCHAR(20),
    UNIQUE (SponsorEmail)
);
CREATE TABLE Session (
    SessionID INT  PRIMARY KEY,
    SessionTitle VARCHAR(255) NOT NULL,
    SessionDescription TEXT,
    SessionTime TIME,
    EventID INT,
    FOREIGN KEY (EventID) REFERENCES Event(EventID)
);
CREATE TABLE Registration (
    RegistrationID INT  PRIMARY KEY,
    AttendeeID INT,
    EventID INT,
    RegistrationDate DATE,
    FOREIGN KEY (AttendeeID) REFERENCES Attendee(AttendeeID),
    FOREIGN KEY (EventID) REFERENCES Event(EventID)
);
CREATE TABLE Feedback (
    FeedbackID INT  PRIMARY KEY,
    AttendeeID INT,
    EventID INT,
    FeedbackRating INT,
    FOREIGN KEY (AttendeeID) REFERENCES Attendee(AttendeeID),
    FOREIGN KEY (EventID) REFERENCES Event(EventID)
);
---- INSERTING RECORDS ----

-- Populate Event table
INSERT INTO Event (EventID, EventName, EventDescription, EventDate, EventTime, EventVenue, MaxCapacity) VALUES
(1, 'Tech Conference 2024', 'Annual technology conference featuring industry experts and innovators.', '2024-09-15', '09:00:00', 'Convention Center', 500),
(2, 'Business Summit', 'Gathering of business leaders to discuss industry trends and strategies.', '2024-10-20', '10:30:00', 'Hotel Ballroom', 300),
(3, 'Health & Wellness Expo', 'Exhibition promoting healthy living, fitness, and wellness products.', '2024-11-05', '11:00:00', 'Community Center', 200),
(4, 'Startup Pitch Day', 'Event where startup founders pitch their ideas to investors and mentors.', '2024-12-10', '13:00:00', 'Tech Hub', 100),
(5, 'Marketing Masterclass', 'Workshop on the latest marketing techniques and strategies.', '2025-01-25', '14:00:00', 'Marketing Agency', 50),
(6, 'AI & Machine Learning Symposium', 'Symposium focusing on advancements in AI and machine learning.', '2024-09-25', '09:00:00', 'Innovation Hall', 400),
(7, 'Environmental Sustainability Conference', 'Conference addressing environmental sustainability and green practices.', '2024-10-10', '10:00:00', 'Eco Center', 350),
(8, 'Cybersecurity Workshop', 'Workshop on the latest cybersecurity threats and solutions.', '2024-11-15', '10:00:00', 'Tech Park', 250),
(9, 'Healthcare Innovations Summit', 'Summit showcasing innovations in healthcare technology.', '2024-12-01', '09:30:00', 'Medical Center', 300),
(10, 'Entrepreneurship Bootcamp', 'Intensive bootcamp for aspiring entrepreneurs.', '2025-01-10', '09:00:00', 'Startup Incubator', 150),
(11, 'Digital Transformation Forum', 'Forum discussing digital transformation in various industries.', '2024-09-30', '11:00:00', 'Tech Arena', 500),
(12, 'Art & Culture Expo', 'Expo celebrating art and culture from around the world.', '2024-10-25', '12:00:00', 'Cultural Center', 400),
(13, 'Blockchain Conference', 'Conference dedicated to blockchain technology and its applications.', '2024-11-20', '09:00:00', 'Tech Plaza', 300),
(14, 'Finance & Investment Summit', 'Summit on finance and investment strategies.', '2024-12-15', '10:00:00', 'Finance Hall', 350),
(15, 'Education Technology Expo', 'Expo showcasing the latest in educational technology.', '2025-01-20', '11:00:00', 'Education Center', 200),
(16, 'Creative Writing Workshop', 'Workshop for aspiring writers to hone their skills.', '2024-09-20', '10:00:00', 'Writers Hub', 100),
(17, 'Gaming Convention', 'Convention for gaming enthusiasts and professionals.', '2024-10-05', '09:00:00', 'Gaming Arena', 600),
(18, 'Fashion Show', 'Fashion show featuring the latest trends and designers.', '2024-11-10', '18:00:00', 'Fashion Center', 250),
(19, 'Robotics Competition', 'Competition showcasing robotics projects and innovations.', '2024-12-05', '09:00:00', 'Robotics Lab', 200),
(20, 'Music Festival', 'Festival celebrating music from various genres.', '2025-01-15', '14:00:00', 'Music Park', 500);
SELECT * FROM Event;
-- Populate Attendee table
INSERT INTO Attendee (AttendeeID, FirstName, LastName, Email, PhoneNumber, RegistrationDate) VALUES
(1, 'John', 'Doe', 'john.doe@example.com', '1234567890', '2024-08-01'),
(2, 'Alice', 'Smith', 'alice.smith@example.com', '9876543210', '2024-09-10'),
(3, 'Michael', 'Johnson', 'michael.johnson@example.com', '4561237890', '2024-10-05'),
(4, 'Emily', 'Brown', 'emily.brown@example.com', '7894561230', '2024-11-15'),
(5, 'David', 'Taylor', 'david.taylor@example.com', '3216549870', '2024-12-20'),
(6, 'Olivia', 'Wilson', 'olivia.wilson@example.com', '2345678901', '2024-08-15'),
(7, 'James', 'Anderson', 'james.anderson@example.com', '8765432109', '2024-09-20'),
(8, 'Sophia', 'Martinez', 'sophia.martinez@example.com', '3456789012', '2024-10-10'),
(9, 'Liam', 'Garcia', 'liam.garcia@example.com', '7654321098', '2024-11-05'),
(10, 'Mia', 'Hernandez', 'mia.hernandez@example.com', '4567890123', '2024-12-01'),
(11, 'Noah', 'Moore', 'noah.moore@example.com', '6543210987', '2024-08-25'),
(12, 'Ava', 'Jackson', 'ava.jackson@example.com', '5678901234', '2024-09-30'),
(13, 'William', 'Martinez', 'william.martinez@example.com', '5432109876', '2024-10-15'),
(14, 'Isabella', 'Lopez', 'isabella.lopez@example.com', '6789012345', '2024-11-25'),
(15, 'Lucas', 'Gonzalez', 'lucas.gonzalez@example.com', '4321098765', '2024-12-10'),
(16, 'Charlotte', 'Wilson', 'charlotte.wilson@example.com', '7890123456', '2024-08-05'),
(17, 'Henry', 'Martinez', 'henry.martinez@example.com', '3210987654', '2024-09-15'),
(18, 'Amelia', 'Anderson', 'amelia.anderson@example.com', '8901234567', '2024-10-25'),
(19, 'Sebastian', 'Garcia', 'sebastian.garcia@example.com', '2109876543', '2024-11-10'),
(20, 'Evelyn', 'Hernandez', 'evelyn.hernandez@example.com', '9012345678', '2024-12-05');
SELECT * FROM Attendee;
-- Populate Speaker table
INSERT INTO Speaker (SpeakerID, SpeakerName, SpeakerBio, SpeakerEmail, SpeakerPhoneNumber) VALUES
(1, 'Sarah Adams', 'Experienced tech entrepreneur and keynote speaker.', 'sarah.adams@example.com', '5551234567'),
(2, 'Chris Evans', 'Marketing guru with a passion for digital advertising.', 'chris.evans@example.com', '5559876543'),
(3, 'Lisa Martinez', 'Health and wellness coach dedicated to holistic living.', 'lisa.martinez@example.com', '5557891234'),
(4, 'James Lee', 'Startup mentor and angel investor.', 'james.lee@example.com', '5554567890'),
(5, 'Emma Wright', 'Expert in business strategy and management consulting.', 'emma.wright@example.com', '5553216547'),
(6, 'Robert Johnson', 'AI and machine learning specialist.', 'robert.johnson@example.com', '5551237890'),
(7, 'Nancy Davis', 'Environmental sustainability advocate and speaker.', 'nancy.davis@example.com', '5559873210'),
(8, 'David Wilson', 'Cybersecurity expert and ethical hacker.', 'david.wilson@example.com', '5556541230'),
(9, 'Jessica Miller', 'Healthcare technology innovator.', 'jessica.miller@example.com', '5557896543'),
(10, 'Matthew Martinez', 'Entrepreneurship coach and business mentor.', 'matthew.martinez@example.com', '5553219876'),
(11, 'Daniel Thompson', 'Digital transformation leader.', 'daniel.thompson@example.com', '5554563217'),
(12, 'Sophia Brown', 'Cultural historian and speaker.', 'sophia.brown@example.com', '5557894321'),
(13, 'Olivia Garcia', 'Blockchain technology expert.', 'olivia.garcia@example.com', '5551236549'),
(14, 'Lucas Taylor', 'Finance and investment strategist.', 'lucas.taylor@example.com', '5559874563'),
(15, 'Mia Anderson', 'Educational technology innovator.', 'mia.anderson@example.com', '5553216540'),
(16, 'Ethan Martinez', 'Creative writing coach.', 'ethan.martinez@example.com', '5556547890'),
(17, 'Lily Jackson', 'Gaming industry analyst and speaker.', 'lily.jackson@example.com', '5557893214'),
(18, 'Aiden Hernandez', 'Fashion industry expert.', 'aiden.hernandez@example.com', '5554569870'),
(19, 'Ava Rodriguez', 'Robotics engineer and speaker.', 'ava.rodriguez@example.com', '5553217894'),
(20, 'Benjamin Lewis', 'Music producer and festival organizer.', 'benjamin.lewis@example.com', '5556543217');
SELECT * FROM Speaker;
-- Populate Sponsor table
INSERT INTO Sponsor (SponsorID, SponsorName, SponsorContactPerson, SponsorEmail, SponsorPhoneNumber) VALUES
(1, 'Tech Solutions Inc.', 'Mark Johnson', 'mark.johnson@techsolutions.com', '1112223333'),
(2, 'Marketing Xpert Agency', 'Jessica Parker', 'jessica.parker@marketingxpert.com', '4445556666'),
(3, 'Healthy Living Store', 'Sam Wilson', 'sam.wilson@healthylivingstore.com', '7778889999'),
(4, 'Startup Fund', 'Emily Clark', 'emily.clark@startupfund.com', '2223334444'),
(5, 'Business Consulting Group', 'Alex Turner', 'alex.turner@businessconsulting.com', '8889990000'),
(6, 'Green Energy Corp', 'Laura Green', 'laura.green@greenenergy.com', '1231231234'),
(7, 'Tech Innovators', 'Tom White', 'tom.white@techinnovators.com', '2342342345'),
(8, 'Fitness Gear', 'Nancy Blue', 'nancy.blue@fitnessgear.com', '3453453456'),
(9, 'EduTech', 'Peter Black', 'peter.black@edutech.com', '4564564567'),
(10, 'Fashion Forward', 'Anna Grey', 'anna.grey@fashionforward.com', '5675675678'),
(11, 'HealthFirst', 'Olivia Pink', 'olivia.pink@healthfirst.com', '6786786789'),
(12, 'Financial Experts', 'David Red', 'david.red@financialexperts.com', '7897897890'),
(13, 'GameOn', 'Lucas Purple', 'lucas.purple@gameon.com', '8908908901'),
(14, 'Creative Minds', 'Sophia Yellow', 'sophia.yellow@creativeminds.com', '9019019012'),
(15, 'Tech Future', 'William Orange', 'william.orange@techfuture.com', '1111111111'),
(16, 'Biz Growth', 'James Pink', 'james.pink@bizgrowth.com', '2222222222'),
(17, 'Healthcare Partners', 'Isabella Brown', 'isabella.brown@healthcarepartners.com', '3333333333'),
(18, 'EcoWorld', 'Mia Blue', 'mia.blue@ecoworld.com', '4444444444'),
(19, 'Innovate Now', 'Ethan Green', 'ethan.green@innovatenow.com', '5555555555'),
(20, 'Startup Innovators', 'Emma Orange', 'emma.orange@startupinnovators.com', '6666666666');
SELECT * FROM Sponsor;
-- Populate Session table
INSERT INTO Session (SessionID, SessionTitle, SessionDescription, SessionTime, EventID) VALUES
(1, 'Keynote Address', 'Opening keynote speech by Sarah Adams on the future of technology.', '09:30:00', 1),
(2, 'Digital Marketing Trends', 'Panel discussion led by Chris Evans on the latest trends in digital marketing.', '11:00:00', 2),
(3, 'Yoga Workshop', 'Interactive yoga workshop conducted by Lisa Martinez.', '13:30:00', 3),
(4, 'Startup Pitch Competition', 'Pitch competition featuring startup founders moderated by James Lee.', '15:00:00', 4),
(5, 'Strategic Planning Workshop', 'Workshop led by Emma Wright on strategic planning for business growth.', '10:00:00', 5),
(6, 'AI and Machine Learning', 'Discussion on the latest advancements in AI and machine learning by Robert Johnson.', '09:00:00', 1),
(7, 'Sustainability Practices', 'Session on environmental sustainability by Nancy Davis.', '10:30:00', 2),
(8, 'Cybersecurity Threats', 'Overview of current cybersecurity threats by David Wilson.', '11:30:00', 1),
(9, 'Healthcare Innovations', 'Presentation on healthcare technology innovations by Jessica Miller.', '14:00:00', 3),
(10, 'Entrepreneurship Essentials', 'Talk on essential skills for entrepreneurs by Matthew Martinez.', '16:00:00', 4),
(11, 'Digital Transformation', 'Insights on digital transformation in businesses by Daniel Thompson.', '09:30:00', 5),
(12, 'Cultural Heritage', 'Discussion on preserving cultural heritage by Sophia Brown.', '11:00:00', 1),
(13, 'Blockchain Applications', 'Exploring blockchain applications in various industries by Olivia Garcia.', '12:30:00', 2),
(14, 'Investment Strategies', 'Workshop on investment strategies by Lucas Taylor.', '14:30:00', 4),
(15, 'Educational Tech', 'Session on the latest in educational technology by Mia Anderson.', '15:00:00', 3),
(16, 'Creative Writing Techniques', 'Workshop on creative writing techniques by Ethan Martinez.', '10:00:00', 5),
(17, 'Gaming Industry Insights', 'Panel discussion on the gaming industry by Lily Jackson.', '13:00:00', 1),
(18, 'Fashion Industry Trends', 'Session on the latest trends in the fashion industry by Aiden Hernandez.', '14:00:00', 2),
(19, 'Robotics Innovations', 'Presentation on robotics innovations by Ava Rodriguez.', '15:30:00', 4),
(20, 'Music Production', 'Workshop on music production techniques by Benjamin Lewis.', '16:30:00', 5);
SELECT * FROM Session;
-- Populate Registration table
INSERT INTO Registration (RegistrationID, AttendeeID, EventID, RegistrationDate) VALUES
(1, 1, 1, '2024-08-05'),
(2, 2, 2, '2024-09-12'),
(3, 3, 3, '2024-10-08'),
(4, 4, 4, '2024-11-20'),
(5, 5, 5, '2024-12-25'),
(6, 6, 1, '2024-08-15'),
(7, 7, 2, '2024-09-22'),
(8, 8, 3, '2024-10-12'),
(9, 9, 4, '2024-11-22'),
(10, 10, 5, '2024-12-30'),
(11, 11, 1, '2024-08-25'),
(12, 12, 2, '2024-09-30'),
(13, 13, 3, '2024-10-18'),
(14, 14, 4, '2024-11-28'),
(15, 15, 5, '2024-12-10'),
(16, 16, 1, '2024-09-05'),
(17, 17, 2, '2024-10-10'),
(18, 18, 3, '2024-11-05'),
(19, 19, 4, '2024-12-15'),
(20, 20, 5, '2025-01-01');
SELECT * FROM Registration;
-- Populate Feedback table
INSERT INTO Feedback (FeedbackID, AttendeeID, EventID, FeedbackRating) VALUES
(1, 1, 1, 5),
(2, 2, 2, 4),
(3, 3, 3, 5),
(4, 4, 4, 4),
(5, 5, 5, 5),
(6, 6, 1, 4),
(7, 7, 2, 5),
(8, 8, 3, 4),
(9, 9, 4, 3),
(10, 10, 5, 5),
(11, 11, 1, 3),
(12, 12, 2, 4),
(13, 13, 3, 5),
(14, 14, 4, 4),
(15, 15, 5, 3),
(16, 16, 1, 4),
(17, 17, 2, 5),
(18, 18, 3, 3),
(19, 19, 4, 5),
(20, 20, 5, 4);
SELECT * FROM Feedback;

-- SQL QUERIES ---

--Retrieve Event Names and Venues for Events after 2024-11-01
SELECT EventName, EventVenue
FROM Event
WHERE EventDate > '2024-11-01';

--Count the Number of Events with MaxCapacity Greater Than 300:
SELECT COUNT(*)
FROM Event
WHERE MaxCapacity > 300;

--Retrieve Events Ordered by Event Date in Ascending Order:
SELECT *
FROM Event
ORDER BY EventDate ASC;

--Calculate Average Event Capacity:
SELECT AVG(MaxCapacity) AS AvgCapacity
FROM Event;

--Retrieve Event Names and the Number of Attendees Registered for Each Event:
SELECT e.EventName, COUNT(r.RegistrationID) AS AttendeeCount
FROM Event e
LEFT JOIN Registration r ON e.EventID = r.EventID
GROUP BY e.EventName;

--Retrieve Events with Feedback Ratings Higher Than 4:
SELECT e.*
FROM Event e
JOIN Feedback f ON e.EventID = f.EventID
WHERE f.FeedbackRating > 4;

--Update Records in a Table
UPDATE Attendee
SET PhoneNumber = '0001112222'
WHERE AttendeeID = 1;
SELECT *FROM Attendee

-- Implementing SQL Functions for Data Transformation or Calculation
SELECT FirstName, LastName, UPPER(Email) AS UpperCaseEmail
FROM Attendee;

SELECT FirstName, LastName, CONCAT(FirstName, ' ', LastName) AS FullName
FROM Attendee;

--Using SELECT Statements with Various Clauses
SELECT * FROM Attendee
WHERE RegistrationDate > '2024-09-01';

SELECT * FROM Attendee
ORDER BY LastName ASC;

SELECT COUNT(*), RegistrationDate
FROM Attendee
GROUP BY RegistrationDate
HAVING COUNT(*) > 2024-10-05;

-- Performing Aggregation Functions
SELECT COUNT(*) AS TotalAttendees
FROM Attendee;
SELECT AVG(MaxCapacity) AS AverageMaxCapacity
FROM Event;
SELECT COUNT(*) AS TotalSponsors
FROM Sponsor;

-- Crafting SQL Joins to Retrieve Data from Multiple Related Tables
--Inner Join
SELECT A.FirstName, A.LastName, S.SponsorName
FROM Attendee A
INNER JOIN Sponsor S ON A.AttendeeID = S.SponsorID;

--LEFT JOIN
SELECT A.FirstName, A.LastName, E.EventName
FROM Attendee A
LEFT JOIN Event E ON A.AttendeeID = E.EventID;

--Join with Multiple Tables
SELECT A.FirstName, A.LastName, E.EventName, S.SpeakerName
FROM Attendee A
INNER JOIN Event E ON A.AttendeeID = E.EventID
INNER JOIN Speaker S ON E.EventID = S.SpeakerID;










