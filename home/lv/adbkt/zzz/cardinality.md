---
layout: default1
nav: adbkt-zzz
is_slide: 0
---

# **High Cardinality in Time Series Databases**

## **Slide 1: Title Slide**

**Title:** High Cardinality in Time Series Databases: Definition, Implications, and Management

## **Slide 2: Introduction**

* Time series databases are specialized for time-indexed data.1  
* Used in IoT, monitoring, finance, healthcare, etc..2  
* Cardinality refers to the number of unique elements.7  
* High cardinality in time series arises from numerous unique data streams, often due to tags or labels.9

## **Slide 3: What is Cardinality in Time Series Databases?**

* **Cardinality (General):** Number of unique values in a column.7  
* **Time Series Cardinality:** Uniqueness of the entire time series based on tags/labels.9  
* A time series is a sequence of (timestamp, value) with associated tags (key-value pairs).9  
* Each unique combination of tag values creates a distinct time series.17  
* **High Cardinality:** Very large number of unique time series.7  
* **Low Cardinality:** Small number of unique time series.7

## **Slide 4: Causes of High Cardinality**

* Tracking individual entities (users, devices, orders) with unique IDs.8  
* Highly granular timestamps (millisecond, nanosecond level).13  
* Dynamic environments (auto-scaling instances, ephemeral containers) with unique identifiers.20  
* Rich instrumentation with detailed context in tags (e.g., request paths with dynamic parameters).20  
* Unbounded tag values that constantly increase.32

## **Slide 5: Challenges of High Cardinality**

* **Increased Storage:** Each unique series requires storage and index space.10  
* **Degraded Query Performance:** More series to filter, slower index traversal, expensive aggregations.10  
* **Increased Memory Consumption:** Larger in-memory indices and metadata.10  
* **Reduced Write Throughput:** Costly to create and index new series.10  
* **Increased Costs:** Higher resource usage and potential licensing fees.17

## **Slide 6: Strategies for Managing High Cardinality \- Data Modeling**

* Avoid using high-cardinality dimensions directly as tags (e.g., user IDs, raw IP addresses).39  
* Normalize high-cardinality fields (e.g., store network subnets instead of IPs, user cohorts instead of user IDs).18  
* Store URL route patterns instead of full URLs with parameters.18  
* Separate metadata from time series data.12

## **Slide 7: Strategies for Managing High Cardinality \- Aggregation and Roll-ups**

* Pre-aggregate data for common time intervals.2  
* Implement tiered storage with different granularity levels based on data age.18  
* Downsampling: Reduce data granularity over time.13

## **Slide 8: Strategies for Managing High Cardinality \- Bucketing and Sampling**

* **Bucketing:** Group high-cardinality data into predefined categories or ranges (e.g., latency buckets).13  
* **Sampling:** Reduce the volume of high-cardinality data collected.13

## **Slide 9: Strategies for Managing High Cardinality \- Label Management and Database Features**

* Implement strict policies on which labels can be added.31  
* Regularly review and eliminate unnecessary labels.39  
* Utilize database-specific features like cardinality limiters and optimized indexing.12

## **Slide 10: How Different Time Series Databases Handle High Cardinality**

* **InfluxDB (Pre 3.0):** In-memory index limited performance.12 **InfluxDB 3.0:** Columnar, supports unlimited cardinality.42  
* **TimescaleDB:** PostgreSQL extension, leverages B-trees and partitioning.11  
* **VictoriaMetrics:** Designed for high cardinality, uses inverted index (IndexDB), cardinality limiter.35  
* **QuestDB:** Column-based, parallelized hashmap operations.10  
* **TDengine:** One table per data collection point, separates metadata.12

## **Slide 11: Real-World Use Cases**

* **IoT and Sensor Data:** Unique device IDs, sensor IDs .  
* **Microservices Monitoring:** Instance IDs, pod names, container IDs .  
* **User Activity Tracking:** User IDs, session IDs, request paths .  
* **Financial Markets:** Stock tickers, transaction IDs.2

