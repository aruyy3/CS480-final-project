-- The Legend of Zelda
SELECT 
    'The Legend of Zelda' AS Title, 
    CASE 
        WHEN AvailabilityStatus = 1 THEN 'In Stock'
        ELSE 'Out of Stock'
    END AS StockStatus
FROM video_game_library
WHERE GameID = 1;

-- Call of Duty
SELECT 
    'Call of Duty' AS Title, 
    CASE 
        WHEN AvailabilityStatus = 1 THEN 'In Stock'
        ELSE 'Out of Stock'
    END AS StockStatus
FROM video_game_library
WHERE GameID = 2;

-- FIFA 24
SELECT 
    'FIFA 24' AS Title, 
    CASE 
        WHEN AvailabilityStatus = 1 THEN 'In Stock'
        ELSE 'Out of Stock'
    END AS StockStatus
FROM video_game_library
WHERE GameID = 3;

-- The Sims 4
SELECT 
    'The Sims 4' AS Title, 
    CASE 
        WHEN AvailabilityStatus = 1 THEN 'In Stock'
        ELSE 'Out of Stock'
    END AS StockStatus
FROM video_game_library
WHERE GameID = 4;

-- Minecraft
SELECT 
    'Minecraft' AS Title, 
    CASE 
        WHEN AvailabilityStatus = 1 THEN 'In Stock'
        ELSE 'Out of Stock'
    END AS StockStatus
FROM video_game_library
WHERE GameID = 5;

--MOCK GAMES
SELECT 
    'Mock Game 6' AS Title, 
    CASE 
        WHEN AvailabilityStatus = 1 THEN 'In Stock'
        ELSE 'Out of Stock'
    END AS StockStatus
FROM video_game_library
WHERE GameID = 6;

SELECT 
    'Mock Game 7' AS Title, 
    CASE 
        WHEN AvailabilityStatus = 1 THEN 'In Stock'
        ELSE 'Out of Stock'
    END AS StockStatus
FROM video_game_library
WHERE GameID = 7;

SELECT 
    'Mock Game 8' AS Title, 
    CASE 
        WHEN AvailabilityStatus = 1 THEN 'In Stock'
        ELSE 'Out of Stock'
    END AS StockStatus
FROM video_game_library
WHERE GameID = 8;

SELECT 
    'Mock Game 9' AS Title, 
    CASE 
        WHEN AvailabilityStatus = 1 THEN 'In Stock'
        ELSE 'Out of Stock'
    END AS StockStatus
FROM video_game_library
WHERE GameID = 9;

SELECT 
    'Mock Game 10' AS Title, 
    CASE 
        WHEN AvailabilityStatus = 1 THEN 'In Stock'
        ELSE 'Out of Stock'
    END AS StockStatus
FROM video_game_library
WHERE GameID = 10;

SELECT 
    'Mock Game 11' AS Title, 
    CASE 
        WHEN AvailabilityStatus = 1 THEN 'In Stock'
        ELSE 'Out of Stock'
    END AS StockStatus
FROM video_game_library
WHERE GameID = 11;

SELECT 
    'Mock Game 12' AS Title, 
    CASE 
        WHEN AvailabilityStatus = 1 THEN 'In Stock'
        ELSE 'Out of Stock'
    END AS StockStatus
FROM video_game_library
WHERE GameID = 12;

SELECT 
    'Mock Game 13' AS Title, 
    CASE 
        WHEN AvailabilityStatus = 1 THEN 'In Stock'
        ELSE 'Out of Stock'
    END AS StockStatus
FROM video_game_library
WHERE GameID = 13;

SELECT 
    'Mock Game 14' AS Title, 
    CASE 
        WHEN AvailabilityStatus = 1 THEN 'In Stock'
        ELSE 'Out of Stock'
    END AS StockStatus
FROM video_game_library
WHERE GameID = 14;

SELECT 
    'Mock Game 15' AS Title, 
    CASE 
        WHEN AvailabilityStatus = 1 THEN 'In Stock'
        ELSE 'Out of Stock'
    END AS StockStatus
FROM video_game_library
WHERE GameID = 15;

SELECT 
    'Mock Game 16' AS Title, 
    CASE 
        WHEN AvailabilityStatus = 1 THEN 'In Stock'
        ELSE 'Out of Stock'
    END AS StockStatus
FROM video_game_library
WHERE GameID = 16;

