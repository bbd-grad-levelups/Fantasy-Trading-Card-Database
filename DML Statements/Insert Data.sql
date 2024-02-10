USE FantasyTCStore
GO


INSERT INTO CardRarity (CardRarityName)
VALUES 
    ('Common'),
    ('Uncommon'),
    ('Rare'),
    ('Super Rare'),
    ('Limited Edition');

INSERT INTO CardCategory (CardCategoryName)
VALUES 
    ('Pokemon TCG'),
    ('Magic: The Gathering'),
    ('Yu-Gi-Oh! TCG'),
    ('Final Fantasy TCG'),
    ('Digimon TCG');
INSERT INTO CardGrading (CardGradingName) 
VALUES 
    ('Poor'),
    ('Fair'),
    ('Good'),
    ('Excellent'),
    ('Mint Condition');


INSERT INTO Cards (CardName, CardCategoryID, CardRarityID)
VALUES 
    ('Gen 1 Pikachu', 1, 4), 
    ('Charizard Holo', 1, 4),
    ('Blue-Eyes White Dragon', 3, 3),
    ('Dark Magician', 3, 2),
    ('Black Lotus', 2, 5),
    ('Mewtwo GX', 1, 4),
    ('Ancient Mew', 3, 5),
    ('Exodia the Forbidden One', 3, 5),
    ('Misty''s Tears', 1, 1),
    ('Shiny Charizard', 1, 4),
    ('Machamp First Edition', 1, 3),
    ('Pikachu Illustrator', 1, 5),
    ('Rainbow Charizard VMAX', 1, 4),
    ('Shining Gyarados', 1, 3),
    ('Jolteon Gold Star', 1, 4),
    ('Base Set Charizard', 1, 3),
    ('Darkrai EX', 1, 4),
    ('Ancient Origins Lugia', 1, 3),
    ('Gold Pikachu', 1, 5),
    ('Crystal Charizard', 1, 4),
    ('Jace, the Mind Sculptor', 2, 4),
    ('Tarmogoyf', 2, 4),
    ('Force of Will', 2, 3),
    ('Mox Sapphire', 2, 4),
    ('Liliana of the Veil', 2, 4),
    ('Snapcaster Mage', 2, 4),
    ('Thoughtseize', 2, 3),
    ('Mana Drain', 2, 4),
    ('Scalding Tarn', 2, 4),
    ('Red-Eyes Black Dragon', 3, 3),
    ('Dark Magician Girl', 3, 4),
    ('Sangan', 3, 2),
    ('Pot of Greed', 3, 4),
    ('Agumon', 5, 1),
    ('Gabumon', 5, 1),
    ('Veemon', 5, 1),
    ('Cloud Strife', 5, 3),
    ('Tifa Lockhart', 5, 4),
    ('Sephiroth', 5, 4),
    ('Lightning', 5, 3),
    ('Tidus', 5, 2),
    ('Yuna', 5, 2),
    ('Detective Pikachu', 1, 5),
    ('Magikarp', 1, 1);
GO
-- Inserting varied quantities for the existing 43 cards in the Cards table into the Stock table
INSERT INTO Stock (CardID, CardGradingID, QuantityInStock)
VALUES 
    (1, 1, 10), -- Example quantities, adjust as needed
    (2, 2, 15),
    (3, 3, 20),
    (4, 4, 8),
    (5, 5, 1),
    (6, 1, 18),
    (7, 2, 11),
    (8, 3, 7),
    (9, 4, 0),
    (10, 5, 9),
    (11, 1, 13),
    (12, 2, 10),
    (13, 3, 16),
    (14, 4, 5),
    (15, 5, 20),
    (16, 1, 9),
    (17, 2, 15),
    (18, 3, 12),
    (19, 4, 8),
    (20, 5, 10),
    (21, 1, 11),
    (22, 2, 18),
    (23, 3, 7),
    (24, 4, 0),
    (25, 5, 1),
    (26, 1, 13),
    (27, 2, 10),
    (28, 3, 16),
    (29, 4, 5),
    (30, 5, 20),
    (31, 1, 9),
    (32, 2, 15),
    (33, 3, 12),
    (34, 4, 8),
    (35, 5, 1),
    (36, 1, 11),
    (37, 2, 18),
    (38, 3, 7),
    (39, 4, 0),
    (40, 5, 2),
    (41, 1, 13),
    (42, 2, 10),
    (43, 3, 16),
    (10, 3, 2),
    (1,4,3),
    (22,3,10),
    (11,4,11),
    (36,4,6),
    (19,2,4),
    (22,1,12),
    (44,2,3),
    (44,4,4),
    (44,5,40),
    (44,1,60);



