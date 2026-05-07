-- ------------------------------------------------------------
-- Aufgabe 1
--
-- Zeigen Sie Titel und Releasedatum aller Filme des Genre „Action“ an. Sortieren Sie nach dem Titel. Hinweis: Nutzen Sie die Tabelle GENRES ( \d GENRES ).
-- ------------------------------------------------------------
SELECT title, releasedate FROM movies LEFT JOIN genres ON movies.genre_id = genres.genre_id WHERE genres.name = 'Action';


-- ------------------------------------------------------------
-- Aufgabe 2
-- Erstellen Sie eine Abfrage, welche Titel, Releasedatum und Genre aller Filme anzeigt. Aktuelle Filme sollen zuerst angezeigt werden.
-- ------------------------------------------------------------
SELECT title, releasedate, genres.name FROM movies LEFT JOIN genres ON movies.genre_id = genres.genre_id ORDER BY releasedate DESC;


-- ------------------------------------------------------------
-- Aufgabe 3
-- Zeigen Sie Filme an, deren Budget mit einem anderen Film übereinstimmt, der mehr als 600 Millionen Dollar eingespielt hat. Schließen Sie beim Vergleich die Ausgabe deselben Films aus. Sortieren Sie nach Titel.
-- ------------------------------------------------------------
SELECT m1.title, m1.budget, m1.profit
FROM movies m1
JOIN movies m2 ON m1.budget = m2.budget
WHERE m2.profit > 600000000
AND m1.movie_id != m2.movie_id
ORDER BY m1.title;

-- ------------------------------------------------------------
-- Aufgabe 5

-- Erstellen Sie eine Abfrage, welche alle Genres mit der Anzahl der Filme ausgibt.
-- Hinweis: Es sollen auch Genres ausgegeben werden, denen kein Film zugeordnet wurde.
-- ------------------------------------------------------------
SELECT genres.name, COUNT(movies.movie_id) AS Anzahl
FROM genres
LEFT JOIN movies ON genres.genre_id = movies.genre_id
GROUP BY genres.name;

-- ------------------------------------------------------------
-- Aufgabe 7
-- Zeigen Sie ein Mitwirkendenverzeichnis (Vor- und Nachname) aller Filme (Filmtitel) an, einmal mit und einmal ohne das Schlüsselwort "WHERE" zu verwenden. Sortieren Sie die Nachnamen absteigend.
-- Hinweis: Hierfür werden die Tabellen PERSONS und PERSONSMOVIES benötigt.
-- ------------------------------------------------------------
SELECT p.firstname, p.lastname, m.title

FROM PERSONSMOVIES pm

    INNER JOIN Persons p ON p.person_id = pm.person_id
    INNER JOIN Movies m ON m.movie_id = pm.movie_id;

-- ------------------------------------------------------------
-- Aufgabe 8
-- Schreiben Sie eine Abfrage, um den kürzesten Film und den längsten Film anzuzeigen.
-- Benennen Sie die ausgegebenen Tupel entsprechend. Hinweis: Hier können Sie eine Vereinigung verwenden. Außerdem können in der WHERE-Klausel ein Subselect verwenden.
-- Benutzen Sie BEZEICHNUNG, RUNTIME und TITLE als Spaltennamen.
-- Die Ausgabe soll so aussehnen:
-- ------------------------------------------------------------
SELECT 'kurz' AS Bezeichnung, runtime, title
FROM movies
WHERE runtime = (SELECT MIN(runtime) FROM movies)

UNION

SELECT 'lang' AS Bezeichnung, runtime, title
FROM movies
WHERE runtime = (SELECT MAX(runtime) FROM movies)

ORDER BY runtime;

