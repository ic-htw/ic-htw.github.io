// ------------------------------------------------------------------------------
// Löschen
// ------------------------------------------------------------------------------
match (n) detach delete n;

// ------------------------------------------------------------------------------
// Knoten: Haltestellen
// ------------------------------------------------------------------------------
CREATE
  (HeidelbergerPlatz:Haltestelle {name: 'HeidelbergerPlatz'}), 
  (FehrbellinerPlatz:Haltestelle {name: 'FehrbellinerPlatz'}), 
  (Hohenzollernplatz:Haltestelle {name: 'Hohenzollernplatz'}),
  (SpichernStr:Haltestelle {name: 'SpichernStr'}),
  (AugsburgerStr:Haltestelle {name: 'AugsburgerStr'}),
  (Wittenbergplatz:Haltestelle {name: 'Wittenbergplatz'}),
  (KonstanzerStr:Haltestelle {name: 'KonstanzerStr'}),
  (Adenauerplatz:Haltestelle {name: 'Adenauerplatz'}),
  (BlisseStr:Haltestelle {name: 'BlisseStr'}),
  (BerlinerStr:Haltestelle {name: 'BerlinerStr'}),
  (BayerischerPlatz:Haltestelle {name: 'BayerischerPlatz'}),
  (GüntzelStr:Haltestelle {name: 'GüntzelStr'}),
  (Kurfürstendamm:Haltestelle {name: 'Kurfürstendamm'}),
  (ZoologischerGarten:Haltestelle {name: 'ZoologischerGarten'}),
  (UhlandStr:Haltestelle {name: 'UhlandStr'})

// ------------------------------------------------------------------------------
// Knoten: Halte
// ------------------------------------------------------------------------------
CREATE
  (S1HeidelbergerPlatz:Stop {ankunft: localtime('10:00'), abfahrt: localtime('10:03')}),
  (S1FehrbellinerPlatz:Stop {ankunft: localtime('10:06'), abfahrt: localtime('10:07')}),
  (S1Hohenzollernplatz:Stop {ankunft: localtime('10:10'), abfahrt: localtime('10:11')}),
  (S1SpichernStr:Stop {ankunft: localtime('10:13'), abfahrt: localtime('10:15')}),
  (S1AugsburgerStr:Stop {ankunft: localtime('10:18'), abfahrt: localtime('10:19')}),
  (S1Wittenbergplatz:Stop {ankunft: localtime('10:21'), abfahrt: localtime('10:22')})

// ------------------------------------------------------------------------------
// Beziehungen: IH (in Haltestelle): Stop -> Haltestelle
// ------------------------------------------------------------------------------
CREATE
  (S1HeidelbergerPlatz)-[:IH]->(HeidelbergerPlatz),
  (S1FehrbellinerPlatz)-[:IH]->(FehrbellinerPlatz),
  (S1Hohenzollernplatz)-[:IH]->(Hohenzollernplatz),
  (S1SpichernStr)-[:IH]->(SpichernStr),
  (S1AugsburgerStr)-[:IH]->(AugsburgerStr),
  (S1Wittenbergplatz)-[:IH]->(Wittenbergplatz)

// ------------------------------------------------------------------------------
// Beziehungen: N (nächster Stop): Stop -> Stop
// ------------------------------------------------------------------------------
CREATE
  (S1HeidelbergerPlatz)-[:N]->(S1FehrbellinerPlatz),
  (S1FehrbellinerPlatz)-[:N]->(S1Hohenzollernplatz),
  (S1Hohenzollernplatz)-[:N]->(S1SpichernStr),
  (S1SpichernStr)-[:N]->(S1AugsburgerStr),
  (S1AugsburgerStr)-[:N]->(S1Wittenbergplatz)

// ------------------------------------------------------------------------------
// Beziehungen: L (Link): Haltestelle -> Haltestelle
// ------------------------------------------------------------------------------
CREATE
  (HeidelbergerPlatz)-[:L {distanz: 1211}]->(FehrbellinerPlatz),
  (FehrbellinerPlatz)-[:L {distanz: 763}]->(Hohenzollernplatz),
  (Hohenzollernplatz)-[:L {distanz: 541}]->(SpichernStr),
  (SpichernStr)-[:L {distanz: 609}]->(AugsburgerStr),
  (AugsburgerStr)-[:L {distanz: 429}]->(Wittenbergplatz)

