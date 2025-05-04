---
layout: default1
nav: adbkt-sonstiges
is_slide: 0
---

# Rekursive Abfrage - Summierung in einer Hierarchie

## Aufgabenstellung
Schreiben Sie eine SQL-Abfrage, die in einer Baumstrukture alle Werte von den Blättern bis zur Wurzel aufsummiert.

## Tabelle
  ```sql
  create table tree0 (
    id integer not null primary key,
    p integer,
    v integer
  );
  ```

## Beispieldaten
  ```sql
  insert into tree0 values (11, null, null);
  insert into tree0 values (12, 11, null);
  insert into tree0 values (13, 11, null);
  insert into tree0 values (14, 11, 4000);
  insert into tree0 values (15, 12, 1000);
  insert into tree0 values (16, 12, 1100);
  insert into tree0 values (17, 13, null);
  insert into tree0 values (18, 13, 300);
  insert into tree0 values (19, 17, 500);
  insert into tree0 values (20, 17, 501);
  insert into tree0 values (21, 17, 502);
  ```
> ![Bild](/home/lv/adbkt/a/sql/fig/tabelle.png)

## Baumstruktur
> ![Bild](/home/lv/adbkt/a/sql/fig/baum.png)

## Erwartetes Ergebnis der Abfrage
> ![Bild](/home/lv/adbkt/a/sql/fig/ergebnis.png)

