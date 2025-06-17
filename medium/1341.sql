+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| movie_id      | int     |
| title         | varchar |
+---------------+---------+
movie_id is the primary key (column with unique values) for this table.
title is the name of the movie.
 

Table: Users

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| user_id       | int     |
| name          | varchar |
+---------------+---------+
user_id is the primary key (column with unique values) for this table.
The column 'name' has unique values.
Table: MovieRating

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| movie_id      | int     |
| user_id       | int     |
| rating        | int     |
| created_at    | date    |
+---------------+---------+
(movie_id, user_id) is the primary key (column with unique values) for this table.
This table contains the rating of a movie by a user in their review.
created_at is the users review date. 
 

Write a solution to:

Find the name of the user who has rated the greatest number of movies. In case of a tie, return the lexicographically smaller user name.
Find the movie name with the highest average rating in February 2020. In case of a tie, return the lexicographically smaller movie name.

WITH most_ratings AS (
    SELECT name, COUNT(*) as rating_count
    FROM Users a JOIN MovieRating b ON (a.user_id = b.user_id)
    GROUP BY a.user_id
    ORDER BY rating_count DESC, name ASC
    LIMIT 1
),
highest_avg AS (
    SELECT title, AVG(rating) as average_rating
    FROM MovieRating a JOIN Movies b ON (a.movie_id = b.movie_id)
    WHERE MONTH(created_at) = 2 AND YEAR(created_at) = 2020
    GROUP BY a.movie_id
    ORDER BY average_rating DESC, title ASC
    LIMIT 1
)
SELECT name as results
FROM most_ratings
UNION ALL
SELECT title as results
FROM highest_avg;
