
USE FantasyTCStore
GO

--Making the max length for name and surname more inclusive

ALTER TABLE Customers
DROP CONSTRAINT UC_Customer_Uniqueness;
GO

ALTER TABLE Customers
ALTER COLUMN CustomerName VARCHAR(1000);
GO
ALTER TABLE Customers
ALTER COLUMN CustomerSurname VARCHAR(1000);
GO


--Now adjust max length of email to the correct max length as per the spec
ALTER TABLE Customers
DROP CONSTRAINT CHK_ValidEmailFormat;
GO

ALTER TABLE Customers
DROP CONSTRAINT UC_CustomerEmail;
GO

ALTER TABLE Customers
ALTER COLUMN CustomerEmail VARCHAR(254) -- Maximum length for an email address according to RFC 2821
;
GO

--Add constraints back

ALTER TABLE Customers
ADD CONSTRAINT CHK_ValidEmailFormat 
CHECK (CustomerEmail LIKE '%@%.%');
GO

ALTER TABLE Customers
ADD CONSTRAINT UC_CustomerEmail UNIQUE (CustomerEmail);
GO

ALTER TABLE Customers
ADD CONSTRAINT UC_Customer_Uniqueness 
UNIQUE (CustomerName, CustomerSurname, CustomerEmail);
GO
