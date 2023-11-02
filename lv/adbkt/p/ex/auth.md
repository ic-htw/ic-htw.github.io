---
layout: default
title: ADBKT
---

# Zugriffskontrolle mit Graphdatenbanken

## Aufgabestellung
- In einer Graphdatenbank werden folgende Daten gespeichert
  - Unternehmensstruktur<br>
    ![Bild1](/lv/adbkt/a/auth/unternehmensstruktur.png)<br>
    Das Unternehmen "u1" hat Subunternehmen "u11" und "u12"<br>
    Die Subunternehmen habe Subsubunternehmen usw.<br>
    Der Typ der Beziehung ist "SUB"
  - Administratoren und deren Gruppen<br>
    ![Bild1](/lv/adbkt/a/auth/admin-gruppen.png)<br>
    Admins können zu mehreren Gruppen gehören<br>
    Gruppen können mehrere Admins beinhalten<br>
    Der Typ der Beziehung ist "ING" (steht für "in Gruppe")

- Sie sollen in Python folgende Funktionen für die Zugriffskontrolle entwickeln
  - `setAuth(gruppe, unternehmen, auth)`
    - Damit sollen für die Admingruppe `gruppe` für das (Sub)Unternehmen `unternehmen` die Zugriffsrechte gesetzt werden
    - `auth` kann folgende Werte annehmen<br>
      `AI` (Allow Inherit): Zugriff für das Unternehmen und alle Subunternehmen erlauben<br>
      `DI` (Deny Inherit): Zugriff für das Unternehmen und alle Subunternehmen verbieten. Hat Vorrang vor AI<br>
      `A` (Allow): Zugriff nur für das Unternehmen erlauben. Hat Vorrang vor DI<br>
      `D` (Deny): Zugriff nur für das Unternehmen verbieten. Hat Vorrang vor allen

  - `showAuth()`
    - Zeigt detailliert in tabellarischer Form an, welcher Admin Zugriff auf welche Unternehmen hat

  - `unsetAuth(gruppe, unternehmen, auth)`
    - Damit sollen für die Admingruppe `gruppe` für das (Sub)Unternehmen `unternehmen` die Zugriffsrechte zurückgesetzt werden

## Hinweise zur Lösung
- Code zum Anlegen der Knoten und Kanten [(ipynb)](/lv/adbkt/a/ipynb/neo4j-auth.ipynb)
  [(render)](https://github.com/ic-htw/ic-htw.github.io/blob/master/lv/adbkt/a/ipynb/neo4j-auth.ipynb)
- Legen Sie mittels "setAuth" geeignete Beziehungen in der Graphdatenbank an
- Nutzen sie Cypher-Abfragen zur Lösung des Problems
- Nur die tabellarischen Ausgaben sind in ihrer Lösung notwendig, nicht die Graphiken
- Die Graphiken dienen lediglich zur Illustration



## Beispiel 1
#### `setAuth("g3", "u1", "AI")`

- Gruppe 3 enthält Admins a1 und a2
- Wegen Vererbung der Rechte erhalten a1 und a2 Zugriff auf alles<br>
  ![Bild](/lv/adbkt/a/auth/setAuth-g3-u1-ai-graph.png)<br>

#### `showAuth()`
> ![Tabelle](/lv/adbkt/a/auth/setAuth-g3-u1-ai-tab.png)<br>

## Beispiel 2
#### `setAuth("g1", "u12", "DI"), setAuth("g2", "u11", "DI")`

- Gruppe 1 enthält Admin a1, Gruppe 2 Admin a2
- Admin a1 wird Zugriff auf u12 verboten (mit Vererbung)
- Admin a2 wird Zugriff auf u11 verboten (mit Vererbung)
- DI hat Vorrang vor AI<br>
  ![Bild](/lv/adbkt/a/auth/setAuth-g1-u12-di-und-setAuth-g2-u11-di-graph.png)<br>

#### `showAuth()`
> ![Tabelle](/lv/adbkt/a/auth/setAuth-g1-u12-di-und-setAuth-g2-u11-di-tab.png)<br>


## Beispiel 3
#### `setAuth("g1", "u111", "DI")`

- Admin a1 wird Zugriff auf u111 verboten (mit Vererbung)<br>
  ![Bild](/lv/adbkt/a/auth/setAuth-g1-u111-di-graph.png)<br>

#### `showAuth()`
> ![Tabelle](/lv/adbkt/a/auth/setAuth-g1-u111-di-tab.png)<br>


## Beispiel 4
#### `setAuth("g1", "u1111", "A")`

- Admin a1 wird Zugriff auf u1111 erlaubt
- A hat Vorrang vor DI<br>
  ![Bild](/lv/adbkt/a/auth/setAuth-g1-u1111-a-graph.png)<br>

#### `showAuth()`
> ![Tabelle](/lv/adbkt/a/auth/setAuth-g1-u1111-a-tab.png)<br>


## Beispiel 5
#### `setAuth("g2", "u112", "D")`

- Admin a2 wird Zugriff auf u12 verboten
- D hat immer Vorrang<br>
  ![Bild](/lv/adbkt/a/auth/setAuth-g2-u12-d-graph.png)<br>

#### `showAuth()`
> ![Tabelle](/lv/adbkt/a/auth/setAuth-g2-u12-d-tab.png)<br>





## Beispiel 6
#### `setAuth("g3", "u1", "D")`

- Admins a1 und a2 wird Zugriff auf u1 verboten
- D hat immer Vorrang<br>
  ![Bild](/lv/adbkt/a/auth/setAuth-g3-u1-d-graph.png)<br>

#### `showAuth()`
> ![Tabelle](/lv/adbkt/a/auth/setAuth-g3-u1-d-tab.png)<br>



## Beispiele für unsetAuth
- Jeweils hinter einem setAuth ausführen
- Dann muss wieder der vorherige Zustand bei showAuth angezeigt werden