CREATE DATABASE Hotel;
--------branch--------
CREATE TABLE branch(
 branch_id int PRIMARY KEY IDENTITY(1,1) ,
    name VARCHAR(50),
    location VARCHAR(50) 
);

--------Room----------------
CREATE TABLE Room(
 roomNumber int  ,
    name VARCHAR(50),
    nithlyrate VARCHAR(50),
	type VARCHAR(50),
	 branch_id int  FOREIGN KEY  REFERENCES branch(branch_id),

	 PRIMARY KEY (roomNumber,branch_id)

);
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


