-- Create Library table
CREATE TABLE IF NOT EXISTS Library (
    EmpID INT PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100),
    Salary DECIMAL(10, 2)
);

-- Create Client table
CREATE TABLE IF NOT EXISTS Client (
    ClientID INT PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100),
    Address VARCHAR(255),
    PaymentMethods VARCHAR(255)
);

-- Create VideoGame table
CREATE TABLE IF NOT EXISTS VideoGame (
    GameID INT PRIMARY KEY,
    Title VARCHAR(100),
    Platform VARCHAR(100),
    Genre VARCHAR(50),
    ReleaseYear INT,
    Developer VARCHAR(100),
    Publisher VARCHAR(100)
);

-- Create GameCopy table
CREATE TABLE IF NOT EXISTS GameCopy (
    GameCopyID INT PRIMARY KEY,
    GameID INT,
    Borrowed BOOLEAN,
    NoOfCopies INT,
    FOREIGN KEY (GameID) REFERENCES VideoGame(GameID)
);

-- Create LendingTransactions table
CREATE TABLE IF NOT EXISTS LendingTransactions (
    TransactionID INT PRIMARY KEY,
    ClientID INT,
    GameCopyID INT,
    BorrowDate DATE,
    DueDate DATE,
    ReturnDate DATE,
    Fee DECIMAL(10, 2),
    FOREIGN KEY (ClientID) REFERENCES Client(ClientID),
    FOREIGN KEY (GameCopyID) REFERENCES GameCopy(GameCopyID)
);

-- Create Manage table
CREATE TABLE IF NOT EXISTS Manage (
    EmpID INT,
    TransactionID INT,
    Responsibility VARCHAR(100),
    PRIMARY KEY (EmpID, TransactionID),
    FOREIGN KEY (EmpID) REFERENCES Library(EmpID),
    FOREIGN KEY (TransactionID) REFERENCES LendingTransactions(TransactionID)
);

-- Create Genre table
CREATE TABLE IF NOT EXISTS Genre (
    GenreID INT PRIMARY KEY,
    Name VARCHAR(50)
);

-- Create VideoGameGenre table
CREATE TABLE IF NOT EXISTS VideoGameGenre (
    GameID INT,
    GenreID INT,
    PRIMARY KEY (GameID, GenreID),
    FOREIGN KEY (GameID) REFERENCES VideoGame(GameID),
    FOREIGN KEY (GenreID) REFERENCES Genre(GenreID)
);

-- Create video_game_library table
CREATE TABLE IF NOT EXISTS video_game_library (
    GameID INT PRIMARY KEY,
    Name VARCHAR(100),
    Genre VARCHAR(50),
    Price DECIMAL(10, 2),
    AvailabilityStatus BOOLEAN
);

-- Insert mock data into video_game_library
INSERT IGNORE INTO video_game_library (GameID, Name, Genre, Price, AvailabilityStatus) VALUES
(1, 'The Legend of Zelda', 'Adventure', 59.99, 1),
(2, 'Call of Duty', 'Action', 49.99, 0),
(3, 'FIFA 24', 'Sports', 39.99, 1),
(4, 'The Sims 4', 'Simulation', 19.99, 1),
(5, 'Minecraft', 'Sandbox', 29.99, 0);
