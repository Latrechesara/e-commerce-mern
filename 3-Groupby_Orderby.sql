
/* SECTION 3: AGGREGATES, GROUP BY, AND SORTING 
*/

-- Q1: How do you write a query to count the Total_Movies for each unique Rating using GROUP BY?
SELECT Rating, COUNT(*) AS Total_Movies 
FROM MOVIES 
GROUP BY Rating;

-- Q2: Write a statement to find the average ReleaseYear per rating.
SELECT Rating, AVG(ReleaseYear) AS AvgReleaseYear 
FROM MOVIES 
GROUP BY Rating;

-- Q3: How can you combine aggregates to see the MIN, MAX, and COUNT of movies for every rating in a single query?
SELECT Rating, MIN(ReleaseYear), MAX(ReleaseYear), COUNT(*) 
FROM MOVIES 
GROUP BY Rating;

-- Q4: What command sorts the movies table alphabetically by Title?
SELECT * FROM MOVIES ORDER BY Title ASC;

-- Q5: How do you display all movies from newest to oldest?
SELECT * FROM MOVIES ORDER BY ReleaseYear DESC;

-- Q6: Write a query to sort users by JoinDate (descending) and then by Email (ascending).
SELECT * FROM USERS 
ORDER BY JoinDate DESC, Email ASC;

-- Q7: How does "Positional Sorting" allow you to sort by ReleaseYear if it is the second column in your SELECT list?
-- You use the number of the column position (2) in the ORDER BY clause.
SELECT Title, ReleaseYear FROM MOVIES ORDER BY 2;

-- Q8: How would you group the users table to count how many subscribers joined on each specific date?
SELECT JoinDate, COUNT(*) AS SubscriberCount 
FROM USERS 
GROUP BY JoinDate;

-- Q9: What is the syntax for a multi-level sort that organizes movies by Rating first and then by Title?
SELECT * FROM MOVIES 
ORDER BY Rating, Title;

