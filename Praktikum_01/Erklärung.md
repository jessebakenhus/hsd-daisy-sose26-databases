# Erklärung 

## 1. Container mit Datenbank starten

Zunächst wird der Container mit der Datenbank gestartet.

```bash 
docker run -it --rm bsalgert/postgres:v1
```

## 2.  SQL Datei ausführen

Datei erstellen:

```bash 
echo "SELECT * FROM MOVIES;" > script.sql 
```

```bash
docker run --rm -v $(pwd)/script.sql:/script.sql -e SQL_FILE=/script.sql bsalgert/postgres:v1 > result.log
```

## 3. Container im Hintergrund starten (und mit Namen versehen  doc)

```bash
docker run -d --name mydb bsalgert/postgres:v1 /demon.sh 
```

## 4. mit Container über bash verbinden

```bash
docker exec -it mydb bash
```

in Postgres verbinden
```bash
psql --username=postgres --dbname=postgres
```

## 5. Container verwalten

```bash
docker stop name
docker start name

```



