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
    (5, 5, 12),
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
    (25, 5, 9),
    (26, 1, 13),
    (27, 2, 10),
    (28, 3, 16),
    (29, 4, 5),
    (30, 5, 20),
    (31, 1, 9),
    (32, 2, 15),
    (33, 3, 12),
    (34, 4, 8),
    (35, 5, 10),
    (36, 1, 11),
    (37, 2, 18),
    (38, 3, 7),
    (39, 4, 0),
    (40, 5, 9),
    (41, 1, 13),
    (42, 2, 10),
    (43, 3, 16);


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
    ('buy'),
    ('sell');
GO

-- Generate 30 transactions with consistent data
INSERT INTO Transactions (CustomerID, TransactionTypeID, TransactionDate)
VALUES 
    (1, 1, '2024-02-01'),
    (2, 1, '2024-02-02'),
    (3, 1, '2024-02-03'),
    (4, 1, '2024-02-04'),
    (5, 1, '2024-02-05'),
    (6, 1, '2024-02-06'),
    (7, 1, '2024-02-07'),
    (8, 1, '2024-02-08'),
    (9, 1, '2024-02-09'),
    (10, 1, '2024-01-10'),
    (11, 1, '2024-01-11'),
    (12, 1, '2024-01-12'),
    (13, 1, '2024-01-13'),
    (14, 1, '2024-01-14'),
    (1, 2, '2024-01-15'),
    (2, 2, '2024-01-16'),
    (3, 2, '2024-01-17'),
    (4, 2, '2024-01-18'),
    (5, 2, '2024-01-19'),
    (6, 2, '2024-01-20'),
    (7, 2, '2024-01-21'),
    (8, 2, '2024-01-22'),
    (9, 2, '2024-01-23'),
    (10, 2, '2024-01-24'),
    (11, 2, '2024-01-25'),
    (12, 2, '2024-01-26'),
    (13, 2, '2024-01-27'),
    (14, 2, '2024-01-28');
GO


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
    (21, 14, 1);



