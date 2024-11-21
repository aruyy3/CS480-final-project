
-- Create Library table
CREATE TABLE Library (
    EmpID INT PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100),
    Salary DECIMAL(10, 2)
);

-- Create Client table
CREATE TABLE Client (
    ClientID INT PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100),
    Address VARCHAR(255),
    PaymentMethods VARCHAR(255)
);

-- Create VideoGame table
CREATE TABLE VideoGame (
    GameID INT PRIMARY KEY,
    Title VARCHAR(100),
    Platform VARCHAR(100),
    Genre VARCHAR(50),
    ReleaseYear INT,
    Developer VARCHAR(100),
    Publisher VARCHAR(100)
);

-- Create GameCopy table
CREATE TABLE GameCopy (
    GameCopyID INT PRIMARY KEY,
    GameID INT,
    Borrowed BOOLEAN,
    NoOfCopies INT,
    FOREIGN KEY (GameID) REFERENCES VideoGame(GameID)
);

-- Create LendingTransactions table
CREATE TABLE LendingTransactions (
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
CREATE TABLE Manage (
    EmpID INT,
    TransactionID INT,
    Responsibility VARCHAR(100),
    PRIMARY KEY (EmpID, TransactionID),
    FOREIGN KEY (EmpID) REFERENCES Library(EmpID),
    FOREIGN KEY (TransactionID) REFERENCES LendingTransactions(TransactionID)
);
