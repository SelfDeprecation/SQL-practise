-- Problem description:

-- Table: Queue
-- +-------------+---------+
-- | Column Name | Type    |
-- +-------------+---------+
-- | person_id   | int     |
-- | person_name | varchar |
-- | weight      | int     |
-- | turn        | int     |
-- +-------------+---------+
-- person_id column contains unique values.
-- This table has the information about all people waiting for a bus.
-- The person_id and turn columns will contain all numbers from 1 to n, where n is the number of rows in the table.
-- turn determines the order of which the people will board the bus, where turn=1 denotes the first person to board and turn=n denotes the last person to board.
-- weight is the weight of the person in kilograms.
 
-- There is a queue of people waiting to board a bus. However, the bus has a weight limit of 1000 kilograms, so there may be some people who cannot board.
-- Write a solution to find the person_name of the last person that can fit on the bus without exceeding the weight limit.
-- The test cases are generated such that the first person does not exceed the weight limit.
-- Note that only one person can board the bus at any given turn.

-- Solution code:

SELECT person_name
FROM (
    SELECT person_name,
    SUM(weight) OVER (ORDER BY turn) AS current
    FROM Queue
    ORDER BY turn DESC
)
WHERE current <= 1000
LIMIT 1
