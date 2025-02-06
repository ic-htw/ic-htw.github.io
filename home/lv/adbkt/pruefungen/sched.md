---
layout: default1
nav: adbkt-pruefungen
title: P5
is_slide: 0
---

# Fahrverbindung

## Aufgabenstellung
In dieser Aufgabe sollen Sie Geo-Daten mit Graph-Daten kombinieren, um eine Fahrverbindung zu erstellen.

- Entwickeln Sie eine Python-Funktion, die für
  - eine Start- und Zieladresse
  - ein Datum und eine Startzeit
- folgendes berechnet
  - eine Start- und Zielhaltestelle, die am nächsten zu den jeweiligen Adressen liegen
  - eine Fahrverbindung für den kürzesten Weg zwischen diesen beiden Haltestellen
- Hinweise
  - Die Start- und Zieladressen werden über Geokoordinaten gegeben
    - Damit brauchen sie ein Geoencoding nicht zu programmieren
  - Die Distanzen zwischen Adresse und Haltestelle sollen Luftlinie sein
    - Damit brauchen sie keine kürzesten Weg im Berliner Straßenetz zu berechnen
  - Die Geo- und Fahrzeitdaten finden sie in der Postgres-Datenbank
  - Die kürzesten Pfade bitte in der Neo4j-Datenbank berechnen
  - Gehen sie von einer minimalen Umstiegszeit von 30 Sekunden aus
- Die Python-Funktion soll folgende Signatur haben:
  - `fahrverbindung(lat_lng_start, lat_lng_ziel, startdatum, startzeit)`
  - Beachten sie, dass sich aus dem Startdatum ein Zeitplan ergibt
  - Dieser muss natürlich bei der Fahrverbindung berücksichtigt werden
  - Berechnen sie auch Umsteigepunkte
- Zum Testen können sie folgende Beispiele verwenden
  - Eberbacher Str. 1 nach Meierottostraße 10<br>
    `fahrverbindung([52.473176, 13.313740], [52.4969134,13.327166], "2021-04-01","11:00:00")`
  - Eberbacher Str. 1 nach Ballenstedter Str. 6<br>
    `fahrverbindung([52.473176, 13.313740], [52.494833,13.3038814], "2021-04-01","11:00:00")`
  - Eberbacher Str. 1 nach Elsastraße 2<br>
    `fahrverbindung([52.473176, 13.313740], [52.4752505,13.3308319], "2021-04-01","11:00:00")`
- Im Folgenden finden sie diverse Information, die beim Testen helfen

## Code
- Python 
[(link)](/home/lv/adbkt/a/ipynb/shed.ipynb) 
[(render)](https://github.com/ic-htw/ic-htw.github.io/blob/master/home/lv/adbkt/a/ipynb/shed.ipynb)


## Datenmodell Postgres
> ![Bild](/home/lv/adbkt/a/shed/bubahn-modell.png)


## Datenauszug aus den Postgres-Daten
> ![Bild](/home/lv/adbkt/a/shed/daten.png)


## Datenmodell Neo4j
Graphprojektion "bubahn" siehe [(link)](/home/lv/adbkt/uebungen/gds.html#graphprojektion)

## Relevanter Netzausschnitt für die Beispiele
> ![Bild](/home/lv/adbkt/a/shed/netzausschnitt.png)

## Beispiel 1
> ![Bild](/home/lv/adbkt/a/shed/verbindung1.png)


## Beispiel 2
> ![Bild](/home/lv/adbkt/a/shed/verbindung2.png)


## Beispiel 3
> ![Bild](/home/lv/adbkt/a/shed/verbindung3.png)