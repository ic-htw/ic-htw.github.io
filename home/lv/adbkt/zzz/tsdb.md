---
layout: default1
nav: adbkt-zzz
is_slide: 0
---

# **Timeseries Databases: An In-Depth Analysis**

## **Slide 1: Title Slide**

**Timeseries Databases: An In-Depth Analysis**

## **Slide 2: Introduction \- Defining TSDBs**

* **Timeseries Data:** Data points indexed and ordered by time.1 Captures evolution of variables over time.10  
* **Need for Specialized Databases:** Traditional databases lack optimizations for temporal data workloads.2 Inefficient for high-volume ingestion, time-range queries, and time-based aggregations.  
* **Timeseries Databases (TSDBs):** Purpose-built for efficient storage, querying, and analysis of time-dependent data.2

## **Slide 3: Introduction \- Historical Context**

* **Early Focus:** Analyzing financial data and stock market fluctuations.7 Real-time systems highlighted limitations of existing databases.  
* **Modern Growth:** Driven by IoT, DevOps, and demand for real-time insights.5  
* **Evolution:** Handling diverse data types (logs, sensor readings).2 Enhanced integration with analytical tools (Grafana, Spark) and cloud services. Real-time processing and advanced analytics.

## **Slide 4: Distinguishing Features of TSDBs**

* **Time as Primary Index:** Architecturally designed with timestamp as core organizing principle.2 Faster writes and efficient time-based queries.  
* **Optimized for Sequential Data:** Engineered for continuous, append-only data streams.2  
* **Built-in Data Retention Policies:** Automated expiration or downsampling of older data.2  
* **Time-Aware Data Structures:** Time partitioning (chunking) for efficient querying.2 Specialized compression algorithms.2  
* **Specialized Query Languages:** Optimized for time-based analysis (bucketing, moving averages).2

## **Slide 5: Core Characteristics \- Attributes of Timeseries Data**

* **Timestamping:** Every data point associated with a specific time.2  
* **Sequential Nature:** Data arrives in a continuous, ordered flow.2  
* **High Volumes:** Generated at high frequencies, leading to massive datasets.2  
* **Trends, Patterns, and Anomalies:** Focus on identifying temporal dynamics.3  
* **Immutability:** Typically append-only, rarely updated or deleted.14

## **Slide 6: Core Characteristics \- Architectural Optimizations**

* **Columnar Storage:** Stores data by columns, improving analytical query performance and compression.5  
* **Time-Based Partitioning:** Divides data into time-based segments (chunks) for efficient management and querying.2  
* **Specialized Indexing:** Optimized for time ranges, enabling fast retrieval within temporal boundaries.2  
* **Data Compression:** Tailored algorithms to exploit temporal coherence and value patterns.2  
* **In-Memory Processing:** For recent and frequently accessed data, enabling low-latency operations.5

## **Slide 7: Benefits of Using TSDBs**

* **Enhanced Performance for Time-Based Queries:** Optimized for time ranges and aggregations.2  
* **Scalability to Handle Large Data Volumes:** Vertical and horizontal scaling capabilities.2  
* **Efficient Storage and Data Compression:** Reduced disk space and improved I/O performance.2  
* **Specialized Query Languages/Functions:** Simplified temporal data analysis.2  
* **Real-Time Analytics and Processing:** Immediate insights and alerts based on latest data.2

## **Slide 8: Applications \- IoT and Industrial IoT**

* **Monitoring Connected Devices:** Assessing performance and identifying maintenance needs.2  
* **Predictive Maintenance:** Analyzing historical sensor data to predict equipment failures.10  
* **Smart Homes:** Monitoring and controlling appliances.27  
* **Industrial Automation:** Tracking machine performance in real-time.27  
* **Environmental Monitoring:** Analyzing air quality, weather patterns, water levels.27

## **Slide 9: Applications \- DevOps and System Monitoring**

* **Tracking Infrastructure Metrics:** CPU, memory, network performance.3  
* **Monitoring Application Performance:** Latency, throughput, error rates.3  
* **Real-Time Alerting for System Anomalies:** Notifications based on thresholds or deviations.14  
* **Capacity Planning:** Analyzing historical trends to predict future resource needs.14  
* **Integration with Tools:** Grafana and Prometheus for visualization and monitoring.5

## **Slide 10: Applications \- Financial Markets**

* **Tracking Stock Prices and Market Trends:** Analyzing economic indicators over time.2  
* **High-Frequency Trading (HFT):** Near-instantaneous response times.2  
* **Algorithmic Trading:** Automated strategies based on real-time and historical data.2  
* **Risk Management:** Monitoring financial metrics over time.2  
* **Market Analysis:** Identifying patterns and trends for investment decisions.2

## **Slide 11: Applications \- Scientific Research & Other Use Cases**

* **Scientific Research:** Data acquisition and analysis in climate modeling, astronomy, physics.51 Monitoring scientific instruments.52  
* **Healthcare:** Continuous patient vitals monitoring.2  
* **Energy Sector:** Utility usage management, grid optimization.2  
* **Environmental Monitoring:** Tracking climate change, weather patterns.2  
* **Product Analytics:** Tracking user interactions with applications.3  
* **Website Traffic Analysis:** Understanding user journeys.8  
* **Logistics and Asset Tracking:** Real-time monitoring of shipments.12  
* **Anomaly Detection:** Identifying unusual patterns across domains.3

