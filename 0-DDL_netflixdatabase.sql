CREATE DATABASE NetflixDB;
USE NetflixDB;
SHOW TABLES;

CREATE TABLE MOVIES (
    MovieID INT PRIMARY KEY,
    Title VARCHAR(100) NOT NULL,
    ReleaseYear INT,
    Rating CHAR(5) DEFAULT 'NR'
);

CREATE TABLE USERS (
    UserID INT PRIMARY KEY,
    Email VARCHAR(50) UNIQUE NOT NULL,
    JoinDate DATE NOT NULL,
    MembershipID CHAR(12) UNIQUE
);

CREATE TABLE REVIEWS (
    ReviewID INT PRIMARY KEY,
    MovieID INT,
    UserID INT,
    Comment VARCHAR(250) NOT NULL,
    FOREIGN KEY (MovieID) REFERENCES MOVIES(MovieID),
    FOREIGN KEY (UserID) REFERENCES USERS(UserID)
);
DESC MOVIES;

SHOW TABLES;
-- 1. Adding a new column for movie genres
-- ALTER TABLE MOVIES ADD Genre VARCHAR(30);

-- 2. Increasing the character limit for User Emails
-- ALTER TABLE USERS MODIFY Email VARCHAR(100);

-- 3. Deleting the reviews table permanently
-- DROP TABLE REVIEWS;

-- inserting into  Movies table
INSERT INTO MOVIES VALUES (101, 'The Dark Knight', 2008, 'PG-13');
INSERT INTO MOVIES VALUES (102, 'Interstellar', 2014, 'PG-13');
INSERT INTO MOVIES VALUES (103, 'Inception', 2010, 'PG-13');
INSERT INTO MOVIES VALUES (104, 'The Irishman', 2019, 'R');
INSERT INTO MOVIES VALUES (105, 'Glass Onion', 2022, 'PG-13');
INSERT INTO MOVIES VALUES (106, 'Spider-Man: Across the Spider-Verse', 2023, 'PG');
INSERT INTO MOVIES VALUES (107, 'The Godfather', 1972, 'R');
INSERT INTO MOVIES VALUES (108, 'Klaus', 2019, 'PG');
-- inserting into Users

INSERT INTO USERS VALUES (1, 'alex@email.com', '2023-01-10', 'MEMB10000001');
INSERT INTO USERS VALUES (2, 'sara@email.com', '2023-02-15', 'MEMB10000002');
INSERT INTO USERS VALUES (3, 'mike@email.com', '2023-03-20', 'MEMB10000003');
INSERT INTO USERS VALUES (4, 'lina@email.com', '2023-05-05', 'MEMB10000004');
INSERT INTO USERS VALUES (5, 'john@email.com', '2023-06-12', 'MEMB10000005');
INSERT INTO USERS VALUES (6, 'emma@email.com', '2023-08-30', 'MEMB10000006');
INSERT INTO USERS VALUES (7, 'david@email.com', '2023-09-14', 'MEMB10000007');

-- inserting into REVIEW TABLE
INSERT INTO REVIEWS VALUES (501, 101, 1, 'Incredible performance by Heath Ledger.');
INSERT INTO REVIEWS VALUES (502, 102, 2, 'Cried my eyes out, 10/10.');
INSERT INTO REVIEWS VALUES (503, 103, 1, 'Needed to watch it twice to understand!');
INSERT INTO REVIEWS VALUES (504, 104, 3, 'A bit long but the acting is top-tier.');
INSERT INTO REVIEWS VALUES (505, 105, 4, 'Very fun mystery, loved the setting.');
INSERT INTO REVIEWS VALUES (506, 106, 5, 'The animation style is groundbreaking.');
INSERT INTO REVIEWS VALUES (507, 101, 2, 'Classic! I watch this once a year.');
INSERT INTO REVIEWS VALUES (508, 102, 6, 'Scientific and beautiful.');


