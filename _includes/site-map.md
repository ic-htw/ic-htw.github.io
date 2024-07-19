{% if include.mode != "short" %}
<p class="w3-large w3-theme">Prof. Dr. Ingo Claßen - HTW Berlin</p>
{% endif %}

<!--
====================================================
Collapse / Expand
==================================================== 
{% if include.mode == "short" %}
{% endif %}
--> 
<div class="w3-bar"> 
  <button 
    onclick="setAllNavitemsOn()"
    class="w3-button w3-theme">
  +
  </button>
  <button 
    onclick="setAllNavitemsOff()"
    class="w3-button w3-theme">
  -
  </button>
</div>

<a  href="/home/home.html">Neu</a>


<!--
****************************************************
Lehrveranstaltungen
**************************************************** 
-->  
<p class="w3-large w3-theme ic-neg3">Lehre</p>


<!--
====================================================
Ausgewählte Datenbankkonzepte/-techniken
==================================================== 
-->  
<button 
  onclick="navitemToggle('ADBKT')"
  class="w3-button w3-left-align w3-padding-small w3-block ic-neg10">
{% if include.mode == "short" %}
ADBKT
{% else %}
Ausgewählte Datenbankkonzepte/-techniken
{% endif %}
</button>

<div class="ADBKT w3-padding">
    <a  href="/lv/adbkt/p/main.html">Überblick</a> <br>
    <a  href="/lv/adbkt/p/plan.html">Plan</a> <br>
    <a  href="/lv/adbkt/p/res.html">Ressourcen</a> <br>
    Vorlesung<br>
        &nbsp;&nbsp;&nbsp;&nbsp;
    <a  href="/lv/adbkt/p/history.html">Historischer Überblick</a> <br>
        &nbsp;&nbsp;&nbsp;&nbsp;
    <a  href="/lv/adbkt/p/cas.html">Überblick Cassandra</a> <br>
        &nbsp;&nbsp;&nbsp;&nbsp;
    <a  href="/lv/adbkt/p/nosql.html">NoSQL</a> <br>
        &nbsp;&nbsp;&nbsp;&nbsp;
    <a  href="/lv/adbkt/p/repl-part.html">Replikation / Partitionierung</a> <br>
        &nbsp;&nbsp;&nbsp;&nbsp;
    <a  href="/lv/adbkt/p/consistency.html">Konsistenz</a> <br>
        &nbsp;&nbsp;&nbsp;&nbsp;
    <a  href="/lv/adbkt/p/lsm.html">Log Structured Merge Trees</a> <br>
        &nbsp;&nbsp;&nbsp;&nbsp;
    <a  href="/lv/adbkt/p/cypher.html">Cypher</a> <br>
        &nbsp;&nbsp;&nbsp;&nbsp;
    <a  href="/lv/adbkt/a/graph/gds.pdf">Graph-Data-Science</a> <br>
        &nbsp;&nbsp;&nbsp;&nbsp;
    <a  href="/lv/adbkt/a/geo/geo.pdf">Geo-Datenverarbeitung</a> <br>
        &nbsp;&nbsp;&nbsp;&nbsp;
    <a  href="/lv/adbkt/p/vectordb.html">Vektordatenbanken</a> <br>
        &nbsp;&nbsp;&nbsp;&nbsp;
    <a  href="/lv/adbkt/p/dynamo.html">DynamoDB</a> <br>
        &nbsp;&nbsp;&nbsp;&nbsp;
    <a  href="/lv/adbkt/a/concur/concur.pdf">Nebenläufigkeit</a> <br>
        &nbsp;&nbsp;&nbsp;&nbsp;
    <a  href="/lv/adbkt/a/concur/2pc.pdf">Verteilte Transaktionen</a> <br>
        &nbsp;&nbsp;&nbsp;&nbsp;
    <a  href="/lv/adbkt/a/json/json-pg.pdf">JSON in Postgres</a> <br>
        &nbsp;&nbsp;&nbsp;&nbsp;
    <a  href="/lv/adbkt/p/window-sql.html">Window-Funktionen in SQL</a> <br>
        &nbsp;&nbsp;&nbsp;&nbsp;
    <a  href="/lv/adbkt/a/sql/rec.pdf">Rekursive Abfragen</a> <br>
        &nbsp;&nbsp;&nbsp;&nbsp;
    <a  href="/lv/adbkt/a/hana/hana.pdf">SAP Hana</a> <br>
        &nbsp;&nbsp;&nbsp;&nbsp;
    <a  href="/lv/adbkt/a/insta/insta.pdf">Instacart</a> <br>
    Übungen<br>
        &nbsp;&nbsp;&nbsp;&nbsp;
    <a  href="/lv/adbkt/p/pres.html">Präsentation von Fallbeispielen</a> <br>
        &nbsp;&nbsp;&nbsp;&nbsp;
    <a  href="/lv/adbkt/p/py-cont.html">Python-Container erstellen</a> <br>
        &nbsp;&nbsp;&nbsp;&nbsp;
    <a  href="/lv/adbkt/p/cas-repl.html">Cassandra Replikation</a> <br>
        &nbsp;&nbsp;&nbsp;&nbsp;
    <a  href="/lv/adbkt/p/neo4j-cont.html">Neo4j-Container erstellen</a> <br>
       &nbsp;&nbsp;&nbsp;&nbsp;
    <a  href="/lv/adbkt/p/dbeaver.html">Konfiguration DBeaver</a> <br>
        &nbsp;&nbsp;&nbsp;&nbsp;
    <a  href="/lv/adbkt/p/db-intro.html">Python DB-Intro</a> <br>
        &nbsp;&nbsp;&nbsp;&nbsp;
    <a  href="/lv/adbkt/p/cypher-queries.html">Cypher-Abfragen</a> <br>
        &nbsp;&nbsp;&nbsp;&nbsp;
    <a  href="/lv/adbkt/p/gds.html">Graph-Data-Science</a> <br>
         &nbsp;&nbsp;&nbsp;&nbsp;
    <a  href="/lv/adbkt/p/geo-sql.html">Geo-Abfragen</a> <br>
        &nbsp;&nbsp;&nbsp;&nbsp;
    <a  href="/lv/adbkt/p/geo-viz.html">Visualisierung Geodaten</a> <br>
        &nbsp;&nbsp;&nbsp;&nbsp;
    <a  href="/lv/adbkt/p/pgrouting.html">pgRouting</a> <br>
        &nbsp;&nbsp;&nbsp;&nbsp;
    <a  href="/lv/adbkt/p/langchain.html">Langchain</a> <br>
        &nbsp;&nbsp;&nbsp;&nbsp;
    <a  href="/lv/adbkt/p/dynamodb.html">DynamoDB</a> <br>
        &nbsp;&nbsp;&nbsp;&nbsp;
    <a  href="/lv/adbkt/p/concur.html">Nebenläufigkeit</a> <br>
        &nbsp;&nbsp;&nbsp;&nbsp;
    <a  href="/lv/adbkt/p/retail.html">Retail Sales</a> <br>
        &nbsp;&nbsp;&nbsp;&nbsp;
    <a  href="/lv/adbkt/p/rec-sql.html">Rekursive Abfrage</a> <br>
        &nbsp;&nbsp;&nbsp;&nbsp;
    <a  href="/lv/adbkt/p/sql-chatgpt.html">SQL mit ChatGPT</a> <br>
        &nbsp;&nbsp;&nbsp;&nbsp;
    <a  href="/lv/adbkt/p/hana-btp-account.html">Hana, BTP Account</a> <br>
        &nbsp;&nbsp;&nbsp;&nbsp;
    <a  href="/lv/adbkt/p/hana-graph.html">Hana Graph</a> <br>
        &nbsp;&nbsp;&nbsp;&nbsp;
    <a  href="/lv/adbkt/p/hana-cc.html">Closeness Centrality in SAP Hana</a> <br>
    Prüfungsleistungen<br>
        &nbsp;&nbsp;&nbsp;&nbsp;
    <a  href="/lv/adbkt/p/tour-delight.html">P1</a> (15 Punkte)<br>
        &nbsp;&nbsp;&nbsp;&nbsp;
    <a  href="/lv/adbkt/p/nosql-sys.html">P2</a> (10 Punkte)<br>
        &nbsp;&nbsp;&nbsp;&nbsp;
    <a  href="/lv/adbkt/p/auth.html">P3</a> (20 Punkte)<br>
        &nbsp;&nbsp;&nbsp;&nbsp;
    <a  href="/lv/adbkt/p/sched.html">P4</a> (20 Punkte)<br>
        &nbsp;&nbsp;&nbsp;&nbsp;
    <a  href="/lv/adbkt/p/vectordb-case.html">P5</a> (15 Punkte)<br>
        &nbsp;&nbsp;&nbsp;&nbsp;
    <a  href="/lv/adbkt/p/graphql.html">P6</a> (20 Punkte)<br>
