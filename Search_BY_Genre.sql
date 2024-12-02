-- Query to Retrieve All Available Genres
SELECT DISTINCT 
    Name AS Genre 
FROM 
    Genre
ORDER BY 
    Name ASC;

-- Query to Search Games by Genre
SELECT 
    vg.GameID,
    vg.Title,
    vg.Platform,
    vg.ReleaseYear,
    vg.Developer,
    vg.Publisher
FROM 
    VideoGame vg
JOIN 
    VideoGameGenre vgg ON vg.GameID = vgg.GameID
JOIN 
    Genre g ON vgg.GenreID = g.GenreID
WHERE 
    g.Name = ?; 

-- Query to Search Games by Genre with Pagination
SELECT 
    vg.GameID,
    vg.Title,
    vg.Platform,
    vg.ReleaseYear,
    vg.Developer,
    vg.Publisher
FROM 
    VideoGame vg
JOIN 
    VideoGameGenre vgg ON vg.GameID = vgg.GameID
JOIN 
    Genre g ON vgg.GenreID = g.GenreID
WHERE 
    g.Name = ?
LIMIT ? OFFSET ?; 

-- Query to Retrieve Game Details by ID
SELECT 
    vg.GameID,
    vg.Title,
    vg.Platform,
    vg.ReleaseYear,
    vg.Developer,
    vg.Publisher,
    GROUP_CONCAT(g.Name) AS Genres
FROM 
    VideoGame vg
LEFT JOIN 
    VideoGameGenre vgg ON vg.GameID = vgg.GameID
LEFT JOIN 
    Genre g ON vgg.GenreID = g.GenreID
WHERE 
    vg.GameID = ?
GROUP BY 
    vg.GameID;

-- Query to Retrieve Games by Developer
SELECT 
    vg.GameID,
    vg.Title,
    vg.Platform,
    vg.ReleaseYear,
    vg.Developer,
    vg.Publisher
FROM 
    VideoGame vg
WHERE 
    vg.Developer LIKE ?; 
