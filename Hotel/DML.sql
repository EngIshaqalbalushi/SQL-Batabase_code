CREATE DATABASE Hotel;
--------branch--------
CREATE TABLE branch(
 branch_id int PRIMARY KEY IDENTITY(1,1) ,
    name VARCHAR(50),
    location VARCHAR(50) 
);

--------Room----------------

CREATE TABLE Room(
    roomNumber int,
    name VARCHAR(50),
    nithlyrate VARCHAR(50),
    type VARCHAR(50),
    branch_id int,
    PRIMARY KEY (roomNumber, branch_id),
    FOREIGN KEY (branch_id) REFERENCES branch(branch_id)
);

select * from Room;


--------Book-------------
CREATE TABLE Book(
B_ID int PRIMARY KEY IDENTITY(1,1) ,    
    Checkin VARCHAR(50),
	CheckOut VARCHAR(50)
);
----------custmer-----------
CREATE TABLE custmer(
C_ID int PRIMARY KEY IDENTITY(1,1) ,  
 name VARCHAR(50),
 email VARCHAR(50),
 B_ID int  FOREIGN KEY  REFERENCES Book(B_ID),

);

------------------custmerphone--------------
CREATE TABLE custmerphone(
  
 phone VARCHAR(50),
 email VARCHAR(50),
 	 C_ID int  FOREIGN KEY  REFERENCES custmer(C_ID ),
 	 PRIMARY KEY (C_ID,phone)
);
-------------staff-------------
CREATE TABLE staff(
  
 S_ID int PRIMARY KEY IDENTITY(1,1) ,

 name VARCHAR(50),
 jobTitle VARCHAR(50),
 	 
 	
);

CREATE TABLE staffAndCustomer(
  
 C_ID int  FOREIGN KEY  REFERENCES custmer(C_ID ),

 S_ID  int  FOREIGN KEY  REFERENCES staff(S_ID ),

 		 PRIMARY KEY (C_ID,S_ID)

);



INSERT INTO branch (name, location)
VALUES 
('Central Branch', 'New York'),
('West Wing', 'Los Angeles'),
('East Point', 'Chicago');


INSERT INTO Room (roomNumber, name, nithlyrate, type, branch_id)
VALUES 
(101, 'Deluxe Suite', '200', 'Suite', 1),
(102, 'Standard Room', '100', 'Standard', 1),
(201, 'Executive Room', '150', 'Executive', 2),
(301, 'Penthouse', '300', 'Luxury', 3);

INSERT INTO Book (Checkin, CheckOut) 
VALUES 
('2025-05-10', '2025-05-15'),
('2025-06-01', '2025-06-05'),
('2025-07-20', '2025-07-25');

INSERT INTO custmer (name, email, B_ID) 
VALUES 
('John Doe', 'john@example.com', 1),
('Jane Smith', 'jane@example.com', 2),
('Michael Brown', 'michael@example.com', 3);

INSERT INTO custmerphone (phone, email, C_ID) 
VALUES 
('123-456-7890', 'john@example.com', 1),
('555-987-6543', 'jane@example.com', 2),
('321-654-9870', 'michael@example.com', 3);

INSERT INTO staff (name, jobTitle) 
VALUES 
('Alice Johnson', 'Receptionist'),
('Bob Williams', 'Manager'),
('Eve Davis', 'Housekeeping');

INSERT INTO staffAndCustomer (C_ID, S_ID) 
VALUES 
(1, 1), 
(2, 2), 
(3, 3);

 s

DROP TABLE IF EXISTS staffAndCustomer;
DROP TABLE IF EXISTS staff;
DROP TABLE IF EXISTS custmerphone;
DROP TABLE IF EXISTS custmer;
DROP TABLE IF EXISTS Book;
DROP TABLE IF EXISTS Room;
DROP TABLE IF EXISTS branch;

