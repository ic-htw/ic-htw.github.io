---
layout: default1
nav: adbkt-uebungen
title: Übung Graph-Data-Science
is_slide: 0
---

# Übung Graph Data Science

- Laden der U-Bahn-Daten
[(link)](http://localhost:4000/home/lv/adbkt/allgemeines/infra.html#ubahn-daten-laden)
- Graphprojektion anlegen
[(link)](http://localhost:4000/home/lv/adbkt/allgemeines/infra.html#graphprojektion)

  

## Netz-Zusammenhang
- Ermitteln Sie den Netz-Zusammenhang im Graphen<br>
  ![(png)](/home/lv/adbkt/a/graph/fig/scc.png)



## Kürzeste Pfade
- Ermitteln sie die kürzeste Pfade zwischen zwei Haltestellen
- Als Beispiel soll die Verbindung zwischen HeidelbergerPlatz und KottbusserTor genommen werden
- Hier sollen zwei Varianten betrachtet werden:
- Anzahl Haltestellen<br>
  ![(png)](/home/lv/adbkt/a/graph/fig/shortest-path-hops.png)
- Gesamtlänge der Strecke<br>
  ![(png)](/home/lv/adbkt/a/graph/fig/shortest-path-len.png)

## Closeness Centrality
- Ermitteln sie die Closeness Centrality im Netz in Bezug auf die Länge der Segmente.
- Berechnen sie für jede Haltestelle die Summe der Längen der kürzesten Pfade zu allen anderen Haltestelle
- Sortieren sie das Ergebnis aufsteigend nach den Summen<br>
  ![(png)](/home/lv/adbkt/a/graph/fig/closeness-centrality.png)