</div> 


<!--
====================================================
Data Management and Business Performance Management
==================================================== 
-->  
<button 
  onclick="navitemToggle('DataMan')"
  class="w3-button w3-left-align w3-padding-small w3-block ic-neg10">
{% if include.mode == "short" %}
DataMan
{% else %}
Data Management and Business Performance Management
{% endif %}
</button>

<div class="DataMan w3-padding">
    <a  href="/lv/dataman/p/teach-mat.html">Teaching Material</a> <br>
    <a  href="/lv/dataman/p/schedule.html">Schedule</a> <br>
    <a  href="/lv/dataman/p/pres.html">Presentations</a> <br>
    <a  href="/lv/dataman/p/ex-classroom.html">Classroom Exercises</a> <br>
    <a  href="/lv/dataman/p/ex-rated.html">Rated Exercises</a> <br>
    <a  href="/lv/dataman/p/software.html">Software</a> <br>
    <a  href="/lv/dataman/p/sql-pattern.html">SQL Patterns</a> <br>
    <a  href="/lv/dataman/p/grading.html">Grading</a> <br>
</div> 


<!--
====================================================
Datenbanktechnologien
==================================================== 
-->  
<button 
  onclick="navitemToggle('DbTech')"
  class="w3-button w3-left-align w3-padding-small w3-block ic-neg10">
{% if include.mode == "short" %}
DbTech
{% else %}
Datenbanktechnologien
{% endif %}
</button>

