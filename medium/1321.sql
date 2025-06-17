+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| customer_id   | int     |
| name          | varchar |
| visited_on    | date    |
| amount        | int     |
+---------------+---------+
In SQL,(customer_id, visited_on) is the primary key for this table.
This table contains data about customer transactions in a restaurant.
visited_on is the date on which the customer with ID (customer_id) has visited the restaurant.
amount is the total paid by a customer.
 

You are the restaurant owner and you want to analyze a possible expansion (there will be at least one customer every day).

Compute the moving average of how much the customer paid in a seven days window (i.e., current day + 6 days before). average_amount should be rounded to two decimal places.

WITH daily AS (
  SELECT visited_on, SUM(amount) AS total_amount
  FROM Customer
  GROUP BY visited_on
),
rolling AS (
  SELECT 
    visited_on,
    SUM(total_amount) OVER (
      ORDER BY visited_on 
      ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
    ) AS sum_amount,
    ROUND(AVG(total_amount) OVER (
      ORDER BY visited_on 
      ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
    ), 2) AS average_amount,
    ROW_NUMBER() OVER (ORDER BY visited_on) AS rn
  FROM daily
)
SELECT 
  visited_on,
  sum_amount AS amount,
  average_amount
FROM rolling
WHERE rn >= 7;
