INSERT INTO LendingTransactions (
    TransactionID, ClientID, GameCopyID, BorrowDate, DueDate, ReturnDate, Fee
) VALUES (
    ?, -- Will be randomly generated ID, primary key
    ?, -- Client ID of the user
    ?, -- Game ID of game requested by the user
    ?, -- Borrow date (could use current date, or manually provided)
    ?, -- Due date (could use borrow date plus 7 days)
    NULL, -- Return date (NULL when initially borrowed)
    0.00 -- Fee (update upon return if necessary)
);

UPDATE LendingTransactions
SET ReturnDate = CURDATE(), -- Use actual return date
    Fee = CASE 
        WHEN CURDATE() > DueDate THEN DATEDIFF(CURDATE(), DueDate) * 5 -- Using 5 dollar per day fee, can change
        ELSE 0
    END
WHERE TransactionID = 1; -- Replace with the Transaction ID

INSERT INTO Manage (
    EmpID, TransactionID, Responsibility
) VALUES (
    ?, -- Employee ID provided in the query
    ?, -- Transaction ID
    'Responsibility template'
);

-- Returns all active transactions
SELECT LT.TransactionID, C.Name AS ClientName, VG.Title AS GameTitle, LT.BorrowDate, LT.DueDate
FROM LendingTransactions LT
JOIN Client C ON LT.ClientID = C.ClientID
JOIN GameCopy GC ON LT.GameCopyID = GC.GameCopyID
JOIN VideoGame VG ON GC.GameID = VG.GameID
WHERE LT.ReturnDate IS NULL;

-- Returns all overdue transactions
SELECT LT.TransactionID, C.Name AS ClientName, VG.Title AS GameTitle, LT.BorrowDate, LT.DueDate, DATEDIFF(CURDATE(), LT.DueDate) AS OverdueDays
FROM LendingTransactions LT
JOIN Client C ON LT.ClientID = C.ClientID
JOIN GameCopy GC ON LT.GameCopyID = GC.GameCopyID
JOIN VideoGame VG ON GC.GameID = VG.GameID
WHERE LT.ReturnDate IS NULL AND LT.DueDate < CURDATE();

-- Returns transaction history for client
SELECT LT.TransactionID, VG.Title AS GameTitle, LT.BorrowDate, LT.DueDate, LT.ReturnDate, LT.Fee
FROM LendingTransactions LT
JOIN GameCopy GC ON LT.GameCopyID = GC.GameCopyID
JOIN VideoGame VG ON GC.GameID = VG.GameID
WHERE LT.ClientID = ?; -- Whichever client is being queried

-- Returns all games currently borrowed by a client
SELECT VG.Title AS GameTitle, VG.Platform, LT.BorrowDate, LT.DueDate
FROM LendingTransactions LT
JOIN GameCopy GC ON LT.GameCopyID = GC.GameCopyID
JOIN VideoGame VG ON GC.GameID = VG.GameID
WHERE LT.ClientID = ? -- Whichever client is being queried
  AND LT.ReturnDate IS NULL;


-- Delete transactions for debugging purposes
DELETE FROM LendingTransactions
WHERE TransactionID = ?; -- Replace with Transaction ID

