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
  -[n1:NEXT]->*
  (b:Stop)
  -[n2:NEXT]->*
  (c:Stop)
  -[:CALLS_AT]->
  (lds:Station {name: 'Leeds'}),
  //
  (b:Stop)
  -[:CALLS_AT]->
  (l:Station)
  <-[:CALLS_AT]-
  (m:Stop)
  -[:NEXT]->*
  (n:Stop)
  -[:CALLS_AT]->
  (lds),
  //
  (lds)<-[:CALLS_AT]-
  (x:Stop)
  -[:NEXT]->*
  (y:Stop)
  -[:CALLS_AT]->
  (:Station {name: 'Huddersfield'})
WHERE 
  b.arrives < m.departs AND
  n.arrives < x.departs
RETURN 
stb.name as start,
b.departs AS harDeparture,
c.arrives AS ldsArrival,
l.name as ChangeAt,
m.departs AS harDeparts,
n.arrives AS leedsArrival,
x.departs AS leedsDeparture,
y.arrives AS arrives
ORDER BY arrives, harDeparts