// ------------------------------------------------------------------------------
// Schema
// ------------------------------------------------------------------------------
CALL db.schema.visualization()

// ------------------------------------------------------------------------------
// Knoten
// ------------------------------------------------------------------------------
// Folie
MATCH (h:Haltestelle)
RETURN h as haltestelle
ORDER BY h.name;

// Folie
MATCH (h:Haltestelle {name: 'HeidelbergerPlatz'})
RETURN h as haltestelle;

// Folie
MATCH (h:Haltestelle WHERE h.name STARTS WITH 'H')
RETURN h as haltestelle
ORDER BY h.name;

// Folie
MATCH (h:Haltestelle WHERE h.name STARTS WITH 'H')
RETURN h.name as haltestelle
ORDER BY h.name;


// ------------------------------------------------------------------------------
// Pfade fester Länge - L
// ------------------------------------------------------------------------------
// Folie - Graph + Text
MATCH (h1:Haltestelle {name: 'SpichernStr'})-[:L]->(h2:Haltestelle)
RETURN h1, h2;

// Folie - Graph + Text
MATCH (h1:Haltestelle {name: 'SpichernStr'})<-[:L]-(h2:Haltestelle)
RETURN h1, h2;

// Folie - Graph + Text
MATCH (h1:Haltestelle {name: 'SpichernStr'})-[:L]-(h2:Haltestelle)
RETURN h1, h2;

// Folie
MATCH (h1:Haltestelle {name: 'SpichernStr'})-[l:L]->(h2:Haltestelle)
RETURN h1.name, h2.name, l.distanz
ORDER BY h1.name, h2.name;

// ------------------------------------------------------------------------------
// Pfade fester Länge - S, N
// ------------------------------------------------------------------------------
// Folie - Graph + Text
MATCH (s:Stop)-[ih:IH]->(h:Haltestelle {name: 'SpichernStr'})
RETURN s, ih, h;

// Folie - Graph + Text
MATCH 
  (h1:Haltestelle {name: 'SpichernStr'})
  <-[ih1:IH]-(s1:Stop)
  -[n:N]->(s2:Stop)
  -[ih2:IH]->(h2:Haltestelle)
RETURN s1, ih1, h1, n, s2, ih2, h2
ORDER BY s1.abfahrt;

// Folie
MATCH 
  (h1:Haltestelle {name: 'SpichernStr'})
  <-[:IH]-(s1:Stop WHERE s1.abfahrt > localtime('10:08'))
  -[:N]->(s2:Stop)
  -[:IH]->(h2:Haltestelle)
RETURN 
  h1.name as abfahrtVon, s1.abfahrt as umAbfahrt, 
  h2.name as ankunftAn, s2.ankunft as umAnkunft
ORDER BY s1.abfahrt;

MATCH (h:Haltestelle)<-[inh:InH]-(s1:Stop)-[n:N]->(s2:Stop)
RETURN h, s1, s2, inh, n;


// ------------------------------------------------------------------------------
// Aggregationen / WITH
// ------------------------------------------------------------------------------
// Folie
MATCH (s:Stop)-[ih:IH]->(h:Haltestelle)
WITH h.name as haltestelle, count(*) as anzahlStops
WHERE anzahlStops > 1
RETURN haltestelle, anzahlStops;

// ------------------------------------------------------------------------------
// Pfade variabler Länge - L
// ------------------------------------------------------------------------------
// Folie
MATCH p = (
  (h1:Haltestelle {name: 'Hohenzollernplatz'})
  ((:Haltestelle)-[:L]->(:Haltestelle)){1,2}
  (hn:Haltestelle)
)
RETURN [n IN nodes(p) | n.name];

// Folie
MATCH p = (
  (h1:Haltestelle {name: 'Hohenzollernplatz'})
  ((:Haltestelle)-[:L]->(:Haltestelle))+
  (hn:Haltestelle)
)
WITH p
ORDER BY length(p)
WITH [n IN nodes(p) | n.name] as haltestellen
RETURN haltestellen;

// Folie
MATCH p = (
  (h1:Haltestelle {name: 'FehrbellinerPlatz'})
  ((:Haltestelle)-[:L]->(:Haltestelle))+
  (hn:Haltestelle WHERE NOT EXISTS {(hn)-[:L]->(:Haltestelle)})
)
WITH p
ORDER BY length(p)
WITH [n IN nodes(p) | n.name] as haltestellen
RETURN haltestellen;

