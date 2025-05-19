---
layout: default1
nav: adbkt-tsdb
is_slide: 0
title: Zeitreihendatenbanken
---

# Zeitreihen
- Timestamping: Every data point associated with a specific time
- Sequential Nature: Data arrives in a continuous, ordered flow
- High Volumes: Generated at high frequencies, leading to massive datasets
- Trends, Patterns, and Anomalies: Focus on identifying temporal dynamics
- Immutability: Typically append-only, rarely updated or deleted

- Beispiele [(link)](https://www.influxdata.com/what-is-time-series-data/#examples)

- Charakteristica [(link)](https://tdengine.com/characteristics-of-time-series-data/)

- Datenmodelle [(link)](https://www.alibabacloud.com/blog/key-concepts-and-features-of-time-series-databases_594734#:~:text=Time%20Series%20Data%20Models)

- Charakteristica [(link)](https://tdengine.com/characteristics-of-time-series-data/)

- Verarbeitung [(link)](https://www.alibabacloud.com/blog/key-concepts-and-features-of-time-series-databases_594734#:~:text=Processing%20of%20Time Series%20Data)

- Reguläre/Irreguläre Zeitreihendaten
[(link)](https://www.influxdata.com/wp-content/uploads/regular-vs-irregular-time-series-data.png)

# Beispiele
## IOT
- Predictive Maintenance: Analyzing historical sensor data to predict equipment failures
- Smart Homes: Monitoring and controlling appliances
- Industrial Automation: Tracking machine performance in real-time
- Environmental Monitoring: Analyzing air quality, weather patterns, water levels

## DevOps and System Monitoring
- Tracking Infrastructure Metrics: CPU, memory, network performance
- Monitoring Application Performance: Latency, throughput, error rates
- Real-Time Alerting for System Anomalies: Notifications based on thresholds or deviations

## Financial Markets

- Tracking Stock Prices and Market Trends: Analyzing economic indicators over time
- High-Frequency Trading (HFT): Near-instantaneous response times
- Algorithmic Trading: Automated strategies based on real-time and historical data
- Risk Management: Monitoring financial metrics over time
- Market Analysis: Identifying patterns and trends for investment decisions

# Other Use Cases
- Healthcare: Continuous patient vitals monitoring
- Energy Sector: Utility usage management, grid optimization
- Environmental Monitoring: Tracking climate change, weather patterns
- Product Analytics: Tracking user interactions with applications
- Website Traffic Analysis: Understanding user journeys
- Logistics and Asset Tracking: Real-time monitoring of shipments
- Anomaly Detection: Identifying unusual patterns across domains


# Kardinalität
- Große Kardinalität
[(link)](https://last9.io/blog/performance-implications-of-high-cardinality-in-time-series-databases/#high-cardinality-beyond-just-many-unique-values)

- Speicherverbrauch
[(link)](https://last9.io/blog/performance-implications-of-high-cardinality-in-time-series-databases/#when-ram-becomes-your-primary-bottleneck)

# Zeitbasierte Analyse
- Tumbling Window
[(link)](https://learn.microsoft.com/en-us/stream-analytics-query/media/tumbling-window-azure-stream-analytics/streamanalytics-tumblingwindow5mins.png)

- Hopping Window
[(link)](https://learn.microsoft.com/en-us/stream-analytics-query/media/hopping-window-azure-stream-analytics/streamanalytics-hoppingwindow.png)

- Session window
[(link)](https://learn.microsoft.com/en-us/stream-analytics-query/media/session-window-azure-stream-analytics/stream-analytics-window-functions-session-intro.png)

- Sliding Window
[(link)](https://learn.microsoft.com/en-us/stream-analytics-query/media/sliding-window-azure-stream-analytics/sliding-window-updated.png)

- Snapshot window
[(link)](https://learn.microsoft.com/en-us/stream-analytics-query/media/snapshot-window-azure-stream-analytics/snapshot.png)


# Konzepte Zeitreihendatenbanksysteme

- Time as Primary Index: Architecturally designed with timestamp as core organizing principle.Faster writes and efficient time-based queries
- Optimized for Sequential Data: Engineered for continuous, append-only data streams
- Built-in Data Retention Policies: Automated expiration or downsampling of older data
- Time-Aware Data Structures: Time partitioning (chunking) for efficient querying. Specialized compression algorithms
- Specialized Query Languages: Optimized for time-based analysis (bucketing, moving averages)

- Columnar Storage: Stores data by columns, improving analytical query performance and- compression
- Time-Based Partitioning: Divides data into time-based segments (chunks) for efficient- management and querying
- Specialized Indexing: Optimized for time ranges, enabling fast retrieval within temporal- boundaries
- Data Compression: Tailored algorithms to exploit temporal coherence and value patterns.2
- In-Memory Processing: For recent and frequently accessed data, enabling low-latency operations

# Zeitreihendatenbanksysteme

- Ranking
[(link)](https://db-engines.com/de/ranking/time+series+dbms)

## InfluxDB

- Architektur
[(link)](bbb)

- Datenmodell
[(link)](bbb)

- Speicherung
[(link)](bbb)

- Abfragesprache
[(link)](bbb)

- aaa
[(link)](bbb)

## Prometheus

- Architektur
[(link)](bbb)

- Datenmodell
[(link)](bbb)

- Speicherung
[(link)](bbb)

- Abfragesprache
[(link)](bbb)

- aaa
[(link)](bbb)

## Kdb

- Architektur
[(link)](bbb)

- Datenmodell
[(link)](bbb)

- Speicherung
[(link)](bbb)

- Abfragesprache
[(link)](bbb)

- aaa
[(link)](bbb)

## Graphite

- Architektur
[(link)](bbb)

- Datenmodell
[(link)](bbb)

- Speicherung
[(link)](bbb)

- Abfragesprache
[(link)](bbb)

- aaa
[(link)](bbb)

## TimescaleDB

- Architektur
[(link)](bbb)

- Datenmodell
[(link)](bbb)

- Speicherung
[(link)](bbb)

- Abfragesprache
[(link)](bbb)

- aaa
[(link)](bbb)

## QuestDB

- Architektur
[(link)](bbb)

- Datenmodell
[(link)](bbb)

- Speicherung
[(link)](bbb)

- Abfragesprache
[(link)](bbb)

- aaa
[(link)](bbb)

## Apache Druid

- Architektur
[(link)](bbb)

- Datenmodell
[(link)](bbb)

- Speicherung
[(link)](bbb)

- Abfragesprache
[(link)](bbb)

- aaa
[(link)](bbb)

## GridDB

- Architektur
[(link)](bbb)

- Datenmodell
[(link)](bbb)

- Speicherung
[(link)](bbb)

- Abfragesprache
[(link)](bbb)

- aaa
[(link)](bbb)

## TDengine

- Architektur
[(link)](bbb)

- Datenmodell
[(link)](bbb)

- Speicherung
[(link)](bbb)

- Abfragesprache
[(link)](bbb)

- aaa
[(link)](bbb)

