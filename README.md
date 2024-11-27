Below is a detailed `README.md` file for your GitHub repository based on the provided scope and SQL snippets:

```markdown
# EdTech Platform Database Management

## Project Overview

This project involves creating a relational database for an EdTech platform to manage courses, students, and enrollments effectively. The database ensures efficient tracking of available courses, registered students, and the progress of enrolled students. It includes the following key functionalities:

- Managing courses with details such as names, durations, and associated instructors.
- Maintaining a student directory with essential information.
- Tracking course enrollments with progress metrics.

---

## Features

### Core Entities
1. **Courses**: Stores information about available courses, including course names, durations, and associated instructors.
2. **Students**: Maintains student information such as names, emails, and registration dates.
3. **Enrollments**: Tracks student enrollment details, including progress percentage for each course.

### SQL Operations
- **DDL (Data Definition Language)**:
  - Add a `Category` column to classify courses.
  - Remove unnecessary columns like `Description` from the `Courses` table.
- **DML (Data Manipulation Language)**:
  - Update a student’s course progress upon completion.
  - Retrieve all courses a specific student is enrolled in.
  - Remove a student and their associated data from the database.

---

## Database Structure

### Schema Details

#### 1. **Students Table**
```sql
CREATE TABLE Students (
    StudentID INT AUTO_INCREMENT PRIMARY KEY,
    FullName VARCHAR(255) NOT NULL,
    Email VARCHAR(255) NOT NULL UNIQUE,
    RegistrationDate DATE NOT NULL
);
```

#### 2. **Instructors Table**
```sql
CREATE TABLE Instructors (
    InstructorID INT NOT NULL PRIMARY KEY,
    InstructorFullName VARCHAR(255) NOT NULL,
    InstructorEmail VARCHAR(255) NOT NULL UNIQUE,
    InstructorPhoneNum VARCHAR(15) NOT NULL
);
```

#### 3. **Courses Table**
```sql
CREATE TABLE Courses (
    CourseID INT NOT NULL PRIMARY KEY,
    CourseName VARCHAR(255) NOT NULL,
    InstructorID INT NOT NULL,
    Duration INT NOT NULL,
    Amount DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (InstructorID) REFERENCES Instructors(InstructorID)
);
```

#### 4. **Enrollments Table**
```sql
CREATE TABLE Enrollments (
    EnrollmentID INT NOT NULL PRIMARY KEY,
    CourseID INT NOT NULL,
    StudentID INT NOT NULL,
    EnrollmentDate DATE NOT NULL,
    Progress DECIMAL(5, 2) NOT NULL,
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID)
);
```

---

## Sample Data

### Students
```sql
INSERT INTO Students (FullName, Email, RegistrationDate)
VALUES
('Alice Walker', 'alice.walker@example.com', '2024-01-01'),
('Bob Johnson', 'bob.johnson@example.com', '2024-02-15'),
... -- and more rows
;
```

### Courses
```sql
INSERT INTO Courses (CourseID, CourseName, InstructorID, Duration, Amount)
VALUES
(2001, 'Python Programming', 101, 8, 500.00),
(2002, 'Data Science Fundamentals', 102, 10, 750.00),
... -- and more rows
;
```

### Enrollments
```sql
INSERT INTO Enrollments (EnrollmentID, CourseID, StudentID, EnrollmentDate, Progress)
VALUES
(3001, 2001, 1, '2024-01-15', 75.00),
(3002, 2002, 2, '2024-01-20', 60.80),
... -- and more rows
;
```

---

## Operations Performed

### DDL Commands
1. Add `Category` column to `Courses`:
    ```sql
    ALTER TABLE Courses ADD Category VARCHAR(255);
    ```
2. Drop the `Description` column:
    ```sql
    ALTER TABLE Courses DROP COLUMN CourseDescription;
    ```

### DML Commands
1. Update progress for a completed course:
    ```sql
    UPDATE Enrollments
    SET Progress = 100
    WHERE StudentID = (SELECT StudentID FROM Students WHERE FullName = 'Diana Prince');
    ```
2. Retrieve all courses for a specific student:
    ```sql
    SELECT Courses.CourseID, Courses.CourseName, Courses.Duration, Courses.Amount
    FROM Courses
    INNER JOIN Enrollments ON Courses.CourseID = Enrollments.CourseID
    INNER JOIN Students ON Enrollments.StudentID = Students.StudentID
    WHERE Students.FullName = 'Diana Prince';
    ```
3. Delete a student:
    ```sql
    DELETE FROM Students WHERE FullName = 'Diana Prince';
    ```

---

## How to Run the Project

1. **Set Up the Database**:
   - Use a MySQL or compatible database engine.
   - Run the SQL script provided in the `scripts/` directory.

2. **Insert Sample Data**:
   - Populate the tables using the provided `INSERT` statements.

3. **Execute Queries**:
   - Test the DDL and DML operations using your database client.

4. **View Results**:
   - Use `SELECT` queries to verify data manipulations and retrieve results.

---

## Project Outcomes

- A fully functional relational database to support EdTech operations.
- Insights into the progress and enrollments of students.
- Clean and scalable database structure for future enhancements.

---

## limitations
- Modify the primary key columns of each table created to include the UNSIGNED constraint, ensuring that negative numbers cannot be entered.

