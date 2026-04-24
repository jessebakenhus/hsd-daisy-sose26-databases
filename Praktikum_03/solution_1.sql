SELECT CONCAT_WS(',', 
    movie_id, 
    title, 
    releasedate, 
    genre_id, 
    budget, 
    openingweek, 
    profit, 
    runtime, 
    certificate, 
    sequelof, 
    distribution
) AS CSV_OUTPUT FROM movies;