SELECT 
    'Mock Game 17' AS Title, 
    CASE 
        WHEN AvailabilityStatus = 1 THEN 'In Stock'
        ELSE 'Out of Stock'
    END AS StockStatus
FROM video_game_library
WHERE GameID = 17;

SELECT 
    'Mock Game 18' AS Title, 
    CASE 
        WHEN AvailabilityStatus = 1 THEN 'In Stock'
        ELSE 'Out of Stock'
    END AS StockStatus
FROM video_game_library
WHERE GameID = 18;

SELECT 
    'Mock Game 19' AS Title, 
    CASE 
        WHEN AvailabilityStatus = 1 THEN 'In Stock'
        ELSE 'Out of Stock'
    END AS StockStatus
FROM video_game_library
WHERE GameID = 19;

SELECT 
    'Mock Game 20' AS Title, 
    CASE 
        WHEN AvailabilityStatus = 1 THEN 'In Stock'
        ELSE 'Out of Stock'
    END AS StockStatus
FROM video_game_library
WHERE GameID = 20;

SELECT 
    'Mock Game 21' AS Title, 
    CASE 
        WHEN AvailabilityStatus = 1 THEN 'In Stock'
        ELSE 'Out of Stock'
    END AS StockStatus
FROM video_game_library
WHERE GameID = 21;

SELECT 
    'Mock Game 22' AS Title, 
    CASE 
        WHEN AvailabilityStatus = 1 THEN 'In Stock'
        ELSE 'Out of Stock'
    END AS StockStatus
FROM video_game_library
WHERE GameID = 22;

SELECT 
    'Mock Game 23' AS Title, 
    CASE 
        WHEN AvailabilityStatus = 1 THEN 'In Stock'
        ELSE 'Out of Stock'
    END AS StockStatus
FROM video_game_library
WHERE GameID = 23;

SELECT 
    'Mock Game 24' AS Title, 
    CASE 
        WHEN AvailabilityStatus = 1 THEN 'In Stock'
        ELSE 'Out of Stock'
    END AS StockStatus
FROM video_game_library
WHERE GameID = 24;

SELECT 
    'Mock Game 25' AS Title, 
    CASE 
        WHEN AvailabilityStatus = 1 THEN 'In Stock'
        ELSE 'Out of Stock'
    END AS StockStatus
FROM video_game_library
WHERE GameID = 25;


--IF GAME IS BORROWED
-- The Legend of Zelda
UPDATE video_game_library
SET 
    AvailabilityStatus = 0
WHERE GameID = 1;

-- Call of Duty
UPDATE video_game_library
SET 
    AvailabilityStatus = 0
WHERE GameID = 2;

-- FIFA 24
UPDATE video_game_library
SET 
    AvailabilityStatus = 0
WHERE GameID = 3;

-- The Sims 4
UPDATE video_game_library
SET 
    AvailabilityStatus = 0
WHERE GameID = 4;

-- Minecraft
UPDATE video_game_library
SET 
    AvailabilityStatus = 0
WHERE GameID = 5;

-- Mock Game 6
UPDATE video_game_library
SET 
    AvailabilityStatus = 0
WHERE GameID = 6;

-- Mock Game 7
UPDATE video_game_library
SET 
    AvailabilityStatus = 0
WHERE GameID = 7;

-- Mock Game 8
UPDATE video_game_library
SET 
    AvailabilityStatus = 0
WHERE GameID = 8;

-- Mock Game 9
UPDATE video_game_library
SET 
    AvailabilityStatus = 0
WHERE GameID = 9;

-- Mock Game 10
UPDATE video_game_library
SET 
    AvailabilityStatus = 0
WHERE GameID = 10;

-- Mock Game 11
UPDATE video_game_library
SET 
    AvailabilityStatus = 0
WHERE GameID = 11;

-- Mock Game 12
UPDATE video_game_library
SET 
    AvailabilityStatus = 0
WHERE GameID = 12;

-- Mock Game 13
UPDATE video_game_library
SET 
    AvailabilityStatus = 0
WHERE GameID = 13;

-- Mock Game 14
UPDATE video_game_library
SET 
    AvailabilityStatus = 0
WHERE GameID = 14;

-- Mock Game 15
UPDATE video_game_library
SET 
    AvailabilityStatus = 0
WHERE GameID = 15;

-- Mock Game 16
UPDATE video_game_library
SET 
    AvailabilityStatus = 0
WHERE GameID = 16;

