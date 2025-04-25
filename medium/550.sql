+--------------+---------+
| Column Name  | Type    |
+--------------+---------+
| player_id    | int     |
| device_id    | int     |
| event_date   | date    |
| games_played | int     |
+--------------+---------+
(player_id, event_date) is the primary key (combination of columns with unique values) of this table.
This table shows the activity of players of some games.
Each row is a record of a player who logged in and played a number of games (possibly 0) before logging out on someday using some device.
 

Write a solution to report the fraction of players that logged in again on the day after the day they first logged in, rounded to 2 decimal 
  places. In other words, you need to count the number of players that logged in for at least two consecutive days starting from their first 
  login date, then divide that number by the total number of players.

WITH Login AS (
    SELECT *,
           ROW_NUMBER() OVER (PARTITION BY player_id ORDER BY event_date) AS rn
    FROM Activity
)
SELECT 
    ROUND(
        COUNT(*) * 1.0 / (SELECT COUNT(DISTINCT player_id) FROM Activity), 
        2
    ) AS fraction
FROM Login a JOIN Login b ON a.player_id = b.player_id
WHERE a.rn = 2 AND b.rn = 1 AND a.event_date = DATE_ADD(b.event_date, INTERVAL 1 DAY);
