// ------------------------------------------------------------------------------
// Löschen
// ------------------------------------------------------------------------------
match (n) detach delete n;

// ------------------------------------------------------------------------------
// Knoten: Banken
// ------------------------------------------------------------------------------
CREATE
  (b01:Bank {name: 'Deutsche Bank'}), 
  (b02:Bank {name: 'Commerzbank'}), 
  (b03:Bank {name: 'Volksbank'}), 
  (b04:Bank {name: 'Ing Diba'})

// ------------------------------------------------------------------------------
// Knoten: Kunden
// ------------------------------------------------------------------------------
CREATE
  (pk01:Privat:Kunde {name: 'Klausen'}),
  (pk02:Privat:Kunde {name: 'Franzen'}),
  (pk03:Privat:Kunde {name: 'Vogel'}),
  (pk04:Privat:Kunde {name: 'Bauer'}),

  (uk01:Unternehmen:Kunde {name: 'Baustoff Gruppe'}),
  (uk011:Unternehmen:Kunde {name: 'Feststoff AG'}),
  (uk0111:Unternehmen:Kunde {name: 'Beton GmbH'}),
  (uk0112:Unternehmen:Kunde {name: 'Zement GmbH'}),
  (uk012:Unternehmen:Kunde {name: 'Holz AG'}),

  (uk02:Unternehmen:Kunde {name: 'Fix GmbH'}),
  (uk03:Unternehmen:Kunde {name: 'Happy OHG'})

// ------------------------------------------------------------------------------
// Knoten: Konten
// ------------------------------------------------------------------------------
CREATE
  (kto01:Konto {iban: 'de03 1234 5678 9012 34'}), 
  (kto02:Konto {iban: 'de03 2345 6789 0123 45'}), 
  (kto03:Konto {iban: 'de04 3456 7890 1234 56'}), 
  (kto04:Konto {iban: 'de04 4567 8901 2345 67'}), 
  (kto05:Konto {iban: 'de01 4567 1234 6789 22'}), 
  (kto06:Konto {iban: 'de01 4567 1234 6789 22'}), 
  (kto07:Konto {iban: 'de01 4567 1234 6789 22'}), 
  (kto08:Konto {iban: 'de01 4567 1234 6789 22'}), 
  (kto09:Konto {iban: 'de01 4567 1234 6789 22'}), 
  (kto10:Konto {iban: 'de02 4567 1234 6789 22'}), 
  (kto11:Konto {iban: 'de02 4567 1234 6789 22'})

// ------------------------------------------------------------------------------
// Beziehungen: Kunde -> Bank
// ------------------------------------------------------------------------------
CREATE
  (pk01)-[:KD]->(b03),
  (pk02)-[:KD]->(b03),
  (pk03)-[:KD]->(b04),
  (pk04)-[:KD]->(b04),
  (uk01)-[:KD]->(b01),
  (uk011)-[:KD]->(b01),
  (uk0111)-[:KD]->(b01),
  (uk0112)-[:KD]->(b01),
  (uk012)-[:KD]->(b01),
  (uk02)-[:KD]->(b02),
  (uk03)-[:KD]->(b02)

// ------------------------------------------------------------------------------
// Beziehungen: Konto -> Kunde 
// ------------------------------------------------------------------------------
CREATE
  (kto01)-[:KTO]->(pk01),
  (kto02)-[:KTO]->(pk02),
  (kto03)-[:KTO]->(pk03),
  (kto04)-[:KTO]->(pk04),
  (kto05)-[:KTO]->(uk01),
  (kto06)-[:KTO]->(uk01),
  (kto07)-[:KTO]->(uk011),
  (kto08)-[:KTO]->(uk0111),
  (kto09)-[:KTO]->(uk0112),
  (kto10)-[:KTO]->(uk012),
  (kto11)-[:KTO]->(uk02),
  (kto04)-[:KTO]->(uk03)


// ------------------------------------------------------------------------------
// Beziehungen: Subuternehmen
// ------------------------------------------------------------------------------
CREATE
  (uk011)-[:SUB]->(uk01),
  (uk0111)-[:SUB]->(uk011),
  (uk0112)-[:SUB]->(uk011),
  (uk012)-[:SUB]->(uk01)


// ------------------------------------------------------------------------------
// Beziehungen: Überweisungen
// ------------------------------------------------------------------------------
/*
CREATE
  (kto01)-[:UEB {betrag: 300}]->(kto0),
  (kto01)-[:UEB {betrag: 300}]->(kto02),
  (kto02)-[:UEB {betrag: 300}]->(kto03),
  (kto02)-[:UEB {betrag: 300}]->(kto04),
  (kto03)-[:UEB {betrag: 300}]->(kto0),
  (kto0 )-[:UEB {betrag: 300}]->(kto0),
  (kto0 )-[:UEB {betrag: 300}]->(kto0),
  (kto0 )-[:UEB {betrag: 300}]->(kto0),
  (kto0 )-[:UEB {betrag: 300}]->(kto0),
  (kto0 )-[:UEB {betrag: 300}]->(kto0),
  (kto0 )-[:UEB {betrag: 300}]->(kto0),
  (kto0 )-[:UEB {betrag: 300}]->(kto0),
  (kto0 )-[:UEB {betrag: 300}]->(kto0),
  (kto0 )-[:UEB {betrag: 300}]->(kto0),
  (kto0 )-[:UEB {betrag: 300}]->(kto0),
  (kto0 )-[:UEB {betrag: 300}]->(kto0),
  (kto0 )-[:UEB {betrag: 300}]->(kto0),
  (kto0 )-[:UEB {betrag: 300}]->(kto0),
  (kto0 )-[:UEB {betrag: 300}]->(kto0),
  (kto0 )-[:UEB {betrag: 300}]->(kto0),

*/