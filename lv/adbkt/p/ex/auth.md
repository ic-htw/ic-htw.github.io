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

## Beispiel 6
```python
setAuth("g3", "u1", "D")
```

- Admins a1 und a2 wird Zugriff auf u1 verboten
- D hat immer Vorrang<br>
  ![Bild](/lv/adbkt/a/auth/setAuth-g3-u1-d-graph.png)<br>

```
showAuth()
```
- Zugriffsdaten<br>
![Tabelle](/lv/adbkt/a/auth/setAuth-g3-u1-d-tab.png)<br>



## Beispiele für unsetAuth
- Jeweils hinter einem setAuth ausführen
- Dann muss wieder der vorherige Zustand bei showAuth angezeigt werden