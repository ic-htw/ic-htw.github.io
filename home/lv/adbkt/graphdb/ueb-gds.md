---
layout: default1
nav: adbkt-graphdb
title: "Ü: Graph-Data-Science"
is_slide: 0
---

# Neo4j Graph Data Science

## Laden der U-Bahn-Daten

- Daten aus der Neo4j löschen
  ```cypher
  MATCH (x) DETACH DELETE x;
  ```
- U-Bahn-Daten aus der Postgres holen: 
  [(ipynb)](/home/lv/adbkt/a-ipynb/neo4j-fill-mobility.ipynb) 
  [(render)](https://github.com/ic-htw/ic-htw.github.io/blob/master/home/lv/adbkt/a-ipynb/neo4j-fill-mobility.ipynb)
- Die Cypher-Abfragen beziehen sich auf Daten des Berliner UBahn-Netzes
  - Aktuelles Netz [(link)](https://de.m.wikipedia.org/wiki/Datei:U-Bahn_Berlin_-_Netzplan.png)
  - Datenmodell in der Postgres-Datenbank<br> 
  ![(png)](/home/lv/adbkt/a/shed/bubahn-modell.png)
  - Datenmodell in der Neo4j-Datenbank<br> 
  ![(png)](/home/lv/adbkt/a/shed/bubahn-modell-neo4j.png)
  

## Graphprojektion
- Legen sie folgende Graph-Projektion an
  ```cypher
  MATCH (ha:Haltestelle)<-[sa:ProjSegA]-(s:Segment)-[sb:ProjSegB]-(hb:Haltestelle)
  WITH gds.graph.project(
      'bubahn',
      ha,
      hb,
      {relationshipProperties: s{.laengeInMeter}},
      {undirectedRelationshipTypes: ['*']}) AS g
  RETURN
    g.graphName AS graph, g.nodeCount AS nodes, g.relationshipCount AS rels
  ```
- Graph-Projektionen auflisten
  ```cypher
call gds.graph.list()
   ```
- Graph-Projektion löschen
  ```cypher
CALL gds.graph.drop('bubahn') YIELD graphName;
   ```


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
