# Praktikum 01 – Docker & PostgreSQL

## Ziel

Ziel des Praktikums war es, einen PostgreSQL-Container mit Docker zu starten, sich mit der Datenbank zu verbinden und SQL-Abfragen auszuführen.

---

## 1. Docker Image starten

```bash
docker run -it --rm bsalgert/postgres:v1
```

| Flag | Bedeutung |
|------|-----------|
| `-it` | Interaktives Terminal |
| `--rm` | Container wird nach Beenden automatisch gelöscht |

---

## 2. Container im Hintergrund starten

```bash
docker run -d --name mydb bsalgert/postgres:v1 /demon.sh
```

| Flag | Bedeutung |
|------|-----------|
| `-d` | Detached – läuft im Hintergrund |
| `--name mydb` | Gibt dem Container einen Namen |

---

## 3. Laufende Container anzeigen

```bash
docker ps
```

---

## 4. In Container einloggen

```bash
docker exec -it mydb bash
```

---

## 5. Verbindung zur Datenbank herstellen

```bash
psql --username=postgres --dbname=postgres
```

---

## 6. SQL-Abfrage ausführen

```sql
SELECT * FROM Movies;
```

---

## 7. psql verlassen

```sql
\q
```

---

## 8. Container stoppen

```bash
docker stop mydb
```

Alternativ mit Container-ID:

```bash
docker stop 11be1bcce49c
```

---

## 9. Container wieder starten

```bash
docker start mydb
```

---

## 10. SQL-Skript ausführen (Batch-Modus)

```bash
docker run --rm -v $(pwd)/script.sql:/script.sql -e SQL_FILE=/script.sql bsalgert/postgres:v1 > result.log
```

| Flag / Option | Bedeutung |
|---------------|-----------|
| `-v` | Bindet eine lokale Datei in den Container ein |
| `SQL_FILE` | Pfad zur SQL-Datei, die im Container ausgeführt wird |
| `> result.log` | Leitet die Ausgabe in eine Datei um |

---

## Probleme & Lösungen

### Architektur-Warnung

```
linux/amd64 vs linux/arm64
```

> Nur eine Warnung auf Macs mit Apple Silicon (M1/M2) – kann ignoriert werden.

---

### Fehler: `role "root" does not exist`

**Ursache:** Falscher Benutzername beim Verbinden.

**Lösung:** Immer mit dem korrekten Postgres-Nutzer verbinden:

```bash
psql --username=postgres --dbname=postgres
```

---

### Fehler: SQL wird nicht ausgeführt (`postgres-#`)

**Ursache:** Semikolon am Ende des Befehls vergessen.

**Lösung:**

```sql
SELECT * FROM Movies;
```

---

## Ergebnis

- Verbindung zur Datenbank erfolgreich hergestellt
- Tabelle `Movies` erfolgreich abgefragt
- Container erfolgreich gestartet, betreten und gestoppt