-- Mock Game 17
UPDATE video_game_library
SET 
    AvailabilityStatus = 0
WHERE GameID = 17;

-- Mock Game 18
UPDATE video_game_library
SET 
    AvailabilityStatus = 0
WHERE GameID = 18;

-- Mock Game 19
UPDATE video_game_library
SET 
    AvailabilityStatus = 0
WHERE GameID = 19;

-- Mock Game 20
UPDATE video_game_library
SET 
    AvailabilityStatus = 0
WHERE GameID = 20;

-- Mock Game 21
UPDATE video_game_library
SET 
    AvailabilityStatus = 0
WHERE GameID = 21;

-- Mock Game 22
UPDATE video_game_library
SET 
    AvailabilityStatus = 0
WHERE GameID = 22;

-- Mock Game 23
UPDATE video_game_library
SET 
    AvailabilityStatus = 0
WHERE GameID = 23;

-- Mock Game 24
UPDATE video_game_library
SET 
    AvailabilityStatus = 0
WHERE GameID = 24;

-- Mock Game 25
UPDATE video_game_library
SET 
    AvailabilityStatus = 0
WHERE GameID = 25;

--IF GAME IS RETURNED

-- The Legend of Zelda
UPDATE video_game_library
SET 
    AvailabilityStatus = 1
WHERE GameID = 1;

-- Call of Duty
UPDATE video_game_library
SET 
    AvailabilityStatus = 1
WHERE GameID = 2;

-- FIFA 24
UPDATE video_game_library
SET 
    AvailabilityStatus = 1
WHERE GameID = 3;

-- The Sims 4
UPDATE video_game_library
SET 
    AvailabilityStatus = 1
WHERE GameID = 4;

-- Minecraft
UPDATE video_game_library
SET 
    AvailabilityStatus = 1
WHERE GameID = 5;

-- Mock Game 6
UPDATE video_game_library
SET 
    AvailabilityStatus = 1
WHERE GameID = 6;

-- Mock Game 7
UPDATE video_game_library
SET 
    AvailabilityStatus = 1
WHERE GameID = 7;

-- Mock Game 8
UPDATE video_game_library
SET 
    AvailabilityStatus = 1
WHERE GameID = 8;

-- Mock Game 9
UPDATE video_game_library
SET 
    AvailabilityStatus = 1
WHERE GameID = 9;

-- Mock Game 10
UPDATE video_game_library
SET 
    AvailabilityStatus = 1
WHERE GameID = 10;

-- Mock Game 11
UPDATE video_game_library
SET 
    AvailabilityStatus = 1
WHERE GameID = 11;

-- Mock Game 12
UPDATE video_game_library
SET 
    AvailabilityStatus = 1
WHERE GameID = 12;

-- Mock Game 13
UPDATE video_game_library
SET 
    AvailabilityStatus = 1
WHERE GameID = 13;

-- Mock Game 14
UPDATE video_game_library
SET 
    AvailabilityStatus = 1
WHERE GameID = 14;

-- Mock Game 15
UPDATE video_game_library
SET 
    AvailabilityStatus = 1
WHERE GameID = 15;

-- Mock Game 16
UPDATE video_game_library
SET 
    AvailabilityStatus = 1
WHERE GameID = 16;

-- Mock Game 17
UPDATE video_game_library
SET 
    AvailabilityStatus = 1
WHERE GameID = 17;

-- Mock Game 18
UPDATE video_game_library
SET 
    AvailabilityStatus = 1
WHERE GameID = 18;

-- Mock Game 19
UPDATE video_game_library
SET 
    AvailabilityStatus = 1
WHERE GameID = 19;

-- Mock Game 20
UPDATE video_game_library
SET 
    AvailabilityStatus = 1
WHERE GameID = 20;

-- Mock Game 21
UPDATE video_game_library
SET 
    AvailabilityStatus = 1
WHERE GameID = 21;

-- Mock Game 22
UPDATE video_game_library
SET 
    AvailabilityStatus = 1
WHERE GameID = 22;

-- Mock Game 23
UPDATE video_game_library
SET 
    AvailabilityStatus = 1
WHERE GameID = 23;

-- Mock Game 24
UPDATE video_game_library
SET 
    AvailabilityStatus = 1
WHERE GameID = 24;

-- Mock Game 25
UPDATE video_game_library
SET 
    AvailabilityStatus = 1
WHERE GameID = 25;


