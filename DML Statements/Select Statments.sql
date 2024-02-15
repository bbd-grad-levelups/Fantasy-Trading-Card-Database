USE FantasyTCStore
GO

--Select statments to show off the Card value calculation
SELECT TOP 10
    c.CardName,
    c.CardRarityID,
    s.CardGradingID,
    dbo.CalculateMonetaryValue(s.StockID, 1) AS PurchasePrice,
    dbo.CalculateMonetaryValue(s.StockID, 2) AS SellingPrice
FROM Stock s
INNER JOIN Cards c 
ON s.CardID = c.CardID
WHERE c.CardRarityID=1 
OR c.CardRarityID=5
ORDER BY PurchasePrice;
GO

SELECT * 
FROM CurrentStockView
ORDER BY
    Category,
    CardName,
    SellingPrice;
GO

SELECT *
FROM dbo.GetCustomerTransactions(1)
ORDER BY TransactionDate;
GO

SELECT QuantityInStock from Stock
where StockID=15
EXEC dbo.AddTransactionLine @StockID = 15, @TransactionID = 1, @Quantity = 10
GO

SELECT * FROM TransactionLine WHERE StockID = 15 AND TransactionID = 1
GO

SELECT QuantityInStock from Stock
where StockID=15

EXEC AddTransaction @CustomerID = 1, @typeid = 2, @TransactionDate = '2024-02-09'
GO

SELECT * FROM Transactions WHERE CustomerID = 1 AND TransactionDate = '2024-02-09'
GO

EXEC UpdateStockCount @StockId = 1, @NewQty = 20;
GO

SELECT * FROM Stock WHERE StockID = 1;
GO

EXEC DeleteUnusedTransactions;
GO

SELECT * FROM Transactions WHERE CustomerID = 1 AND TransactionDate = '2024-02-09';
GO