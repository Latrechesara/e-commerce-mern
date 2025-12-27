-- -------------------------------------------------------------------------
-- NetflixDB Stored Procedures Tutorial
-- -------------------------------------------------------------------------

-- 1. Setup the context
USE NetflixDB;

-- First, let's just write a super simple query to find highly rated movies
SELECT *
FROM MOVIES
WHERE Rating >= 8.5;

-- Now let's put this into a stored procedure.
-- Question: How do we save this logic for later use?
CREATE PROCEDURE high_rated_movies()
SELECT *
FROM MOVIES
WHERE Rating >= 8.5;

-- Now if we run this it will work and create the stored procedure.
-- If we want to call it and use it, we say:
CALL high_rated_movies();

-- As you can see, it ran the query inside the stored procedure we created.

-- -------------------------------------------------------------------------

-- Now, how we have written it is not actually best practice.
-- Usually, when writing a stored procedure, you want multiple or more complex queries.

-- If we tried to add another query to this stored procedure without special markers, it wouldn't work:
-- The following would fail to include the second SELECT in the procedure:
CREATE PROCEDURE movie_and_user_check()
SELECT * FROM MOVIES WHERE ReleaseYear > 2020;
SELECT * FROM USERS; 

-- Best practice is to use a DELIMITER and a BEGIN and END block.
-- The delimiter is what separates queries (default is ;). We change it to $$ 
-- so the database reads the whole block as one unit.



DELIMITER $$
CREATE PROCEDURE movie_and_user_check()
BEGIN
    -- Query 1
    SELECT * FROM MOVIES 
    WHERE ReleaseYear > 2020;
    
    -- Query 2
    SELECT * FROM USERS 
    WHERE JoinDate > '2023-01-01';
END $$
DELIMITER ;

-- Now we change the delimiter back to the default semicolon (;).
-- Let's run this stored procedure:
CALL movie_and_user_check();

-- You will see 2 outputs because we had 2 queries inside the block!

-- -------------------------------------------------------------------------

-- We can also use a safer way to create procedures by dropping them if they already exist.
-- This is common in professional scripts to avoid "already exists" errors.

DROP PROCEDURE IF EXISTS get_all_reviews;

DELIMITER $$
CREATE PROCEDURE get_all_reviews()
BEGIN
    SELECT M.Title, R.Comment, U.Email
    FROM REVIEWS R
    JOIN MOVIES M ON R.MovieID = M.MovieID
    JOIN USERS U ON R.UserID = U.UserID;
END $$
DELIMITER ;

CALL get_all_reviews();

-- -------------------------------------------------------------------------

-- Finally, we can also add PARAMETERS.
-- This allows us to pass a specific value into the procedure to filter results dynamically.
-- Question: How do I find reviews for ONLY a specific Movie ID?

DROP PROCEDURE IF EXISTS get_reviews_by_movie;

DELIMITER $$
-- We add (movie_id_param INT) to define the input
CREATE PROCEDURE get_reviews_by_movie(movie_id_param INT)
BEGIN
    SELECT M.Title, R.Comment
    FROM REVIEWS R
    JOIN MOVIES M ON R.MovieID = M.MovieID
    WHERE M.MovieID = movie_id_param;
END $$
DELIMITER ;

-- Now, when we CALL it, we must provide the ID.
-- Let's get reviews for 'Interstellar' (ID: 102)
CALL get_reviews_by_movie(102);

-- Let's get reviews for 'The Dark Knight' (ID: 101)
CALL get_reviews_by_movie(101);