-- Problem description:

-- Table: Employee
-- +-------------+------+
-- | Column Name | Type |
-- +-------------+------+
-- | id          | int  |
-- | salary      | int  |
-- +-------------+------+
-- id is the primary key (column with unique values) for this table.
-- Each row of this table contains information about the salary of an employee.
 
-- Write a solution to find the second highest distinct salary from the Employee table. If there is no second highest salary, return null.

-- Solution code:

SELECT MAX(salary) AS SecondHighestSalary FROM Employee
WHERE salary NOT IN (SELECT MAX(salary) FROM Employee)
