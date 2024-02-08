CREATE DATABASE CardCollection;
GO

USE CardCollection;
GO

-- Creating CardCategory table
CREATE TABLE CardCategory (
    CategoryID INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(200)
);
GO

-- Creating Grading table
CREATE TABLE Grading (
    GradingID INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(200)
);
GO

-- Creating Rarity table
CREATE TABLE Rarity (
    RarityID INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(200)
);
GO

-- Creating Customer table
CREATE TABLE Customer (
    CustomerID INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(200),
    Surname NVARCHAR(200),
    Email NVARCHAR(200)
);
GO

-- Creating TransactionType table
CREATE TABLE TransactionType (
    TypeID INT PRIMARY KEY IDENTITY(1, 1),
	Name VARCHAR (45)
);
GO

-- Creating CardName table 
CREATE TABLE CardName (
	CardNameId INT PRIMARY KEY IDENTITY (1, 1), 
	Name VARCHAR (20) 
); 
GO 

-- Creating Stock Table 
CREATE TABLE Stock ( 
	StockId INT PRIMARY KEY IDENTITY (0, 0), 
	CardId INT FOREIGN KEY REFERENCES Card(CardId), 
	RarityId INT FOREIGN KEY REFERENCES Rarity(RarityId), 
	GradingId INT FOREIGN KEY REFERENCES Grading (GradingId),  
	QtyInStock int NOT NULL  
); 

--Creating TransactionLine Table  
 CREATE TABLE TransactionLine(
TransactionLineID int primary key identity,
Cardid int foreign key references card(cardid) not null,
Transactionid int foreign key references cardtransaction(transactionid) not null,
Quantity int not null);

 --Creating TransactionType Table  
 CREATE TABLE transactiontype(
typeid int primary key identity,
name varchar(max));

 --Creating cardtransaction Table  
 CREATE TABLE cardtransaction(
Transactionid int primary key identity,
Customerid int foreign key references customer(customerid) not null,
typeid int foreign key references transactiontype(typeid) not null,
Transactiondate datetime);

