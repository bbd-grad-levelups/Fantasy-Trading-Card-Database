
USE FantasyTCStore
GO
--Select statments to show off the Card value calculation
SELECT TOP 10
    c.CardName,
    c.CardRarityID,
    s.CardGradingID,
    dbo.CalculateMonetaryValue(s.StockID, 1) AS PurchasePrice,
    dbo.CalculateMonetaryValue(s.StockID, 2) AS SellingPrice
FROM
    Stock s
INNER JOIN
    Cards c ON s.CardID = c.CardID
WHERE
    c.CardRarityID=1 OR c.CardRarityID=5

ORDER BY PurchasePrice;