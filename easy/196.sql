+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| email       | varchar |
+-------------+---------+
id is the primary key (column with unique values) for this table.
Each row of this table contains an email. The emails will not contain uppercase letters.
 

Write a solution to delete all duplicate emails, keeping only one unique email with the smallest id.

For SQL users, please note that you are supposed to write a DELETE statement and not a SELECT one.

DELETE p
FROM Person p
JOIN (SELECT email, MIN(id) AS min_id
    FROM Person
    GROUP BY email)
AS Keep ON (p.email = keep.email)
WHERE p.id <> min_id;
