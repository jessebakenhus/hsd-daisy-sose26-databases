-- Aufgabe 1
-- a) Fügen Sie der Tabelle MOVIES den ersten Film hinzu. Listen Sie dazu die Attributnamen explizit auf.

INSERT INTO MOVIES (movie_id, title, releasedate, genre_id, budget, openingweek, profit, runtime, certificate, sequelOf, distribution)
VALUES (31,
        'Pirates of the Caribbean – Fluch der Karibik 2',
        '2006-07-27',
        (SELECT genre_id FROM GENRES WHERE name = 'Action'),
        225000000,
        135634554,
        423315812,
        151,
        12,
        NULL,
'Walt Disney Studios');

-- b) Füllen Sie die Tabelle MOVIES mit dem zweiten und dritten Film auf. Listen Sie dabei die Attribute nicht auf.

INSERT INTO MOVIES
VALUES (
     32,
     'Rogue One: A Star Wars Story',
     '2016-12-15',
     (SELECT genre_id FROM GENRES WHERE name = 'Sci-Fi'),
     200000000,
     155081681,
     532171696,
     133,
     12,
     NULL,
     'Walt Disney Studios'
);

INSERT INTO MOVIES
VALUES (
        33,
        'Pirates of the Caribbean – Fremde Gezeiten',
        '2017-05-19',
        (SELECT genre_id FROM GENRES WHERE name = 'Action'),
        250000000,
        90151958,
        241071802,
        136,
        12,
        (SELECT movie_id FROM Movies WHERE title = 'Pirates of the Caribbean – Fluch der Karibik 2'),
        'Walt Disney Studios'
);

-- Aufgabe 2
-- Bei der Nutzung der Datenbank hat sich herausgestellt, dass die Summen statt in Dollar besser in Euro angegeben werden sollten. Aktualisieren Sie den Datenbestand, in dem Sie die Dollarangaben in Euro umrechnen. Verwenden Sie den Wechselkurs 1 US-Dollar = 0,85 Euro.

UPDATE MOVIES
SET Budget = Budget * 0.85,
    Openingweek = Openingweek * 0.85,
    Profit = Profit * 0.85;


-- Aufgabe 3
-- Ändern Sie den Titel von Pirates of the Caribbean – Fluch der Karibik 2 in Fluch der Karibik 2.
UPDATE Movies
SET title = 'Fluch der Karibik 2'
WHERE title = 'Pirates of the Caribbean – Fluch der Karibik 2';

-- Aufgabe 5

BEGIN;
    INSERT INTO movies (movie_id, title, releasedate, genre_id, budget, openingweek, profit, runtime, certificate, sequelof, distribution)
    SELECT
        i,
        'Testfilm',
        '2000-01-01',
        1,
        250000000,
        90151958,
        241071802,
        136,
        12,
        NULL,
        'Walt Disney Studios'
    FROM generate_series(100, 1000) as s(i);
ROLLBACK;