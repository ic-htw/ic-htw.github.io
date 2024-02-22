---
layout: default
title: ADBKT
---

# Neo4j-Container anlegen



- In Portainer einloggen (nur im Intranet: entweder an der HTW oder über VPN):
  - Host, Userid und Passwort werden in der LV bekannt gegeben
  - `https://xxx.f4.htw-berlin.de:9443/`
- Environment "local" auswählen
- In der Navigationsleiste links auf "Stacks" klicken
- Auf Button "Add stack" klicken
- Name "neo4j" vergeben
- Skript "Docker Compose - Neo4j" in Web Editor kopieren (siehe [link](/lv/adbkt/p/infra.html#docker-compose---neo4j))
- Auf "Deploy the stack" klicken
- Auf Neo4j-Browser zugreifen: `http://xxx.f4.htw-berlin.de:7474`

