+-------------+------+
| Column Name | Type |
+-------------+------+
| x           | int  |
| y           | int  |
| z           | int  |
+-------------+------+
In SQL, (x, y, z) is the primary key column for this table.
Each row of this table contains the lengths of three line segments.
 

Report for every three line segments whether they can form a triangle.

Return the result table in any order.

SELECT x, y, z, 
CASE WHEN GREATEST(x, y, z) < x + y + z - GREATEST(x, y, z) THEN 'Yes' ELSE 'No' END as triangle
FROM Triangle;
