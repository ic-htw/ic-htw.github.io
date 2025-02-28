---
layout: default1
nav: adbkt-uebungen
is_slide: 0
---

# Data Download und Import
- bubahn.tar.gz herunter laden [(link)](/home/lv/adbkt/a/hana/bubahn.tar.gz)
- Tabellen und Daten über `import catalog objects` in Hana laden
- SAP HANA Database Graph Reference 
[(link)](https://help.sap.com/docs/hana-cloud-database/sap-hana-cloud-sap-hana-database-graph-reference/sap-hana-cloud-sap-hana-database-graph-reference?locale=en-US)

<!--
- xxx [(link)]()
-->

# Graph Workspace
## Views
``` sql
create or replace view v_graph_haltestelle as 
  select hid, bez
  from haltestelle;

create or replace view v_graph_segment as 
  select hid_a * 100000 + hid_b as sid, hid_a, hid_b, laenge_in_meter 
  from segment
  union
  select hid_b * 100000 + hid_a as sid, hid_b, hid_a, laenge_in_meter 
  from segment;
```

## Graph-Workspace anlegen
``` sql
create graph workspace "GWS_BUBAHN"
  edge table v_graph_segment
    source column hid_a
    target column hid_b
    key column sid
  vertex table v_graph_haltestelle
    key column hid;
```

## Verwaltungscode
``` sql
select * from graph_workspaces;
select * from v_graph_haltestelle;
select * from v_graph_segment;

drop graph workspace GWS_BUBAHN;
drop view v_graph_haltestelle;
drop view v_graph_segment;

```

# Shortest Path
## Ergebnistyp
``` sql
create type tt_segment_path as 
  table (pos bigint, hid_a integer, hid_b integer);
``` 

## Prozedur
``` sql
create or replace procedure proc_shortest_segment_path (
  in p_src integer, in p_dst integer, in p_by_hops boolean, out p_path_table tt_segment_path)
  language graph
  reads sql data
as
begin
  Graph v_graph = Graph("GWS_BUBAHN");
	Vertex v_src = Vertex(:v_graph, :p_src);
	Vertex v_dst = Vertex(:v_graph, :p_dst);
  if (:p_by_hops) {
	  WeightedPath<BIGINT> v_path = SHORTEST_PATH(:v_graph, :v_src, :v_dst);
    p_path_table = select :i, :e.hid_a, :e.hid_b 
      foreach e in Edges(:v_path) with ordinality as i;
  } else {
 	  WeightedPath<Int> v_path = SHORTEST_PATH(:v_graph, :v_src, :v_dst, (Edge e) => Int {return :e.laenge_in_meter;});
    p_path_table = select :i, :e.hid_a, :e.hid_b
      foreach e in Edges(:v_path) with ordinality as i;
  }
end

```

## Funktion
``` sql
create or replace function func_shortest_segment_path(
  in p_src integer, in p_dst integer, in p_by_hops boolean
) returns tt_segment_path
  language sqlscript
  reads sql data
as
begin
  declare v_segment_path tt_segment_path;
  call proc_shortest_segment_path(:p_src, :p_dst, :p_by_hops, v_segment_path);
  return :v_segment_path;
end
```

## Ausführung
```
Bundesplatz  10148
HeidelbergerPlatz 10152
KonstanzerStr 10242
KottbusserTor 10243
Rüdesheimer Platz 10291
SpichernStr 10303
```
``` sql
select sp.pos,ha.bez as von, hb.bez as nach
from func_shortest_segment_path(10291, 10303, true) sp
     join haltestelle ha on ha.hid=sp.hid_a
     join haltestelle hb on hb.hid=sp.hid_b
order by sp.pos;
```

## Verwaltungscode
``` sql
drop type tt_segment_path;
drop procedure proc_shortest_segment_path;
drop function func_shortest_segment_path;

```

<!--
## xxx
``` sql
xxx
```
-->
