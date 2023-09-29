---
layout: default
title: ADBKT
---

# TourDelight

## Aufgabenstellung

Entwickeln sie einen Backend-Service basierend auf dem Cassandra-NoSQL-Datenbanksystem für eine Tourenplaner-App ähnlich wie "outdooractive" oder "komoot"

- Entwerfen sie dazu ein Cassandra-Datemodell
- Verfolgen sie dabei den Query-First-Ansatz mit einem entsprechend denormalisierten Datenmodell
- Achten sie dabei auf geeignete Partitionierungen, da die Anwendung mit großen Nutzerzahlen umgehen soll
- Entwickeln sie in Python eine Service-Schnittstelle mit ausgewählten Funktionen. Beachten sie dabei auch die Konsistenzsicherung in Bezug auf die Denormalisierung
- Die Entwicklung einer Oberfläche ist nicht Bestandteil der Aufgabe
- Ihr System soll auf einen Cassadra-Cluster mit 3 Knoten laufen. Simulieren sie einen Knotenausfall und zeigen sie, dass das Gesamsystem nach wie vor funktioniert
- Erstellen sie einen weiteren Knoten mit einem Web-Server, der statischen Content, z.B. Bilder liefert
- Vorgehen:
  - Schauen sie sich "outdooractive" oder "komoot" an
  - Stimmen sie sich mit mir ab, welche Daten und Services sie abbilden wollen
  - Entwickeln sie das Datenmodell und erzeugen sie den CQL-Code zum Anlegen der Tabellen
  - Erstellen sie Testdaten und tragen diese in die Datenbank ein
  - Entwicklen sie die Services als einfache Python-Funktionen
  - Nutzen sie den Python-Treiber für Cassandra
