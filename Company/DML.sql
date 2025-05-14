CREATE DATABASE Company;

USE Company;

---------------------Employee-------------------------------
CREATE TABLE EMPLOYEE
(
    Ssn INT PRIMARY KEY IDENTITY(1,1),
    Fname VARCHAR(100) NOT NULL,
    Lname VARCHAR(100),
    Bdate DATE,
    Address VARCHAR(50),
    Sex CHAR(6) CHECK (Sex IN ('Male', 'Female', 'Other')),
    Salary DECIMAL(10, 2),
    Super_ssn INT,
    FOREIGN KEY (Super_ssn) REFERENCES EMPLOYEE(Ssn)
);

------------------ Department -----------------------------------
CREATE TABLE DEPARTMENT
(
    Dnumber INT PRIMARY KEY IDENTITY(1,1),
    Dname VARCHAR(100) NOT NULL,
    Lname VARCHAR(100),
    Mgr_start_date DATE,
    Mgr_ssn INT,
    FOREIGN KEY (Mgr_ssn) REFERENCES EMPLOYEE(Ssn)
);

------------------ Department Locations -------------------------
CREATE TABLE DEPT_LOCATIONS
(
    Dlocation VARCHAR(50),  -- Adjusted length
    Dnumber INT,
    PRIMARY KEY (Dnumber, Dlocation),
    FOREIGN KEY (Dnumber) REFERENCES DEPARTMENT(Dnumber)
);

--------------------------- Project -----------------------------
CREATE TABLE PROJECT
(
    Pname VARCHAR(100) NOT NULL,
    Pnumber INT PRIMARY KEY IDENTITY(1,1),
    Plocation VARCHAR(100),  -- Adjusted length
    Dnum INT,
    FOREIGN KEY (Dnum) REFERENCES DEPARTMENT(Dnumber)
);

-------------------------- Works On -----------------------------
CREATE TABLE WORKS_NO
(
    Essn INT,
    Hours DECIMAL(4,2),  -- Hours as decimal for better precision
    Pno INT,
    PRIMARY KEY (Essn, Pno),
    FOREIGN KEY (Essn) REFERENCES EMPLOYEE(Ssn),
    FOREIGN KEY (Pno) REFERENCES PROJECT(Pnumber)
);



-- Insert employee details
INSERT INTO EMPLOYEE (Fname, LName, Bdate, Addres, Sex, Salary, Super_ssn) VALUES 
('John', 'Doe', '1985-05-10', '123 Maple St', 'Male', '60000', NULL),
('Alice', 'Smith', '1990-08-15', '456 Oak Ave', 'Female', '70000', 1),
('Robert', 'Brown', '1982-11-20', '789 Pine Rd', 'Male', '75000', 1),
('Jessica', 'Davis', '1995-03-25', '321 Birch Ln', 'Female', '65000', 2);

-- Insert department details
INSERT INTO DEPARTENT (Dname, LName, Mgr_start_date, Mgr_ssn) VALUES 
('HR', 'Smith', '2020-01-15', 1),
('IT', 'Brown', '2018-06-20', 2),
('Finance', 'Davis', '2019-11-10', 3);

-- Insert department locations
INSERT INTO DEPT_LOCATIONS (Dlocation, Dnumber) VALUES 
('New York', 1),
('San Francisco', 2),
('Chicago', 3);

-- Insert project details
INSERT INTO PROJECT (Pname, Plocation, Dnum) VALUES 
('Project Alpha', 'New York', 1),
('Project Beta', 'San Francisco', 2),
('Project Gamma', 'Chicago', 3);

-- Insert work assignments
INSERT INTO WORKS_NO (Essn, Hours, Pno) VALUES 
(1, '08:00:00', 1),
(2, '07:30:00', 2),
(3, '08:30:00', 3),
(4, '06:45:00', 1);

-- Insert dependent details
INSERT INTO DEPENDENTDB (Essn, Dependent_name, Sex, Bdate, Relationship) VALUES 
(1, 'Mary', 'Female', '2010-04-10', 'Daughter'),
(2, 'Tom', 'Male', '2012-06-15', 'Son'),
(3, 'Lucy', 'Female', '2008-11-25', 'Daughter'),
(4, 'Jake', 'Male', '2016-02-05', 'Son');


INSERT INTO DEPT_LOCATIONS (Dlocation, Dnumber) VALUES 
('San Francisco', 2),
('Chicago', 3);

-- Insert department locations without duplicates
INSERT INTO DEPT_LOCATIONS (Dlocation, Dnumber) VALUES 
('New York', 1),        -- Only include this if not already present
('San Francisco', 2),
('Chicago', 3);

SELECT * FROM DEPENDENTDB;

