-- Q1: Will Title (MOVIES) and Comment (REVIEWS) work with UNION?
-- Answer: Yes, provided they are both string data types (VARCHAR).

-- Q2: Union 'PG' movies (Family) and 'R' movies (Adult).
SELECT Title, 'Family' AS Label FROM MOVIES WHERE Rating = 'PG'
UNION
SELECT Title, 'Adult' AS Label FROM MOVIES WHERE Rating = 'R';

-- Q3: Why is UNION ALL faster than UNION?
-- Answer: UNION ALL does not check for and remove duplicates.

-- Q4: Create a single list of all unique IDs.
SELECT MovieID AS ID FROM MOVIES
UNION
SELECT UserID FROM USERS
UNION
SELECT ReviewID FROM REVIEWS;

-- Q5: Where does the ORDER BY clause need to go for a stacked list?
-- Answer: At the very end of the final query in the UNION chain.