// Folie
MATCH 
  p1 = (
    (h1:Haltestelle {name: 'SpichernStr'})
    ((:Haltestelle)-[:L]->(:Haltestelle))+
    (hm:Haltestelle)
  ),
  p2 = (
    (hm)
    ((:Haltestelle)-[:L]->(:Haltestelle))*
  (hn:Haltestelle)
)
WITH p1, p2
ORDER BY length(p1), length(p2)
WITH 
  [n IN nodes(p1) | n.name] as haltestellen1,
  [n IN nodes(p2) | n.name] as haltestellen2
RETURN haltestellen1, haltestellen2;

MATCH 
  (h1:Haltestelle {name: 'Hohenzollernplatz'})
  ((ha:Haltestelle)-[:L]->(:Haltestelle))+
  (hm:Haltestelle)
  ((hb:Haltestelle)-[:L]->(:Haltestelle))+
  (hn:Haltestelle)
RETURN h1.name, [h IN ha | h.name], hm.name, [h IN hb | h.name], hn.name;

MATCH p = (
  (h1:Haltestelle {name: 'SpichernStr'})
  -[l:L]-*
  (h2:Haltestelle {name: 'Wittenbergplatz'})
)
RETURN  [n IN nodes(p) | n.name];

// Folie
MATCH p = (
  (h1:Haltestelle {name: 'HeidelbergerPlatz'})
  ((ha:Haltestelle)-[l:L]->(hb:Haltestelle))*
  (h2:Haltestelle {name: 'SpichernStr'})
)
RETURN [n IN nodes(p) | n.name];

// Folie
MATCH p = (
  (h1:Haltestelle {name: 'HeidelbergerPlatz'})
  ((ha:Haltestelle)-[l:L]-(hb:Haltestelle where hb.name<>'GüntzelStr'))*
  (h2:Haltestelle {name: 'SpichernStr'})
)
RETURN [n IN nodes(p) | n.name];

// Folie
MATCH p = (
  (h1:Haltestelle {name: 'FehrbellinerPlatz'})
  ((ha:Haltestelle)-[l:L]->(hb:Haltestelle))*
  (h2:Haltestelle {name: 'SpichernStr'})
)
WITH  [r IN relationships(p)] as rels
UNWIND rels as r
RETURN startnode(r).name as von, endnode(r).name as bis, r.distanz as distanz;

// Folie
MATCH 
  (h1:Haltestelle {name: 'FehrbellinerPlatz'})
  -[l:L]->+
  (h2:Haltestelle {name: 'SpichernStr'})
WITH
  h1, h2,
  [x IN l | startnode(x).name] as hh,
  reduce(acc = 0, x IN l | acc + x.distanz) AS distanz
RETURN hh + h2.name, distanz
ORDER BY distanz;

// Folie
MATCH 
  (h1:Haltestelle {name: 'FehrbellinerPlatz'})
  -[l:L]->+
  (h2:Haltestelle {name: 'SpichernStr'})
WITH
  h1, h2,
  [x IN l | startnode(x).name] as hh,
  reduce(acc = 0, x IN l | acc + x.distanz) AS distanz
WHERE distanz < 2000
RETURN hh + h2.name, distanz
ORDER BY distanz;


// ------------------------------------------------------------------------------
// Aufgaben
// ------------------------------------------------------------------------------
MATCH 
  (s:Stop {linie: 'U3'})-[:IH]->(h:Haltestelle)
RETURN
  h.name;

MATCH
  (s1:Stop WHERE NOT EXISTS {(:Stop)-[:N]->(s1)})
  -[n:N]->+
  (s2:Stop WHERE NOT EXISTS {(s2)-[:N]->(:Stop)})
WITH 
  nodes(p) as stops
RETURN [];

MATCH p = (
  (h1:Haltestelle WHERE NOT EXISTS {(:Haltestelle)-[:L]->(h1)})
  ((hx:Haltestelle)-[:L]->(hy:Haltestelle) 
    where 1=1)+
  (h2:Haltestelle WHERE NOT EXISTS {(h2)-[:L]->(:Haltestelle)})
)
RETURN nodes(p);