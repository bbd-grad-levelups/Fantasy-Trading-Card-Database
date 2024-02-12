CREATE PROCEDURE CalculateCardValue 
    @RarityID INT, 
    @GradingID INT
AS
BEGIN
    DECLARE @RarityValue INT, @GradingValue INT, @TotalValue INT

    SELECT @RarityValue = RarityID FROM Rarity WHERE RarityID = @RarityID
    SELECT @GradingValue = GradingID FROM Grading WHERE GradingID = @GradingID

    SET @TotalValue = 10 * @RarityValue + 5 * @GradingValue

    SELECT 'The value of the card is: ' + CAST(@TotalValue AS NVARCHAR(50)) AS CardValue
END;
GO


CREATE PROCEDURE AddTransaction
    @CustomerID INT,
    @typeid INT,
    @TransactionDate DATETIME
AS
BEGIN
    INSERT INTO CardTransaction (CustomerID, typeid, TransactionDate)
    VALUES (@CustomerID, @typeid, @TransactionDate)
END;
GO


CREATE PROCEDURE AddTransactionLine
    @CardID INT,
    @TransactionID INT,
    @Quantity INT
AS
BEGIN
    INSERT INTO TransactionLine (CardID, TransactionID, Quantity)
    VALUES (@CardID, @TransactionID, @Quantity)
END;
GO

CREATE PROCEDURE UpdateStockCount
    @StockId INT,
    @NewQty INT
AS
BEGIN
    UPDATE Stock
    SET QtyInStock = @NewQty
    WHERE StockId = @StockId
END;
GO
