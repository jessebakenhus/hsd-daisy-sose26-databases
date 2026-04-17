## Aufgabe 1

```sql
SELECT * FROM Movies;
```

### Output:
 movie_id |                        title                        | releasedate | genre_id |  budget   | openingweek |  profit   | runtime | certificate | sequelof |        distribution        
----------+-----------------------------------------------------+-------------+----------+-----------+-------------+-----------+---------+-------------+----------+----------------------------
        1 | Avatar - Aufbruch nach Pandora                      | 2009-12-17  |        1 | 237000000 |    77025481 | 760505847 |     162 |          12 |          | 20th Century Fox
        2 | Titanic                                             | 1997-12-14  |        2 | 200000000 |    28638131 | 658672302 |     194 |          12 |          | Paramount Pictures
        3 | Star Wars: Das Erwachen der Macht                   | 2015-12-14  |        1 | 245000000 |   247966675 | 936627416 |     136 |          12 |          | Walt Disney Studios
        4 | Jurassic World                                      | 2015-12-14  |        1 | 150000000 |   204600000 | 652177271 |     124 |          12 |          | Universal Studios
        5 | The Avengers                                        | 2012-04-11  |        3 | 220000000 |   207438708 | 623279547 |     143 |          12 |          | Walt Disney Studios
        6 | Fast & Furios 7                                     | 2016-03-15  |        4 | 190000000 |   147187040 | 350034110 |     137 |          12 |          | Universal Studios
        7 | Avengers: Age of Ultron                             | 2015-04-13  |        3 | 250000000 |   191271109 | 458991599 |     141 |          12 |        5 | Walt Disney Studios
        8 | Harry Potter und die Heiligtümer des Todes – Teil 2 | 2011-07-11  |        5 | 125000000 |   169189427 | 380955619 |     130 |          12 |          | Warner Bros. Entertainment
        9 | Die Eiskönigin – Völlig unverfroren                 | 2011-10-11  |        6 | 150000000 |    67391326 | 400736600 |     102 |           0 |          | Walt Disney Studios
       10 | Die Schöne und das Biest                            | 2017-03-17  |        5 | 160000000 |   174750616 | 503974884 |     129 |           6 |          | Walt Disney Studios
       11 | Fast & Furious 8                                    | 2017-04-04  |        4 | 250000000 |    98786705 | 225697400 |     136 |          12 |        6 | Universal Studios
       12 | Iron Man 3                                          | 2013-04-12  |        4 | 200000000 |   174144585 | 408992272 |     130 |          12 |          | Walt Disney Studios
       13 | Minions                                             | 2015-06-11  |        4 |  74000000 |   115200000 | 336029560 |      91 |           0 |          | Universal Studios
       14 | The First Avenger: Civil War                        | 2016-04-28  |        3 | 250000000 |   179139142 | 408080554 |     147 |          12 |          | Walt Disney Studios
       15 | Transformers 3 – Die dunkle Seite des Mondes        | 2011-06-29  |        3 | 195000000 |   115886050 | 352358779 |     154 |          12 |          | Paramount Pictures
       16 | Der Herr der Ringe: Die Rückkehr des Königs         | 2003-12-17  |        5 |  94000000 |    72629713 | 377019252 |     201 |          12 |          | New Line Cinema
       17 | James Bond 007: Skyfall                             | 2012-11-01  |        4 | 200000000 |    88364714 | 304360277 |     143 |          12 |          | Metro-Goldwyn-Mayer
       18 | Transformers: Ära des Untergangs                    | 2014-07-17  |        3 | 210000000 |   100038390 | 245428137 |     165 |          12 |       15 | Paramount Pictures
       19 | The Dark Knight Rises                               | 2012-07-26  |        3 | 250000000 |   160887295 | 448130642 |     164 |          12 |          | Warner Bros. Entertainment
       20 | Toy Story 3                                         | 2010-07-29  |        6 | 200000000 |   109000000 | 414984497 |     103 |           0 |          | Walt Disney Studios

## Aufgabe 2

```sql
SELECT title, releasedate, genre_id FROM Movies ORDER BY title;
```

                        title                        | releasedate | genre_id 
-----------------------------------------------------+-------------+----------
 Avatar - Aufbruch nach Pandora                      | 2009-12-17  |        1
 Avengers: Age of Ultron                             | 2015-04-13  |        3
 Der Herr der Ringe: Die Rückkehr des Königs         | 2003-12-17  |        5
 Die Eiskönigin – Völlig unverfroren                 | 2011-10-11  |        6
 Die Schöne und das Biest                            | 2017-03-17  |        5
 Fast & Furios 7                                     | 2016-03-15  |        4
 Fast & Furious 8                                    | 2017-04-04  |        4
 Harry Potter und die Heiligtümer des Todes – Teil 2 | 2011-07-11  |        5
 Iron Man 3                                          | 2013-04-12  |        4
 James Bond 007: Skyfall                             | 2012-11-01  |        4
 Jurassic World                                      | 2015-12-14  |        1
 Minions                                             | 2015-06-11  |        4
 Star Wars: Das Erwachen der Macht                   | 2015-12-14  |        1
 The Avengers                                        | 2012-04-11  |        3
 The Dark Knight Rises                               | 2012-07-26  |        3
 The First Avenger: Civil War                        | 2016-04-28  |        3
 Titanic                                             | 1997-12-14  |        2
 Toy Story 3                                         | 2010-07-29  |        6
 Transformers 3 – Die dunkle Seite des Mondes        | 2011-06-29  |        3
 Transformers: Ära des Untergangs                    | 2014-07-17  |        3


 ## Aufgabe 3

 ```sql
 SELECT DISTINCT distribution FROM Movies 
 ```
         distribution        
----------------------------
 Paramount Pictures
 Warner Bros. Entertainment
 New Line Cinema
 Metro-Goldwyn-Mayer
 Universal Studios
 Walt Disney Studios
 20th Century Fox

## Aufgabe 4

```sql
SELECT movie_id, title, profit FROM Movies WHERE profit > 600000000;
```

 movie_id |               title               |  profit   
----------+-----------------------------------+-----------
        1 | Avatar - Aufbruch nach Pandora    | 760505847
        2 | Titanic                           | 658672302
        3 | Star Wars: Das Erwachen der Macht | 936627416
        4 | Jurassic World                    | 652177271
        5 | The Avengers                      | 623279547

```sql
SELECT movie_id, title, profit FROM Movies WHERE profit BETWEEN 600000000 AND 800000000;
```

 movie_id |             title              |  profit   
----------+--------------------------------+-----------
        1 | Avatar - Aufbruch nach Pandora | 760505847
        2 | Titanic                        | 658672302
        4 | Jurassic World                 | 652177271
        5 | The Avengers                   | 623279547
(4 rows)

## Aufgabe 5

```sql
SELECT title, budget, profit FROM Movies WHERE sequelof IS NOT NULL ORDER BY profit DESC
```

              title               |  budget   |  profit   
----------------------------------+-----------+-----------
 Avengers: Age of Ultron          | 250000000 | 458991599
 Fast & Furious 8                 | 250000000 | 225697400
 Transformers: Ära des Untergangs | 210000000 | 245428137


```sql
SELECT title, budget + profit AS Umsatz FROM Movies WHERE sequelof IS NOT NULL;
```

              title               |  umsatz   
----------------------------------+-----------
 Avengers: Age of Ultron          | 708991599
 Fast & Furious 8                 | 475697400
 Transformers: Ära des Untergangs | 455428137