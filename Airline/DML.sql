CREATE DATABASE Airline;


--------Airport----------
CREATE TABLE Airport (
    airport_code VARCHAR(10) PRIMARY KEY,
    name VARCHAR(50),
    city VARCHAR(50),
    state VARCHAR(50)
);

--------------FlightLeg-------------
CREATE TABLE FlightLeg (
    leg_no INT PRIMARY KEY,
    scheduled_dep_time TIME,
    scheduled_arr_time TIME,
    arrival_time TIME,
    departure_time TIME
);
-------------------LegInstance------------
CREATE TABLE LegInstance (
    given_date DATE,
    number_of_available_seats INT,
    leg_no INT,
    PRIMARY KEY (leg_no, given_date),
    FOREIGN KEY (leg_no) REFERENCES FlightLeg(leg_no)
);

-------------Flight----------
CREATE TABLE Flight (
    flight_id INT PRIMARY KEY,
    weekdays VARCHAR(50),
    restrictions VARCHAR(100)
);

-- Airplane-----------
CREATE TABLE AirplaneType (
    typename VARCHAR(50) PRIMARY KEY,
    max_seats INT,
    company VARCHAR(50),
    airline VARCHAR(50)
);

------------Airplane----------------------
CREATE TABLE Airplane (
    airplane_id INT PRIMARY KEY,
    typename VARCHAR(50),
    FOREIGN KEY (typename) REFERENCES AirplaneType(typename)
);

-- Fare------------------------
CREATE TABLE Fare (
    code VARCHAR(10) PRIMARY KEY,
    amount DECIMAL(10, 2)
);

-- ------ SeatReservation-----------------
CREATE TABLE SeatReservation (
    reservation_id INT PRIMARY KEY,
    given_date DATE,
    seat_number VARCHAR(5)
);

--------Customer-------
CREATE TABLE Customer (
    customer_id INT PRIMARY KEY,
    name VARCHAR(50),
    phone VARCHAR(15)
);

------------------AllowLanding------------------
CREATE TABLE AllowLanding (
    airport_code VARCHAR(10),
    typename VARCHAR(50),
    PRIMARY KEY (airport_code, typename),
  
);


--------HasFlightLeg----------------
CREATE TABLE HasFlightLeg (
    flight_id INT,
    leg_no INT,
    PRIMARY KEY (flight_id, leg_no),
    FOREIGN KEY (flight_id) REFERENCES Flight(flight_id),
    FOREIGN KEY (leg_no) REFERENCES FlightLeg(leg_no)
);

----------------------Share----------
CREATE TABLE Share (
    typename VARCHAR(50),
    airplane_id INT,
    PRIMARY KEY (typename, airplane_id),
    FOREIGN KEY (typename) REFERENCES AirplaneType(typename),
    FOREIGN KEY (airplane_id) REFERENCES Airplane(airplane_id)
);

-------MadeReservation------------------
CREATE TABLE MadeReservation (
    customer_id INT,
    reservation_id INT,
    PRIMARY KEY (customer_id, reservation_id),
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id),
    FOREIGN KEY (reservation_id) REFERENCES SeatReservation(reservation_id)
);

----------------------------AirplaneReservation------------
CREATE TABLE AirplaneReservation (
    airplane_id INT,
    reservation_id INT,
    PRIMARY KEY (airplane_id, reservation_id),
    FOREIGN KEY (airplane_id) REFERENCES Airplane(airplane_id),
    FOREIGN KEY (reservation_id) REFERENCES SeatReservation(reservation_id)
);

---add new columes
ALTER TABLE Airport ADD address VARCHAR(100);
ALTER TABLE Flight_Leg ADD duration TIME;

---delete table for 
DROP TABLE IF EXISTS Airplane_Reservation;
DROP TABLE IF EXISTS Made_Reservation;



ALTER TABLE Seat_Reservation DROP COLUMN given_dat


-- Insert airport details
-- Use the Airport database


-- Insert airport details
INSERT INTO Airport (airport_code, name, city, state) VALUES 
('JFK', 'John F. Kennedy International', 'New York', 'New York'),
('LAX', 'Los Angeles International', 'Los Angeles', 'California');

-- Insert flight leg details
INSERT INTO FlightLeg (leg_no, scheduled_dep_time, scheduled_arr_time, arrival_time, departure_time) VALUES 
(1, '08:00:00', '12:00:00', '12:15:00', '08:10:00'),
(2, '14:00:00', '18:00:00', '18:20:00', '14:05:00'),
(3, '09:30:00', '13:30:00', '13:40:00', '09:40:00');

-- Insert leg instances
INSERT INTO LegInstance (given_date, number_of_available_seats, leg_no) VALUES 
('2025-05-15', 30, 1),
('2025-05-16', 25, 2),
('2025-05-17', 40, 3);

-- Insert flight details
INSERT INTO Flight (flight_id, weekdays, restrictions) VALUES 
(1001, 'Monday, Wednesday, Friday', 'No pets allowed'),
(1002, 'Tuesday, Thursday, Saturday', 'Masks required'),
(1003, 'Sunday', 'No special restrictions');


-- Insert airplane types
INSERT INTO AirplaneType (typename, max_seats, company, airline) VALUES 
('Boeing 737', 150, 'Boeing', 'American Airlines'),
('Airbus A320', 180, 'Airbus', 'Delta Airlines'),
('Embraer E190', 100, 'Embraer', 'JetBlue');


-- Insert airplanes
INSERT INTO Airplane (airplane_id, typename) VALUES 
(5001, 'Boeing 737'),
(5002, 'Airbus A320'),
(5003, 'Embraer E190');


-- Insert fare details
INSERT INTO Fare (code, amount) VALUES 
('ECO', 250.00),
('BUS', 500.00),
('FST', 1000.00);

-- Insert seat reservations
INSERT INTO SeatReservation (reservation_id, given_date, seat_number) VALUES 
(3001, '2025-05-15', '12A'),
(3002, '2025-05-16', '5B'),
(3003, '2025-05-17', '7C');

-- Insert customer details
INSERT INTO Customer (customer_id, name, phone) VALUES 
(101, 'John Doe', '555-123-4567'),
(102, 'Alice Smith', '555-234-5678'),
(103, 'Bob Johnson', '555-345-6789');

-- Insert allowed landing details
INSERT INTO AllowLanding (airport_code, typename) VALUES 
('JFK', 'Boeing 737'),
('LAX', 'Airbus A320'),
('ORD', 'Embraer E190');

-- Insert flight leg associations
INSERT INTO HasFlightLeg (flight_id, leg_no) VALUES 
(1001, 1),
(1002, 2),
(1003, 3);

-- Insert airplane sharing details
INSERT INTO Share (typename, airplane_id) VALUES 
('Boeing 737', 5001),
('Airbus A320', 5002),
('Embraer E190', 5003);

-- Insert reservation details
INSERT INTO MadeReservation (customer_id, reservation_id) VALUES 
(101, 3001),
(102, 3002),
(103, 3003);


SELECT * FROM AllowLanding ;

SELECT * FROM Airport WHERE airport_code = 'JFK1';



SELECT * FROM AirplaneType;

INSERT INTO AllowLanding (airport_code, typename) VALUES ('JFK', 'Airbus A320');

SELECT * FROM AirplaneType WHERE typename = 'Boeing 747';

INSERT INTO AirplaneType (typename, max_seats, company, airline) 
VALUES ('Boeing 747', 416, 'Boeing', 'United Airlines');

SELECT * FROM AirplaneType;

