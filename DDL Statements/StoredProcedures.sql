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
    @Quantity INT,
    @TransactionTypeID INT
AS
BEGIN
    DECLARE @ValidTransaction BIT;
    DECLARE @NewStockQty INT;
    
    SET @ValidTransaction = dbo.CheckValidTransaction(@CardID, @Quantity, @TransactionTypeID);
    
    IF @ValidTransaction = 1
    BEGIN
        INSERT INTO TransactionLine (StockID, TransactionID, Quantity)
        VALUES (@CardID, @TransactionID, @Quantity);
        
        IF @TransactionTypeID = 1 -- Buy transaction
            SET @NewStockQty = (SELECT QuantityInStock + @Quantity FROM Stock WHERE StockID = @CardID);
        ELSE -- Sell transaction
            SET @NewStockQty = (SELECT QuantityInStock - @Quantity FROM Stock WHERE StockID = @CardID);

        EXEC UpdateStockCount @StockId = @CardID, @NewQty = @NewStockQty;
    END
    ELSE
    BEGIN
        RAISERROR ('Invalid transaction. Please check the quantity and availability of the card.', 16, 1);
    END
END;
GO