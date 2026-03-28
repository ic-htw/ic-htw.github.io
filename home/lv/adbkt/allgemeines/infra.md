---
layout: default1
nav: adbkt-allgemeines
title: Infrastruktur - ADBKT
is_slide: 0
---

---
# Vorbemerkung
Alle Zugriffe nur im Intranet: entweder an der HTW oder über VPN

---
# Arbeiten mit dem Portainer

## Einloggen
- Host, Userid und Passwort werden in der LV bekannt gegeben
- <code>https://aaa.f4.htw-berlin.de:9443/</code>

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
Achtung: Passwort vergeben
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
      POSTGRES_PASSWORD: 
    networks:
      - adbkt
```

## Per DBeaver auf Datenbank zugreifen
- DBeaver Download [(link)](https://dbeaver.io/download/)
- Passwort wie vorher vergeben
- Creds
  - user: postgres
  - password: 
  - host: aaa.f4.htw-berlin.de:5432
  - database: postgres

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

Achtung: Passwort eintragen, wie vorher vergeben

```python
import psycopg

conninfo = " ".join([
"user='postgres'",
"password=''",
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

# Neo4j
## Container erstellen
Achtung: Passwort vergeben, siehe Code: ```NEO4J_AUTH=neo4j/<---hier das passwort```

```yaml
networks:
  adbkt:
    external: true

services:
  neo4j:
    container_name: neo4j
    image: neo4j
    ports:
      - 7474:7474
      - 7687:7687
    environment:
      - NEO4J_AUTH=neo4j/
      - NEO4J_server_memory_heap_initial__size=500M 
      - NEO4J_server_memory_heap_max__size=500M 
      - NEO4J_server_memory_pagecache_size=500M 
      - NEO4J_PLUGINS=["apoc", "graph-data-science"]
```

## Auf Neo4j-Browser zugreifen
```
http://aaa.f4.htw-berlin.de:7474
```

## Alle Daten löschen
```cypher
MATCH (x) DETACH DELETE x;
```

## UBahn-Daten laden
Passwort setzen, siehe Code: ```neo4j_auth = ("neo4j", "hier das passwort")```

```python
import duckdb
from neo4j import GraphDatabase

parquet_url = "https://raw.githubusercontent.com/ic-htw/data/main/parquet/bubahn"

def load_df(table_name):
    return duckdb.query(f"SELECT * FROM '{parquet_url}/{table_name}.parquet'").to_df()

df_haltestelle = load_df("haltestelle")
df_segment = load_df("segment")
df_linie = load_df("linie")
df_unterlinie = load_df("unterlinie")
df_abschnitt = load_df("abschnitt")

neo4j_host = "neo4j://widb000l.f4.htw-berlin.de:7687"
neo4j_auth = ("neo4j", "")

cypher_create_stop = 'CREATE (h:Haltestelle {hid: $hid, bez: $bez, lat:$lat, lng:$lng})'
with GraphDatabase.driver(neo4j_host, auth=neo4j_auth) as driver:
    with driver.session() as session:
        for r in df_haltestelle.itertuples(index=False):
            session.run(cypher_create_stop, hid=r.HID, bez=r.BEZ, lat=r.LAT, lng=r.LNG)

cypher_create_linie = 'CREATE (l:Linie {lid: $lid, bez: $bez})'
with GraphDatabase.driver(neo4j_host, auth=neo4j_auth) as driver:
    with driver.session() as session:
        for r in df_linie.itertuples(index=False):
            session.run(cypher_create_linie, lid=r.LID, bez=r.BEZ)

cypher_create_segment = '''
MATCH (ha:Haltestelle), (hb:Haltestelle)
WHERE ha.hid=$hid_a AND hb.hid=$hid_b
CREATE (s:Segment {hid_a: ha.hid, hid_b: hb.hid, laengeInMeter: $laengeInMeter})
CREATE (s) -[:ProjSegA]-> (ha)
CREATE (s) -[:ProjSegB]-> (hb)
'''
with GraphDatabase.driver(neo4j_host, auth=neo4j_auth) as driver:
    with driver.session() as session:
        for r in df_segment.itertuples(index=False):
            session.run(cypher_create_segment, hid_a=r.hid_a, hid_b=r.hid_b, laengeInMeter=r.laenge_in_meter)


cypher_create_unterlinie = '''
MATCH (l:Linie)
WHERE l.lid=$lid
CREATE (ul:Unterlinie {ulid: $ulid})
CREATE (ul) -[:InL]-> (l)
'''
with GraphDatabase.driver(neo4j_host, auth=neo4j_auth) as driver:
    with driver.session() as session:
        for r in df_unterlinie.itertuples(index=False):
            session.run(cypher_create_unterlinie, ulid=r.ULID, lid=r.LID)


cypher_create_abschnitt = '''
MATCH (ha:Haltestelle), (hb:Haltestelle), (ul:Unterlinie)
WHERE ha.hid=$hid_a AND hb.hid=$hid_b AND ul.ulid=$ulid
CREATE (a:Abschnitt {nr: $nr, haelt: $haelt})
CREATE (a) -[:InUL]-> (ul)
CREATE (a) -[:ProjAbA]-> (ha)
CREATE (a) -[:ProjAbB]-> (hb)
'''
with GraphDatabase.driver(neo4j_host, auth=neo4j_auth) as driver:
    with driver.session() as session:
        for r in df_abschnitt.itertuples(index=False):
            session.run(cypher_create_abschnitt, ulid=r.ULID, nr=r.NR, hid_a=r.HID_A, hid_b=r.HID_B, haelt=r.HAELT)

```

## Schema anzeigen
```cypher
call db.schema.visualization()
```


## Graphprojektion
### Anlegen

```cypher
MATCH (ha:Haltestelle)<-[sa:ProjSegA]-(s:Segment)-[sb:ProjSegB]-(hb:Haltestelle)
WITH gds.graph.project(
    'bubahn',
    ha,
    hb,
    {relationshipProperties: s{.laengeInMeter}},
    {undirectedRelationshipTypes: ['*']}) AS g
RETURN
  g.graphName AS graph, g.nodeCount AS nodes, g.relationshipCount AS rels
```

### Auflisten

```cypher
call gds.graph.list()
```

### Löschen

```cypher
CALL gds.graph.drop('bubahn') YIELD graphName;
```

# K6
```yaml
networks:
  adbkt:
    external: true

services:
  k6:
    container_name: k6
    image:  iclassen/ubu-k6
    networks:
      - adbkt
```


# InfluxDB
```yaml
networks:
  adbkt:
    external: true

services:
  idb:
    container_name: idb
    image: influxdb:3-core
    ports:
      - 8181:8181
    command:
      - influxdb3
      - serve
      - --node-id=node0
      - --object-store=file
      - --data-dir=/var/lib/influxdb3/data
      - --plugin-dir=/var/lib/influxdb3/plugins
    networks:
      - adbkt
```

Grafana
```yaml
networks:
  adbkt:
    external: true

services:
  grafana:
    container_name: grafana
    image:  grafana/grafana:12.1-ubuntu
    ports:
      - 3000:3000
    networks:
      - adbkt
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

