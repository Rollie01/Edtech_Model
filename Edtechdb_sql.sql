CREATE DATABASE edtechdb;

CREATE TABLE Students (
    StudentID INT AUTO_INCREMENT PRIMARY KEY,
    FullName VARCHAR(255) NOT NULL,
    Email VARCHAR(255) NOT NULL UNIQUE,
    RegistrationDate DATE NOT NULL);
    
    
INSERT INTO Students (FullName, Email, RegistrationDate)
VALUES
('Alice Walker', 'alice.walker@example.com', '2024-01-01'),
('Bob Johnson', 'bob.johnson@example.com', '2024-02-15'),
('Charlie Smith', 'charlie.smith@example.com', '2024-03-10'),
('Diana Prince', 'diana.prince@example.com', '2024-04-05'),
('Edward Nigma', 'edward.nigma@example.com', '2024-05-20'),
('Fiona Apple', 'fiona.apple@example.com', '2024-06-15'),
('George Clooney', 'george.clooney@example.com', '2024-07-30'),
('Hannah Montana', 'hannah.montana@example.com', '2024-08-25'),
('Ivy League', 'ivy.league@example.com', '2024-09-12'),
('Jack Sparrow', 'jack.sparrow@example.com', '2024-10-05'),
('Kathy Bates', 'kathy.bates@example.com', '2024-11-15'),
('Liam Neeson', 'liam.neeson@example.com', '2024-12-10'),
('Mona Lisa', 'mona.lisa@example.com', '2024-01-25'),
('Nancy Drew', 'nancy.drew@example.com', '2024-02-18'),
('Oscar Wilde', 'oscar.wilde@example.com', '2024-03-30');


CREATE TABLE Instructors (
    InstructorID INT NOT NULL PRIMARY KEY,
    InstructorFullName VARCHAR(255) NOT NULL,
    InstructorEmail VARCHAR(255) NOT NULL UNIQUE,
    InstructorPhoneNum VARCHAR(15) NOT NULL);
    
    INSERT INTO Instructors (InstructorID, InstructorFullName, InstructorEmail, InstructorPhoneNum)
VALUES
(101, 'John Doe', 'john.doe@example.com', '+441234567890'),
(102, 'Jane Smith', 'jane.smith@example.com', '+441234567891'),
(103, 'Alice Brown', 'alice.brown@example.com', '+441234567892'),
(104, 'Tom White', 'tom.white@example.com', '+441234567893'),
(105, 'Anna Lee', 'anna.lee@example.com', '+441234567894'),
(106, 'Mark Green', 'mark.green@example.com', '+441234567895'),
(107, 'Sophia Adams', 'sophia.adams@example.com', '+441234567896'),
(108, 'Michael Scott', 'michael.scott@example.com', '+441234567897'),
(109, 'Emma Wilson', 'emma.wilson@example.com', '+441234567898'),
(110, 'David Johnson', 'david.johnson@example.com', '+441234567899'),
(111, 'Lucy Grey', 'lucy.grey@example.com', '+441234567800'),
(112, 'James Bond', 'james.bond@example.com', '+441234567801'),
(113, 'Laura Palmer', 'laura.palmer@example.com', '+441234567802'),
(114, 'Harry Potter', 'harry.potter@example.com', '+441234567803'),
(115, 'Lily Evans', 'lily.evans@example.com', '+441234567804');


CREATE TABLE Courses (
    CourseID INT NOT NULL PRIMARY KEY,
    CourseName VARCHAR(255) NOT NULL,
    CourseDescription TEXT,
    InstructorID INT NOT NULL,
    Duration INT NOT NULL,
    Amount DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (InstructorID) REFERENCES Instructors(InstructorID));
    
    
    INSERT INTO Courses (CourseID, CourseName, CourseDescription, InstructorID, Duration, Amount)
