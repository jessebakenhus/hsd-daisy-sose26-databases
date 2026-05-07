-- ------------------------------------------------------------
-- Aufgabe 1
--
-- Erstellen Sie eine Abfrage, um alle Daten der Tabelle Movies anzuzeigen. Trennen Sie die Spalten durch ein Komma voneinander. Nennen Sie die Spalte CSV_OUTPUT. Nutzen Sie dafür die String-Verkettung.
-- ------------------------------------------------------------
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
) AS CSV_OUTPUT
FROM movies;


-- ------------------------------------------------------------
-- Aufgabe 2a

-- Zeigen Sie Titel und Genre_ID aller Filme der Genre_IDs 1 und 3 in alphabetischer Reihenfolge nach Titel an.
-- ------------------------------------------------------------
SELECT title, genre_id
FROM movies
WHERE genre_id IN (1, 3)
ORDER BY title;


-- ------------------------------------------------------------
-- Aufgabe 2b

-- Modifizieren Sie Ihre Anweisung derart, dass die Anzahl der Filme jeder Genre_ID ausgegeben wird. Benennen Sie die Spalten in GENRE_ID und ANZAHL um.
-- ------------------------------------------------------------
SELECT
    COUNT(movie_id) AS Anzahl,
    genre_id        AS Genre_ID
FROM movies
WHERE genre_id IN (1, 3)
GROUP BY genre_id;


-- ------------------------------------------------------------
-- Aufgabe 3a
--
-- Schreiben Sie eine Abfrage, um die Anzahl der Filme anzuzeigen. Benennen Sie die Ausgabespalte in ANZAHL um.
-- ------------------------------------------------------------
SELECT COUNT(movie_id) AS Anzahl
FROM movies;


-- ------------------------------------------------------------
-- Aufgabe 3b
--
-- Schreiben Sie eine Abfrage um den Gesamtgewinn pro Filmverleih anzugeben. Geben Sie den Betrag in Milliarden Dollar aus.
-- Die Ausgabe soll wie folgt aussehen:
--
-- DISTRIBUTION	MRDDOLLAR
-- 20th Century Fox	.76
-- ...	...
--
--
-- Hinweis: Benutzen Sie die Funktion ROUND
-- ------------------------------------------------------------
SELECT
    distribution,
    SUM(profit) AS MRDDOLLAR
FROM movies
GROUP BY distribution;


-- ------------------------------------------------------------
-- Aufgabe 4a
--
-- Erstellen Sie eine Abfrage um pro Jahr anzuzeigen wie viele Filme in diesem Jahr erschienen sind. Geben Sie für jedes Jahr auch das Gesamteinspielergebnis und das durchschnittlich Einspielergebnis an.
-- Benennen Sie die Spalten mit JAHR, ANZAHL, GESAMT und DURCHSCHNITT.
-- Hinweis: Verwenden Sie die Funktion TO_CHAR zur Wandlung eines Datumwertes in eine Zeichenkette.
-- ------------------------------------------------------------
SELECT
    TO_CHAR(releasedate, 'YYYY') AS Jahr,
    COUNT(movie_id) AS Anzahl,
    SUM(profit) AS Gesamt,
    ROUND(AVG(profit), 2) AS Durchschnitt
FROM movies
GROUP BY TO_CHAR(releasedate, 'YYYY');


-- ------------------------------------------------------------
-- Aufgabe 4b
--
-- Modifizieren Sie Ihre Abfrage aus 4a in derart, dass nur noch Jahre angezeigt werden in denen mindestens zwei Filme erschienen sind.
-- ------------------------------------------------------------
SELECT
    TO_CHAR(releasedate, 'YYYY') AS Jahr,
    COUNT(movie_id) AS Anzahl,
    SUM(profit) AS Gesamt,
    ROUND(AVG(profit), 2) AS Durchschnitt
FROM movies
GROUP BY TO_CHAR(releasedate, 'YYYY')
HAVING COUNT(movie_id) >= 2;

-- ------------------------------------------------------------
-- Aufgabe 5
--
-- Geben Sie für jeden Anfangsbuchstaben eines Films an, wie viele Filme mit diesem Anfangsbuchstaben gedreht wurden.
-- ------------------------------------------------------------
SELECT
    SUBSTRING(title, 1, 1) AS Anfgngsbuchstabe,
    COUNT(movie_id) AS Anzahl
FROM movies
GROUP BY SUBSTRING(title, 1, 1);

-- ------------------------------------------------------------
-- Aufgabe 6
--
-- Erstellen Sie eine Abfrage, welche in einem Tupel die gesamte Anzahl der Filme anzeigt und wie viele dieser Filme jeweils 2014, 2015, 2016 und 2017 veröffentlicht wurden. Weisen Sie entsprechende Spaltenüberschriften zu. Erklären Sie Ihren Lösungsweg als SQLKommentar in der Log-Datei!
-- Hinweis: Verwenden Sie die Funktion CASE zur Auswahl der Jahreszahlen.
-- ------------------------------------------------------------


SELECT TO_CHAR(releasedate, 'YYYY') AS Jahr,

SUM(CASE
    WHEN TO_CHAR(releasedate, 'YYYY') = '2014' THEN 1
    WHEN TO_CHAR(releasedate, 'YYYY') = '2015' THEN 1
    WHEN TO_CHAR(releasedate, 'YYYY') = '2016' THEN 1
    WHEN TO_CHAR(releasedate, 'YYYY') = '2017' THEN 1
    ELSE 0
END) AS Anzahl

FROM movies

GROUP BY Jahr

HAVING SUM(CASE
    WHEN TO_CHAR(releasedate, 'YYYY') = '2014' THEN 1
    WHEN TO_CHAR(releasedate, 'YYYY') = '2015' THEN 1
    WHEN TO_CHAR(releasedate, 'YYYY') = '2016' THEN 1
    WHEN TO_CHAR(releasedate, 'YYYY') = '2017' THEN 1
    ELSE 0
END) > 0

ORDER BY Jahr;