<div class="DbTech w3-padding">
    <a href="/lv/dbtech/p/material.html">Material</a> <br>
    <a href="/lv/dbtech/p/plan.html">Plan</a> <br>
    <a href="/lv/dbtech/p/pruefung.html">Prüfung</a> <br>
    <a href="/lv/dbtech/p/ue-org.html">Übung - Org</a> <br>
    <a href="/lv/dbtech/p/ue-ex.html">Übung - Aufgaben</a> <br>
</div> 

<!--
====================================================
Datenmodellierung und Datenbanksysteme
==================================================== 
-->  
<button 
  onclick="navitemToggle('DMDB')"
  class="w3-button w3-left-align w3-padding-small w3-block ic-neg10">
{% if include.mode == "short" %}
DMDB
{% else %}
Datenmodellierung und Datenbanksysteme
{% endif %}
</button>

<div class="DMDB w3-padding">
    Allgemein<br>
        &nbsp;&nbsp;&nbsp;&nbsp;
    <a  href="/lv/dmdb/p/intro.html">Überblick</a> <br>
        &nbsp;&nbsp;&nbsp;&nbsp;
    <a  href="/lv/dmdb/p/plan.html">Plan</a> <br>
        &nbsp;&nbsp;&nbsp;&nbsp;
    <a  href="https://www.youtube.com/playlist?list=PL9rvxJNs9la68A4nX7sP0sOW_OlQDylLV">Video</a> <br>
        &nbsp;&nbsp;&nbsp;&nbsp;
    <a  href="/lv/dmdb/p/share.html">Share</a> <br>
        &nbsp;&nbsp;&nbsp;&nbsp;
    <a  href="/lv/dmdb/a/probeklausur/dmdb-probeklausur.pdf">Probeklausur</a> <br>
    Rel<br>
        &nbsp;&nbsp;&nbsp;&nbsp;
    <a  href="/lv/dmdb/p/relmod.html">Relationenmodell</a> <br>
        &nbsp;&nbsp;&nbsp;&nbsp;
    <a  href="/lv/dmdb/p/rel-excel.html">Excel / Rel </a> <br>
        &nbsp;&nbsp;&nbsp;&nbsp;
    <a  href="/lv/dmdb/p/norm.html">Normalformen</a> <br>
    ER<br>
        &nbsp;&nbsp;&nbsp;&nbsp;
        <a  href="/lv/dmdb/p/er1.html">ER-Modelle 1</a> <br>
        &nbsp;&nbsp;&nbsp;&nbsp;
        <a  href="/lv/dmdb/p/er2.html">ER-Modelle 2</a> <br>
        &nbsp;&nbsp;&nbsp;&nbsp;
        <a  href="/lv/dmdb/p/er3.html">ER-Modelle 3</a> <br>
        &nbsp;&nbsp;&nbsp;&nbsp;
        <a  href="/lv/dmdb/p/er4.html">ER-Modelle 4</a> <br>
    SQL<br>
        &nbsp;&nbsp;&nbsp;&nbsp;
        <a  href="/lv/dmdb/p/sql-one.html">Abfragen auf einer Tabelle</a> <br>
        &nbsp;&nbsp;&nbsp;&nbsp;
        <a  href="/lv/dmdb/p/sql-join.html">Verbund</a> <br>
        &nbsp;&nbsp;&nbsp;&nbsp;
        <a  href="/lv/dmdb/p/sql-grp-agg.html">Gruppierungen / Aggregationen</a> <br>
        &nbsp;&nbsp;&nbsp;&nbsp;
        <a  href="/lv/dmdb/p/sql-sub.html">Unterabfragen</a> <br>
        &nbsp;&nbsp;&nbsp;&nbsp;
        <a  href="/lv/dmdb/p/sql-window.html">Fenster-Funktionen</a> <br>
        &nbsp;&nbsp;&nbsp;&nbsp;
        <a  href="/lv/dmdb/p/sql-case.html">Fallbeipiele</a> <br>
    Visualisierungen<br>
        &nbsp;&nbsp;&nbsp;&nbsp;
        <a  href="/lv/dmdb/p/viz-types.html">Diagrammtypen</a> <br>
        &nbsp;&nbsp;&nbsp;&nbsp;
        <a  href="/lv/dmdb/p/viz-amounts.html">Beträge</a> <br>
        &nbsp;&nbsp;&nbsp;&nbsp;
        <a  href="/lv/dmdb/p/viz-dist.html">Verteilungen</a> <br>
        &nbsp;&nbsp;&nbsp;&nbsp;
        <a  href="/lv/dmdb/p/viz-dist-many.html">Viele Verteilungen</a> <br>
        &nbsp;&nbsp;&nbsp;&nbsp;
        <a  href="/lv/dmdb/p/viz-proportions.html">Proportionen</a> <br>
        &nbsp;&nbsp;&nbsp;&nbsp;
        <a  href="/lv/dmdb/p/viz-assoc.html">Assoziationen</a> <br>
        &nbsp;&nbsp;&nbsp;&nbsp;
        <a  href="/lv/dmdb/p/viz-timeseries.html">Zeitreihen</a> <br>
        &nbsp;&nbsp;&nbsp;&nbsp;
        <a  href="/lv/dmdb/p/viz-sonstiges.html">Sonstiges</a> <br>
    Datenmodelle - relational<br>
        &nbsp;&nbsp;&nbsp;&nbsp;
        <a  href="/lv/dmdb/p/dm-unternehmen.html">Unternehmen</a> <br>
        &nbsp;&nbsp;&nbsp;&nbsp;
        <a  href="/lv/dmdb/p/dm-playlist.html">Playlist</a> <br>
        &nbsp;&nbsp;&nbsp;&nbsp;
        <a  href="/lv/dmdb/p/dm-foodmart.html">Foodmart</a> <br>
        &nbsp;&nbsp;&nbsp;&nbsp;
        <a  href="/lv/dmdb/p/dm-gm.html">Gartenmöbel</a> <br>
    Datenmodelle - ER<br>
        &nbsp;&nbsp;&nbsp;&nbsp;
        <a  href="/lv/dmdb/p/er-hochschule.html">Hochschule</a> <br>
    Arbeitsblätter<br>
        &nbsp;&nbsp;&nbsp;&nbsp;
        <a  href="/lv/dmdb/p/ab-01.html">Arbeitsblatt 1</a> <br>
        &nbsp;&nbsp;&nbsp;&nbsp;
        <a  href="/lv/dmdb/p/ab-02.html">Arbeitsblatt 2</a> <br>
        &nbsp;&nbsp;&nbsp;&nbsp;
        <a  href="/lv/dmdb/p/ab-03.html">Arbeitsblatt 3</a> <br>
        &nbsp;&nbsp;&nbsp;&nbsp;
        <a  href="/lv/dmdb/p/ab-04.html">Arbeitsblatt 4</a> <br>
