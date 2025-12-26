

---
/* SECTION 2: WHERE CLAUSES & PATTERN MATCHING (From Image 3)
*/

-- Q1: How do you find all movies released after 2014?
SELECT * FROM MOVIES WHERE ReleaseYear > 2014;

-- Q2: Write a query to find movies with the exact title "Inception".
SELECT * FROM MOVIES WHERE Title = 'Inception';

-- Q3: How do you retrieve movies that are not rated "PG-13"?
SELECT * FROM MOVIES WHERE Rating <> 'PG-13';

-- Q4: What is the difference between using AND and OR when searching for a MovieID and ReleaseYear?
/* AND: Both conditions must be true (e.g., MovieID = 101 AND ReleaseYear = 2008).
   OR: Either condition can be true (e.g., MovieID = 101 OR ReleaseYear = 2023).
*/

-- Q5: How do you filter users who joined after '2023-01-10'?
SELECT * FROM USERS WHERE JoinDate > '2023-01-10';

-- Q6: Using the LIKE operator, how do you find emails starting with "sara"?
SELECT * FROM USERS WHERE Email LIKE 'sara%';
SELECT * FROM users WHERE Email LIKE '_a%';


-- Q7: In pattern matching, what is the specific difference between the % and _ wildcards?
/* %: Represents zero, one, or multiple characters.
   _: Represents exactly one single character.
   
*/

-- Q8: Write a query to find any email starting with 'a' followed by exactly three specific characters.
-- Note: This looks for exactly 4 characters total (a + 3) before the @ or end of string.
SELECT * FROM USERS WHERE Email LIKE 'a___%';
select * from users;
select* from movies;
-- Q9 Write a query to select users who joined between 2023-01-10 and 2023-05-05
SELECT * FROM users WHERE JoinDate BETWEEN '2023-01-10' AND '2023-05-05';
-- Q10 Write a query to select movies where rating is PG or R using OR 
SELECT * FROM MOVIES
WHERE Rating IN ('PG', 'R');

-- Regular Expression 
-- find users whose email start with 'a', 's', or 'm':
SELECT * FROM USERS 
WHERE Email REGEXP '^[asm]';
--  find all movies where the title starts with a letter between A and M:
SELECT * FROM MOVIES 
WHERE Title REGEXP '^[A-M]';
-- find users whose email does not start with the letters 'a' through 'l':
SELECT * FROM USERS 
WHERE Email REGEXP '^[^a-l]';
-- find movies that start with "The" followed by any characters, but specifically for years ending in "2" or "9" (like 1972, 2019, 2022):
SELECT * FROM MOVIES 
WHERE Title REGEXP '^The' 
  AND ReleaseYear REGEXP '[29]$';
