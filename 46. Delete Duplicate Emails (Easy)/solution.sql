-- Problem description:

-- Table: Person
-- +-------------+---------+
-- | Column Name | Type    |
-- +-------------+---------+
-- | id          | int     |
-- | email       | varchar |
-- +-------------+---------+
-- id is the primary key (column with unique values) for this table.
-- Each row of this table contains an email. The emails will not contain uppercase letters.
 
-- Write a solution to delete all duplicate emails, keeping only one unique email with the smallest id.

-- After running your script, the answer shown is the Person table.
-- The driver will first compile and run your piece of code and then show the Person table.
-- The final order of the Person table does not matter.

-- Solution code:

DELETE FROM Person
WHERE id NOT IN (SELECT MIN(id) FROM Person GROUP BY email)
