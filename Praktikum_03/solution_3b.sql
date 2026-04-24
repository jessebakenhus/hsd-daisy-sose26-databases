SELECT distribution, SUM(profit) AS MRDDOLLAR
FROM movies
GROUP BY distribution;