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