## **Slide 12: Popular TSDBs \- Open Source (Part 1\)**

* **InfluxDB:** High performance, scalability, vibrant ecosystem.5  
* **TimescaleDB:** PostgreSQL extension, SQL with time-series optimizations.5  
* **Prometheus:** Monitoring and alerting toolkit, cloud-native focus.5

## **Slide 13: Popular TSDBs \- Open Source (Part 2\)**

* **ClickHouse:** High-performance columnar OLAP database.3  
* **OpenTSDB:** For large volumes of data, often with Hadoop/HBase.7  
* **VictoriaMetrics:** Speed, scalability, cost-effectiveness for monitoring.7  
* **Other Open-Source:** Graphite, QuestDB, TDengine, RedisTimeSeries, GridDB, DolphinDB, Fauna.

## **Slide 14: Popular TSDBs \- Commercial and Cloud-Based**

* **Amazon Timestream:** Fully managed, serverless, AWS integration.5  
* **kdb+:** High-performance, in-memory, columnar, finance standard.5  
* **RedisTimeSeries:** Time-series module for Redis, high-speed ingestion.6  
* **Other Commercial/Cloud:** Azure Data Explorer, Google Cloud Bigtable.

## **Slide 15: Comparison of Popular Timeseries Databases**

| Database Name | License | Query Language | Data Model | Key Features | Primary Use Cases |
| :---- | :---- | :---- | :---- | :---- | :---- |
| InfluxDB | Open Source | InfluxQL, SQL | Custom, Columnar | High write/query performance, data retention, downsampling, unlimited cardinality (v3) | IoT monitoring, DevOps metrics, real-time analytics, financial data |
| TimescaleDB | Open Source | SQL | Relational (PostgreSQL ext.) | Full SQL support, time-series hyperfunctions, automatic partitioning, compression | Business analytics, IoT telemetry, SQL-based applications, financial data |
| Prometheus | Open Source | PromQL | Custom Time Series | Multi-dimensional data model, alerting rules, integrations with Grafana & Kubernetes | DevOps monitoring, performance tracking, alerting, Kubernetes monitoring |
| ClickHouse | Open Source | SQL (with extensions) | Columnar | High query performance, real-time ingestion, distributed processing | High-performance analytics, time-series analytics, BI, log analysis, product analytics |
| kdb+ | Commercial | q | Columnar, In-Memory | Extremely fast, nanosecond precision, built-in time-series functions | Financial data analysis, high-frequency trading |
| Amazon Timestream | Commercial | SQL | Serverless, Dual-Tier | Automatic scaling, built-in analytics, data retention policies, AWS integration | IoT applications, DevOps applications, analytics within AWS |
| RedisTimeSeries | Open Source | Redis commands | Key-Value with Time Series | High-speed ingestion, downsampling, aggregations, Redis integration | IoT data, stock prices, telemetry |

## **Slide 16: In-Depth Analysis \- InfluxDB**

* **Architecture:** Go-based, evolved from TSM Tree to FDAP stack (Flight, DataFusion, Arrow, Parquet) in v3.35  
* **Key Features:** High write/query performance 7, InfluxQL and SQL support 7, unlimited cardinality (v3) 54, data retention policies 7, integrations (Grafana, Telegraf).7  
* **Use Cases:** IoT monitoring 5, DevOps metrics 5, real-time analytics 5, financial data.5

## **Slide 17: In-Depth Analysis \- TimescaleDB**

* **Architecture:** PostgreSQL extension, leveraging its reliability and SQL support . Uses hypertables for automatic partitioning.5  
* **Key Features:** Full SQL compatibility 5, time-series hyperfunctions 53, automatic partitioning 5, compression 5, scalability.5  
* **Use Cases:** Business analytics 5, IoT telemetry 5, SQL-based applications, financial data.5

## **Slide 18: In-Depth Analysis \- Prometheus**

* **Architecture:** Go-based, pull model for metrics collection.5 Metrics stored locally in custom format.5 Uses PromQL for querying.5  
* **Key Features:** Multi-dimensional data model with labels 23, alerting rules 23, Grafana integration 23, Kubernetes monitoring.23  
* **Use Cases:** DevOps monitoring 5, performance tracking 5, alerting 5, Kubernetes monitoring.5

## **Slide 19: In-Depth Analysis \- ClickHouse**

* **Architecture:** Open-source, columnar database for OLAP.3 Columnar storage and vectorized query execution.3 Supports SQL with extensions.3  
* **Key Features:** High query performance 3, real-time data ingestion 43, distributed processing 3, scalability 43, data compression.43  
* **Use Cases:** High-performance analytics 3, time-series analytics 3, BI, log analysis, financial data, product analytics.43

## **Slide 20: In-Depth Analysis \- kdb+**

* **Architecture:** High-performance, in-memory, columnar.5 Based on ordered lists, uses q language.70  
* **Key Features:** Exceptional speed 5, nanosecond precision 10, built-in time-series functions 10, computationally efficient 70, integration with other languages.70  
* **Use Cases:** Financial data and stock market analysis 10, high-frequency trading (HFT).10

## **Slide 21: In-Depth Analysis \- Amazon Timestream**

