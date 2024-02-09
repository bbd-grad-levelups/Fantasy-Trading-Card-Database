CREATE DATABASE FantasyTCStore;
GO

DROP DATABASE FantasyTCStore;
GO

CREATE TABLE FantasyTCStore.CardRarity (
    CardRarityID INT IDENTITY(1,1) NOT NULL,
    CardRarityName VARCHAR(100) NULL
);

ALTER TABLE FantasyTCStore.CardRarity
ADD CONSTRAINT PK_CardRarity PRIMARY KEY(CardRarityID);
GO

CREATE TABLE FantasyTCStore.CardCategory (
    CardCategoryID INT IDENTITY(1,1) NOT NULL,
    CardCategoryName VARCHAR(100)
);

ALTER TABLE FantasyTCStore.CardCategory
ADD CONSTRAINT PK_CardRarity PRIMARY KEY(CardRarityID);
GO


CREATE TABLE FantasyTCStore.CardGrading (
    CardGradingID INT IDENTITY(1,1) NOT NULL,
    CardGradingName VARCHAR(100) NULL
);

ALTER TABLE FantasyTCStore.CardGrading
ADD CONSTRAINT PK_CardGrading
PRIMARY KEY(CardGradingID)

CREATE TABLE Cards (
    CardID INT IDENTITY(1,1) NOT NULL,
    CardName VARCHAR(100) NULL,
    CardRarity INT NOT NULL,
    CardGrading INT NOT NULL,
    CardCategory INT NOT NULL,
    QuantityInStock INT NOT NULL,
    CardValue FLOAT,
    FOREIGN KEY (GradingID) REFERENCES Grading(GradingID),
    FOREIGN KEY (CategoryID) REFERENCES CardCategory(CategoryID)
);

ALTER TABLE Cards
ADD CONSTRAINT PK_Cards PRIMARY KEY (CardID);

ALTER TABLE Cards
ADD CONSTRAINT FK_Cards FOREIGN KEY (CardRarity) REFERENCES CardRarity(CardRarityID);

ALTER TABLE Cards
ADD CONSTRAINT FK_Cards2 FOREIGN KEY (CardCategory) REFERENCES CardCategory(CardCategoryID);


CREATE TABLE CardType (
    CardTypeID INT IDENTITY(1,1) NOT NULL,
    CardTypeName VARCHAR(100) NULL
);

ALTER TABLE CardType
ADD CONSTRAINT PK_CardType
PRIMARY KEY (CardTypeID) ;
GO

CREATE TABLE Customers (
    CustomerID INT IDENTITY(1,1),
    CustomerName VARCHAR(2000),
    Surname VARCHAR(2000),
    Email VARCHAR(500)
);
GO

ALTER TABLE Customers
ADD CONSTRAINT PK_Customers
PRIMARY KEY (CustomerID) ;
GO

CREATE TABLE Transactions (
    TransactionID INT IDENTITY(1,1),
    CustomerID INT,
    CardID INT,
    TypeID INT,
    TransactionDate DATETIME
);

ALTER TABLE Transactions
ADD CONSTRAINT PK_Transactions
PRIMARY KEY (TransactionID) ;
GO

CREATE TABLE TransactionLine (
    TransactionLineID INT IDENTITY(1,1),
    CardID INT NOT NULL,
    TransactionID INT NOT NULL,
    Quantity INT
);
