CALL db.schema.visualization()

MATCH (h:Haltestelle)<-[inh:InH]-(s1:Stop)-[n:N]->(s2:Stop)
RETURN h, s1, s2, inh, n;

MATCH (h:Haltestelle)
RETURN h;


MATCH (h:Haltestelle {name: 'HeidelbergerPlatz'})
RETURN h;

MATCH (h:Haltestelle WHERE h.name STARTS WITH 'H')
RETURN h;

MATCH (h:Haltestelle)
RETURN count(*) as anzahl;

MATCH (s:Stop)-[:IH]->(h:Haltestelle {name: 'HeidelbergerPlatz'})
RETURN h.name, s.abfahrt;

MATCH 
  (h1:Haltestelle {name: 'HeidelbergerPlatz'})
  <-[:IH]-(s1:Stop WHERE s1.abfahrt >= localtime('10:00'))
  -[:N]->(s2:Stop)
  -[:IH]->(h2:Haltestelle)
RETURN h1.name, s1.abfahrt, h2.name, s2.ankunft;

MATCH p = (
  (h1:Haltestelle {name: 'HeidelbergerPlatz'})
  -[l:L]-*
  (h2:Haltestelle {name: 'Wittenbergplatz'})
)
RETURN  [n IN nodes(p) | n.name];

MATCH p = (
  (h1:Haltestelle {name: 'HeidelbergerPlatz'})
  ((ha:Haltestelle)-[l:L]-(hb:Haltestelle))*
  (h2:Haltestelle {name: 'Wittenbergplatz'})
)
RETURN [n IN nodes(p) | n.name];

MATCH p = (
  (h1:Haltestelle {name: 'HeidelbergerPlatz'})
  ((ha:Haltestelle)-[l:L]-(hb:Haltestelle where hb.name<>'GüntzelStr'))*
  (h2:Haltestelle {name: 'Wittenbergplatz'})
)
RETURN [n IN nodes(p) | n.name];

MATCH p = (
  (h1:Haltestelle {name: 'HeidelbergerPlatz'})
  ((ha:Haltestelle)-[l:L]-(hb:Haltestelle))*
  (h2:Haltestelle {name: 'Wittenbergplatz'})
)
WITH  collect(p) as pp
RETURN [n IN nodes(pp[0]) | n.name];

MATCH p = (
  (h1:Haltestelle {name: 'HeidelbergerPlatz'})
  ((ha:Haltestelle)-[l:L]-(hb:Haltestelle))*
  (h2:Haltestelle {name: 'Wittenbergplatz'})
)
WITH  [r IN relationships(p)] as rels
UNWIND rels as r
RETURN startnode(r).name as von, endnode(r).name as bis, r.distanz as distanz;

MATCH 
  (h1:Haltestelle {name: 'HeidelbergerPlatz'})
  -[l:L]-+
  (h2:Haltestelle {name: 'Wittenbergplatz'})
RETURN reduce(acc = 0, x IN l | acc + x.distanz) AS distanz;