</div> 


<!--
====================================================
Projekt Business Intelligence
==================================================== 
-->  
<button 
  onclick="navitemToggle('PBI')"
  class="w3-button w3-left-align w3-padding-small w3-block ic-neg10">
{% if include.mode == "short" %}
PBI
{% else %}
Projekt Business Intelligence
{% endif %}
</button>

<div class="PBI w3-padding">
    <a  href="/lv/pbi/main.html">Projektdurchführung</a> <br>
</div> 






<!--
****************************************************
Sonstiges
**************************************************** 
-->  
<p class="w3-large w3-theme ic-neg3">Sonstiges</p>
<button 
  onclick="navitemToggle('Sonstiges')"
  class="w3-button w3-left-align w3-padding-small w3-block ic-neg10">
{% if include.mode == "short" %}
Sonstiges
{% else %}
Sonstiges
{% endif %}
</button>

<div class="Sonstiges w3-padding">
    <a  href="/sonstiges/p/abschluss.html">Abschlussarbeiten</a> <br>
    <a  href="/sonstiges/p/pruefmod.html">Prüfungsmodalitäten</a> <br>
    <a  href="/sonstiges/p/plagiate.html">Plagiate in Übungen</a> <br>
    <a  href="/sonstiges/p/sqldeveloper.html">SQL-Developer</a> <br>
    <a  href="/sonstiges/p/ressourcen.html">Ressourcen</a> <br>
