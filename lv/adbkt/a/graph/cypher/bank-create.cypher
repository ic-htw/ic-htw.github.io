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
  (pk01:Privatkunde:Kunde {name: 'Klausen'}),
  (pk02:Privatkunde:Kunde {name: 'Franzen'}),
  (pk03:Privatkunde:Kunde {name: 'Vogel'}),
  (pk04:Privatkunde:Kunde {name: 'Bauer'}),

  (uk01:Unternehmenskunde:Kunde {name: 'Baustoff Gruppe'}),
  (uk011:Unternehmenskunde:Kunde {name: 'Feststoff AG'}),
  (uk0111:Unternehmeskunde:Kunde {name: 'Beton GmbH'}),
  (uk0112:Unternehmenskunde:Kunde {name: 'Zement GmbH'}),
  (uk012:Unternehmenskunde:Kunde {name: 'Holz AG'}),

  (uk02:Unternehmenskunde:Kunde {name: 'Fix GmbH'}),
  (uk03:Unternehmenskunde:Kunde {name: 'Happy OHG'})

// ------------------------------------------------------------------------------
// Knoten: Konten
// ------------------------------------------------------------------------------
CREATE
  (kto01:Konto {iban: '#iban01'}), 
  (kto02:Konto {iban: '#iban02'}), 
  (kto03:Konto {iban: '#iban03'}), 
  (kto04:Konto {iban: '#iban04'}), 
  (kto05:Konto {iban: '#iban05'}), 
  (kto06:Konto {iban: '#iban06'}), 
  (kto07:Konto {iban: '#iban07'}), 
  (kto08:Konto {iban: '#iban08'}), 
  (kto09:Konto {iban: '#iban09'}), 
  (kto10:Konto {iban: '#iban10'}), 
  (kto11:Konto {iban: '#iban11'}),
  (kto12:Konto {iban: '#iban12'})

// ------------------------------------------------------------------------------
// Beziehungen: Subuternehmen
// ------------------------------------------------------------------------------
CREATE
  (uk011)-[:SUB]->(uk01),
  (uk0111)-[:SUB]->(uk011),
  (uk0112)-[:SUB]->(uk011),
  (uk012)-[:SUB]->(uk01)


// ------------------------------------------------------------------------------
// Beziehungen: Kunde -> Bank
// ------------------------------------------------------------------------------
CREATE
  (pk01)-[:KD]->(b02),
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
  (kto01)-[:KTO]->(pk01), // Klausen
  (kto02)-[:KTO]->(pk02), // Franzen
  (kto03)-[:KTO]->(pk03), // Vogel
  (kto04)-[:KTO]->(pk04), // Bauer
  (kto05)-[:KTO]->(uk01), // Baustoff Gruppe
  (kto06)-[:KTO]->(uk01), // Baustoff Gruppe
  (kto07)-[:KTO]->(uk011), // Feststoff AG
  (kto08)-[:KTO]->(uk0111), // Beton GmbH
  (kto09)-[:KTO]->(uk0112), // Zement GmbH
  (kto10)-[:KTO]->(uk012), // Holz AG
  (kto11)-[:KTO]->(uk02), // Fix GmbH
  (kto12)-[:KTO]->(uk03) // Happy OHG


// ------------------------------------------------------------------------------
// Beziehungen: Überweisungen
// ------------------------------------------------------------------------------
CREATE
  (kto01)-[:UEB {betrag: 100}]->(kto12),
  (kto01)-[:UEB {betrag: 150}]->(kto10),

  (kto02)-[:UEB {betrag: 200}]->(kto09),

  (kto05)-[:UEB {betrag: 1000}]->(kto09),

  (kto07)-[:UEB {betrag: 1000}]->(kto05),

  (kto08)-[:UEB {betrag: 250}]->(kto04),
  (kto08)-[:UEB {betrag: 1000}]->(kto07),

  (kto09)-[:UEB {betrag: 300}]->(kto03),
  (kto09)-[:UEB {betrag: 1000}]->(kto10),
  (kto09)-[:UEB {betrag: 350}]->(kto08),
  (kto09)-[:UEB {betrag: 1000}]->(kto08),

  (kto10)-[:UEB {betrag: 1100}]->(kto05)

/*
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