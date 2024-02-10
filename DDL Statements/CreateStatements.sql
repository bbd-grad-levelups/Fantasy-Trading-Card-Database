USE master;
GO

IF EXISTS (SELECT * FROM sys.databases WHERE name = 'FantasyTCStore')
BEGIN
    ALTER DATABASE FantasyTCStore SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE FantasyTCStore;
END
GO

CREATE DATABASE FantasyTCStore
GO


USE FantasyTCStore
GO

CREATE TABLE CardRarity (
    CardRarityID INT IDENTITY(1,1) NOT NULL,
    CardRarityName VARCHAR(20) NULL
);

ALTER TABLE CardRarity
ADD CONSTRAINT PK_CardRarity PRIMARY KEY(CardRarityID);
GO

CREATE TABLE CardCategory (
    CardCategoryID INT IDENTITY(1,1) NOT NULL,
    CardCategoryName VARCHAR(50)
);

ALTER TABLE CardCategory
ADD CONSTRAINT PK_CardCategory PRIMARY KEY(CardCategoryID);
GO


CREATE TABLE CardGrading (
    CardGradingID INT IDENTITY(1,1) NOT NULL,
    CardGradingName VARCHAR(20) NULL
);

ALTER TABLE CardGrading
ADD CONSTRAINT PK_CardGrading PRIMARY KEY(CardGradingID)
GO

CREATE TABLE Cards (
    CardID INT IDENTITY(1,1) NOT NULL,
    CardName VARCHAR(100) NULL,
    CardCategoryID INT NOT NULL,
    CardRarityID INT NOT NULL,
   
 

);


ALTER TABLE Cards
ADD CONSTRAINT PK_Cards PRIMARY KEY (CardID);

ALTER TABLE Cards
ADD CONSTRAINT FK_Cards_Rarity FOREIGN KEY (CardRarityID) REFERENCES CardRarity(CardRarityID);

ALTER TABLE Cards
ADD CONSTRAINT FK_Cards_Category FOREIGN KEY (CardCategoryID) REFERENCES CardCategory(CardCategoryID);
GO

CREATE TABLE Stock(
    StockID INT IDENTITY(1,1) NOT NULL,
    CardID INT NOT NULL,
    CardGradingID INT NOT NULL,
    QuantityInStock INT NOT NULL,

);
ALTER TABLE Stock
Add CONSTRAINT PK_Stock PRIMARY KEY (StockID);

ALTER TABLE Stock
ADD CONSTRAINT FK_Stock_Cards FOREIGN KEY (CardID) REFERENCES Cards(CardID);

ALTER TABLE Stock
ADD CONSTRAINT FK_Stock_Grading FOREIGN KEY(CardGradingID) REFERENCES CardGrading(CardGradingID)

CREATE TABLE Customers (
    CustomerID INT IDENTITY(1,1),
    CustomerName VARCHAR(200),
    Surname VARCHAR(200),
    Email VARCHAR(500)
);

ALTER TABLE Customers
ADD CONSTRAINT PK_Customers
PRIMARY KEY (CustomerID) ;
GO

CREATE TABLE TransactionType(
    TransactionTypeID INT IDENTITY(1,1),
    TransactionName VARCHAR(4)
);
ALTER TABLE TransactionType
ADD CONSTRAINT PK_TransactionType PRIMARY KEY (TransactionTypeID)

GO

CREATE TABLE Transactions (
    TransactionID INT IDENTITY(1,1),
    CustomerID INT,
 
    TransactionTypeID INT,
    TransactionDate DATETIME
);

ALTER TABLE Transactions
ADD CONSTRAINT PK_Transactions
PRIMARY KEY (TransactionID) ;


ALTER TABLE Transactions
ADD CONSTRAINT FK_Transactions_Type FOREIGN KEY(TransactionTypeID) REFERENCES TransactionType(TransactionTypeID)

ALTER TABLE Transactions
ADD CONSTRAINT FK_Transactions_Customer FOREIGN KEY(CustomerID) REFERENCES Customers(CustomerID)


GO

CREATE TABLE TransactionLine (
    TransactionLineID INT IDENTITY(1,1),
    StockID INT NOT NULL,
    TransactionID INT NOT NULL,
    Quantity INT
);

ALTER TABLE TransactionLine
ADD CONSTRAINT PK_TransactionLine PRIMARY KEY (TransactionLineID)


ALTER TABLE TransactionLine
ADD CONSTRAINT FK_TransactionLine_Stock FOREIGN KEY(StockID) REFERENCES Stock(StockID)

ALTER TABLE TransactionLine
ADD CONSTRAINT FK_TransactionLine_Transaction FOREIGN KEY (TransactionID) REFERENCES Transactions(TransactionID)

GO