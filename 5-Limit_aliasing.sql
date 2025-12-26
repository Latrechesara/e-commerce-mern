-- ==========================================
-- 5. LIMIT & ORDER OF EXECUTION
-- ==========================================

-- Q1: Show the top 10 oldest movies.
SELECT * FROM MOVIES ORDER BY ReleaseYear ASC LIMIT 10;

-- Q2: Select the 5th through 10th users who joined (Skip 4, show 6).
SELECT * FROM USERS ORDER BY JoinDate ASC LIMIT 4, 6;

-- Q3: Purpose of writing SELECT COUNT(*) AS Total_Reviews?
-- Answer: To count rows and provide a descriptive column name (Alias).

-- Q4: If you use LIMIT 5, 2, how many rows are skipped/displayed?
-- Answer: 5 rows are skipped, 2 rows are displayed.

-- Q5: Can an alias be used in the WHERE clause?
-- Answer: No, because WHERE is executed before SELECT.