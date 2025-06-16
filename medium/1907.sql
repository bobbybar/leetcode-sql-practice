+-------------+------+
| Column Name | Type |
+-------------+------+
| account_id  | int  |
| income      | int  |
+-------------+------+
account_id is the primary key (column with unique values) for this table.
Each row contains information about the monthly income for one bank account.
 

Write a solution to calculate the number of bank accounts for each salary category. The salary categories are:

"Low Salary": All the salaries strictly less than $20000.
"Average Salary": All the salaries in the inclusive range [$20000, $50000].
"High Salary": All the salaries strictly greater than $50000.
The result table must contain all three categories. If there are no accounts in a category, return 0.

WITH AccountsCat AS (
    SELECT *, CASE WHEN income < 20000 THEN 'Low Salary' WHEN income > 50000 THEN 'High Salary' ELSE 'Average Salary' END as category
    FROM Accounts
)
SELECT categories.category, COALESCE(COUNT(ac.category), 0) AS accounts_count
FROM (
    SELECT 'Low Salary' AS category
    UNION ALL
    SELECT 'Average Salary'
    UNION ALL
    SELECT 'High Salary'
) AS categories
LEFT JOIN AccountsCat ac ON categories.category = ac.category
GROUP BY categories.category;
