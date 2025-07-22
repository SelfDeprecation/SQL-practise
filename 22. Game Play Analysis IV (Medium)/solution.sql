-- Problem description:

-- Table: Activity
-- +--------------+---------+
-- | Column Name  | Type    |
-- +--------------+---------+
-- | player_id    | int     |
-- | device_id    | int     |
-- | event_date   | date    |
-- | games_played | int     |
-- +--------------+---------+
-- (player_id, event_date) is the primary key (combination of columns with unique values) of this table.
-- This table shows the activity of players of some games.
-- Each row is a record of a player who logged in and played a number of games (possibly 0) before logging out on someday using some device.

-- Write a solution to report the fraction of players that logged in again on the day after the day they first logged in, rounded to 2 decimal places.
-- In other words, you need to determine the number of players who logged in on the day immediately following their initial login, and divide it by the number of total players.

-- Solution code:

WITH first_login AS (
    SELECT player_id, min(event_date) AS event_date FROM Activity
    GROUP BY player_id
)

SELECT ROUND(COUNT(*) FILTER (WHERE a.event_date - f.event_date = 1) * 1.0 / COUNT(DISTINCT a.player_id), 2) AS fraction
FROM Activity a
LEFT JOIN first_login f ON a.player_id = f.player_id
