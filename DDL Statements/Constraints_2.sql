
USE FantasyTCStore
GO

--Adding constraints to CardRarity table
ALTER TABLE CardRarity
ADD CONSTRAINT PK_CardRarity PRIMARY KEY(CardRarityID);
GO

--Adding constraints to CardCategory table
ALTER TABLE CardCategory
ADD CONSTRAINT PK_CardCategory PRIMARY KEY(CardCategoryID);
GO

--Adding constraints to CardGrading
ALTER TABLE CardGrading
ADD CONSTRAINT PK_CardGrading PRIMARY KEY(CardGradingID)
GO

--Adding contraints to Cards table
ALTER TABLE Cards
ADD CONSTRAINT PK_Cards PRIMARY KEY (CardID);

ALTER TABLE Cards
ADD CONSTRAINT FK_Cards_Rarity FOREIGN KEY (CardRarityID) REFERENCES CardRarity(CardRarityID);

ALTER TABLE Cards
ADD CONSTRAINT FK_Cards_Category FOREIGN KEY (CardCategoryID) REFERENCES CardCategory(CardCategoryID);

--Adding constraints to Stock table
ALTER TABLE Stock
ADD CONSTRAINT PK_Stock PRIMARY KEY (StockID);

ALTER TABLE Stock
ADD CONSTRAINT FK_Stock_Cards FOREIGN KEY (CardID) REFERENCES Cards(CardID);

ALTER TABLE Stock
ADD CONSTRAINT FK_Stock_Grading FOREIGN KEY(CardGradingID) REFERENCES CardGrading(CardGradingID)

--Adding constraints to Customers table

ALTER TABLE Customers
ADD CONSTRAINT PK_Customers PRIMARY KEY (CustomerID) ;

--Adding constraints for TransactionType table
ALTER TABLE TransactionType
ADD CONSTRAINT PK_TransactionType PRIMARY KEY (TransactionTypeID);

--Adding constraints for Transactions table
ALTER TABLE Transactions
ADD CONSTRAINT PK_Transactions PRIMARY KEY (TransactionID) ;

ALTER TABLE Transactions
ADD CONSTRAINT FK_Transactions_Type FOREIGN KEY(TransactionTypeID) REFERENCES TransactionType(TransactionTypeID);

ALTER TABLE Transactions
ADD CONSTRAINT FK_Transactions_Customer FOREIGN KEY(CustomerID) REFERENCES Customers(CustomerID);

--Adding constraint for TransactionLine table
ALTER TABLE TransactionLine
ADD CONSTRAINT PK_TransactionLine PRIMARY KEY (TransactionLineID);

ALTER TABLE TransactionLine
ADD CONSTRAINT FK_TransactionLine_Stock FOREIGN KEY(StockID) REFERENCES Stock(StockID);

ALTER TABLE TransactionLine
ADD CONSTRAINT FK_TransactionLine_Transaction FOREIGN KEY (TransactionID) REFERENCES Transactions(TransactionID);

-- Adding constraint to ensure email format is valid
ALTER TABLE Customers
ADD CONSTRAINT CHK_ValidEmailFormat 
CHECK (Email LIKE '%@%.%');
GO

-- Adding constraint to ensure CardName is unique
ALTER TABLE Cards
ADD CONSTRAINT UQ_CardName UNIQUE (CardName);
GO

-- Adding constraint to ensure CardID and CardGradingID pairing is unique
ALTER TABLE Stock
ADD CONSTRAINT UQ_CardGradingPairing UNIQUE (CardID, CardGradingID);
GO

-- Adding constraint to ensure StockID and TransactionID pairing is unique
ALTER TABLE TransactionLine
ADD CONSTRAINT UQ_StockTransactionPair UNIQUE (StockID, TransactionID);
GO

-- Adding default constraint for TransactionDate column
ALTER TABLE Transactions
ADD CONSTRAINT DF_TransactionDate DEFAULT GETDATE() FOR TransactionDate;
GO

-- Adding constraint to ensure QuantityInStock is greater than or equal to 0
ALTER TABLE Stock
ADD CONSTRAINT CHK_QuantityInStock 
CHECK (QuantityInStock >= 0);
GO

-- Adding constraint to ensure Quantity is greater than or equal to 0 for TransactionLine
ALTER TABLE TransactionLine
ADD CONSTRAINT CHK_Quantity 
CHECK (Quantity > 0);
GO