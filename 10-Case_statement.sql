-- Q1: Keyword to finish a CASE statement?
-- Answer: END

-- Q2: Label movies 'Long' if MovieID > 105, else 'Short'.
SELECT Title, 
  CASE 
    WHEN MovieID > 105 THEN 'Long' 
    ELSE 'Short' 
  END AS Movie_Length
FROM MOVIES;

-- Q3: Count 'Classic' (Year < 2010) vs 'Modern' (Year >= 2010).
SELECT 
  COUNT(CASE WHEN ReleaseYear < 2010 THEN 1 END) AS Classic,
  COUNT(CASE WHEN ReleaseYear >= 2010 THEN 1 END) AS Modern
FROM MOVIES;

-- Q4: What if no WHEN matches and no ELSE?
-- Answer: It returns NULL.

-- Q5: Multiple WHEN conditions?
-- Answer: Yes.