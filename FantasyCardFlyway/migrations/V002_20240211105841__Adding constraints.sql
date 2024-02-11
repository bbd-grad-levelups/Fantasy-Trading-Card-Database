
USE FantasyTCStore
GO

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