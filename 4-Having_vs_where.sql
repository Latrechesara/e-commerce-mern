-- Q1: Why does WHERE AVG(ReleaseYear) > 2010 result in an error?
-- WHERE cannot filter aggregate functions; HAVING must be used.

-- Q2: Write a query to find movie Ratings that have more than 3 films associated with them.
SELECT Rating, COUNT(*) FROM MOVIES GROUP BY Rating HAVING COUNT(*) > 3;

-- Q3: How would you filter your results to show only UserIDs who have an average MovieID higher than 102?
SELECT UserID, AVG(MovieID) FROM REVIEWS GROUP BY UserID HAVING AVG(MovieID) > 102;

-- Q4: Can you use both WHERE and HAVING in the same query? (Hint: Yes! Use WHERE to filter the movies first, then HAVING to filter the groups!).
SELECT Rating, COUNT(*) FROM MOVIES WHERE ReleaseYear > 2000 GROUP BY Rating HAVING COUNT(*) > 1;