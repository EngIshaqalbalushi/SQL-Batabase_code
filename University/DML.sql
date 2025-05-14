CREATE DATABASE University;

USE University;
-----------FACULTY----------------
CREATE TABLE FACULTY (
    F_id INT PRIMARY KEY,
    Name VARCHAR(50),
    mobile_No VARCHAR(15),
    Department VARCHAR(50),
    Salary DECIMAL(10, 2)
);
--------------------STUDENT--------------------
CREATE TABLE STUDENT (
    S_id INT PRIMARY KEY,
    Name VARCHAR(50),
    F_name VARCHAR(50),
    L_name VARCHAR(50),
    Age INT,
    DoB DATE,
    Phone_no VARCHAR(15)
);
--------------------SUBJECT------------------
CREATE TABLE SUBJECT (
    Subject_id INT PRIMARY KEY,
    Subject_name VARCHAR(50)
);
--------------------COURSE-------------
CREATE TABLE COURSE (
    Course_id INT PRIMARY KEY,
    Course_name VARCHAR(50),
    Duration INT
);
-----------------------DEPARTMENT------------------------
CREATE TABLE DEPARTMENT (
    Department_id INT PRIMARY KEY,
    D_name VARCHAR(50)
);
----------------------------EXAMS-----------------------------
CREATE TABLE EXAMS (
    Exam_code INT PRIMARY KEY,
    Date DATE,
    Time TIME,
    Room VARCHAR(50)
);
----------HOSTEL-----------------------
CREATE TABLE HOSTEL (
    Hostel_id INT PRIMARY KEY,
    Hostel_name VARCHAR(50),
    Address VARCHAR(100),
    Pin_code_OF_seats INT,
    State VARCHAR(50),
    City VARCHAR(50)
);

-- Relationship Tables

-------------------------Teaches-----------------
CREATE TABLE Teaches (
    F_id INT,
    S_id INT,
    FOREIGN KEY (F_id) REFERENCES FACULTY(F_id),
    FOREIGN KEY (S_id) REFERENCES STUDENT(S_id),
    PRIMARY KEY (F_id, S_id)
);
--------------------Taught------------------
CREATE TABLE Taught (
    S_id INT,
    Subject_id INT,
    FOREIGN KEY (S_id) REFERENCES STUDENT(S_id),
    FOREIGN KEY (Subject_id) REFERENCES SUBJECT(Subject_id),
    PRIMARY KEY (S_id, Subject_id)
);
-----------------------Enroll---------------
CREATE TABLE Enroll (
    S_id INT,
    Course_id INT,
    FOREIGN KEY (S_id) REFERENCES STUDENT(S_id),
    FOREIGN KEY (Course_id) REFERENCES COURSE(Course_id),
    PRIMARY KEY (S_id, Course_id)
);
------------------------------Belong-----
CREATE TABLE Belong (
    S_id INT,
    Department_id INT,
    FOREIGN KEY (S_id) REFERENCES STUDENT(S_id),
    FOREIGN KEY (Department_id) REFERENCES DEPARTMENT(Department_id)
);
---------------Handled-----------
CREATE TABLE Handled (
    Course_id INT,
    Department_id INT,
    FOREIGN KEY (Course_id) REFERENCES COURSE(Course_id),
    FOREIGN KEY (Department_id) REFERENCES DEPARTMENT(Department_id)
);
--------------Take--------
CREATE TABLE Take (
    S_id INT,
    Exam_code INT,
    FOREIGN KEY (S_id) REFERENCES STUDENT(S_id),
    FOREIGN KEY (Exam_code) REFERENCES EXAMS(Exam_code),
    PRIMARY KEY (S_id, Exam_code)
);
----Conducted--------------------------
CREATE TABLE Conducted (
    Exam_code INT,
    Hostel_id INT,
    FOREIGN KEY (Exam_code) REFERENCES EXAMS(Exam_code),
    FOREIGN KEY (Hostel_id) REFERENCES HOSTEL(Hostel_id)
);
------------------Live------------------
CREATE TABLE Live (
    S_id INT,
    Hostel_id INT,
    FOREIGN KEY (S_id) REFERENCES STUDENT(S_id),
    FOREIGN KEY (Hostel_id) REFERENCES HOSTEL(Hostel_id)
);



-- Insert faculty members
INSERT INTO FACULTY (F_id, Name, mobile_No, Department, Salary) VALUES 
(101, 'Dr. John Smith', '123-456-7890', 'Computer Science', 80000.50),
(102, 'Prof. Alice Brown', '234-567-8901', 'Mathematics', 75000.25),
(103, 'Dr. Michael Lee', '345-678-9012', 'Physics', 85000.00);

-- Insert students
INSERT INTO STUDENT (S_id, Name, F_name, L_name, Age, DoB, Phone_no) VALUES 
(201, 'David', 'Robert', 'Johnson', 20, '2005-06-15', '456-789-0123'),
(202, 'Emma', 'Grace', 'Williams', 22, '2003-08-22', '567-890-1234'),
(203, 'Sophia', 'Anne', 'Brown', 21, '2004-05-10', '678-901-2345');

-- Insert subjects
INSERT INTO SUBJECT (Subject_id, Subject_name) VALUES 
(301, 'Database Systems'),
(302, 'Calculus'),
(303, 'Quantum Physics');

-- Insert courses
INSERT INTO COURSE (Course_id, Course_name, Duration) VALUES 
(401, 'B.Sc. Computer Science', 3),
(402, 'B.Sc. Mathematics', 3),
(403, 'B.Sc. Physics', 3);

-- Insert departments
INSERT INTO DEPARTMENT (Department_id, D_name) VALUES 
(501, 'Computer Science'),
(502, 'Mathematics'),
(503, 'Physics');

-- Insert exam details
INSERT INTO EXAMS (Exam_code, Date, Time, Room) VALUES 
(601, '2025-05-20', '09:00:00', 'Room A1'),
(602, '2025-06-15', '11:00:00', 'Room B2'),
(603, '2025-07-10', '14:00:00', 'Room C3');

-- Insert hostel details
INSERT INTO HOSTEL (Hostel_id, Hostel_name, Address, Pin_code_OF_seats, State, City) VALUES 
(701, 'Maple Residency', '12 Elm Street', 50, 'California', 'Los Angeles'),
(702, 'Pine Lodge', '34 Oak Avenue', 75, 'New York', 'New York City'),
(703, 'Cedar Hall', '56 Birch Lane', 60, 'Texas', 'Houston');


