---
layout: default1
nav: adbkt-geo
title: "Ü: Geo-Abfragen"
is_slide: 0
---

# Geo-Abfragen

## Datenmodell
![Datenmodell](/home/lv/adbkt/a/shed/bubahn-modell.png)<br>
![Datenmodell](/home/lv/adbkt/a/geo/fig/bezirk.png)
![Datenmodell](/home/lv/adbkt/a/geo/fig/museum.png)
 
## Kodierung der Geo-Koordinaten
- Pos hat die SRID 4326 und Posp die SRID 31468
- shape hat die SRID 4326 und shapep die SRID 31468
- SRID 4326 [(link)](https://epsg.io/4326)
- SRID 31468 [(link)](https://epsg.io/31468)

## Abfrage 1
- Anzahl Haltestellen pro Bezirk
- Die Daten sollen nach "bezirk" sortiert sein<br>
![Datenmodell](/home/lv/adbkt/a/geo/fig/abfrage1.png)

## Abfrage 2
- Durch welche Bezirke verlaufen Unterlinien
- Die Daten sollen nach "linie" und "ulid" sortiert sein
- Die Spalte bezirke soll alphabetisch sortiert sein<br>
![Datenmodell](/home/lv/adbkt/a/geo/fig/abfrage2.png)

## Abfrage 3
- Erstellen Sie eine SQL-Abfrage, die für jedes Museum die nächstgelegene Haltestelle ermittelt
- Das ist die Haltestelle, die den minimalen Abstand zu dem Museum unter allen Haltestellen hat
- Die Daten sollen nach "museum" sortiert sein<br>
![Datenmodell](/home/lv/adbkt/a/geo/fig/abfrage3.png)