-- Inserting 15 customers into the Customers table with real email provider
INSERT INTO Customers (CustomerName, Surname, Email)
VALUES 
    ('John', 'Doe', 'john.doe@gmail.com'),
    ('Jane', 'Smith', 'jane.smith@yahoo.com'),
    ('Michael', 'Johnson', 'michael.johnson@hotmail.com'),
    ('Emily', 'Williams', 'emily.williams@outlook.com'),
    ('William', 'Brown', 'william.brown@aol.com'),
    ('Emma', 'Jones', 'emma.jones@icloud.com'),
    ('James', 'Garcia', 'james.garcia@protonmail.com'),
    ('Olivia', 'Martinez', 'olivia.martinez@zoho.com'),
    ('Benjamin', 'Hernandez', 'benjamin.hernandez@mail.com'),
    ('Sophia', 'Young', 'sophia.young@live.com'),
    ('Alexander', 'Lee', 'alexander.lee@inbox.com'),
    ('Chloe', 'Gonzalez', 'chloe.gonzalez@fastmail.com'),
    ('Jacob', 'Clark', 'jacob.clark@yandex.com'),
    ('Mia', 'Hall', 'mia.hall@mailinator.com'),
    ('Ethan', 'Turner', 'ethan.turner@gmx.com');

INSERT INTO TransactionType (TransactionName)
VALUES 
    ('Buy'),
    ('Sell');
GO

INSERT INTO Transactions (CustomerID, TransactionTypeID, TransactionDate)
VALUES 
    (1, 1, '2024-02-01 08:00:00'),
    (1, 2, '2024-01-15 13:45:00'),
    (1, 2, '2024-01-12 12:37:00'),
    (2, 1, '2024-02-02 09:30:00'),
    (3, 1, '2024-02-03 10:15:00'),
    (4, 1, '2024-02-04 11:45:00'),
    (5, 1, '2024-02-05 12:30:00'),
    (6, 1, '2024-02-06 13:20:00'),
    (2, 2, '2024-01-16 14:30:00'),
    (7, 1, '2024-02-07 14:00:00'),
    (8, 1, '2024-02-08 15:00:00'),
    (9, 1, '2024-02-09 16:00:00'),
    (10, 1, '2024-01-10 08:30:00'),
    (11, 1, '2024-01-11 09:00:00'),
    (12, 1, '2024-01-12 09:45:00'),
    (13, 1, '2024-01-13 10:30:00'),
    (14, 1, '2024-01-14 11:15:00'),
    (3, 2, '2024-01-17 15:00:00'),
    (4, 2, '2024-01-18 15:45:00'),
    (5, 2, '2024-01-19 08:00:00'),
    (6, 2, '2024-01-20 08:45:00'),
    (7, 2, '2024-01-21 09:30:00'),
    (8, 2, '2024-01-22 10:15:00'),
    (9, 2, '2024-01-23 11:00:00'),
    (10, 2, '2024-01-24 11:45:00'),
    (11, 2, '2024-01-25 12:30:00'),
    (12, 2, '2024-01-26 13:00:00'),
    (13, 2, '2024-01-27 13:45:00');


