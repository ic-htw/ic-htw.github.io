---
layout: default1
nav: adbkt-uebungen
is_slide: 0
---

# Cypher-Abfragen

## Daten von Postgres auf Neo4j übertragen

- Die Cypher-Abfragen beziehen sich auf Daten des Berliner UBahn-Netzes
  - Aktuelles Netz [(link)](https://de.m.wikipedia.org/wiki/Datei:U-Bahn_Berlin_-_Netzplan.png)
  - Datenmodell in der Postgres-Datenbank<br> 
  ![(png)](/home/lv/adbkt/a/shed/bubahn-modell.png)
  - Datenmodell in der Neo4j-Datenbank<br> 
  ![(png)](/home/lv/adbkt/a/shed/bubahn-modell-neo4j.png)
  - Code 
    - Credentials [(py)](/home/lv/adbkt/a-ipynb/neo4j.py )
      - Download
      - Umbenennen in cred_neo4j.py
      - Werte anpassen
      - Upload
    - Übertragung der Daten 
      [(ipynb)](/home/lv/adbkt/a-ipynb/neo4j-fill-mobility.ipynb) 
      [(render)](https://github.com/ic-htw/ic-htw.github.io/blob/master/home/lv/adbkt/a-ipynb/neo4j-fill-mobility.ipynb)

## Cypher-Abfrage 1

- Schreiben Sie eine Cypher-Abfrage, die die Linien ermittelt die jeweils durch ein Segment gehen.
- Die Linien ergeben sich durch die Abschnitte, die durch das jeweilige Segment gehen.
- Diese sind über die Unterlinie mit der Linie verbunden.<br>
![(png)](/home/lv/adbkt/a/graph/fig/cypher-abfrage1-ergebnis.png)

## Cypher-Abfrage 2

- Schreiben Sie eine Cypher-Abfrage, die die Unterlinienverläufe ermittelt.
- Dabei soll mit einem Plus- oder Minuszeichen gekennzeichnet werden, ob die Unterlinie in der jeweiligen Station hält oder nicht.
- Gehen Sie davon aus, dass in der ersten und letzten Haltestelle einer Unterline immer gehalten wird.<br>
![(png)](/home/lv/adbkt/a/graph/fig/cypher-abfrage2-ergebnis.png)