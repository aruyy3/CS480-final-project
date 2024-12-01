-- Query to Retrieve All Available Game IDs
SELECT 
    GameID 
FROM 
    VideoGame
ORDER BY 
    GameID ASC;

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

-- Query to Retrieve Games by ID with Pagination
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
    vg.GameID
LIMIT ? OFFSET ?;

-- Query to Retrieve All Game Details Without Filtering
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
GROUP BY 
    vg.GameID;

-- Query to Retrieve Games with a Range of IDs
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
    vg.GameID BETWEEN ? AND ?
GROUP BY 
    vg.GameID;
