--1. Checks Wheather a Specific game is there in the stock or not                                                        and displays the number of available copies.

SELECT 
    VG.Title, 
    GC.NoOfCopies, 
    CASE 
        WHEN GC.NoOfCopies > 0 THEN 'In Stock'
        ELSE 'Out of Stock'
    END AS StockStatus
FROM VideoGame VG
JOIN GameCopy GC ON VG.GameID = GC.GameID
WHERE VG.GameID = ?;    /*HERE THE ? is we need to replace this with the specific Game ID added by user*/


--2. Mark a Game as Borrowed 
 This updates the Borrowed status and reduces the available copies by 1.
UPDATE GameCopy
SET 
    Borrowed = TRUE,
    NoOfCopies = 0
WHERE GameCopyID = ? AND NoOfCopies > 0;   /*Same as above here also we need to change the ? with the specific GameCOpyID*/


--3. Mark a Game as Returned 
This updates the Borrowed status and increases the available copies by 1.
UPDATE GameCopy
SET 
    Borrowed = FALSE,
    NoOfCopies =  1
WHERE GameCopyID = ? AND Borrowed = TRUE;  /*HERE THE ? is we need to replace this with the specific Game CopyID*/


--4. Add New Game Copies 
 This adds a specified number of new copies of an existing game to inventory.
UPDATE GameCopy
SET 
    NoOfCopies = NoOfCopies + ?
WHERE GameID = ?;  /*Replace ? with the number of copies and the specific GameID*/

 --5. Remove Copies of a Game 
This removes a specified number of copies from inventory.
 It ensures that the number of copies does not go below zero.
UPDATE GameCopy
SET 
    NoOfCopies = GREATEST(0, NoOfCopies - ?)
WHERE GameID = ?;  /* Replace '?' with the number of copies to remove and the specific GameID*/
