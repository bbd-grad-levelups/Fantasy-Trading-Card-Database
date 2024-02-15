-- USE master;
-- GO

-- IF EXISTS (SELECT * FROM sys.databases WHERE name = 'FantasyTCStore')
-- BEGIN
--     ALTER DATABASE FantasyTCStore SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
--     DROP DATABASE FantasyTCStore;
-- END
-- GO

-- CREATE DATABASE FantasyTCStore
-- GO


USE FantasyTCStore
GO

CREATE TABLE CardRarity (
    CardRarityID INT IDENTITY(1,1) NOT NULL,
    CardRarityName VARCHAR(50) NULL
);

CREATE TABLE CardCategory (
    CardCategoryID INT IDENTITY(1,1) NOT NULL,
    CardCategoryName VARCHAR(50) NULL
);

CREATE TABLE CardGrading (
    CardGradingID INT IDENTITY(1,1) NOT NULL,
    CardGradingName VARCHAR(50) NULL
);

CREATE TABLE Cards (
    CardID INT IDENTITY(1,1) NOT NULL,
    CardName VARCHAR(100) NULL,
    CardCategoryID INT NOT NULL,
    CardRarityID INT NOT NULL
);

CREATE TABLE Stock(
    StockID INT IDENTITY(1,1) NOT NULL,
    CardID INT NOT NULL,
    CardGradingID INT NOT NULL,
    QuantityInStock INT NOT NULL
);

CREATE TABLE Customers (
    CustomerID INT IDENTITY(1,1) NOT NULL,
    CustomerName VARCHAR(1000) NULL,
    Surname VARCHAR(1000) NULL,
    Email VARCHAR(500) NULL
);

CREATE TABLE TransactionType(
    TransactionTypeID INT IDENTITY(1,1) NOT NULL,
    TransactionName VARCHAR(10) NULL
);

CREATE TABLE Transactions (
    TransactionID INT IDENTITY(1,1) NOT NULL,
    CustomerID INT NOT NULL,
    TransactionTypeID INT NOT NULL,
    TransactionDate DATETIME NULL
);

CREATE TABLE TransactionLine (
    TransactionLineID INT IDENTITY(1,1) NOT NULL,
    StockID INT NOT NULL,
    TransactionID INT NOT NULL,
    Quantity INT NULL
);

