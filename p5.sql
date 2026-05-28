-- Aufgabe 1
-- Zeigen Sie ein Mitwirkendenverzeichnis (Vor- und Nachname) aller Filme (Filmtitel) mit Tätigkeit an, einmal mit und einmal ohne das Schlüsselwort "WHERE" zu verwenden. Sortieren Sie die Nachnamen absteigend. Hinweis: Hierfür werden die Tabellen PERSONS und PERSONSMOVIES benötigt.

SELECT p.firstname, p.lastname, m.title, pm.role
FROM PERSONSMOVIES pm
    INNER JOIN Persons p ON p.person_id = pm.person_id
    INNER JOIN Movies m ON m.movie_id = pm.movie_id;


SELECT p.firstname, p.lastname, m.title, pm.role
FROM PERSONSMOVIES pm, Persons p, Movies m
WHERE pm.person_id = p.person_id
  AND pm.movie_id = m.movie_id;

-- Aufgabe 2
-- Welcher Regisseur hat mit welchem Film das höchste Einspielergebnis in der Eröffnungswoche eingespielt?
SELECT m.title, p.firstname, p.lastname, m.profit
FROM PERSONSMOVIES pm
    INNER JOIN Persons p ON p.person_id = pm.person_id
    INNER JOIN Movies m ON m.movie_id = pm.movie_id
WHERE m.profit > (SELECT AVG(m.profit) from Movies m);

-- Aufgabe 3
-- Erstellen Sie eine Abfrage um Filme mit ihrem Genre anzuzeigen, deren Budget genauso hoch ist wie das (irgend-) eines Actionsfilms. Sortieren Sie die Filme alphabetisch. Geben Sie dabei Actionfilme nicht mit aus.
-- a) verwenden Sie einen(!) Subquery
SELECT m.movie_id, m.title, m.budget, g.name FROM movies m
    INNER JOIN genres g ON m.genre_id = g.genre_id
    WHERE g.name != 'Action' AND m.budget IN (SELECT m.budget FROM movies m JOIN genres g ON m.genre_id = g.genre_id WHERE g.name = 'Action');
-- b) verwenden Sie keinen Subquery
SELECT DISTINCT m.movie_id, m.title, m.budget, g.name
FROM movies m
    INNER JOIN genres g ON m.genre_id = g.genre_id
    INNER JOIN movies m2 ON m.budget = m2.budget AND m2.genre_id = 4
WHERE m.genre_id != 4;

-- Aufg. 4
-- Erstellen Sie eine Abfrage, um die Filme mit ihrem Gewinn anzuzeigen, die mehr Gewinn erzielt haben als jeder Actionfilm. Sortieren Sie das Ergebnis absteigend nach dem Einspielergebnis.
-- a) mit Subquery, der den maximalen Gewinn eines Actionfilmes ermittelt
SELECT title, profit
FROM movies
WHERE profit > (SELECT MAX(profit) FROM movies WHERE genre_id = 4)
ORDER BY profit DESC;
-- b) ohne Subquery
SELECT m.title, m.profit
FROM movies m
    INNER JOIN movies a ON a.genre_id = 4
WHERE m.profit > a.profit
GROUP BY m.title, m.profit
HAVING m.profit > MAX(a.profit)
ORDER BY m.profit DESC;

--Aufgabe 5
-- Geben Sie alle Personen mit Anzahl der Filme aus, die an mehr als einem Film mitgewirkt haben an.
SELECT p.firstname, p.lastname, COUNT(pm.movie_id) AS anzahl_filme
FROM persons p
    INNER JOIN personsmovies pm ON p.person_id = pm.person_id
GROUP BY p.person_id, p.firstname, p.lastname
HAVING COUNT(pm.movie_id) > 1;

SELECT m.title, g.name, p.firstname, p.lastname

FROM movies m

INNER JOIN genres g

ON m.genre_id = g.genre_id

INNER JOIN personsmovies pm

ON pm.movie_id = m.movie_id

INNER JOIN persons p

ON p.person_id = pm.person_id;