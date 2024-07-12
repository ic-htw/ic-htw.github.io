// ------------------------------------------------------------------------------
// Schema
// ------------------------------------------------------------------------------
CALL db.schema.visualization()

// ------------------------------------------------------------------------------
// Abfragen
// ------------------------------------------------------------------------------
MATCH 
  (stb:Station {name: 'Starbeck'})
  <-[:CALLS_AT]-
  (a:Stop {departs: time('11:11')})
  -[:NEXT]->*
  (b)
  -[:NEXT]->*
  (c:Stop)
  -[:CALLS_AT]->
  (lds:Station {name: 'Leeds'}),
  //
  (b)-[:CALLS_AT]->(l:Station)
  <-[:CALLS_AT]-(m:Stop)-[:NEXT]->*
  (n:Stop)-[:CALLS_AT]->(lds),
  //
  (lds)<-[:CALLS_AT]-(x:Stop)
  -[:NEXT]->*(y:Stop)
  -[:CALLS_AT]->
  (:Station {name: 'Huddersfield'})
RETURN 
stb.name as start,
a.departs as starttime,
l.name as changeAt,
m.departs AS changeDeparts,
y.arrives AS arrives