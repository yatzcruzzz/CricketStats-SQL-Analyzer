-- Created a database for the purpose of storing and managing data effectively of Test Cricket Players.
CREATE DATABASE Mens_Test_Cricket_Stats;

-- This function shows all the databases existed in the Schemas.
SHOW DATABASES;

-- This function activates the database in which we want to create tables and run queries.
USE Mens_Test_Cricket_Stats;

-- This function describe the structure of the table. In this case, we have imported the table named as batting_stats.
-- The table store information like players name, matches played, number of innings, runs, highest score, average, half-century, century, and ducks.
DESC batting_stats;

-- Here we have used the "ALTER" function to set the Primary Key of our table "batting_stats". "ID" is the primary key. 
Alter Table batting_stats ADD PRIMARY KEY (ID);

-- Retrieving Top 10 players era who scored most runs.
SELECT Player, Span, Runs
FROM batting_stats
ORDER BY Runs DESC
LIMIT 10;

-- Retrieving top 10 players with highest average.
SELECT Player, Avg
FROM batting_stats
ORDER BY Avg DESC
LIMIT 10;

-- Retrieving top 10 players with highest number of centuries scored in their career.
SELECT Player, Century
FROM batting_stats
ORDER BY Century DESC
LIMIT 10;

-- Retrieving top 10 players with highest number of half-centuries scored in their career.
SELECT Player, HalfCentury
FROM batting_stats
ORDER BY HalfCentury DESC
LIMIT 10;

-- Retrieving 10 players who remained not-out most number of times in their career.
SELECT Player, NotOut
FROM batting_stats
ORDER BY NotOut DESC
LIMIT 10;

-- Retrieving top 10 players who has most number of ducks.
SELECT Player, Duck
FROM batting_stats
ORDER BY Duck Desc
LIMIT 10;

-- Retrieving top 10 players whose highest score is gretaer than 200.
SELECT Player, HS AS Highest_Score
FROM batting_stats
WHERE HS>200
ORDER BY Highest_Score DESC
LIMIT 10;

-- Retrieving top 10 players whose average runs per match is highest.
SELECT Player, Mat, Avg, Runs / Mat AS Avg_Runs_Per_Match
FROM batting_stats
ORDER BY Avg_Runs_Per_Match DESC
LIMIT 10;

-- Retrieving players who scored more than 35 centuries and average more than 50 in their career.
SELECT Player, Runs, HS, Century
FROM batting_stats
WHERE Century>= 35 AND Avg>= 50
ORDER BY Century DESC;

-- Retrieving players who played more than 100 matches in their career.
SELECT Player, Mat, Runs, Avg
FROM batting_stats
WHERE Mat > 100
ORDER BY Mat DESC;

-- Sum Total of all the runs made by all the players in their career.
SELECT SUM(Runs) AS Total_Runs
FROM batting_stats;

-- Ranking top 10 players based on runs scored in their career.
SELECT Player, Runs, RANK() OVER (ORDER BY Runs DESC) AS Ranks
FROM batting_stats
LIMIT 10;

-- Alloting unique number to each row.
SELECT Player, Runs, ROW_NUMBER() OVER (ORDER BY Runs DESC) AS Row_ID
FROM batting_stats
LIMIT 10;

-- Retrieving top 5 players record.
SELECT Player, Mat, Runs, Avg, Century
FROM batting_stats
WHERE Runs > 10000 AND Avg >= 50 AND Mat >= 100 AND Century >= 35
ORDER BY Runs DESC;