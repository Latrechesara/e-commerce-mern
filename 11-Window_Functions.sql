-- Q1: Main difference between GROUP BY and Window Functions?
-- Answer: GROUP BY collapses rows into a single summary; Window Functions 
-- perform calculations while keeping all individual rows visible.

-- Q2: Show Review Comment and the total count of reviews by that user.
SELECT Comment, 
       COUNT(*) OVER(PARTITION BY UserID) AS User_Total_Reviews
FROM REVIEWS;

-- Q3: Difference between RANK() and DENSE_RANK() for ties?
-- Answer: RANK() leaves a gap in the next numbering (e.g., 1, 1, 3). 
-- DENSE_RANK() does not leave a gap (e.g., 1, 1, 2).

-- Q4: Rolling Sum of movie IDs within each Rating group.
SELECT Rating, MovieID, 
       SUM(MovieID) OVER(PARTITION BY Rating ORDER BY MovieID) AS Rolling_Sum
FROM MOVIES;

-- Q5: Can you use a Window Function in a WHERE clause directly?
-- Answer: No, you must wrap it in a Subquery or CTE.