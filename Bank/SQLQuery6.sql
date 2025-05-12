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