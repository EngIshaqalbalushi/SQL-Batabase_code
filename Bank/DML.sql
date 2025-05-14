CREATE DATABASE Bank;


-- Create the branch table
CREATE TABLE branch (
    branch_id VARCHAR(20) PRIMARY KEY,
    address VARCHAR(100) NOT NULL
);

-- Create the branchPhoneNumber table
CREATE TABLE branchPhoneNumber (
    branch_id VARCHAR(20) NOT NULL,
    phone_number VARCHAR(20) NOT NULL,
    PRIMARY KEY (branch_id, phone_number),
    FOREIGN KEY (branch_id) REFERENCES branch(branch_id)
);

-- Create the Customers table
CREATE TABLE Customers (
    customer_id VARCHAR(20) PRIMARY KEY,
    address VARCHAR(100) NOT NULL,
    date_of_birth DATE NOT NULL
);

-- Create the Employers table
CREATE TABLE Employers (
    employee_id VARCHAR(20) PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    position VARCHAR(50) NOT NULL,
    branch_id VARCHAR(20) NOT NULL,
    FOREIGN KEY (branch_id) REFERENCES branch(branch_id)
);

-- Create the assist table (junction table between Customers and Employers)
CREATE TABLE assist (
    customer_id VARCHAR(20) NOT NULL,
    action_id VARCHAR(20) NOT NULL,
    employee_id VARCHAR(20) NOT NULL,
    PRIMARY KEY (customer_id, action_id, employee_id),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (employee_id) REFERENCES Employers(employee_id)
);

-- Create the loans table
CREATE TABLE loans (
    l_id VARCHAR(20) PRIMARY KEY,
    customer_id VARCHAR(20) NOT NULL,
    type VARCHAR(50) NOT NULL,
    amount DECIMAL(15, 2) NOT NULL,
    issue_date DATE NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

-- Create the account table
CREATE TABLE account (
    account_number VARCHAR(20) PRIMARY KEY,
    balance DECIMAL(15, 2) NOT NULL,
    type VARCHAR(50) NOT NULL,
    date_of_creation DATE NOT NULL
);

-- Create the transactions table
CREATE TABLE transactions (
    transaction_id VARCHAR(20) PRIMARY KEY,
    withdrawals DECIMAL(15, 2),
    deposits DECIMAL(15, 2),
    transfers DECIMAL(15, 2),
    date DATE NOT NULL,
    amount DECIMAL(15, 2) NOT NULL,
    type VARCHAR(50) NOT NULL,
    account_number VARCHAR(20) NOT NULL,
    FOREIGN KEY (account_number) REFERENCES account(account_number)
);




INSERT INTO branch (branch_id, address) VALUES 
('B001', '123 Elm Street, New York'),
('B002', '456 Maple Avenue, Boston'),
('B003', '789 Oak Lane, Chicago');

INSERT INTO branchPhoneNumber (branch_id, phone_number) VALUES 
('B001', '212-555-0101'),
('B001', '212-555-0102'),
('B002', '617-555-0201'),
('B003', '312-555-0301');

-- Insert customers
INSERT INTO Customers (customer_id, address, date_of_birth) VALUES 
('C001', '22 Baker Street, New York', '1990-05-15'),
('C002', '77 Broadway, Boston', '1985-08-20'),
('C003', '101 Michigan Ave, Chicago', '1978-11-02');

-- Insert employees
INSERT INTO Employers (employee_id, name, position, branch_id) VALUES 
('E001', 'John Smith', 'Branch Manager', 'B001'),
('E002', 'Alice Johnson', 'Loan Officer', 'B001'),
('E003', 'Mark Davis', 'Cashier', 'B002'),
('E004', 'Linda Green', 'Teller', 'B003');

-- Insert assist data (linking employees and customers)
INSERT INTO assist (customer_id, action_id, employee_id) VALUES 
('C001', 'A001', 'E001'),
('C002', 'A002', 'E002'),
('C003', 'A003', 'E004');

-- Insert loan data
INSERT INTO loans (l_id, customer_id, type, amount, issue_date) VALUES 
('L001', 'C001', 'Home Loan', 200000.00, '2022-01-15'),
('L002', 'C002', 'Car Loan', 15000.00, '2023-03-12'),
('L003', 'C003', 'Personal Loan', 5000.00, '2024-07-25');


-- Insert account data
INSERT INTO account (account_number, balance, type, date_of_creation) VALUES 
('A001', 10000.50, 'Savings', '2021-06-01'),
('A002', 2500.75, 'Checking', '2022-10-10'),
('A003', 8000.00, 'Business', '2023-05-20');


-- Insert transactions data
INSERT INTO transactions (transaction_id, withdrawals, deposits, transfers, date, amount, type, account_number) VALUES 
('T001', 500.00, NULL, NULL, '2024-02-15', 500.00, 'Withdrawal', 'A001'),
('T002', NULL, 1000.00, NULL, '2024-03-01', 1000.00, 'Deposit', 'A002'),
('T003', NULL, NULL, 300.00, '2024-04-10', 300.00, 'Transfer', 'A003');


SELECT * FROM assist;

   