// ------------------------------------------------------------------------------
// Löschen
// ------------------------------------------------------------------------------
match (n) detach delete n;

// ------------------------------------------------------------------------------
// Knoten: Haltestellen
// ------------------------------------------------------------------------------
CREATE
  (AugsburgerStr:Haltestelle {name: 'AugsburgerStr'}),
  (BayerischerPlatz:Haltestelle {name: 'BayerischerPlatz'}),
  (BerlinerStr:Haltestelle {name: 'BerlinerStr'}),
  (BlisseStr:Haltestelle {name: 'BlisseStr'}),
  (Bundesplatz:Haltestelle {name: 'Bundesplatz'}),
  (FehrbellinerPlatz:Haltestelle {name: 'FehrbellinerPlatz'}), 
  (GüntzelStr:Haltestelle {name: 'GüntzelStr'}),
  (HeidelbergerPlatz:Haltestelle {name: 'HeidelbergerPlatz'}), 
  (Hohenzollernplatz:Haltestelle {name: 'Hohenzollernplatz'}),
  (KonstanzerStr:Haltestelle {name: 'KonstanzerStr'}),
  (Kurfürstendamm:Haltestelle {name: 'Kurfürstendamm'}),
  (SpichernStr:Haltestelle {name: 'SpichernStr'}),
  (Wittenbergplatz:Haltestelle {name: 'Wittenbergplatz'}),
  (ZoologischerGarten:Haltestelle {name: 'ZoologischerGarten'})

// ------------------------------------------------------------------------------
// Beziehungen: L (Link): Haltestelle -> Haltestelle
// ------------------------------------------------------------------------------
CREATE
  (AugsburgerStr)-[:L {distanz: 429}]->(Wittenbergplatz),
  (BerlinerStr)-[:L {distanz: 550}]->(GüntzelStr),
  (Bundesplatz)-[:L {distanz: 1088}]->(BerlinerStr),
  (FehrbellinerPlatz)-[:L {distanz: 763}]->(Hohenzollernplatz),
  (GüntzelStr)-[:L {distanz: 512}]->(SpichernStr),
  (HeidelbergerPlatz)-[:L {distanz: 1211}]->(FehrbellinerPlatz),
  (Hohenzollernplatz)-[:L {distanz: 541}]->(SpichernStr),
  (KonstanzerStr)-[:L {distanz: 481}]->(FehrbellinerPlatz),
  (Kurfürstendamm)-[:L {distanz: 362}]->(ZoologischerGarten),
  (SpichernStr)-[:L {distanz: 609}]->(AugsburgerStr),
  (SpichernStr)-[:L {distanz: 801}]->(Kurfürstendamm),
  (FehrbellinerPlatz)-[:L {distanz: 582}]->(BlisseStr),
  (BlisseStr)-[:L {distanz: 737}]->(BerlinerStr),
  (BerlinerStr)-[:L {distanz: 629}]->(BayerischerPlatz)

// ------------------------------------------------------------------------------
// Knoten: Halte
// ------------------------------------------------------------------------------
CREATE
  // U3
  (SU31HeidelbergerPlatz:Stop {linie: 'U3', ankunft: localtime('10:00:00'), abfahrt: localtime('10:01:00')}),
  (SU31FehrbellinerPlatz:Stop {linie: 'U3', ankunft: localtime('10:03:01'), abfahrt: localtime('10:04:00')}),
  (SU31Hohenzollernplatz:Stop {linie: 'U3', ankunft: localtime('10:05:16'), abfahrt: localtime('10:06:00')}),
  (SU31SpichernStr:Stop {linie: 'U3', ankunft: localtime('10:06:54'), abfahrt: localtime('10:08:00')}),
  (SU31AugsburgerStr:Stop {linie: 'U3', ankunft: localtime('10:09:00'), abfahrt: localtime('10:10:00')}),
  (SU31Wittenbergplatz:Stop {linie: 'U3', ankunft: localtime('10:10:42'), abfahrt: localtime('10:12:00')}),
  // U7
  (SU71KonstanzerStr:Stop {linie: 'U7', ankunft: localtime('09:58:02'), abfahrt: localtime('09:59:00')}),
  (SU71FehrbellinerPlatz:Stop {linie: 'U7', ankunft: localtime('09:59:48'), abfahrt: localtime('10:01:00')}),
  (SU71BlisseStr:Stop {linie: 'U7', ankunft: localtime('10:01:58'), abfahrt: localtime('10:03:00')}),
  (SU71BerlinerStr:Stop {linie: 'U7', ankunft: localtime('10:04:13'), abfahrt: localtime('10:06:00')}),
  (SU71BayerischerPlatz:Stop {linie: 'U7', ankunft: localtime('10:07:02'), abfahrt: localtime('10:08:00')}),
  // U7, 10 Minuten später
  (SU72KonstanzerStr:Stop {linie: 'U7', ankunft: localtime('10:08:02'), abfahrt: localtime('10:09:00')}),
  (SU72FehrbellinerPlatz:Stop {linie: 'U7', ankunft: localtime('10:09:48'), abfahrt: localtime('10:11:00')}),
  (SU72BlisseStr:Stop {linie: 'U7', ankunft: localtime('10:11:58'), abfahrt: localtime('10:13:00')}),
  (SU72BerlinerStr:Stop {linie: 'U7', ankunft: localtime('10:14:13'), abfahrt: localtime('10:16:00')}),
  (SU72BayerischerPlatz:Stop {linie: 'U7', ankunft: localtime('10:17:02'), abfahrt: localtime('10:16:00')}),
  // U9
  (SU91Bundesplatz:Stop {linie: 'U9', ankunft: localtime('10:01:01'), abfahrt: localtime('10:02:00')}),
  (SU91BerlinerStr:Stop {linie: 'U9', ankunft: localtime('10:03:48'), abfahrt: localtime('10:05:00')}),
  (SU91GüntzelStr:Stop {linie: 'U9', ankunft: localtime('10:05:55'), abfahrt: localtime('10:07:00')}),
  (SU91SpichernStr:Stop {linie: 'U9', ankunft: localtime('10:07:51'), abfahrt: localtime('10:09:00')}),
  (SU91Kurfürstendamm:Stop {linie: 'U9', ankunft: localtime('10:10:20'), abfahrt: localtime('10:12:00')}),
  (SU91ZoologischerGarten:Stop {linie: 'U9', ankunft: localtime('10:12:36'), abfahrt: localtime('10:14:00')})

