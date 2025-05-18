
--Display all book records.
SELECT * FROM Book;

--Show each book’s title, genre, and availability.

SELECT Title, Genre,AvailabilityStatus
FROM Book;

-- Display all members' names, email, and membership start date

SELECT FullName,Email,MembershipStartDate
FROM Member;


-- Display each book's title and price with alias "BookPrice
SELECT CONCAT(Title, ' ', Price) AS FullName   
FROM Book;

--List books priced above 250 LE
SELECT * FROM Book 
WHERE Price > 250;

-- List members who joined before 2023

SELECT * FROM Member 
WHERE MembershipStartDate < '2023-01-01';

-- Display names and roles of staff working in 'Zamalek Branch'.

--10. Insert yourself as a member with ID = 405 and register to borrow book ID = 1011
-- First insert yourself as a member


-- Then register the book loan (assuming loan_id is identity)
INSERT INTO Loan ( DueDate, ReturnDate)
VALUES   (GETDATE() ,GETDATE());


INSERT INTO Member ( FullName, Email, PhoneNumber, MembershipStartDate)
VALUES ( 'Your Name', 'your.email@example.com', '1234567890', GETDATE());

--11. Insert a member with NULL email and phone
INSERT INTO Member ( FullName, Email, PhoneNumber, MembershipStartDate)
VALUES ( 'Ishaq', 'GTR@example.com', Null, GETDATE());


--12. Update the return date of your loan to today
UPDATE Loan
SET ReturnDate = GETDATE()
WHERE LoanID = 405 AND ReturnDate IS NULL;

