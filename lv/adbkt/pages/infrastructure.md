---
layout: default
title: "ADBKT"
---
# Technische Infrastruktur

## DBeaver
- Download [(link)](https://dbeaver.io/)

- Verbindungskonfiguration: wird in der ersten Vorlesung mitgeteilt
  - aaa.f4.htw-berlin.de
  - ${user},ugeobln,ugm,uinsta,umisc,umobility,usozmed,public

## Docker Compose - Python
```
services:
  py:
    container_name: py
    image:  iclassen/py
    ports:
      - 8888:8888
    volumes:
      - data:/opt/dev

volumes:
  data:
```

## Docker Compose - Cassandra

### cas1
```
networks:
  ncas:
    name: ncas

services:
  cas1:
    container_name: cas1
    image: cassandra:latest
    ports:
      - 17000:7000
      - 17001:7001
      - 17070:7070
      - 17199:7199 
      - 19042:9042
      - 19160:9160
    environment:
      - JVM_OPTS=-Xms1024M -Xmx1024M
      - HEAP_NEWSIZE=1024M
      - MAX_HEAP_SIZE=1024M
    networks:
      - ncas
```

### cas2
```
networks:
  ncas:
    name: ncas

services:
  cas2:
    container_name: cas2
    image: cassandra:latest
    ports:
      - 27000:7000
      - 27001:7001
      - 27070:7070
      - 27199:7199 
      - 29042:9042
      - 29160:9160
    environment:
      - CASSANDRA_SEEDS=cas1
      - JVM_OPTS=-Xms1024M -Xmx1024M
      - HEAP_NEWSIZE=1024M
      - MAX_HEAP_SIZE=1024M
    networks:
      - ncas
```

### cas3
```
networks:
  ncas:
    name: ncas

services:
  cas3:
    container_name: cas3
    image: cassandra:latest
    ports:
      - 37000:7000
      - 37001:7001
      - 37070:7070
      - 37199:7199 
      - 39042:9042
      - 39160:9160
    environment:
      - CASSANDRA_SEEDS=cas1
      - JVM_OPTS=-Xms1024M -Xmx1024M
      - HEAP_NEWSIZE=1024M
      - MAX_HEAP_SIZE=1024M
    networks:
      - ncas
```

## Docker Compose - Neo4j
```
services:
  neo4j:
    container_name: neo4j
    image: neo4j
    ports:
      - 7474:7474
      - 7687:7687
    volumes:
      - data:/data
      - logs:/logs
    environment:
      - NEO4J_AUTH=neo4j/<passwort festlegen>
      - NEO4J_server_memory_heap_initial__size=500M 
      - NEO4J_server_memory_heap_max__size=500M 
      - NEO4J_server_memory_pagecache_size=500M 
      - NEO4J_PLUGINS=["apoc", "graph-data-science"]
      - NEO4J_dbms_security_allow__csv__import__from__file__urls=true
      - NEO4J_server_directories_import=/data/csv

volumes:
  data:
  logs:
```
