+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| num         | varchar |
+-------------+---------+
In SQL, id is the primary key for this table.
id is an autoincrement column starting from 1.
 

Find all numbers that appear at least three times consecutively.

Return the result table in any order.

SELECT DISTINCT(num) as ConsecutiveNums
FROM (SELECT *, LEAD(num, 1) OVER (ORDER BY id) as next_num, LEAD(num, 2) OVER (ORDER BY id) as next2_num
FROM Logs) as sub
WHERE num = next_num AND num = next2_num;
