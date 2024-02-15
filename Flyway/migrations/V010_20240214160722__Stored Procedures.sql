
USE FantasyTCStore
GO



CREATE PROCEDURE UpdateStockCount
    @StockId INT,
    @NewQty INT
AS
BEGIN
    UPDATE Stock
    SET QuantityInStock = @NewQty
    WHERE StockID = @StockId
END;
GO


CREATE PROCEDURE AddTransaction
    @CustomerID INT,
    @typeid INT,
    @TransactionDate DATETIME
AS
BEGIN
    INSERT INTO Transactions (CustomerID, TransactionTypeID, TransactionDate)
    VALUES (@CustomerID, @typeid, @TransactionDate)
END;
GO


CREATE PROCEDURE AddTransactionLine
    @StockID INT,
    @TransactionID INT,
    @Quantity INT
    
AS
BEGIN
    DECLARE @ValidTransaction BIT;
    DECLARE @NewStockQty INT;
    DECLARE @TransactionTypeID INT;

    -- Select the TransactionTypeID from the Transactions table
   SELECT TOP 1 @TransactionTypeID = TransactionTypeID
FROM Transactions
WHERE TransactionID = @TransactionID;

    SET @ValidTransaction = dbo.CheckValidTransaction(@StockID, @Quantity, @TransactionTypeID);
    
    IF @ValidTransaction = 1
    BEGIN
       BEGIN TRY
            INSERT INTO TransactionLine (StockID, TransactionID, Quantity)
            VALUES (@StockID, @TransactionID, @Quantity);
        
            IF @TransactionTypeID = 1 -- Buy transaction
                SET @NewStockQty = (SELECT QuantityInStock + @Quantity FROM Stock WHERE StockID = @StockID);
            ELSE -- Sell transaction
                SET @NewStockQty = (SELECT QuantityInStock - @Quantity FROM Stock WHERE StockID = @StockID);

            EXEC UpdateStockCount @StockId = @StockID, @NewQty = @NewStockQty;
        END TRY
        BEGIN CATCH
            -- Handle the error, you can log it or raise it further as needed
            -- For simplicity, just raising it here
            RAISERROR ('Error occurred while adding transaction line.', 16, 1);
        END CATCH;
    END
    ELSE
    BEGIN
        RAISERROR ('Invalid transaction. Please check the quantity and availability of the card.', 16, 1);
    END
END;
GO

CREATE PROCEDURE DeleteUnusedTransactions
AS
BEGIN
    
    -- Delete transactions older than 3 days that have no lines
    DELETE FROM Transactions
    WHERE TransactionDate <= DATEADD(DAY, -3, GETDATE())
    AND NOT EXISTS (
        SELECT 1 FROM TransactionLine 
        WHERE TransactionLine.TransactionID = Transactions.TransactionID
    );

END;
Go
