--1) Restore (the provided Company DB) then create the following Queries:

--Display all the employees Data.

SELECT * FROM Employee;

--Display the employee First name, last name, Salary and Department number.

SELECT Fname, Lname, Salary, Dno 
FROM Employee;
--Display all the projects names, locations and the department which is responsible about it.
SELECT Pname, Plocation, Dnum 
FROM Project;
-- f you know that the company policy is to pay an annual commission for each employee with specific percent 
--equals 10% of his/her annual salary .Display each employee full name and his annual commission in an 
--ANNUAL COMM column (alias)

SELECT CONCAT(Fname, ' ', Lname) AS FullName, 
       (Salary * 12 * 0.10) AS "ANNUAL COMM" 
FROM Employee;

--Display the employees Id, name who earns more than 1000 LE monthly.
SELECT SSN, CONCAT(Fname, ' ', Lname) AS Name 
FROM Employee 
WHERE Salary > 1000;

--Display the employees Id, name who earns more than 10000 LE annually
SELECT SSN, CONCAT(Fname, ' ', Lname) AS Name 
FROM Employee 
WHERE (Salary * 12) > 10000;

--Display the names and salaries of the female employees
SELECT CONCAT(Fname, ' ', Lname) AS Name, Salary 
FROM Employee 
WHERE Sex = 'F';

--Display each department id, name which managed by a manager with id equals 968574

SELECT Dnum, Dname 
FROM Departments 
WHERE MGRSSN = 968574;

-- Display the ids, names and locations of the projects controlled by department 10
SELECT Pnumber, Pname, Plocation 
FROM Project 
WHERE Dnum = 10;

-- Insert your personal data to the employee table
INSERT INTO Employee (Fname, Lname, SSN,  Salary, Superssn, Dno)
VALUES ('YourFirstName', 'YourLastName', 102672,   3000, 112233, 30);

--11. Insert another employee (your friend) with partial data
INSERT INTO Employee (Fname, Lname, SSN,  Dno)
VALUES ('FriendFirstName', 'FriendLastName', 102660,  30);

--Upgrade your salary by 20%
UPDATE Employee 
SET Salary = Salary * 1.20 
WHERE SSN = 102672;

-- 
