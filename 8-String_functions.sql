-- Convert Movie Titles to all uppercase
SELECT UPPER(Title) FROM MOVIES;

-- Convert Ratings to all lowercase
SELECT LOWER(Rating) FROM MOVIES;

-- Get the character count of each Movie Title
SELECT Title, LENGTH(Title) AS Title_Length FROM MOVIES;

-- Remove leading and trailing spaces from User emails
SELECT TRIM(Email) FROM USERS;

-- Extract the first 3 characters of a Movie Title
SELECT LEFT(Title, 3) FROM MOVIES;

-- Extract the last 4 characters of a Movie Title
SELECT RIGHT(Title, 4) FROM MOVIES;

-- Extract characters from the 3rd position, taking 4 characters
SELECT SUBSTRING(Title, 3, 4) FROM MOVIES;

-- Replace 'PG-13' with 'Teen' in the Rating column
SELECT REPLACE(Rating, 'PG-13', 'Teen') FROM MOVIES;

-- Find the first numerical position of the letter 'e' in Movie Titles
SELECT LOCATE('e', Title), Title FROM MOVIES;

-- Join Movie Title and ReleaseYear together into one string
SELECT CONCAT(Title, ' (', ReleaseYear, ')') AS Movie_Info FROM MOVIES;


