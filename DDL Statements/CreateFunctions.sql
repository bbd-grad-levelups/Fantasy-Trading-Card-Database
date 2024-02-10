
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
GO


CREATE FUNCTION CalculateMonetaryValue (@StockID INT, @TransactionTypeID INT)
RETURNS MONEY
AS
BEGIN
    DECLARE @RarityID INT;
    DECLARE @GradingID INT;
    DECLARE @MonetaryValue MONEY;

    -- Retrieve RarityID and GradingID from the Stock table
    SELECT @RarityID = c.CardRarityID, @GradingID = s.CardGradingID
    FROM Stock s
    INNER JOIN Cards c ON s.CardID = c.CardID
    WHERE s.StockID = @StockID;

    -- Calculate MonetaryValue using the formula 
    SET @MonetaryValue = POWER(5, 1.5* @RarityID) /5* @GradingID;

    -- If TransactionTypeID is 2 (sell transaction), increase the value by 25%
    IF @TransactionTypeID = 2
        SET @MonetaryValue = @MonetaryValue * 1.25;

    RETURN @MonetaryValue;
END;
GO

CREATE FUNCTION GetCustomerTransactions
(
    @CustomerID INT
)
RETURNS TABLE
AS
RETURN
(
    SELECT 
        t.TransactionDate,
        CASE 
            WHEN t.TransactionTypeID = 1 THEN 'Sold To Store'
            WHEN t.TransactionTypeID = 2 THEN 'Purchased By Customer'
            ELSE 'Unknown'
        END AS TransactionType,
        c.CardName,
        cg.CardGradingName AS Grading,
        tl.Quantity AS TransactionQuantity
    FROM 
        Transactions t
    INNER JOIN 
        TransactionLine tl ON t.TransactionID = tl.TransactionID
    INNER JOIN 
        Stock s ON tl.StockID = s.StockID
    INNER JOIN 
        Cards c ON s.CardID = c.CardID
    INNER JOIN 
        CardGrading cg ON s.CardGradingID = cg.CardGradingID
    WHERE 
        t.CustomerID = @CustomerID
);
GO
