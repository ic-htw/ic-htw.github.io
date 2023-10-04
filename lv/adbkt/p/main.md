---
layout: default
title: ADBKT
---
# Ausgewählte Datenbankkonzepte/-techniken (ADBKT)


## Warum ADBKT?
- Wollen sie wissen, was SQL so alles kann?
- Wollen sie verstehen, was Multi Version Concurrency Controlbedeutet?
- Haben sie schon einmal die Begriffe NoSQL, Replikation,Sharding gehört und wollen verstehen, was sich dahinter verbirgt?
- Wollen sie verstehen, wie Graphdatenbanksysteme ticken undsehen, wie damit kürzesteste Pfade und zentrale Punkte inGraphen ermittelt werden können?
- Wollen sie lernen, wie Datenbanksysteme die Verarbeitung vonGeodaten unterstützen?
- Wollen sie lernen, wie JSON innerhalb von Datenbanksystemenverarbeitet werden kann?

Dann könnte diese Lehrveranstaltung für sie von Interesse sein.

## Lernziele
- Verständnis grundlegender Datenbankkonzepte
- Verständnis von Datenbanktechnologien anhand ausgewählter Beispielsysteme
- Praktische Nutzung von Datenbankfunktionalität auf Grundlage von Fallbeispielen

## Aspekte die im Modul behandelt werden
- Datenbank-Abfrage-Sprachen (SQL, JSON Path Language, Cypher)
- Nebenläufigkeit als Teil der Transaktionsverabeitung
- NoSQL-Datenbanksysteme
- Graph-Datenverarbeitung
- Geo-Datenverarbeitung
- JSON-Datenverarbeitung

Die Veranstaltung hat einen technologischen Charakter verbunden mit Entwicklungstätigkeiten,
d.h. Abfragen und Programmierung sind wesentliche Bestandteile.
Programmentwicklung findet in Python auf Grundlage von Jupyter Notebooks satt.

## Prüfung
- Bearbeitung von Übungsaufgaben
- Präsentation von Arbeitsergebnissen
- Keine Klausur

## Terminplan

### 09.10.23
- Einführung
- VL: Historischer Überblick [(pdf)](/lv/adbkt/a/hist/hist.pdf)
- Ü: Fallbeispiele [(link)](/lv/adbkt/p/ex/pres.html)
- Ü: Benutzung DBeaver [(link)](/lv/adbkt/p/infra.html#dbeaver)
- Ü: Python-Container [(link)](/lv/adbkt/p/ex/py-cont.html)
- Ü: Python DB-Intro [(link)](/lv/adbkt/p/ex/db-intro.html)
- P1: ER-Diagramm: 10 Punkte [(link)](/lv/adbkt/p/ex/er-dia.html)

### 16.10.23 (Abgabe P1)
- P1: Statuscheck
- VL: Window-Funktionen in SQL [(pdf)](/lv/adbkt/a/sql/window.pdf)
- Ü: Retail Sales [(link)](/lv/adbkt/p/ex/retail.html)
- VL: Rekursive Abfragen [(pdf)](/lv/adbkt/a/sql/rec.pdf)
- Ü: Rekursive Abfrage [(link)](/lv/adbkt/p/ex/rec-sql.html)
- VL: Nebenläufigkeit [(pdf)](/lv/adbkt/a/concur/concur.pdf)
- VL: Verteilte Transaktionen - 2 Phase Commit Protocol [(pdf)](/lv/adbkt/a/concur/2pc.pdf)
- P2: Nebenläufigkeit: 10 Punkte [(link)](/lv/adbkt/p/ex/concur.html)

### 23.10.23 (Abgabe P2)
- P2: Päsentation
- VL: NoSQL [(pdf)](/lv/adbkt/a/nosql/nosql.pdf)
- Ü: Cassandra Replikation [(link)](/lv/adbkt/p/ex/cas-repl.html)
- VL: Cassandra [(link)](/lv/adbkt/p/pr/cas.html)
- P3: TourDelight: 30 Punkte [(link)](/lv/adbkt/p/ex/tour.html)

### 30.10.23 (per Zoom)
- P3: Abstimmung allgemein
- P3: Abstimmung: individuell per Gruppe

### 06.11.23 (Abgabe P3)
- P3: Statuscheck
- Ü: Neo4j-Container [(link)](/lv/adbkt/p/ex/neo4j-cont.html)
- VL: Cypher [(link)](/lv/adbkt/p/pr/cypher.html)
- Ü: Cypher-Abfragen [(link)](/lv/adbkt/p/ex/cypher.html)
- VL: GDS [(pdf)](/lv/adbkt/a/graph/gds.pdf)
- Ü: GDS [(link)](/lv/adbkt/p/ex/gds.html)
- P4: Zugriffskontrolle mit Graphdatenbanken: 15 Punkte [(link)](/lv/adbkt/p/ex/auth.html)

### 13.11.23 (Abgabe P4)
- P4: Statuscheck
- VL: Geo-Datenverarbeitung [(pdf)](/lv/adbkt/a/geo/geo.pdf)
- Ü: Geo-Abfragen [(link)](/lv/adbkt/p/ex/geo-sql.html)
- Ü: Visualisierung Geodaten [(link)](/lv/adbkt/p/ex/geo-viz.html)
- P5: Fahrverbindung: 15 Punkte [(link)](/lv/adbkt/p/ex/sched.html)

### 20.11.23 (Abgabe P5)
- P5: Statuscheck
- Vorlesung Dokumentenorientierte DB-Systeme [(pdf)](/lv/adbkt/a/nosql/doc-db.pdf)
- Vorlesung JSON-Datenverarbeitung [(pdf)](/lv/adbkt/a/json/json-pg.pdf)
- P6: Graph-QL: 20 Punkte [(link)](/lv/adbkt/p/ex/graphql.html)
- VL: DynamoDB [(link)](/lv/adbkt/p/pr/dynamo.html)
- Ü: DynamoDB [(link)](/lv/adbkt/p/ex/dynamo.html)

### 27.11.23 (Abgabe P6 bis zum 03.12.23)
- P6 Statuscheck
- VL: SAP Hana
- Ü: Hana, BTP Account
- VL: Instacart
- Ü DAT260
- VL: Instacart
- Ü: Closeness Centrality in SAP Hana [(link)](/lv/adbkt/p/ex/hana-cc.html)
