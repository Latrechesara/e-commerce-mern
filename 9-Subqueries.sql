-- Q1: Why do you get an error if your WHERE subquery returns more than one column?
-- Answer: A comparison operator (like =) expects a single value; providing 
-- multiple columns makes the comparison ambiguous.

-- Q2: Select all MOVIES where the MovieID is in the list of movies reviewed by 'alex@email.com'.
SELECT * FROM MOVIES 
WHERE MovieID IN (
    SELECT MovieID FROM REVIEWS 
    WHERE UserID = (SELECT UserID FROM USERS WHERE Email = 'alex@email.com')
);


    
    
-- Q3: What is a "Derived Table" and why must it have an Alias?
-- Answer: A derived table is a subquery used in the FROM clause. It requires 
-- an alias so the outer query can reference its "virtual" columns.

-- Q4: How would you use a subquery to find all movies released after 'The Dark Knight' (2008)?
SELECT * FROM MOVIES 
WHERE ReleaseYear > (
    SELECT ReleaseYear FROM MOVIES WHERE Title = 'The Dark Knight'
);

-- Q5: Can a subquery be used inside another subquery?
-- Answer: Yes, this is called "Multiple Nesting".
-- Q5: Can a subquery be used inside another subquery?
-- Answer: Yes, this is called "Multiple Nesting".

-- Example: Find the titles of movies reviewed by 'alex@email.com'
SELECT Title 
FROM MOVIES 
WHERE MovieID IN (
    -- Subquery Level 1: Get MovieIDs from the REVIEWS table
    SELECT MovieID 
    FROM REVIEWS 
    WHERE UserID = (
        -- Subquery Level 2 (Nested): Get the UserID from the USERS table using an email
        SELECT UserID 
        FROM USERS 
        WHERE Email = 'alex@email.com'
    )
);