* **Architecture:** Fully managed, serverless, AWS service.5 Dual-tier storage (memory and magnetic).61 Supports SQL-like querying.60  
* **Key Features:** Serverless 60, automatic scaling 60, dual-tiered storage 61, built-in time-series analytics 60, data retention policies 60, AWS integration.60  
* **Use Cases:** IoT applications 27, DevOps workloads 27, analytics applications.27

## **Slide 22: Managing Data \- Data Retention Policies**

* **Importance:** Managing storage costs 2, regulatory compliance 28, optimizing query performance.2  
* **Strategies:** Time-based 2, size-based 36, tiered storage.5  
* **Database Mechanisms:** TimescaleDB (add\_retention\_policy) 30, InfluxDB (retention policies, shard groups) 32, Amazon Timestream (tiering, deletion).60

## **Slide 23: Managing Data \- High Write and Query Rates**

* **Challenges:** High cardinality (large number of unique tag values) 41 impacts memory and performance.  
* **Optimization Techniques:** Time-based partitioning, indexing strategies, data compression, pre-aggregation, downsampling, choosing appropriate TSDB.2  
* **Database Approaches:** InfluxDB (TSM engine, v3 architecture) 7, TimescaleDB (hypertables, compression) 37, Prometheus (efficient storage) 23, ClickHouse (columnar, distributed) 43, kdb+ (in-memory) 70, Amazon Timestream (serverless, scalable).60

## **Slide 24: Managing Data \- Time-Stamped Data Management**

* **Efficient Indexing:** Timestamps as primary index, optimized for time ranges.2  
* **Querying and Analysis:** Time-based functions and operators for temporal analysis.2  
* **Handling Irregular Intervals and Gaps:** Interpolation, gap-filling features.3

## **Slide 25: Conclusion \- Summary**

* TSDBs offer enhanced performance, scalability, and storage efficiency for time-dependent data.  
* Built-in retention and specialized queries simplify management and analysis.  
* Essential for IoT, DevOps, finance, scientific research, and more.  
* Enable real-time analytics and processing for immediate insights.

## **Slide 26: Conclusion \- Future Trends**

* Increased adoption of cloud-based TSDB services.  
* Growing integration with machine learning and AI.2  
* Development of specialized query languages and analytical functions.  
* Focus on handling high cardinality data.  
* Emphasis on real-time processing and edge computing.5

## **Slide 27: Conclusion \- Selecting a TSDB**

* Understand your timeseries data characteristics (volume, velocity, variety, granularity, retention).2  
* Consider your specific use case and application requirements (real-time monitoring vs. historical analysis).  
* Evaluate performance, scalability, ease of use, query language, integrations, ecosystem, and cost.2

#### **Referenzen**

