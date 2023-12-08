---
layout: default
title: "DmDb"
head1: "Datenmodellierung und Datenbanksysteme"
head2: "Relationenmodell"
---

***

## Tabelle = Tabellenstruktur + Tabelleninhalt
![Bild](/lv/dmdb/a/relmod/tab1.png)

### Tabellenstruktur
- Tabellenname (grün)
- Spaltennamen (braun)
- Primärschlüssel (unterstrichen, pink)
- Datentypen: Zahl ( SID ), Zeichenkette ( Name ), Datum ( ExDatum 

### Tabelleninhalt
- Datensätze (Zeilen in grau)

***

## Strukturdarstellung / SQL-Anweisung
![Bild](/lv/dmdb/a/relmod/tab2.png)
![Bild](/lv/dmdb/a/relmod/tab3.png)

***

## Fremdschlüssel
![Bild](/lv/dmdb/a/relmod/tab4.png)<br>
![Bild](/lv/dmdb/a/relmod/tab5.png)

- SG enthält Zeiger auf Studiengang-Datensätze
- Student 1 und 2 studieren WI
- Studentin 3 studiert AI

***

## Datentypen (beispielhaft)

| Typname | Wertebereich | Beispiele |
|:-|:-|:-|
|integer | ganze Zahlen | -100, 200 |
| decimal(5,3) &nbsp; &nbsp;| Festkommazahlen | 10,156 |
| float | Gleitkommazahlen | 10,154789 |
| varchar(10) | Zeichenketten variabler Länge &nbsp; &nbsp;| 'Hallo' |
| date | Datum | 1.1.2007 14:30:12 |

***
## Integritätsbedingungen
- __Primärschlüssel / Unique Constraint__
  - Eindeutigkeit der Spaltenwerte.
  - Identifikation von Datensätzen
- __Fremdschlüssel__
  - Beziehungen zwischen Tabellen.
  - Referenzielle Integrität, Zielwert muss existieren.
- __Check-Constraint__
  - Einschränkungen einer Spalte.
  - Anzahl Plätze in einer Veranstaltung darf nicht negativ sein.
- __Not-Null-Constraint__
  - Spalte muss Werte enthalten.

***

## Gründe für Nullwerte
- __Information wird nicht bereit gestellt__
  - Private Telefonnummer
- __Information noch nicht vorhanden.__
  - Exmatrikulationsdatum existiert erst nach Exmatrikulation
- __Spalte macht für Datensatz keinen Sinn__
  - Personentabelle mit Daten von Studies und Profs
  - Spalte MatrNr macht nur für Studies Sinn

***