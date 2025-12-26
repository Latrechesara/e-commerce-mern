-- Q1: If you want a list of all users and any reviews they've written (including users who haven't written any), would you use INNER or LEFT join?
-- LEFT JOIN.

-- Q2: Write a query to join USERS and REVIEWS on the UserID column.
SELECT USERS.Email, REVIEWS.Comment 
FROM USERS 
INNER JOIN REVIEWS ON USERS.UserID = REVIEWS.UserID;

-- Q3: Why do we use m1.MovieID <> m2.MovieID in a self-join?
-- To prevent a row from matching with itself.

-- Q4: In a LEFT JOIN between MOVIES and REVIEWS, what value appears in the review columns if a movie has no reviews?
-- NULL.

-- Q5: How many JOIN statements do you need to connect 3 tables together?
-- 2 JOIN statements.

-- 1. INNER JOIN (Only users who wrote reviews)
SELECT USERS.Email, REVIEWS.Comment
FROM USERS
INNER JOIN REVIEWS ON USERS.UserID = REVIEWS.UserID;

-- 2. LEFT JOIN (All users, even those with 0 reviews)
SELECT USERS.Email, REVIEWS.Comment
FROM USERS
LEFT JOIN REVIEWS ON USERS.UserID = REVIEWS.UserID;

-- 3. RIGHT JOIN (All movies, even those with no reviews)
SELECT MOVIES.Title, REVIEWS.Comment
FROM REVIEWS
RIGHT JOIN MOVIES ON REVIEWS.MovieID = MOVIES.MovieID;

-- 4. SELF JOIN (Find movies released in the same year)
SELECT m1.Title AS Movie_A, m2.Title AS Movie_B, m1.ReleaseYear
FROM MOVIES m1
JOIN MOVIES m2 ON m1.ReleaseYear = m2.ReleaseYear
WHERE m1.MovieID <> m2.MovieID;

-- 5. FULL JOIN (Everything from both tables - Note: MySQL uses UNION for this)

SELECT USERS.Email, REVIEWS.Comment FROM USERS LEFT JOIN REVIEWS ON USERS.UserID = REVIEWS.UserID
UNION
SELECT USERS.Email, REVIEWS.Comment FROM USERS RIGHT JOIN REVIEWS ON USERS.UserID = REVIEWS.UserID;

-- Example 1: INNER JOIN (Only show users who wrote reviews and the specific movie title)
-- This query returns only the rows where a match exists across all three tables.
SELECT USERS.Email, MOVIES.Title, REVIEWS.Comment
FROM REVIEWS
JOIN USERS ON REVIEWS.UserID = USERS.UserID
JOIN MOVIES ON REVIEWS.MovieID = MOVIES.MovieID;

-- Example 2: LEFT JOIN (Show ALL users, their reviews, and the movie titles)
-- If a user has not written a review, the Title and Comment will show as NULL.
SELECT USERS.Email, MOVIES.Title, REVIEWS.Comment
FROM USERS
LEFT JOIN REVIEWS ON USERS.UserID = REVIEWS.UserID
LEFT JOIN MOVIES ON REVIEWS.MovieID = MOVIES.MovieID;


SELECT USERS.Email, REVIEWS.Comment
FROM USERS
INNER JOIN REVIEWS ON USERS.UserID = REVIEWS.UserID;  


-- Example 3: Comprehensive Report (Filtering and Joining)
-- Get reviews for movies released after 2010, showing the user's email.
SELECT USERS.Email, MOVIES.Title, MOVIES.ReleaseYear, REVIEWS.Comment
FROM REVIEWS
JOIN USERS ON REVIEWS.UserID = USERS.UserID
JOIN MOVIES ON REVIEWS.MovieID = MOVIES.MovieID
WHERE MOVIES.ReleaseYear > 2010;

