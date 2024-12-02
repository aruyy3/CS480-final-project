const express = require("express");
const cors = require("cors");
const sqlite3 = require("sqlite3").verbose();

const app = express();
const PORT = 8000;

// Enable CORS
app.use(cors());

// SQLite Database connection
const db = new sqlite3.Database("./video_game_library.sqlite", sqlite3.OPEN_READWRITE, (err) => {
    if (err) {
        console.error("Error connecting to the SQLite database:", err.message);
        process.exit(1); // Exit if connection fails
    }
    console.log("Connected to the SQLite database!");
});

// Endpoint to search games by genre
app.get("/searchByGenre", (req, res) => {
    const genre = req.query.genre;
    if (!genre) {
        res.status(400).send("Genre parameter is required");
        return;
    }

    const query = `
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
    `;

    db.all(query, [genre], (err, rows) => {
        if (err) {
            console.error("Error executing search query:", err.message);
            res.status(500).send("Search query failed");
            return;
        }
        res.json(rows);
    });
});


// Endpoint to search games by genre
app.get("/searchByGenre", (req, res) => {
    const genre = req.query.genre;
    if (!genre) {
        res.status(400).send("Genre parameter is required");
        return;
    }

    const query = `
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
    `;
    db.all(query, [genre], (err, rows) => {
        if (err) {
            console.error("Error executing search query:", err.message);
            res.status(500).send("Search query failed");
            return;
        }
        res.json(rows);
    });
});

// Endpoint to fetch game details by ID
app.get("/game/:id", (req, res) => {
    const gameID = req.params.id;
    const query = `
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
    `;
    db.get(query, [gameID], (err, row) => {
        if (err) {
            console.error("Error fetching game details:", err.message);
            res.status(500).send("Failed to fetch game details");
            return;
        }
        res.json(row || {});
    });
});

// Start the server
app.listen(PORT, () => {
    console.log(`Server is running on http://localhost:${PORT}`);
});
