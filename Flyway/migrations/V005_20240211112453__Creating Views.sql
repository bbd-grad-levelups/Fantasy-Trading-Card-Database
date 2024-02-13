
USE FantasyTCStore
GO

CREATE VIEW CurrentStockView
AS
SELECT
    cc.CardCategoryName as Category,
    c.CardName,
    cr.CardRarityName as Rarity,
    cg.CardGradingName as Grading,
    s.QuantityInStock,
    dbo.CalculateMonetaryValue(s.StockID, 2) AS SellingPrice
FROM
    Stock s
INNER JOIN
    Cards c ON s.CardID = c.CardID
INNER JOIN
    CardCategory cc ON c.CardCategoryID = cc.CardCategoryID
INNER JOIN
    CardRarity cr ON c.CardRarityID = cr.CardRarityID
INNER JOIN
    CardGrading cg ON s.CardGradingID = cg.CardGradingID
;
