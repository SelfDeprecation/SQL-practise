-- Problem description:

-- Table: Customer
-- +---------------+---------+
-- | Column Name   | Type    |
-- +---------------+---------+
-- | customer_id   | int     |
-- | name          | varchar |
-- | visited_on    | date    |
-- | amount        | int     |
-- +---------------+---------+
-- In SQL,(customer_id, visited_on) is the primary key for this table.
-- This table contains data about customer transactions in a restaurant.
-- visited_on is the date on which the customer with ID (customer_id) has visited the restaurant.
-- amount is the total paid by a customer.
 
-- You are the restaurant owner and you want to analyze a possible expansion (there will be at least one customer every day).
-- Compute the moving average of how much the customer paid in a seven days window (i.e., current day + 6 days before). average_amount should be rounded to two decimal places.

-- Return the result table ordered by visited_on in ascending order.

-- Solution code:

WITH skip_days AS (
    SELECT DISTINCT visited_on FROM Customer
    ORDER BY visited_on ASC
    OFFSET 6
)

SELECT s.visited_on, SUM(c.amount) AS amount, ROUND(SUM(c.amount) / 7., 2) AS average_amount
FROM skip_days s
JOIN Customer c ON c.visited_on BETWEEN s.visited_on - 6 AND s.visited_on
GROUP BY s.visited_on