1. www.influxdata.com, Zugriff am Mai 5, 2025, [https://www.influxdata.com/time-series-database/\#:\~:text=A%20time%20series%20database%20(TSDB,downsampled%2C%20and%20aggregated%20over%20time.](https://www.influxdata.com/time-series-database/#:~:text=A%20time%20series%20database%20\(TSDB,downsampled%2C%20and%20aggregated%20over%20time.)  
2. Time Series Databases (TSDBs) Explained \- Splunk, Zugriff am Mai 5, 2025, [https://www.splunk.com/en\_us/blog/learn/time-series-databases.html](https://www.splunk.com/en_us/blog/learn/time-series-databases.html)  
3. Engineering Resources / An intro to time-series databases \- ClickHouse, Zugriff am Mai 5, 2025, [https://clickhouse.com/engineering-resources/what-is-time-series-database](https://clickhouse.com/engineering-resources/what-is-time-series-database)  
4. Time series database \- Wikipedia, Zugriff am Mai 5, 2025, [https://en.wikipedia.org/wiki/Time\_series\_database](https://en.wikipedia.org/wiki/Time_series_database)  
5. Time-Series Database: An Explainer \- Timescale, Zugriff am Mai 5, 2025, [https://www.timescale.com/blog/time-series-database-an-explainer](https://www.timescale.com/blog/time-series-database-an-explainer)  
6. What is Time Series Database? \- Anodot, Zugriff am Mai 5, 2025, [https://www.anodot.com/learning-center/time-series-database/](https://www.anodot.com/learning-center/time-series-database/)  
7. Time series database explained | InfluxData, Zugriff am Mai 5, 2025, [https://www.influxdata.com/time-series-database/](https://www.influxdata.com/time-series-database/)  
8. What is a Time-Series Database (TSDB) \- Key Features, Applications, and Benefits for Real-Time Data Analysis | Greptime, Zugriff am Mai 5, 2025, [https://greptime.com/blogs/2023-03-22-what-is-timeseries-database](https://greptime.com/blogs/2023-03-22-what-is-timeseries-database)  
9. What is Time Series Data? Definition & FAQs \- ScyllaDB, Zugriff am Mai 5, 2025, [https://www.scylladb.com/glossary/time-series-data/](https://www.scylladb.com/glossary/time-series-data/)  
10. Time Series Database: Guide by Experts \- KX, Zugriff am Mai 5, 2025, [https://kx.com/time-series-database/](https://kx.com/time-series-database/)  
11. What Is A Time Series Database? How It Works & Use Cases \- Hazelcast, Zugriff am Mai 5, 2025, [https://hazelcast.com/foundations/data-and-middleware-technologies/time-series-database/](https://hazelcast.com/foundations/data-and-middleware-technologies/time-series-database/)  
12. What is a Time Series Database? \- Redis, Zugriff am Mai 5, 2025, [https://redis.io/nosql/timeseries-databases/](https://redis.io/nosql/timeseries-databases/)  
13. What Is a Time-series Database (TSDB)? \- Pure Storage, Zugriff am Mai 5, 2025, [https://www.purestorage.com/au/knowledge/what-is-a-time-series-database.html](https://www.purestorage.com/au/knowledge/what-is-a-time-series-database.html)  
14. Time-Series Database Basics \- DevOps.com, Zugriff am Mai 5, 2025, [https://devops.com/time-series-database-basics/](https://devops.com/time-series-database-basics/)  
15. An Overview of Time-Series Databases \- StarTree, Zugriff am Mai 5, 2025, [https://startree.ai/resources/overview-of-time-series-databases](https://startree.ai/resources/overview-of-time-series-databases)  
16. The best way to store, collect and analyze time series data | InfluxData, Zugriff am Mai 5, 2025, [https://www.influxdata.com/the-best-way-to-store-collect-analyze-time-series-data/](https://www.influxdata.com/the-best-way-to-store-collect-analyze-time-series-data/)  
17. A Guide to Time Series Databases \- DATAVERSITY, Zugriff am Mai 5, 2025, [https://www.dataversity.net/a-guide-to-time-series-databases/](https://www.dataversity.net/a-guide-to-time-series-databases/)  
18. HIGH PERFORMANCE QUERYING OF TIME SERIES MARKET DATA \- DiVA portal, Zugriff am Mai 5, 2025, [http://www.diva-portal.org/smash/get/diva2:1638667/FULLTEXT01.pdf](http://www.diva-portal.org/smash/get/diva2:1638667/FULLTEXT01.pdf)  
19. Choosing the best time-series database for your IoT needs – a comparison \- Spyrosoft, Zugriff am Mai 5, 2025, [https://spyro-soft.com/blog/industry-4-0/choosing-the-best-time-series-database-for-your-iot-needs-a-comparison](https://spyro-soft.com/blog/industry-4-0/choosing-the-best-time-series-database-for-your-iot-needs-a-comparison)  
20. Time-Series Database (TSDB) for IoT: The Missing Piece | EMQ \- EMQX, Zugriff am Mai 5, 2025, [https://www.emqx.com/en/blog/time-series-database-for-iot-the-missing-piece](https://www.emqx.com/en/blog/time-series-database-for-iot-the-missing-piece)  
21. (PDF) Performance Study of Time Series Databases \- ResearchGate, Zugriff am Mai 5, 2025, [https://www.researchgate.net/publication/363128579\_Performance\_Study\_of\_Time\_Series\_Databases](https://www.researchgate.net/publication/363128579_Performance_Study_of_Time_Series_Databases)  
22. Top 10 DBaaS for IoT & Time-Series Data 2024 \- Daily.dev, Zugriff am Mai 5, 2025, [https://daily.dev/blog/top-10-dbaas-for-iot-and-time-series-data-2024](https://daily.dev/blog/top-10-dbaas-for-iot-and-time-series-data-2024)  
23. Prometheus \- Monitoring system & time series database, Zugriff am Mai 5, 2025, [https://prometheus.io/](https://prometheus.io/)  
24. Key Concepts and Features of Time Series Databases \- Alibaba Cloud Community, Zugriff am Mai 5, 2025, [https://www.alibabacloud.com/blog/key-concepts-and-features-of-time-series-databases\_594734](https://www.alibabacloud.com/blog/key-concepts-and-features-of-time-series-databases_594734)  
25. Characteristics of Time Series Data | TDengine, Zugriff am Mai 5, 2025, [https://tdengine.com/characteristics-of-time-series-data/](https://tdengine.com/characteristics-of-time-series-data/)  
26. What exactly is time-series data? : r/Database \- Reddit, Zugriff am Mai 5, 2025, [https://www.reddit.com/r/Database/comments/mlcfha/what\_exactly\_is\_timeseries\_data/](https://www.reddit.com/r/Database/comments/mlcfha/what_exactly_is_timeseries_data/)  
27. Time Series Database (TSDB): A Guide With Examples \- DataCamp, Zugriff am Mai 5, 2025, [https://www.datacamp.com/blog/time-series-database](https://www.datacamp.com/blog/time-series-database)  
28. Data Retention Policy \- QuestDB, Zugriff am Mai 5, 2025, [https://questdb.com/glossary/data-retention-policy/](https://questdb.com/glossary/data-retention-policy/)  
29. Data Retention for Long-Term IIoT Monitoring Using Time Series Databases, Zugriff am Mai 5, 2025, [https://www.iiot-world.com/predictive-analytics/predictive-maintenance/long-term-iiot-data-retention-with-time-series-databases/](https://www.iiot-world.com/predictive-analytics/predictive-maintenance/long-term-iiot-data-retention-with-time-series-databases/)  
30. Create a data retention policy \- Timescale documentation, Zugriff am Mai 5, 2025, [https://docs.timescale.com/use-timescale/latest/data-retention/create-a-retention-policy/](https://docs.timescale.com/use-timescale/latest/data-retention/create-a-retention-policy/)  
31. Data retention \- Timescale documentation, Zugriff am Mai 5, 2025, [https://docs.timescale.com/use-timescale/latest/data-retention/](https://docs.timescale.com/use-timescale/latest/data-retention/)  
32. Time Series Database:Configure data retention policies \- Alibaba Cloud, Zugriff am Mai 5, 2025, [https://www.alibabacloud.com/help/doc-detail/2384465.html](https://www.alibabacloud.com/help/doc-detail/2384465.html)  
33. How data is stored in timeseries database \- Stack Overflow, Zugriff am Mai 5, 2025, [https://stackoverflow.com/questions/48693800/how-data-is-stored-in-timeseries-database](https://stackoverflow.com/questions/48693800/how-data-is-stored-in-timeseries-database)  
34. Changing data retention settings has no affect | AWS re:Post, Zugriff am Mai 5, 2025, [https://repost.aws/questions/QUhb5kRF\_CQZCCtNYmIAx2TA/changing-data-retention-settings-has-no-affect](https://repost.aws/questions/QUhb5kRF_CQZCCtNYmIAx2TA/changing-data-retention-settings-has-no-affect)  
35. Part Two: InfluxDB 3.0 Under the Hood | InfluxData, Zugriff am Mai 5, 2025, [https://www.influxdata.com/blog/understanding-influxdb-3.0-part-two/](https://www.influxdata.com/blog/understanding-influxdb-3.0-part-two/)  
36. Efficient data retention policy other than time in timescaledb \- Stack Overflow, Zugriff am Mai 5, 2025, [https://stackoverflow.com/questions/73749142/efficient-data-retention-policy-other-than-time-in-timescaledb](https://stackoverflow.com/questions/73749142/efficient-data-retention-policy-other-than-time-in-timescaledb)  
37. PostgreSQL \+ TimescaleDB: 1,000x Faster Queries, 90 % Data Compression, and Much More | Timescale, Zugriff am Mai 5, 2025, [https://www.timescale.com/blog/postgresql-timescaledb-1000x-faster-queries-90-data-compression-and-much-more](https://www.timescale.com/blog/postgresql-timescaledb-1000x-faster-queries-90-data-compression-and-much-more)  
38. TimescaleDB \- Data Intellect, Zugriff am Mai 5, 2025, [https://dataintellect.com/blog/timescaledb/](https://dataintellect.com/blog/timescaledb/)  
39. TimescaleDB Uses, Comparisons & Optimizations \- Simplyblock, Zugriff am Mai 5, 2025, [https://www.simplyblock.io/glossary/what-is-timescaledb/](https://www.simplyblock.io/glossary/what-is-timescaledb/)  
40. TimescaleDB \- simplyblock, Zugriff am Mai 5, 2025, [https://www.simplyblock.io/supported-technologies/timescaledb/](https://www.simplyblock.io/supported-technologies/timescaledb/)  
41. Time Series Database for High Volume IoT Data? \- Reddit, Zugriff am Mai 5, 2025, [https://www.reddit.com/r/Database/comments/1gluf1d/time\_series\_database\_for\_high\_volume\_iot\_data/](https://www.reddit.com/r/Database/comments/1gluf1d/time_series_database_for_high_volume_iot_data/)  
42. The Best Time-Series Databases Compared \- Timescale, Zugriff am Mai 5, 2025, [https://www.timescale.com/learn/the-best-time-series-databases-compared](https://www.timescale.com/learn/the-best-time-series-databases-compared)  
43. What Is ClickHouse? | OpenMetal IaaS, Zugriff am Mai 5, 2025, [https://openmetal.io/resources/blog/what-is-clickhouse/](https://openmetal.io/resources/blog/what-is-clickhouse/)  
44. celerdata.com, Zugriff am Mai 5, 2025, [https://celerdata.com/glossary/what-is-clickhouse\#:\~:text=Scalability%20and%20distributed%20architecture,-ClickHouse%20is%20designed\&text=Key%20scalability%20features%20include%3A,fault%20tolerance%20and%20load%20distribution.](https://celerdata.com/glossary/what-is-clickhouse#:~:text=Scalability%20and%20distributed%20architecture,-ClickHouse%20is%20designed&text=Key%20scalability%20features%20include%3A,fault%20tolerance%20and%20load%20distribution.)  
45. ClickHouse Architecture 101—A Comprehensive Overview (2025) \- Chaos Genius, Zugriff am Mai 5, 2025, [https://www.chaosgenius.io/blog/clickhouse-architecture/](https://www.chaosgenius.io/blog/clickhouse-architecture/)  
46. How to Choose an IoT Database \- Timescale, Zugriff am Mai 5, 2025, [https://www.timescale.com/learn/how-to-choose-an-iot-database](https://www.timescale.com/learn/how-to-choose-an-iot-database)  
47. Amazon Timestream FAQs – Time-Series Database \- AWS, Zugriff am Mai 5, 2025, [https://aws.amazon.com/timestream/faqs/](https://aws.amazon.com/timestream/faqs/)  
48. How Cloud Time Series Databases Benefit IoT | TDengine, Zugriff am Mai 5, 2025, [https://tdengine.com/how-cloud-time-series-databases-benefit-iot/](https://tdengine.com/how-cloud-time-series-databases-benefit-iot/)  
49. The Top Time-Series Databases \- TimeStored.com, Zugriff am Mai 5, 2025, [https://www.timestored.com/data/top-timeseries-databases](https://www.timestored.com/data/top-timeseries-databases)  
50. Time Series Databases 101: What are Time Series Databases? | Vation Ventures Research, Zugriff am Mai 5, 2025, [https://www.vationventures.com/research-article/time-series-db-101](https://www.vationventures.com/research-article/time-series-db-101)  
51. 7 Cutting-Edge Time Series Database Examples For 2024 \- Timeplus, Zugriff am Mai 5, 2025, [https://www.timeplus.com/post/time-series-database-example](https://www.timeplus.com/post/time-series-database-example)  
52. Survey of Time Series Database Technology \- NERC Open Research Archive, Zugriff am Mai 5, 2025, [https://nora.nerc.ac.uk/527832/7/N527832CR.pdf](https://nora.nerc.ac.uk/527832/7/N527832CR.pdf)  
53. How to Write Better Queries for Time-Series Data Analysis With Custom SQL Functions, Zugriff am Mai 5, 2025, [https://www.timescale.com/blog/how-to-write-better-queries-for-time-series-data-analysis-using-custom-sql-functions](https://www.timescale.com/blog/how-to-write-better-queries-for-time-series-data-analysis-using-custom-sql-functions)  
54. Open source, high-speed data engine. Built for real-time. \- InfluxDB, Zugriff am Mai 5, 2025, [https://www.influxdata.com/products/influxdb/](https://www.influxdata.com/products/influxdb/)  
55. InfluxDB \- Wikipedia, Zugriff am Mai 5, 2025, [https://en.wikipedia.org/wiki/InfluxDB](https://en.wikipedia.org/wiki/InfluxDB)  
56. Introduction to InfluxDB: A time-series database \- wearecommunity.io, Zugriff am Mai 5, 2025, [https://wearecommunity.io/communities/india-java-user-group/articles/891](https://wearecommunity.io/communities/india-java-user-group/articles/891)  
57. Prometheus Monitoring: Features, Components, Architecture & Metrics \- K21Academy, Zugriff am Mai 5, 2025, [https://k21academy.com/prometheus/prometheus-monitoring-an-introduction/](https://k21academy.com/prometheus/prometheus-monitoring-an-introduction/)  
58. What is Prometheus? | New Relic, Zugriff am Mai 5, 2025, [https://newrelic.com/blog/best-practices/what-is-prometheus](https://newrelic.com/blog/best-practices/what-is-prometheus)  
59. Overview \- Prometheus, Zugriff am Mai 5, 2025, [https://prometheus.io/docs/introduction/overview/](https://prometheus.io/docs/introduction/overview/)  
60. Amazon Timestream Features – Time-Series Database \- AWS, Zugriff am Mai 5, 2025, [https://aws.amazon.com/timestream/features/](https://aws.amazon.com/timestream/features/)  
61. Compare Amazon Timestream for LiveAnalytics vs SQL Server \- InfluxDB, Zugriff am Mai 5, 2025, [https://www.influxdata.com/comparison/awstimestream-vs-sqlserver/](https://www.influxdata.com/comparison/awstimestream-vs-sqlserver/)  
62. Understanding the Structure of Time-Series Datasets \- Ydata.ai, Zugriff am Mai 5, 2025, [https://ydata.ai/resources/understanding-the-structure-of-time-series-datasets](https://ydata.ai/resources/understanding-the-structure-of-time-series-datasets)  
63. Approprieta use case for time-series? \- MongoDB Atlas, Zugriff am Mai 5, 2025, [https://www.mongodb.com/community/forums/t/approprieta-use-case-for-time-series/279887](https://www.mongodb.com/community/forums/t/approprieta-use-case-for-time-series/279887)  
64. Time Series Database & Data Management | MongoDB, Zugriff am Mai 5, 2025, [https://www.mongodb.com/resources/basics/time-series-data-management](https://www.mongodb.com/resources/basics/time-series-data-management)  
65. Performance Impact of High Cardinality in Time-Series DBs \- Last9, Zugriff am Mai 5, 2025, [https://last9.io/blog/performance-implications-of-high-cardinality-in-time-series-databases/](https://last9.io/blog/performance-implications-of-high-cardinality-in-time-series-databases/)  
66. InfluxDB 3 Core and Enterprise Architecture Highlights | InfluxData, Zugriff am Mai 5, 2025, [https://www.influxdata.com/blog/influxdb3-core-enterprise-architecture/](https://www.influxdata.com/blog/influxdb3-core-enterprise-architecture/)  
67. Architecture Overview | ClickHouse Docs, Zugriff am Mai 5, 2025, [https://clickhouse.com/docs/en/development/architecture](https://clickhouse.com/docs/en/development/architecture)  
68. Understanding ClickHouse®: Products, architecture, tutorial and alternatives \- Instaclustr, Zugriff am Mai 5, 2025, [https://www.instaclustr.com/education/understanding-clickhouse-products-architecture-tutorial-and-alternatives/](https://www.instaclustr.com/education/understanding-clickhouse-products-architecture-tutorial-and-alternatives/)  
69. Architecture Overview | ClickHouse Docs, Zugriff am Mai 5, 2025, [https://clickhouse.com/docs/academic\_overview](https://clickhouse.com/docs/academic_overview)  
70. kdb+ | KX, Zugriff am Mai 5, 2025, [https://kx.com/products/kdb/](https://kx.com/products/kdb/)  
71. Getting started with KDB+: A Quick Guide \- NashTech Blog, Zugriff am Mai 5, 2025, [https://blog.nashtechglobal.com/getting-started-with-kdb-a-quick-guide/](https://blog.nashtechglobal.com/getting-started-with-kdb-a-quick-guide/)  
72. Timeseries indexing at scale \- Datadog, Zugriff am Mai 5, 2025, [https://www.datadoghq.com/blog/engineering/timeseries-indexing-at-scale/](https://www.datadoghq.com/blog/engineering/timeseries-indexing-at-scale/)  
73. Understanding Prometheus Architecture Details \- OpenObserve, Zugriff am Mai 5, 2025, [https://openobserve.ai/articles/prometheus-architecture-details/](https://openobserve.ai/articles/prometheus-architecture-details/)  
74. Learn Prometheus Architecture: A Complete Guide \- DevOps Cube, Zugriff am Mai 5, 2025, [https://devopscube.com/prometheus-architecture/](https://devopscube.com/prometheus-architecture/)  
75. TDengine | Time-Series Database for Industrial IoT, Zugriff am Mai 5, 2025, [https://tdengine.com/](https://tdengine.com/)  
76. GridDB | GridDB: Open Source Time Series Database for IoT, Zugriff am Mai 5, 2025, [https://griddb.net/](https://griddb.net/)  
77. Kdb+ architecture | Optimizing High Frequency Trading with Real Time Insights using Dell PowerFlex and NVIDIA \- White Paper, Zugriff am Mai 5, 2025, [https://infohub.delltechnologies.com/l/optimizing-high-frequency-trading-with-real-time-insights-using-dell-powerflex-and-nvidia-white-paper/kdb-architecture/](https://infohub.delltechnologies.com/l/optimizing-high-frequency-trading-with-real-time-insights-using-dell-powerflex-and-nvidia-white-paper/kdb-architecture/)  
78. 16 Time Series Database Use Cases Across Sectors \[2024\] \- Timeplus, Zugriff am Mai 5, 2025, [https://www.timeplus.com/post/time-series-database-use-cases](https://www.timeplus.com/post/time-series-database-use-cases)  
79. TSM-Bench: Benchmarking Time Series Database Systems for Monitoring Applications, Zugriff am Mai 5, 2025, [https://exascale.info/assets/pdf/khayati2023vldb.pdf](https://exascale.info/assets/pdf/khayati2023vldb.pdf)  
80. SciTS: A Benchmark for Time-Series Databases in Scientific Experiments and Industrial Internet of Things \- Inspire HEP, Zugriff am Mai 5, 2025, [https://inspirehep.net/literature/2070442](https://inspirehep.net/literature/2070442)  
81. What Is a Time Series Database? How It Works \+ Use Cases \- Timeplus, Zugriff am Mai 5, 2025, [https://www.timeplus.com/post/time-series-database](https://www.timeplus.com/post/time-series-database)  
82. Time series Databases : r/softwarearchitecture \- Reddit, Zugriff am Mai 5, 2025, [https://www.reddit.com/r/softwarearchitecture/comments/1b2rsj7/time\_series\_databases/](https://www.reddit.com/r/softwarearchitecture/comments/1b2rsj7/time_series_databases/)  
83. Time Series Database \- Amazon Timestream \- AWS, Zugriff am Mai 5, 2025, [https://aws.amazon.com/timestream/](https://aws.amazon.com/timestream/)  
84. Seeking Database Recommendations for IoT Time Series Data \- Reddit, Zugriff am Mai 5, 2025, [https://www.reddit.com/r/IOT/comments/1954txs/seeking\_database\_recommendations\_for\_iot\_time/](https://www.reddit.com/r/IOT/comments/1954txs/seeking_database_recommendations_for_iot_time/)  
85. What Is a Time Series Database? How It Works & Use Cases \- Liquid Web, Zugriff am Mai 5, 2025, [https://www.liquidweb.com/blog/what-is-a-time-series-database/](https://www.liquidweb.com/blog/what-is-a-time-series-database/)  
86. Best practices \- Amazon Timestream, Zugriff am Mai 5, 2025, [https://docs.aws.amazon.com/timestream/latest/developerguide/best-practices.html](https://docs.aws.amazon.com/timestream/latest/developerguide/best-practices.html)  
87. Top 5 Big Data Time Series Applications | iunera, Zugriff am Mai 5, 2025, [https://www.iunera.com/kraken/time-series/top-5-big-data-time-series-applications/](https://www.iunera.com/kraken/time-series/top-5-big-data-time-series-applications/)  
88. 7 Powerful Time-Series Database for Monitoring Solution \- Geekflare, Zugriff am Mai 5, 2025, [https://geekflare.com/dev/time-series-database/](https://geekflare.com/dev/time-series-database/)  
89. www.timeplus.com, Zugriff am Mai 5, 2025, [https://www.timeplus.com/post/time-series-database-use-cases\#:\~:text=The%20financial%20sector%20relies%20on,analysis%20and%20decision%2Dmaking%20processes.](https://www.timeplus.com/post/time-series-database-use-cases#:~:text=The%20financial%20sector%20relies%20on,analysis%20and%20decision%2Dmaking%20processes.)  
90. What Is a Time Series and How Is It Used? \- Timescale, Zugriff am Mai 5, 2025, [https://www.timescale.com/blog/time-series-introduction](https://www.timescale.com/blog/time-series-introduction)  
91. Time Series in Finance: the array database approach \- NYU Computer Science, Zugriff am Mai 5, 2025, [https://cs.nyu.edu/shasha/papers/jagtalk.html](https://cs.nyu.edu/shasha/papers/jagtalk.html)  
92. www.vationventures.com, Zugriff am Mai 5, 2025, [https://www.vationventures.com/research-article/time-series-db-101\#:\~:text=By%20using%20a%20time%20series,identify%20trends%2C%20and%20inform%20policymaking.](https://www.vationventures.com/research-article/time-series-db-101#:~:text=By%20using%20a%20time%20series,identify%20trends%2C%20and%20inform%20policymaking.)  
93. What are Open Source Time Series Databases? | iunera, Zugriff am Mai 5, 2025, [https://www.iunera.com/kraken/fabric/time-series-database/](https://www.iunera.com/kraken/fabric/time-series-database/)  
94. Comparative Analysis of Time Series Databases in the Context of Edge Computing for Low Power Sensor Networks \- PMC, Zugriff am Mai 5, 2025, [https://pmc.ncbi.nlm.nih.gov/articles/PMC7302557/](https://pmc.ncbi.nlm.nih.gov/articles/PMC7302557/)  
95. Storage \- Amazon Timestream \- AWS Documentation, Zugriff am Mai 5, 2025, [https://docs.aws.amazon.com/timestream/latest/developerguide/storage.html](https://docs.aws.amazon.com/timestream/latest/developerguide/storage.html)  
96. Architecture \- Amazon Timestream \- AWS Documentation, Zugriff am Mai 5, 2025, [https://docs.aws.amazon.com/timestream/latest/developerguide/architecture.html](https://docs.aws.amazon.com/timestream/latest/developerguide/architecture.html)  
97. ARK 1: kdb+ Framework \- Data Intellect, Zugriff am Mai 5, 2025, [https://dataintellect.com/blog/ark-1-kdb-framework/](https://dataintellect.com/blog/ark-1-kdb-framework/)  
98. www.tutorialspoint.com, Zugriff am Mai 5, 2025, [https://www.tutorialspoint.com/kdbplus/kdbplus\_architecture.htm\#:\~:text=Kdb%2B%2F%20tick%20Architecture\&text=To%20get%20the%20relevant%20data,then%20updates%20its%20own%20tables.](https://www.tutorialspoint.com/kdbplus/kdbplus_architecture.htm#:~:text=Kdb%2B%2F%20tick%20Architecture&text=To%20get%20the%20relevant%20data,then%20updates%20its%20own%20tables.)  
99. KDB+ Architecture Overview \- Tutorialspoint, Zugriff am Mai 5, 2025, [https://www.tutorialspoint.com/kdbplus/kdbplus\_architecture.htm](https://www.tutorialspoint.com/kdbplus/kdbplus_architecture.htm)  
100. Recommendation for storage of series of time series \- DBA Stack Exchange, Zugriff am Mai 5, 2025, [https://dba.stackexchange.com/questions/177835/recommendation-for-storage-of-series-of-time-series](https://dba.stackexchange.com/questions/177835/recommendation-for-storage-of-series-of-time-series)  
101. Time-based retention strategies in Postgres \- Sequin Blog, Zugriff am Mai 5, 2025, [https://blog.sequinstream.com/time-based-retention-strategies-in-postgres/](https://blog.sequinstream.com/time-based-retention-strategies-in-postgres/)  
102. assets.timescale.com, Zugriff am Mai 5, 2025, [https://assets.timescale.com/resources/TimescaleDB\_Starter\_Guide.pdf](https://assets.timescale.com/resources/TimescaleDB_Starter_Guide.pdf)  
103. InfluxDB 3 storage engine architecture | InfluxDB Cloud Dedicated Documentation, Zugriff am Mai 5, 2025, [https://docs.influxdata.com/influxdb3/cloud-dedicated/reference/internals/storage-engine/](https://docs.influxdata.com/influxdb3/cloud-dedicated/reference/internals/storage-engine/)  
104. Utilization of Time Series Tools in Life-sciences and Neuroscience \- PMC \- PubMed Central, Zugriff am Mai 5, 2025, [https://pmc.ncbi.nlm.nih.gov/articles/PMC7727047/](https://pmc.ncbi.nlm.nih.gov/articles/PMC7727047/)  
105. SQL: How can I generate a time series from timestamp data and calculate cumulative sums across different event types? \- Stack Overflow, Zugriff am Mai 5, 2025, [https://stackoverflow.com/questions/76295454/sql-how-can-i-generate-a-time-series-from-timestamp-data-and-calculate-cumulati](https://stackoverflow.com/questions/76295454/sql-how-can-i-generate-a-time-series-from-timestamp-data-and-calculate-cumulati)  
106. Best way to store Time series data with heavy writing and high aggregation. (\~1 billion points) \- Stack Overflow, Zugriff am Mai 5, 2025, [https://stackoverflow.com/questions/16448941/best-way-to-store-time-series-data-with-heavy-writing-and-high-aggregation-1](https://stackoverflow.com/questions/16448941/best-way-to-store-time-series-data-with-heavy-writing-and-high-aggregation-1)  
107. Relational/time series databases and very large SELECT queries \- Stack Overflow, Zugriff am Mai 5, 2025, [https://stackoverflow.com/questions/62854018/relational-time-series-databases-and-very-large-select-queries](https://stackoverflow.com/questions/62854018/relational-time-series-databases-and-very-large-select-queries)