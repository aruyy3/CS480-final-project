-- 1. Checks Whether a Specific Game is in Stock
SELECT 
    VG.Title, 
    CASE 
        WHEN GC.Borrowed = FALSE THEN 'In Stock'
        ELSE 'Out of Stock'
    END AS StockStatus
FROM VideoGame VG
JOIN GameCopy GC ON VG.GameID = GC.GameID
WHERE VG.GameID = ?;    /* Replace ? with the specific Game ID provided by the user */

-- 2. Mark a Game as Borrowed
-- This updates the Borrowed status to TRUE.
UPDATE GameCopy
SET 
    Borrowed = TRUE
WHERE GameCopyID = ? AND Borrowed = FALSE;   /* Replace ? with the specific GameCopyID */

-- 3. Mark a Game as Returned
-- This updates the Borrowed status to FALSE.
UPDATE GameCopy
SET 
    Borrowed = FALSE
WHERE GameCopyID = ? AND Borrowed = TRUE;  /* Replace ? with the specific GameCopyID */

-- 4. Add a Game to Inventory (No Additional Copies Logic Needed)
-- This simply resets the Borrowed status to FALSE for an existing game.
UPDATE GameCopy
SET 
    Borrowed = FALSE
WHERE GameID = ?;  /* Replace ? with the specific GameID */

-- 5. Remove a Game from Inventory (No Copies to Remove)
-- If removing a game means marking it unavailable, set Borrowed to TRUE.
UPDATE GameCopy
SET 
    Borrowed = TRUE
WHERE GameID = ?;  /* Replace ? with the specific GameID */
