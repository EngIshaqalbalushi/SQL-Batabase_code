CREATE DATABASE Company;

USE Company;

---------------------Employee-------------------------------
CREATE TABLE EMPLOYEE
(
 Ssn int PRIMARY KEY IDENTITY(1,1) ,
 Fname VARCHAR(100) NOT NULL,
 LName VARCHAR(100),
  Bdate DATE,
  Addres VARCHAR(50),
  Sex VARCHAR(50) CHECK (Sex IN ('Male', 'Female', 'Other')),
  Salary VARCHAR(50),
  Super_ssn int
   FOREIGN KEY ( Super_ssn) REFERENCES EMPLOYEE(Ssn)

);

------------------Departent-----------------------------------
CREATE TABLE DEPARTENT
(
 Dnumber int PRIMARY KEY IDENTITY(1,1) ,
 Dname VARCHAR(100) NOT NULL,
 LName VARCHAR(100),
  Mgr_start_date DATE,
  Mgr_ssn INT,

   FOREIGN KEY ( Mgr_ssn) REFERENCES EMPLOYEE(Ssn)

);

CREATE TABLE DEPT_LOCATIONS
(
Dlocation VARCHAR(12),
Dnumber int  FOREIGN KEY  REFERENCES DEPARTENT(Dnumber),
PRIMARY KEY (Dnumber,Dlocation)

);
---------------------------Project--------------------
CREATE TABLE PROJECT
(
 Pname VARCHAR(100) NOT NULL,
 Pnumber int PRIMARY KEY IDENTITY(1,1) ,

Plocation VARCHAR(1100),

Dnum int  FOREIGN KEY  REFERENCES DEPARTENT(Dnumber),

);


CREATE TABLE WORKS_NO
(
 Essn int FOREIGN KEY  REFERENCES EMPLOYEE(Ssn)  ,

  Hours TIME,

Pno int  FOREIGN KEY  REFERENCES PROJECT(Pnumber),

PRIMARY KEY (Essn,Pno)


);

------------------------------------- Dependent-----------------

CREATE TABLE DEPENDENTDB
(
 Essn int FOREIGN KEY  REFERENCES EMPLOYEE(Ssn)  ,
 Dependent_name VARCHAR(50),
 Sex VARCHAR(50) CHECK (Sex IN ('Male', 'Female', 'Other')),
Bdate DATE,
Relationship VARCHAR(50),
PRIMARY KEY (Essn,Dependent_name)

);
