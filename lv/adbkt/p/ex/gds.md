---
layout: default
title: ADBKT
---

# Neo4j Graph Data Science

## Graphprojektion
- Legen sie folgende Graph-Projektion an
  ```
  MATCH (ha:Haltestelle)<-[sa:ProjSegA]-(s:Segment)-[sb:ProjSegB]->(hb:Haltestelle)
  WITH gds.graph.project(
      'bubahn',
      ha,
      hb,
      {relationshipProperties: s {.laengeInMeter}},
      {undirectedRelationshipTypes: ['*']}) AS g
  RETURN
    g.graphName AS graph, g.nodeCount AS nodes, g.relationshipCount AS rels
  ```

## Netz-Zusammenhang
- Ermitteln Sie den Netz-Zusammenhang im Graphen<br>
  ![(png)](/lv/adbkt/a/graph/fig/scc.png)



## Kürzeste Pfade
- Ermitteln sie die kürzeste Pfade zwischen zwei Haltestellen
- Als Beispiel soll die Verbindung zwischen HeidelbergerPlatz und KottbusserTor genommen werden
- Hier sollen zwei Varianten betrachtet werden:
- Anzahl Haltestellen<br>
  ![(png)](/lv/adbkt/a/graph/fig/shortest-path-hops.png)
- Gesamtlänge der Strecke<br>
  ![(png)](/lv/adbkt/a/graph/fig/shortest-path-len.png)

## Closeness Centrality
- Ermitteln sie die Closeness Centrality im Netz in Bezug auf die Länge der Segmente.
- Berechnen sie für jede Haltestelle die Summe der Längen der kürzesten Pfade zu allen anderen Haltestelle
- Sortieren sie das Ergebnis aufsteigend nach den Summen<br>
  ![(png)](/lv/adbkt/a/graph/fig/closeness-centrality.png)
