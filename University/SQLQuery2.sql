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
