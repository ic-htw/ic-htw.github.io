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

MATCH p = 
  (zem:Kunde {name: 'Zement GmbH'})
  ((kx:Kunde)<-[:KTO]-(ktox:Konto)-[ueb:UEB]->(ktoy:Konto)-[:KTO]->(ky:Kunde))+
  (k:Kunde)
RETURN zem.name, k.name, ueb;