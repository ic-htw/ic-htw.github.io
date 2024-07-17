call db.schema.visualization()

MATCH
  (b:Bank {name: 'Commerzbank'})<-[:KD]-(k:Kunde)
RETURN k.name as kunde;

MATCH
  (b:Bank {name: 'Commerzbank'})<-[:KD]-(k:Privatkunde)
RETURN k.name as kunde;

MATCH (k:Kunde) RETURN count(*) as anzahlKunden;

MATCH 
  (k:Kunde) <-[:KTO]-(kto:Konto)
WITH k.name as kunde, count(*) as anzahlKonten, collect(kto.iban) as konten
WHERE anzahlKonten > 1
RETURN kunde, anzahlKonten, konten;

MATCH 
  (k:Kunde) <-[:KTO]-(kto:Konto)
WITH k.name as kunde, count(*) as anzahlKonten, collect(kto.iban) as konten
WHERE anzahlKonten > 1
UNWIND konten as kontenx
RETURN kunde, anzahlKonten, kontenx;

MATCH 
  p = (k:Kunde {name: 'Baustoff Gruppe'})<-[:SUB]-+(ks:Kunde WHERE NOT EXISTS {(kx:Kunde)-[:SUB]->(ks)})
RETURN [x IN nodes(p) | x.name] as hierarchie;

MATCH 
  p = (k:Kunde {name: 'Baustoff Gruppe'})<-[:SUB]-+(ks:Kunde WHERE NOT EXISTS {(kx:Kunde)-[:SUB]->(ks)})
WITH [x IN nodes(p) | x.name] as h
RETURN  reduce(s = h[0], y IN h[1..] | s + ', ' + y) as hierarchie;

MATCH
  (uk:Unternehmenskunde)<-[:KTO]-(kto1:Konto)<-[ueb:UEB]-(kto2:Konto)-[:KTO]->(pk:Privatkunde)
RETURN uk.name as unternehmen, pk.name as person, ueb.betrag as betrag;

MATCH 
  (k1:Kunde {name: 'Zement GmbH'})<-[:KTO]-(:Konto)
  -[ueb1:UEB]->(:Konto)
  -[:KTO]->(k2:Kunde)
RETURN k1.name, k2.name, ueb1.betrag;

MATCH 
  (k1:Kunde {name: 'Zement GmbH'})<-[:KTO]-(:Konto)
  -[ueb1:UEB]->(kto1:Konto)-[ueb2:UEB]->(kto2:Konto)
  -[:KTO]->(kn:Kunde)
RETURN k1.name, ueb1.betrag, ueb2.betrag, kn.name;

MATCH 
  (k1:Kunde {name: 'Zement GmbH'})<-[:KTO]-(:Konto)
  ((ktox:Konto)-[ueb:UEB]->(ktoy:Konto))+
  (kton:Konto)-[:KTO]->(kn:Kunde)
WITH 
  k1.name as kunde1, 
  [u IN ueb | u.betrag] as betraege,
  kn.name as kundeN
WHERE 
  all(b IN betraege WHERE b = betraege[0])
  AND size(betraege) > 1
RETURN kunde1, betraege, kundeN;

MATCH p = 
  (k1:Kunde {name: 'Zement GmbH'})<-[:KTO]-(:Konto)
  ((ktox:Konto)-[ueb:UEB]->(ktoy:Konto))+
  (kton:Konto)-[:KTO]->(kn:Kunde)
RETURN 
  nodes(p);

MATCH p = 
  (ku1:Kunde)<-[:KTO]-(:Konto)
  ((ktox:Konto)-[ueb:UEB]->(ktoy:Konto))+
  (kton:Konto)-[:KTO]->(kuN:Kunde)
WHERE 
  ku1.name = 'Zement GmbH'
//  AND kuN.name = 'Zement GmbH'
RETURN 
  nodes(p);

