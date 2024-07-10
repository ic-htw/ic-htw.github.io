// ------------------------------------------------------------------------------
// Löschen
// ------------------------------------------------------------------------------
match (n) detach delete n;

// ------------------------------------------------------------------------------
// Knoten: Haltestellen
// ------------------------------------------------------------------------------
CREATE
  (h01:Haltestelle {name: 'RüdesheimerPlatz'}), 
  (h02:Haltestelle {name: 'HeidelbergerPlatz'}), 
  (h03:Haltestelle {name: 'FehrbellinerPlatz'}), 
  (h04:Haltestelle {name: 'Hohenzollernplatz'}),
  (h05:Haltestelle {name: 'SpichernStr'}),
  (h06:Haltestelle {name: 'AugsburgerStr'}),
  (h07:Haltestelle {name: 'Wittenbergplatz'}),
  (h08:Haltestelle {name: 'KonstanzerStr'}),
  (h09:Haltestelle {name: 'Adenauerplatz'}),
  (h10:Haltestelle {name: 'BlisseStr'}),
  (h11:Haltestelle {name: 'BerlinerStr'}),
  (h12:Haltestelle {name: 'BayerischerPlatz'})

// ------------------------------------------------------------------------------
// Knoten: Halte
// ------------------------------------------------------------------------------
CREATE
  (s101:Stop {ankunft: localtime('10:00'), abfahrt: localtime('10:00')}),
  (s102:Stop {ankunft: localtime('10:02'), abfahrt: localtime('10:03')}),
  (s103:Stop {ankunft: localtime('10:06'), abfahrt: localtime('10:07')}),
  (s104:Stop {ankunft: localtime('10:10'), abfahrt: localtime('10:11')}),
  (s105:Stop {ankunft: localtime('10:13'), abfahrt: localtime('10:15')}),
  (s106:Stop {ankunft: localtime('10:18'), abfahrt: localtime('10:19')}),
  (s107:Stop {ankunft: localtime('10:21'), abfahrt: localtime('10:22')})

// ------------------------------------------------------------------------------
// Beziehungen: IH (in Haltestelle): Stop -> Haltestelle
// ------------------------------------------------------------------------------
CREATE
  (s101)-[:IH]->(h01),
  (s102)-[:IH]->(h02),
  (s103)-[:IH]->(h03),
  (s104)-[:IH]->(h04),
  (s105)-[:IH]->(h05),
  (s106)-[:IH]->(h06),
  (s107)-[:IH]->(h07)

// ------------------------------------------------------------------------------
// Beziehungen: N (nächster Stop): Stop -> Stop
// ------------------------------------------------------------------------------
CREATE
  (s101)-[:N]->(s102),
  (s102)-[:N]->(s103),
  (s103)-[:N]->(s104),
  (s104)-[:N]->(s105),
  (s105)-[:N]->(s106),
  (s106)-[:N]->(s107)