// ------------------------------------------------------------------------------
// Beziehungen: IH (in Haltestelle): Stop -> Haltestelle
// ------------------------------------------------------------------------------
CREATE
  (SU31AugsburgerStr)-[:IH]->(AugsburgerStr),
  (SU71BayerischerPlatz)-[:IH]->(BayerischerPlatz),
  (SU72BayerischerPlatz)-[:IH]->(BayerischerPlatz),
  (SU71BerlinerStr)-[:IH]->(BerlinerStr),
  (SU72BerlinerStr)-[:IH]->(BerlinerStr),
  (SU91BerlinerStr)-[:IH]->(BerlinerStr),
  (SU71BlisseStr)-[:IH]->(BlisseStr),
  (SU72BlisseStr)-[:IH]->(BlisseStr),
  (SU91Bundesplatz)-[:IH]->(Bundesplatz),
  (SU31FehrbellinerPlatz)-[:IH]->(FehrbellinerPlatz),
  (SU71FehrbellinerPlatz)-[:IH]->(FehrbellinerPlatz),
  (SU72FehrbellinerPlatz)-[:IH]->(FehrbellinerPlatz),
  (SU91GüntzelStr)-[:IH]->(GüntzelStr),
  (SU31HeidelbergerPlatz)-[:IH]->(HeidelbergerPlatz),
  (SU31Hohenzollernplatz)-[:IH]->(Hohenzollernplatz),
  (SU71KonstanzerStr)-[:IH]->(KonstanzerStr),
  (SU72KonstanzerStr)-[:IH]->(KonstanzerStr),
  (SU91Kurfürstendamm)-[:IH]->(Kurfürstendamm),
  (SU31SpichernStr)-[:IH]->(SpichernStr),
  (SU91SpichernStr)-[:IH]->(SpichernStr),
  (SU31Wittenbergplatz)-[:IH]->(Wittenbergplatz),
  (SU91ZoologischerGarten)-[:IH]->(ZoologischerGarten)

// ------------------------------------------------------------------------------
// Beziehungen: N (nächster Stop): Stop -> Stop
// ------------------------------------------------------------------------------
CREATE
  (SU31HeidelbergerPlatz)-[:N]->(SU31FehrbellinerPlatz),
  (SU31FehrbellinerPlatz)-[:N]->(SU31Hohenzollernplatz),
  (SU31Hohenzollernplatz)-[:N]->(SU31SpichernStr),
  (SU31SpichernStr)-[:N]->(SU31AugsburgerStr),
  (SU31AugsburgerStr)-[:N]->(SU31Wittenbergplatz),
  //
  (SU71KonstanzerStr)-[:N]->(SU71FehrbellinerPlatz),
  (SU71FehrbellinerPlatz)-[:N]->(SU71BlisseStr),
  (SU71BlisseStr)-[:N]->(SU71BerlinerStr),
  (SU71BerlinerStr)-[:N]->(SU71BayerischerPlatz),
  //
  (SU72KonstanzerStr)-[:N]->(SU72FehrbellinerPlatz),
  (SU72FehrbellinerPlatz)-[:N]->(SU72BlisseStr),
  (SU72BlisseStr)-[:N]->(SU72BerlinerStr),
  (SU72BerlinerStr)-[:N]->(SU72BayerischerPlatz),
  //
  (SU91Bundesplatz)-[:N]->(SU91BerlinerStr),
  (SU91BerlinerStr)-[:N]->(SU91GüntzelStr),
  (SU91GüntzelStr)-[:N]->(SU91SpichernStr),
  (SU91SpichernStr)-[:N]->(SU91Kurfürstendamm),
  (SU91Kurfürstendamm)-[:N]->(SU91ZoologischerGarten)


