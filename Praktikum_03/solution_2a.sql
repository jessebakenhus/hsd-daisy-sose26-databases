SELECT title, genre_id
FROM movies
WHERE genre_id IN (1, 3)
ORDER BY title;