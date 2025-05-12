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
    FOREIGN KEY (airport_code) REFERENCES Airport(airport_code),
    FOREIGN KEY (typename) REFERENCES AirplaneType(typename)
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