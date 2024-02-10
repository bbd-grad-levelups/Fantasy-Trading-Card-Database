
USE FantasyTCStore
GO

CREATE FUNCTION CheckValidTransaction (@StockID INT, @Quantity INT, @TransactionTypeID INT)
RETURNS BIT
AS
BEGIN
    DECLARE @AvailableQuantity INT;
    SET @AvailableQuantity = (SELECT QuantityInStock FROM Stock WHERE StockID = @StockID);

    IF @TransactionTypeID = 1 -- Buy transaction
        RETURN 1;
    ELSE IF @AvailableQuantity >= @Quantity -- Sell transaction
        RETURN 1;
    
        RETURN 0;
END;