-- Inserting transaction line data into the TransactionLine table
INSERT INTO TransactionLine (StockID, TransactionID, Quantity)
VALUES 
    -- Transaction 1 with multiple lines
    (1, 1, 3),  -- StockID 1, TransactionID 1, Quantity 3
    (2, 1, 2),  -- StockID 2, TransactionID 1, Quantity 2
    (3, 1, 1),  -- StockID 3, TransactionID 1, Quantity 1

    -- Transaction 2 with single line
    (4, 2, 1),  -- StockID 4, TransactionID 2, Quantity 1

    -- Transaction 3 with multiple lines
    (5, 3, 2),  -- StockID 5, TransactionID 3, Quantity 2
    (6, 3, 1),  -- StockID 6, TransactionID 3, Quantity 1

    -- Add more lines as needed for other transactions
        (7, 4, 1),  -- StockID 7, TransactionID 4, Quantity 1

    -- Transaction 5 with single line
    (8, 5, 3),  -- StockID 8, TransactionID 5, Quantity 3

    -- Transaction 6 with single line
    (9, 6, 2),  -- StockID 9, TransactionID 6, Quantity 2

    -- Transaction 7 with multiple lines
    (10, 7, 1),  -- StockID 10, TransactionID 7, Quantity 1
    (11, 7, 1),  -- StockID 11, TransactionID 7, Quantity 1
    (12, 7, 1),  -- StockID 12, TransactionID 7, Quantity 1

    -- Transaction 8 with single line
    (13, 8, 2),  -- StockID 13, TransactionID 8, Quantity 2

    -- Transaction 9 with single line
    (14, 9, 1),  -- StockID 14, TransactionID 9, Quantity 1

    -- Transaction 10 with single line
    (15, 10, 1),  -- StockID 15, TransactionID 10, Quantity 1

    -- Transaction 11 with multiple lines
    (16, 11, 2),  -- StockID 16, TransactionID 11, Quantity 2
    (17, 11, 3),  -- StockID 17, TransactionID 11, Quantity 3

    -- Transaction 12 with single line
    (18, 12, 2),  -- StockID 18, TransactionID 12, Quantity 2

    -- Transaction 13 with single line
    (19, 13, 1),  -- StockID 19, TransactionID 13, Quantity 1

    -- Transaction 14 with multiple lines
    (20, 14, 1),  -- StockID 20, TransactionID 14, Quantity 1
    (21, 14, 1),

    (22, 15, 1),  -- StockID 22, TransactionID 15, Quantity 1

    -- Transaction 16 with single line
    (23, 16, 1),  -- StockID 23, TransactionID 16, Quantity 1

    -- Transaction 17 with single line
    (24, 17, 1),  -- StockID 24, TransactionID 17, Quantity 1

    -- Transaction 18 with single line
    (25, 18, 1),  -- StockID 25, TransactionID 18, Quantity 1

    -- Transaction 19 with single line
    (26, 19, 1),  -- StockID 26, TransactionID 19, Quantity 1

    -- Transaction 20 with single line
    (27, 20, 1),  -- StockID 27, TransactionID 20, Quantity 1

    -- Transaction 21 with single line
    (28, 21, 1),  -- StockID 28, TransactionID 21, Quantity 1

    -- Transaction 22 with single line
    (29, 22, 1),  -- StockID 29, TransactionID 22, Quantity 1

    -- Transaction 23 with single line
    (30, 23, 1),  -- StockID 30, TransactionID 23, Quantity 1

    -- Transaction 24 with single line
    (31, 24, 1),  -- StockID 31, TransactionID 24, Quantity 1

    -- Transaction 25 with single line
    (32, 25, 1),  -- StockID 32, TransactionID 25, Quantity 1

    -- Transaction 26 with single line
    (33, 26, 1),  -- StockID 33, TransactionID 26, Quantity 1

    -- Transaction 27 with single line
    (34, 27, 1);  -- StockID 34, TransactionID 27, Quantity 1