## **Slide 12: Performance Benchmarks and Considerations**

* Performance varies significantly between databases under high cardinality .  
* Indexing strategies, storage format (row vs. column), and query optimization are crucial.10  
* Hardware considerations (memory, disk I/O, CPU) are paramount.15

## **Slide 13: Conclusion**

* High cardinality is a significant challenge in time series databases.30  
* Effective management requires careful data modeling, aggregation, and leveraging database-specific features.18  
* Choosing the right time series database is critical for handling high cardinality efficiently.12  
* Understanding the trade-offs of different strategies is essential for building scalable systems.

#### **Referenzen**

1. www.liquidweb.com, Zugriff am Mai 11, 2025, [https://www.liquidweb.com/blog/what-is-a-time-series-database/\#:\~:text=It%20is%20used%20to%20monitor,app%20usage%20frequency%2C%20and%20more.](https://www.liquidweb.com/blog/what-is-a-time-series-database/#:~:text=It%20is%20used%20to%20monitor,app%20usage%20frequency%2C%20and%20more.)  
2. Time Series Database (TSDB): A Guide With Examples | DataCamp, Zugriff am Mai 11, 2025, [https://www.datacamp.com/blog/time-series-database](https://www.datacamp.com/blog/time-series-database)  
3. What Is a Time Series Database? How It Works \+ Use Cases \- Timeplus, Zugriff am Mai 11, 2025, [https://www.timeplus.com/post/time-series-database](https://www.timeplus.com/post/time-series-database)  
4. What Is a Time Series Database? How It Works & Use Cases \- Liquid Web, Zugriff am Mai 11, 2025, [https://www.liquidweb.com/blog/what-is-a-time-series-database/](https://www.liquidweb.com/blog/what-is-a-time-series-database/)  
5. 16 Time Series Database Use Cases Across Sectors \[2024\] \- Timeplus, Zugriff am Mai 11, 2025, [https://www.timeplus.com/post/time-series-database-use-cases](https://www.timeplus.com/post/time-series-database-use-cases)  
6. Engineering Resources / An intro to time-series databases \- ClickHouse, Zugriff am Mai 11, 2025, [https://clickhouse.com/engineering-resources/what-is-time-series-database](https://clickhouse.com/engineering-resources/what-is-time-series-database)  
7. What is Cardinality | Explore Data Cardinality in Databases, Zugriff am Mai 11, 2025, [https://www.actian.com/what-is-cardinality/](https://www.actian.com/what-is-cardinality/)  
8. What Is Cardinality In Databases: A Comprehensive Guide \- Netdata, Zugriff am Mai 11, 2025, [https://www.netdata.cloud/academy/what-is-cardinality-in-databases-a-comprehensive-guide/](https://www.netdata.cloud/academy/what-is-cardinality-in-databases-a-comprehensive-guide/)  
9. What Is Cardinality in a Database? \- Orange Matter, Zugriff am Mai 11, 2025, [https://orangematter.solarwinds.com/2020/01/05/what-is-cardinality-in-a-database/](https://orangematter.solarwinds.com/2020/01/05/what-is-cardinality-in-a-database/)  
10. What Is High Cardinality? | QuestDB, Zugriff am Mai 11, 2025, [https://questdb.com/glossary/high-cardinality/](https://questdb.com/glossary/high-cardinality/)  
11. What Is High Cardinality? | Timescale, Zugriff am Mai 11, 2025, [https://www.timescale.com/blog/what-is-high-cardinality](https://www.timescale.com/blog/what-is-high-cardinality)  
12. High Cardinality in Time Series Data \- TDengine, Zugriff am Mai 11, 2025, [https://tdengine.com/high-cardinality/](https://tdengine.com/high-cardinality/)  
13. Guide — What is High Cardinality? | Last9, Zugriff am Mai 11, 2025, [https://last9.io/blog/high-cardinality-explained-the-basics-without-the-jargon/](https://last9.io/blog/high-cardinality-explained-the-basics-without-the-jargon/)  
14. What is High Cardinality Data? | SigNoz, Zugriff am Mai 11, 2025, [https://signoz.io/blog/high-cardinality-data/](https://signoz.io/blog/high-cardinality-data/)  
15. How databases handle 10 million devices in high-cardinality benchmarks \- QuestDB, Zugriff am Mai 11, 2025, [https://questdb.com/blog/2021/06/16/high-cardinality-time-series-data-performance/](https://questdb.com/blog/2021/06/16/high-cardinality-time-series-data-performance/)  
16. What Is Cardinality in a Database? \- Orange Matter \- SolarWinds, Zugriff am Mai 11, 2025, [https://www.solarwinds.com/blog/what-is-cardinality-in-a-database/](https://www.solarwinds.com/blog/what-is-cardinality-in-a-database/)  
17. Cardinality Metrics for Monitoring and Observability: Why High ..., Zugriff am Mai 11, 2025, [https://www.splunk.com/en\_us/blog/learn/cardinality-metrics-monitoring-observability.html](https://www.splunk.com/en_us/blog/learn/cardinality-metrics-monitoring-observability.html)  
18. Performance Impact of High Cardinality in Time-Series DBs \- Last9, Zugriff am Mai 11, 2025, [https://last9.io/blog/performance-implications-of-high-cardinality-in-time-series-databases/](https://last9.io/blog/performance-implications-of-high-cardinality-in-time-series-databases/)  
19. Guide — Dimensionality in High Cardinality and How to Manage It \- Last9, Zugriff am Mai 11, 2025, [https://last9.io/guides/high-cardinality/dimensionality-in-high-cardinality-and-how-to-manage-it/](https://last9.io/guides/high-cardinality/dimensionality-in-high-cardinality-and-how-to-manage-it/)  
20. Understanding High Cardinality in Observability, Zugriff am Mai 11, 2025, [https://www.observeinc.com/blog/understanding-high-cardinality-in-observability/](https://www.observeinc.com/blog/understanding-high-cardinality-in-observability/)  
21. What Is High Cardinality? \- DZone, Zugriff am Mai 11, 2025, [https://dzone.com/articles/what-is-high-cardinality](https://dzone.com/articles/what-is-high-cardinality)  
22. High-series cardinality \- openGemini, Zugriff am Mai 11, 2025, [https://docs.opengemini.org/guide/features/high\_series\_cardinality](https://docs.opengemini.org/guide/features/high_series_cardinality)  
23. time series \- What is timeseries data cardinality? \- Stack Overflow, Zugriff am Mai 11, 2025, [https://stackoverflow.com/questions/68134063/what-is-timeseries-data-cardinality](https://stackoverflow.com/questions/68134063/what-is-timeseries-data-cardinality)  
24. Database Cardinality: A Brief Overview \- Coursera, Zugriff am Mai 11, 2025, [https://www.coursera.org/articles/cardinality](https://www.coursera.org/articles/cardinality)  
25. What Is Database Cardinality? \- IT Glossary \- SolarWinds, Zugriff am Mai 11, 2025, [https://www.solarwinds.com/resources/it-glossary/database-cardinality](https://www.solarwinds.com/resources/it-glossary/database-cardinality)  
26. High Cardinality \- Honeycomb.io Documentation, Zugriff am Mai 11, 2025, [https://docs.honeycomb.io/get-started/basics/observability/concepts/high-cardinality/](https://docs.honeycomb.io/get-started/basics/observability/concepts/high-cardinality/)  
27. signoz.io, Zugriff am Mai 11, 2025, [https://signoz.io/blog/high-cardinality-data/\#:\~:text=A%20high%20cardinality%20column%20contains,Timestamps%20in%20time%2Dseries%20data](https://signoz.io/blog/high-cardinality-data/#:~:text=A%20high%20cardinality%20column%20contains,Timestamps%20in%20time%2Dseries%20data)  
28. Understanding Cardinality: The Challenges and Solutions | DataCamp, Zugriff am Mai 11, 2025, [https://www.datacamp.com/tutorial/cardinality](https://www.datacamp.com/tutorial/cardinality)  
29. Guide — What is High Cardinality? | Last9, Zugriff am Mai 11, 2025, [https://last9.io/guides/high-cardinality/what-is-high-cardinality/](https://last9.io/guides/high-cardinality/what-is-high-cardinality/)  
30. signoz.io, Zugriff am Mai 11, 2025, [https://signoz.io/blog/high-cardinality-data/\#:\~:text=Can%20you%20provide%20examples%20of,field%20with%20numerous%20unique%20values.](https://signoz.io/blog/high-cardinality-data/#:~:text=Can%20you%20provide%20examples%20of,field%20with%20numerous%20unique%20values.)  
31. High Cardinality in Metrics: Challenges, Causes, and Solutions \- Sawmills, Zugriff am Mai 11, 2025, [https://www.sawmills.ai/blog/high-cardinality-in-metrics-challenges-causes-and-solutions](https://www.sawmills.ai/blog/high-cardinality-in-metrics-challenges-causes-and-solutions)  
32. Time Series Data, Cardinality, and InfluxDB | InfluxData, Zugriff am Mai 11, 2025, [https://www.influxdata.com/blog/time-series-data-cardinality-influxdb/](https://www.influxdata.com/blog/time-series-data-cardinality-influxdb/)  
33. High Cardinality Is Eating Your Storage Budget—Here's Why | Last9, Zugriff am Mai 11, 2025, [https://last9.io/blog/high-cardinality-is-eating-your-storage-budget/](https://last9.io/blog/high-cardinality-is-eating-your-storage-budget/)  
34. How Different Databases Handle High-Cardinality Data | Timescale, Zugriff am Mai 11, 2025, [https://www.timescale.com/blog/how-different-databases-handle-high-cardinality-data](https://www.timescale.com/blog/how-different-databases-handle-high-cardinality-data)  
35. Choosing a Time Series Database for High Cardinality Aggregations \- Abios Gaming, Zugriff am Mai 11, 2025, [https://abiosgaming.com/press/high-cardinality-aggregations/](https://abiosgaming.com/press/high-cardinality-aggregations/)  
36. Understanding cardinality over time in the real world \- Chronosphere, Zugriff am Mai 11, 2025, [https://chronosphere.io/learn/understanding-cardinality-over-time-in-the-real-world/](https://chronosphere.io/learn/understanding-cardinality-over-time-in-the-real-world/)  
37. How to manage high cardinality in metrics | Better Stack ..., Zugriff am Mai 11, 2025, [https://betterstack.com/docs/logs/how-to-manage-high-cardinality-in-metrics/](https://betterstack.com/docs/logs/how-to-manage-high-cardinality-in-metrics/)  
38. Timeseries Database for 100M timeseries : r/devops \- Reddit, Zugriff am Mai 11, 2025, [https://www.reddit.com/r/devops/comments/vx65i4/timeseries\_database\_for\_100m\_timeseries/](https://www.reddit.com/r/devops/comments/vx65i4/timeseries_database_for_100m_timeseries/)  
39. Unveiling High-Cardinality in TSDB | Greptime, Zugriff am Mai 11, 2025, [https://greptime.com/blogs/2023-07-31-unveiling-high-cardinality](https://greptime.com/blogs/2023-07-31-unveiling-high-cardinality)  
40. Time Series Database – Solution to the Problem of Timeline Expansion (High Cardinality), Zugriff am Mai 11, 2025, [https://www.alibabacloud.com/blog/time-series-database-solution-to-the-problem-of-timeline-expansion-high-cardinality\_598694](https://www.alibabacloud.com/blog/time-series-database-solution-to-the-problem-of-timeline-expansion-high-cardinality_598694)  
41. How we tame high cardinality in time series databases | Last9, Zugriff am Mai 11, 2025, [https://last9.io/blog/how-to-make-high-cardinality-work-in-time-series-databases-part-1/](https://last9.io/blog/how-to-make-high-cardinality-work-in-time-series-databases-part-1/)  
42. InfluxDB 3.0 Revolutionizes Unlimited Cardinality, High Performance Time Series Data Analytics \- Database Trends and Applications, Zugriff am Mai 11, 2025, [https://www.dbta.com/Editorial/News-Flashes/InfluxDB-30-Revolutionizes-Unlimited-Cardinality-High-Performance-Time-Series-Data-Analytics-158375.aspx](https://www.dbta.com/Editorial/News-Flashes/InfluxDB-30-Revolutionizes-Unlimited-Cardinality-High-Performance-Time-Series-Data-Analytics-158375.aspx)  
43. VictoriaMetrics, Zugriff am Mai 11, 2025, [https://docs.victoriametrics.com/victoriametrics/](https://docs.victoriametrics.com/victoriametrics/)  
44. Time Series Database for High Volume IoT Data? \- Reddit, Zugriff am Mai 11, 2025, [https://www.reddit.com/r/Database/comments/1gluf1d/time\_series\_database\_for\_high\_volume\_iot\_data/](https://www.reddit.com/r/Database/comments/1gluf1d/time_series_database_for_high_volume_iot_data/)  
45. Choosing a time-series data base for high frequency sensor data : r/Database \- Reddit, Zugriff am Mai 11, 2025, [https://www.reddit.com/r/Database/comments/1jal3fe/choosing\_a\_timeseries\_data\_base\_for\_high/](https://www.reddit.com/r/Database/comments/1jal3fe/choosing_a_timeseries_data_base_for_high/)  
46. How Time Series Databases Work, and Where They Don't \- Hacker News, Zugriff am Mai 11, 2025, [https://news.ycombinator.com/item?id=28901063](https://news.ycombinator.com/item?id=28901063)  
47. Benchmark Comparison of Time-Series Databases: Performance and Reliability, Zugriff am Mai 11, 2025, [https://soufianebouchaara.com/benchmark-comparison-of-time-series-databases-performance-and-reliability/](https://soufianebouchaara.com/benchmark-comparison-of-time-series-databases-performance-and-reliability/)  
48. Seeking advice on dealing with high cardinality : r/PrometheusMonitoring \- Reddit, Zugriff am Mai 11, 2025, [https://www.reddit.com/r/PrometheusMonitoring/comments/df4tqu/seeking\_advice\_on\_dealing\_with\_high\_cardinality/](https://www.reddit.com/r/PrometheusMonitoring/comments/df4tqu/seeking_advice_on_dealing_with_high_cardinality/)  
49. Case studies and talks \- VictoriaMetrics, Zugriff am Mai 11, 2025, [https://docs.victoriametrics.com/victoriametrics/casestudies/](https://docs.victoriametrics.com/victoriametrics/casestudies/)  
50. 7 Cutting-Edge Time Series Database Examples For 2024 \- Timeplus, Zugriff am Mai 11, 2025, [https://www.timeplus.com/post/time-series-database-example](https://www.timeplus.com/post/time-series-database-example)  
51. Key Use Cases and Success Stories of Real-time Analytics Databases \- Imply, Zugriff am Mai 11, 2025, [https://imply.io/use-cases/key-use-cases-and-success-stories-of-real-time-analytics-databases/](https://imply.io/use-cases/key-use-cases-and-success-stories-of-real-time-analytics-databases/)  
52. Very high cardinality and time series data, what DB to use? \- Stack Overflow, Zugriff am Mai 11, 2025, [https://stackoverflow.com/questions/14298354/very-high-cardinality-and-time-series-data-what-db-to-use](https://stackoverflow.com/questions/14298354/very-high-cardinality-and-time-series-data-what-db-to-use)  
53. What time series database can support high cardinality?, Zugriff am Mai 11, 2025, [https://softwareengineering.stackexchange.com/questions/359754/what-time-series-database-can-support-high-cardinality](https://softwareengineering.stackexchange.com/questions/359754/what-time-series-database-can-support-high-cardinality)