</div> 






<!--
****************************************************
Links
**************************************************** 
-->  
<p class="w3-large w3-theme ic-neg3">Links</p>




<!--
====================================================
Datenbanksysteme
==================================================== 
-->  
<button 
  onclick="navitemToggle('DBS')"
  class="w3-button w3-left-align w3-padding-small w3-block ic-neg10">
{% if include.mode == "short" %}
DBS
{% else %}
Datenbanksysteme
{% endif %}
</button>

<div class="DBS w3-padding">
    <a  href="/links/dbs/aaa.html">aaa</a> <br>
    <a  href="/links/dbs/languages.html">Abfragesprachen</a> <br>
    <a  href="/links/dbs/cassandra.html">Cassandra</a> <br>
    <a  href="/links/dbs/data-sets.html">Data Sets</a> <br>
    <a  href="/links/dbs/data-systems.html">Data Systems</a> <br>
    <a  href="/links/dbs/duckdb.html">DuckDB</a> <br>
    <a  href="/links/dbs/dynamodb.html">DynamoDB</a> <br>
    <a  href="/links/dbs/hana.html">Hana</a> <br>
    <a  href="/links/dbs/lsm.html">LSM</a> <br>
    <a  href="/links/dbs/neo4j.html">Neo4j</a> <br>
    <a  href="/links/dbs/oracle.html">Oracle</a> <br>
    <a  href="/links/dbs/postgis.html">Postgis</a> <br>
    <a  href="/links/dbs/postgres.html">Postgres</a> <br>
    <a  href="/links/dbs/stream.html">Stream / Event Processing</a> <br>
    <a  href="/links/dbs/vector_databases.html">Vector Databases</a> <br>
    <a  href="/links/dbs/visualization.html">Visualization</a> <br>
</div> 

<!--
====================================================
Maschinelles Lernen
==================================================== 
-->  
<button 
  onclick="navitemToggle('ML')"
  class="w3-button w3-left-align w3-padding-small w3-block ic-neg10">
{% if include.mode == "short" %}
ML
{% else %}
Maschinelles Lernen
{% endif %}
</button>

<div class="ML w3-padding">
    <a  href="/links/ml/aaa.html">aaa</a> <br>
    <a  href="/links/ml/anomaly_detection.html">Anomaly Detection</a> <br>
    <a  href="/links/ml/decision_trees.html">Decision Trees</a> <br>
    <a  href="/links/ml/deep-learning.html">Deep Learning</a> <br>
    <a  href="/links/ml/recommendation.html">Empfehlungssysteme</a> <br>
    <a  href="/links/ml/interpretation.html">Interpretation of ML Models</a> <br>
    <a  href="/links/ml/customer-analytics.html">Kundenanalyse</a> <br>
    <a  href="/links/ml/large_language_models.html">Large Language Models</a> <br>
    <a  href="/links/ml/lineare_algebra.html">Linear Algebra</a> <br>
    <a  href="/links/ml/nlp.html">NLP</a> <br>
    <a  href="/links/ml/timeseries.html">Timeseries</a> <br>
</div> 

<!--
====================================================
Programmierung
==================================================== 
-->  
<button 
  onclick="navitemToggle('PROG')"
  class="w3-button w3-left-align w3-padding-small w3-block ic-neg10">
{% if include.mode == "short" %}
PROG
{% else %}
Programmierung
{% endif %}
</button>

<div class="PROG w3-padding">
    <a  href="/links/prog/aaa.html">Aaa</a> <br>
    <a  href="/links/prog/js-css-html.html">JavaScript, CSS, HTML</a> <br>
    <a  href="/links/prog/languages.html">Programmiersprachen</a> <br>
    <a  href="/links/prog/python.html">Python</a> <br>
    <a  href="/links/prog/rust.html">Rust</a> <br>
    <a  href="/links/prog/sap.html">SAP</a> <br>
</div> 

<!--
====================================================
xxx
==================================================== 
<button 
  onclick="navitemToggle('{{'xxx' | append: include.mode}}')"
  class="w3-button w3-left-align w3-padding-small w3-block">
{% if include.mode == "short" %}
xxx
{% else %}
xxx
{% endif %}
</button>

<div id={{"xxx" | append: include.mode}} class="ic-nav-item w3-padding">
    <a  href="xxx">xxx</a> <br>
</div> 
-->  
