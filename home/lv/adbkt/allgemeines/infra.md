---
layout: default1
nav: adbkt-allgemeines
title: Infrastruktur - ADBKT
is_slide: 0
---

---
# Arbeiten mit dem Portainer

## Einloggen
- Nur im Intranet: entweder an der HTW oder über VPN
- Host, Userid und Passwort werden in der LV bekannt gegeben
- <code>https://xxx.f4.htw-berlin.de:9443/</code>

## Environment "local" auswählen
- Auf "local" klicken
- Dashboard wird angezeigt

## Netzwerk anlegen
- In der Navigationsleiste links auf "Networks" klicken
- Auf Button "Add network" klicken
- Name "adbkt" eintragen

## Stack anlegen
- Stacks entsprechen <code>docker-compose</code>
- In der Navigationsleiste links auf "Stacks" klicken
- Auf Button "Add stack" klicken
- Docker-Compose-Code in Web-Editor eingeben
- Auf "Deploy the stack" klicken

---
# Postgres 
## Container erstellen
```yaml
networks:
  adbkt:
    external: true
    
services:
  pg:
    container_name: pg
    image: postgres:latest
    ports:
      - 5432:5432
    environment:
      POSTGRES_PASSWORD: htw-bln-pg
    networks:
      - adbkt
```

---
# Python 
## Container erstellen
Das ist die Version für die Einzelgruppe. Siehe unten bzgl. Anpassung an andere Gruppengrößen.
```yaml
networks:
  adbkt:
    external: true

services:
  py:
    container_name: py
    image: iclassen/ubu-py-uv:latest
    entrypoint: ["/root/entrypoint.sh"]
    user: root
    ports:
      - 10000:8888
      - "20000:22"
      - 30000:3000
      - 40000:4000
      - 50000:5000
      - 60000:6000
    networks:
      - adbkt
```

Zweiergruppe: Zwei Container ```py1``` und ```py2```, container_name anpasen
  
Portanpassungen
- 10001:8888 für py1 und 10002:8888 für py2
- 20001:22 für py1 und 20002:22 für py2
- 30001:3000 für py1 und 30002:3000 für py2
- usw.


## Auf JupyterLab zugreifen
Port ggf. anpassen: 10001 oder 10002, Host anpassen.
```
http://aaa.f4.htw-berlin.de:10000/lab
```

## Bibliothek installieren
Terminal in JupyterLab öffnen. Code kopieren.
```
uv pip install -U psycopg[binary,pool]
```
Paste mit CTRL-SHIFT-V

## Per Python auf Postgres zugreifen
Neues Notebook anlegen. Code in erste Zelle kopieren.
```python
import psycopg

conninfo = " ".join([
"user='postgres'",
"password='htw-bln-pg'",
"host='pg'",
"port=5432",
"dbname='postgres'"])
print(conninfo)

sql1 = "drop table if exists kv"
sql2 = """ 
create table kv (
  k integer not null,
  v varchar not null
)
"""
sql3 = "insert into kv values (1, 'hallo'), (2, 'hi')"

with psycopg.connect(conninfo) as conn:
    conn.execute(sql1) 
    conn.execute(sql2) 
    conn.execute(sql3) 

sql = "select * from kv"
with psycopg.connect(conninfo) as conn:
    rs = conn.execute(sql).fetchall()

print(rs)
```
---
# Cassandra
## Container erstellen
```yaml
networks:
  adbkt:
    external: true

services:
  cas:
    container_name: cas
    image: cassandra:latest
    ports:
      - 9042:9042
    environment:
      - JVM_OPTS=-Xms1024M -Xmx1024M
      - HEAP_NEWSIZE=1024M
      - MAX_HEAP_SIZE=1024M
    networks:
      - adbkt
    healthcheck:
      test: ["CMD", "cqlsh", "-e", "describe keyspaces"]
      interval: 20s
      timeout: 10s
      retries: 15
      start_period: 60s
```

## Keyspace erstellen
- Konsole in Container ```cas``` öffnen 
-  Cassandra Query Language Shell starten (```cqlsh```). 
- Code ausführen:
  ```sql
  create keyspace test with replication = {
    'class': 'SimpleStrategy', 'replication_factor' : 1
  };

  use test;

  create table t (
    pk int, 
    sk int, 
    v int, 
    primary key (pk, sk)
  );
  
  insert into t(pk, sk, v) values (1, 1, 100);
  insert into t(pk, sk, v) values (1, 2, 200);
  
  select * from t where pk=1;
  ```

## Bibliothek installieren
Terminal in JupyterLab öffnen. Code kopieren.
```
uv pip install -U cassandra-driver
```
Paste mit CTRL-SHIFT-V


## Per Python auf Cassandra zugreifen
Neues Notebook anlegen. Code in erste Zelle kopieren.
```python
from cassandra.cluster import Cluster

cluster = Cluster(["cas"], port=9042)
session = cluster.connect('test')

print(session.execute("SELECT release_version FROM system.local").one())

rows = session.execute("select * from t where pk=1")
for r in rows:
    print(f"{r.pk}|{r.sk}|{r.v}")

session.shutdown()
cluster.shutdown()
```



# MD
```xxx```

```
xxx
```

```yaml
aaa
```

```python
aaa
```

```sql
aaa
```

