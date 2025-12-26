-- Q1: How do you view all columns in movies?
SELECT * FROM MOVIES;

-- Q2: Write a query to see only the UserID from users.
SELECT UserID FROM USERS;

-- Q3: How would you select Title and ReleaseYear from movies?
SELECT Title, ReleaseYear FROM MOVIES;

-- Q4: Using an alias, how can you display MovieID as ID_movie?
SELECT MovieID AS ID_movie FROM MOVIES;

-- Q5: Write a query to add 10 to ReleaseYear and name the result new_year.
SELECT (ReleaseYear + 10) AS new_year FROM MOVIES;

-- Q6: Which keyword would you use to see only unique values in the Rating column?
-- The keyword is DISTINCT.
SELECT DISTINCT Rating FROM MOVIES;

-- Q7: How do you select Email and rename JoinDate to Subscription_Start?
SELECT Email, JoinDate AS Subscription_Start FROM USERS;



