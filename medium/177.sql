+-------------+------+
| Column Name | Type |
+-------------+------+
| id          | int  |
| salary      | int  |
+-------------+------+
id is the primary key (column with unique values) for this table.
Each row of this table contains information about the salary of an employee.
 

Write a solution to find the nth highest distinct salary from the Employee table. If there are less than n distinct salaries, return null.

CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
  RETURN (
      # Write your MySQL query statement below.
WITH cte AS (
    SELECT *, DENSE_RANK() OVER (ORDER BY salary DESC) as rnk
    FROM Employee
)
SELECT salary
FROM cte
WHERE rnk = N
LIMIT 1
);
END
