-- Problem description:

-- Table: Products
-- +---------------+---------+
-- | Column Name   | Type    |
-- +---------------+---------+
-- | product_id    | int     |
-- | new_price     | int     |
-- | change_date   | date    |
-- +---------------+---------+
-- (product_id, change_date) is the primary key (combination of columns with unique values) of this table.
-- Each row of this table indicates that the price of some product was changed to a new price at some date.
-- Initially, all products have price 10.

-- Write a solution to find the prices of all products on the date 2019-08-16.
-- Return the result table in any order.

-- Solution code:

WITH Normal AS (
    SELECT product_id, MAX(change_date) AS change_date
    FROM Products
    WHERE change_date <= '2019-08-16' OR 
    product_id NOT IN (SELECT product_id FROM Products WHERE change_date <= '2019-08-16')
    GROUP BY product_id
)

SELECT n.product_id, 
    CASE
        WHEN n.change_date <= '2019-08-16' THEN p.new_price
        ELSE 10
    END AS price
FROM Normal n
LEFT JOIN Products p ON n.product_id = p.product_id AND n.change_date = p.change_date
