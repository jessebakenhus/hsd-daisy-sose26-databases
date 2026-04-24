SELECT COUNT(movie_id) AS Anzahl, genre_id AS Genre_ID

FROM movies

WHERE genre_id IN (1, 3)

GROUP BY genre_id