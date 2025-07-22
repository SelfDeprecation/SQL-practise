-- Problem description:

-- Table: Movies
-- +---------------+---------+
-- | Column Name   | Type    |
-- +---------------+---------+
-- | movie_id      | int     |
-- | title         | varchar |
-- +---------------+---------+
-- movie_id is the primary key (column with unique values) for this table.
-- title is the name of the movie.
 
-- Table: Users
-- +---------------+---------+
-- | Column Name   | Type    |
-- +---------------+---------+
-- | user_id       | int     |
-- | name          | varchar |
-- +---------------+---------+
-- user_id is the primary key (column with unique values) for this table.
-- The column 'name' has unique values.

-- Table: MovieRating
-- +---------------+---------+
-- | Column Name   | Type    |
-- +---------------+---------+
-- | movie_id      | int     |
-- | user_id       | int     |
-- | rating        | int     |
-- | created_at    | date    |
-- +---------------+---------+
-- (movie_id, user_id) is the primary key (column with unique values) for this table.
-- This table contains the rating of a movie by a user in their review.
-- created_at is the user's review date. 
 
-- Write a solution to:
-- Find the name of the user who has rated the greatest number of movies. In case of a tie, return the lexicographically smaller user name.
-- Find the movie name with the highest average rating in February 2020. In case of a tie, return the lexicographically smaller movie name.

-- Solution code:

WITH Rates AS (
    SELECT u.name AS results, COUNT(*) AS count FROM Users u
    LEFT JOIN MovieRating mr ON u.user_id = mr.user_id
    GROUP BY u.name
    ORDER BY u.name
), Ratings AS (
    SELECT m.title AS results, AVG(rating) AS rating FROM Movies m
    LEFT JOIN MovieRating mr ON m.movie_id = mr.movie_id
    WHERE mr.created_at >= '2020-02-01' AND mr.created_at <= '2020-02-29'
    GROUP BY m.title
    ORDER BY m.title
)

(SELECT results FROM Rates WHERE count = (SELECT MAX(count) FROM Rates) LIMIT 1)
UNION ALL
(SELECT results FROM Ratings WHERE rating = (SELECT MAX(rating) FROM Ratings) LIMIT 1);
