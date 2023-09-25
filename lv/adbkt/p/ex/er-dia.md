---
layout: default
title: ADBKT
---

# ER-Diagramm aus Datenbankschema erzeugen

Entwickeln Sie eine Python-Funktion, die ein ER-Diagramm aus einem Datenbankschema einer Postgres-Datenbank erzeugt:

- Signatur der Python-Funktion: er_diagram(schema)
- Schema ist der Name des Parameters, verwenden Sie "umobility" als Beispiel:
![Modell UBahn](/lv/adbkt/a/shed/bubahn-modell.png)

- Die Funktion muss auf die Metadaten von Postgres zugreifen, siehe:
  - System Catalogs [(link)](https://www.postgresql.org/docs/current/catalogs.html)
  - System Views [(link)](https://www.postgresql.org/docs/current/views.html)

- Als Ausgabe erzeugt die Funktion einen Text, der als Eingabe für PlantUml verwendet werden kann
  - ER Diagramme in PlantUml [(link)](https://plantuml.com/de/ie-diagram)
  - Interaktive Diagrammerzeugung [(link)](https://www.plantuml.com/plantuml/uml)

- Folgende Informationen sollen im Diagramm enthalten sein
  - Alle Tabellen des Schemas als Entities
  - Alle Primär- und Fremdschlüssel
  - Alle Spalten mit Typinformationen
  - Not Null Constraints
  - Die Fremdschlüssel sollen als 1:n-Beziehungen visualisiert werden

Code
- Download [er-diagramm.ipynb](/lv/adbkt/a/ipynb/er-diagramm.ipynb)
- Upload

