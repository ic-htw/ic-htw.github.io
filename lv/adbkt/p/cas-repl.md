---
layout: default
title: ADBKT
---

# Cassandra Replikation
- Container cas1, cas2, cas3 per docker compose anlegen
  - wie bei Python-Container anlegen [(link)](/lv/adbkt/p/ex/py-cont.html)
  - Skripts siehe [(link)](/lv/adbkt/p/infra.html))
  - das Ganze dreimal ausführen
  - erst cas1 starten und dann etwas warten, dann erst cas2 und cas3

- In cas1, cas2 und cas3 ausführen:
  - `exec console`, jeweils in einem neuen Tab
  - in jeder console `cqlsh` starten

- In cas1 ausführen
  ```
  create keyspace k1 with replication = {
      'class': 'SimpleStrategy', 'replication_factor' : 3
  };
  use k1;
  create table t (
      pk int, 
      sk int, 
      v int, 
      primary key (pk, sk)
  );
  insert into t(pk, sk, v) values (1, 1, 100);
  ```

- In cas1, cas2 und cas3 ausführen
  ```
  use k1;
  consistency quorum;
  select * from t where pk=1;
  ```
- Weitere Schritte
  ```
  auf cas1
    insert into t(pk, sk, v) values (1, 1, 200);
  auf allen Servern: 
    select * from t where pk=1;
  cas3 aus Netzwerk lösen
  auf allen Servern: 
    select * from t where pk=1;
  auf cas3: 
    consistency one;
  auf cas3: 
    select * from t where pk=1;
  auf cas1: 
    insert into t(pk, sk, v) values (1, 1, 300);
  auf allen Servern: 
    select * from t where pk=1;
  (Wieder-)Hereinnehmen von cas3 ins Netzwerk ncas
  auf cas3: 
    consistency quorum;
  auf cas3: 
    select * from t where pk=1;
  ```
