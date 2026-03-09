create database practice;
Use practice;

-- ===========================
-- EMPLOYEES & TRAINING
-- ===========================

CREATE TABLE Employees (
    EmpID INT PRIMARY KEY,
    EmpName VARCHAR(50),
    Department VARCHAR(50),
    JoinDate DATE,
    Salary INT
);

INSERT INTO Employees VALUES
(1, 'Asha', 'HR', '2020-01-10', 60000),
(2, 'Ravi', 'HR', '2021-03-15', 55000),
(3, 'Meera', 'IT', '2019-07-01', 90000),
(4, 'Kiran', 'IT', '2022-02-20', 75000),
(5, 'Divya', 'Finance', '2020-11-11', 80000);

CREATE TABLE TrainingSessions (
    SessionID INT,
    EmpID INT,
    TrainingName VARCHAR(50)
);

INSERT INTO TrainingSessions VALUES
(101, 1, 'Leadership'),
(102, 3, 'Cloud Basics'),
(103, 3, 'Security'),
(104, 5, 'Financial Modeling');


-- ===========================
-- TRANSACTIONS
-- ===========================

CREATE TABLE Transactions (
    TransID INT PRIMARY KEY,
    CustomerID INT,
    Amount INT
);

INSERT INTO Transactions VALUES
(1, 101, 500),
(2, 101, 700),
(3, 102, 200),
(4, 103, 900),
(5, 103, 300),
(6, 104, 100);


-- ===========================
-- ORDERS & PRODUCTS
-- ===========================

CREATE TABLE Orders (
    OrderID INT,
    CustomerID INT,
    ProductID INT
);

INSERT INTO Orders VALUES
(1, 101, 10),
(2, 101, 10),
(3, 101, 11),
(4, 102, 12),
(5, 102, 12),
(6, 103, 13);

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(50)
);

INSERT INTO Products VALUES
(10, 'Laptop'),
(11, 'Mouse'),
(12, 'Keyboard'),
(13, 'Monitor'),
(14, 'Printer'); -- never ordered


-- ===========================
-- SALES
-- ===========================

CREATE TABLE Sales (
    SaleID INT,
    CustomerID INT,
    SaleAmount INT,
    SaleDate DATE
);

INSERT INTO Sales VALUES
(1, 101, 500, '2023-01-01'),
(2, 101, 700, '2023-02-01'),
(3, 102, 200, '2023-01-15'),
(4, 102, 300, '2023-03-01'),
(5, 103, 900, '2023-01-20');


-- ===========================
-- USERS & VERIFIED EMAILS
-- ===========================

CREATE TABLE Users (
    UserID INT,
    UserName VARCHAR(50),
    Email VARCHAR(100),
    Phone VARCHAR(20)
);

INSERT INTO Users VALUES
(1, 'Asha', 'asha@gmail.com', '99999'),
(2, 'Ravi', 'ravi@gmail.com', '88888'),
(3, 'Meera', 'meera@gmail.com', '99999'), -- duplicate phone
(4, 'Kiran', 'kiran@gmail.com', '77777'),
(5, 'Divya', 'divya@gmail.com', '66666');

CREATE TABLE VerifiedEmails (
    Email VARCHAR(100)
);

INSERT INTO VerifiedEmails VALUES
('asha@gmail.com'),
('meera@gmail.com'),
('divya@gmail.com');


-- ===========================
-- MONTHLY REVENUE
-- ===========================

CREATE TABLE MonthlyRevenue (
    MonthName VARCHAR(20),
    Revenue INT
);

INSERT INTO MonthlyRevenue VALUES
('Jan', 10000),
('Feb', 12000),
('Mar', 9000),
('Apr', 15000),
('May', 17000);