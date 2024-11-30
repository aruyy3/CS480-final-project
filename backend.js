const express = require("express");
const cors = require("cors");
const mysql = require("mysql");

const app = express();
const PORT = 3000;

// Enable CORS
app.use(cors());

// MySQL Database configuration
const dbConfig = {
    host: "localhost",
    user: "root",
    password: "",
    database: "video_game_library",
    port: 3306
};

// Create a MySQL connection
const db = mysql.createConnection(dbConfig);

// Handle connection errors
db.connect((err) => {
    if (err) {
        console.error("Error connecting to database:", err);
        process.exit(1); // Exit on connection failure
    }
    console.log("Connected to the database!");
});

// Endpoint to fetch all genres
app.get("/genres", (req, res) => {
    const query = "SELECT DISTINCT Name AS Genre FROM Genre ORDER BY Name ASC;";
    db.query(query, (err, results) => {
        if (err) {
            console.error("Error retrieving genres:", err);
            res.status(500).send("Failed to retrieve genres");
            return;
        }
        res.json(results);
    });
});

// Endpoint to search games by genre
app.get("/search", (req, res) => {
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

    db.query(query, [genre], (err, results) => {
        if (err) {
            console.error("Error executing search query:", err);
            res.status(500).send("Search query failed");
            return;
        }
        res.json(results);
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

    db.query(query, [gameID], (err, results) => {
        if (err) {
            console.error("Error fetching game details:", err);
            res.status(500).send("Failed to fetch game details");
            return;
        }
        res.json(results[0] || {});
    });
});

// Start the server
app.listen(PORT, () => {
    console.log(`Server is running on http://localhost:${PORT}`);
});
