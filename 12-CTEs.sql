-- Q1: What keyword must every CTE start with?
-- Answer: WITH

-- Q2: Write a CTE called User_Activity that selects Email and the count of their reviews,
-- then query it to find users with more than 1 review.
WITH User_Activity AS (
    SELECT u.Email, COUNT(r.ReviewID) AS Review_Count
    FROM USERS u
    JOIN REVIEWS r ON u.UserID = r.UserID
    GROUP BY u.Email
)
SELECT * FROM User_Activity WHERE Review_Count > 1;

-- Q3: Can you use a CTE created at the top of a query inside a later part of the same query?
-- Answer: Yes.

-- Q4: What is the main advantage of using a CTE over a subquery in the FROM clause?
-- Answer: Readability and the ability to reuse the result set within the same statement.

-- Q5: Can you define multiple CTEs in a single WITH statement?
-- Answer: Yes, just separate them with a comma.