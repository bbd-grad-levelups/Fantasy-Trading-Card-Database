
USE FantasyTCStore
GO

--Renaming columns to fit the naming conventions 
--none are already in use in any functions or procedures  so can be safely changed
EXEC sp_rename 'Customers.Surname', 'CustomerSurname', 'COLUMN';
GO

-- In order to rename email, we have to first remove the constraint
ALTER TABLE Customers
DROP CONSTRAINT CHK_ValidEmailFormat;
GO
-- Rename the Email column
EXEC sp_rename 'Customers.Email', 'CustomerEmail', 'COLUMN';
GO
-- Recreate the check constraint with the new column name
ALTER TABLE Customers
ADD CONSTRAINT CHK_ValidEmailFormat 
CHECK (CustomerEmail LIKE '%@%.%');
GO

EXEC sp_rename 'TransactionType.TransactionName', 'TransactionTypeName', 'COLUMN';
GO
--Adding in constraints that were missing

--Uniqueness Constraints


ALTER TABLE TransactionType
ADD CONSTRAINT UC_TransactionTypeName UNIQUE (TransactionTypeName);
GO

ALTER TABLE CardGrading
ADD CONSTRAINT UC_CardGradingName UNIQUE (CardGradingName);
GO

ALTER TABLE CardRarity
ADD CONSTRAINT UC_CardRarityName UNIQUE (CardRarityName);
GO

ALTER TABLE CardCategory
ADD CONSTRAINT UC_CardCategoryName UNIQUE (CardCategoryName);
GO

ALTER TABLE Customers
ADD CONSTRAINT UC_CustomerEmail UNIQUE (CustomerEmail);
GO

ALTER TABLE Customers
ADD CONSTRAINT UC_Customer_Uniqueness 
UNIQUE (CustomerName, CustomerSurname, CustomerEmail);
GO

ALTER TABLE Stock
ADD CONSTRAINT UC_Card_Grading_Uniqueness 
UNIQUE (CardID, CardGradingID);
GO

ALTER TABLE TransactionLine
ADD CONSTRAINT UC_Stock_Transaction_Uniqueness 
UNIQUE (StockID, TransactionID);
GO

ALTER TABLE Cards
ADD CONSTRAINT UC_CardName_Category_Uniqueness 
UNIQUE (CardName, CardCategoryID);
GO