VALUES
(2001, 'Python Programming', 'Learn Python from basics to advanced levels.', 1001, 8, 500.00),
(2002, 'Data Science Fundamentals', 'Introduction to data analysis and visualization.', 1002, 10, 750.00),
(2003, 'Web Development', 'Master front-end and back-end web development.', 1003, 12, 850.00),
(2004, 'Machine Learning Basics', 'Learn the fundamentals of machine learning algorithms.', 1004, 6, 900.00),
(2005, 'Cloud Computing', 'Understand cloud technologies and architecture.', 1005, 9, 600.00),
(2006, 'Cybersecurity Essentials', 'Introduction to cybersecurity concepts and practices.', 1006, 7, 650.00),
(2007, 'SQL Mastery', 'Master SQL queries and database management.', 1007, 5, 400.00),
(2008, 'Networking Basics', 'Learn the basics of computer networking.', 1008, 8, 550.00),
(2009, 'Artificial Intelligence Intro', 'Beginner-friendly introduction to AI.', 1009, 11, 1000.00),
(2010, 'Blockchain Basics', 'Learn blockchain technology and applications.', 1010, 6, 700.00),
(2011, 'DevOps Practices', 'Understand DevOps culture, tools, and practices.', 1011, 8, 800.00),
(2012, 'Mobile App Development', 'Build mobile applications for iOS and Android.', 1012, 10, 950.00),
(2013, 'Software Testing', 'Learn software testing strategies and tools.', 1013, 6, 450.00),
(2014, 'UI/UX Design', 'Create user-friendly interfaces with modern tools.', 1014, 7, 550.00),
(2015, 'Advanced Java Programming', 'Advanced Java concepts and programming techniques.', 1015, 9, 700.00);


CREATE TABLE Enrollments (
    EnrollmentID INT NOT NULL PRIMARY KEY,
    CourseID INT NOT NULL,
    StudentID INT NOT NULL,
    EnrollmentDate DATE NOT NULL,
    Progress DECIMAL(5, 2) NOT NULL,
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID));
    
    
    INSERT INTO Enrollments (EnrollmentID, CourseID, StudentID, EnrollmentDate, Progress)
VALUES
(3001, 201, 1, '2024-01-15', 75.00),
(3002, 202, 2, '2024-01-20', 60.80),
(3003, 203, 3, '2024-01-25', 80.00),
(3004, 204, 4, '2024-02-01', 50.00),
(3005, 205, 5, '2024-02-10', 90.00),
(3006, 206, 6, '2024-02-15', 70.70),
(3007, 207, 7, '2024-02-20', 65.00),
(3008, 208, 8, '2024-02-25', 85.00),
(3009, 209, 9, '2024-03-01', 95.00),
(3010, 210, 1, '2024-03-10', 40.60),
(3011, 211, 2, '2024-03-15', 55.00),
(3012, 212, 3, '2024-03-20', 30.00),
(3013, 213, 4, '2024-03-25', 45.00),
(3014, 214, 5, '2024-03-30', 20.00),
(3015, 215, 6, '2024-04-05', 10.90);

SELECT * FROM enrollments;


UPDATE Courses
SET Category = CASE
    WHEN CourseName LIKE '%Programming%' OR CourseName LIKE '%Development%' THEN 'Programming'
    WHEN CourseName LIKE '%Data%' OR CourseName LIKE '%AI%' OR CourseName LIKE '%Machine%' THEN 'Data Science'
    WHEN CourseName LIKE '%Cybersecurity%' OR CourseName LIKE '%Networking%' OR CourseName LIKE '%Blockchain%' THEN 'IT Security'
    ELSE 'Other'END;
    
SET SQL_SAFE_UPDATES = 0;

ALTER TABLE Courses
DROP COLUMN CourseDescription;


UPDATE Enrollments
SET Progress = 100
WHERE StudentID = (SELECT StudentID FROM Students WHERE FullName = 'Diana Prince');


SELECT Courses.CourseID, Courses.CourseName, Courses.Duration, Courses.Amount
FROM Courses
INNER JOIN Enrollments ON Courses.CourseID = Enrollments.CourseID
INNER JOIN Students ON Enrollments.StudentID = Students.StudentID
WHERE Students.FullName = 'Diana Prince';


DELETE FROM Students
WHERE FullName = 'Diana Prince';


SELECT * FROM courses;

ALTER TABLE courses
CHANGE COLUMN duration duration_Weeks int not null;


describe courses;









    
    




