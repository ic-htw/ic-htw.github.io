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


<!--
====================================================
Ausgewählte Datenbankkonzepte/-techniken
==================================================== 
-->  
<button 
  onclick="navitemToggle('ADBKT')"
  class="w3-button w3-left-align w3-padding-small w3-block">
{% if include.mode == "short" %}
ADBKT
{% else %}
Ausgewählte Datenbankkonzepte/-techniken
{% endif %}
</button>

<div class="ADBKT w3-padding">
  <a  href="/lv/adbkt/p/main.html">Überblick</a> <br>
  <a  href="/lv/adbkt/p/infra.html">Technische Infrastruktur</a> <br>
  <a  href="/lv/adbkt/p/res.html">Ressourcen</a> <br>
</div> 


<!--
====================================================
Data Management and Business Performance Management
==================================================== 
-->  
<button 
  onclick="navitemToggle('DataMan')"
  class="w3-button w3-left-align w3-padding-small w3-block">
{% if include.mode == "short" %}
DataMan
{% else %}
Data Management and Business Performance Management
{% endif %}
</button>

<div class="DataMan w3-padding">
    <a  href="xxx">xxx</a> <br>
</div> 


<!--
====================================================
Datenbanktechnologien
==================================================== 
-->  
<button 
  onclick="navitemToggle('DbTech')"
  class="w3-button w3-left-align w3-padding-small w3-block">
{% if include.mode == "short" %}
DbTech
{% else %}
Datenbanktechnologien
{% endif %}
</button>

<div class="DbTech w3-padding">
    <a  href="xxx">xxx</a> <br>
</div> 

<!--
====================================================
Datenmodellierung und Datenbanksysteme
==================================================== 
-->  
<button 
  onclick="navitemToggle('DMDB')"
  class="w3-button w3-left-align w3-padding-small w3-block">
{% if include.mode == "short" %}
DMDB
{% else %}
Datenmodellierung und Datenbanksysteme
{% endif %}
</button>

<div class="DMDB w3-padding">
    Intro<br>
        &nbsp;&nbsp;&nbsp;&nbsp;
    <a  href="/lv/dmdb/p/intro.html">Überblick</a> <br>
        &nbsp;&nbsp;&nbsp;&nbsp;
    <a  href="/lv/dmdb/p/plan.html">Plan</a> <br>
        &nbsp;&nbsp;&nbsp;&nbsp;
    <a  href="/lv/dmdb/p/relmod.html">Relationenmodell</a> <br>
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
        <a  href="/lv/dmdb/p/sql-case.html">Fallbeipiele</a> <br>
    Datenmodelle - relational<br>
        &nbsp;&nbsp;&nbsp;&nbsp;
        <a  href="/lv/dmdb/p/dm-unternehmen.html">Unternehmen</a> <br>
        &nbsp;&nbsp;&nbsp;&nbsp;
        <a  href="/lv/dmdb/p/dm-playlist.html">Playlist</a> <br>
        &nbsp;&nbsp;&nbsp;&nbsp;
        <a  href="/lv/dmdb/p/dm-foodmart.html">Foodmart</a> <br>
    <a  href="/lv/dmdb/p/material.html">Material</a> <br>
</div> 


<!--
====================================================
Projekt Business Intelligence
==================================================== 
-->  
<button 
  onclick="navitemToggle('PBI')"
  class="w3-button w3-left-align w3-padding-small w3-block">
{% if include.mode == "short" %}
PBI
{% else %}
Projekt Business Intelligence
{% endif %}
</button>

<div class="PBI w3-padding">
    <a  href="xxx">xxx</a> <br>
</div> 














<!--
====================================================
AAA
==================================================== 
-->  
<button 
  onclick="navitemToggle('AAA')"
  class="w3-button w3-left-align w3-padding-small w3-block">
{% if include.mode == "short" %}
AAA
{% else %}
AAA
{% endif %}
</button>

<div class="AAA w3-padding">
    <a  href="/links/aaa/aaa.html">aaa</a> <br>
    <a  href="/links/aaa/blogs-sites.html">Blogs, Sites</a> <br>
    <a  href="/links/aaa/courses-videos-slides-books.html">Courses, Videos, Slides, Books</a> <br>
    <a  href="/links/aaa/linux.html">Linux</a> <br>
    <a  href="/links/aaa/noch_lesen.html">Noch lesen</a> <br>
    <a  href="/links/aaa/posts.html">Posts</a> <br>
    <a  href="/links/aaa/services.html">Services</a> <br>
    <a  href="/links/aaa/tools.html">Tools</a> <br>
</div> 


<!--
====================================================
Datenbanksysteme
==================================================== 
-->  
<button 
  onclick="navitemToggle('DBS')"
  class="w3-button w3-left-align w3-padding-small w3-block">
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
    <a  href="/links/dbs/llm_analytics.html">LLM Analytics</a> <br>
    <a  href="/links/dbs/lsm.html">LSM</a> <br>
    <a  href="/links/dbs/neo4j.html">Neo4j</a> <br>
    <a  href="/links/dbs/oracle.html">Oracle</a> <br>
    <a  href="/links/dbs/postgis.html">Postgis</a> <br>
    <a  href="/links/dbs/postgres.html">Postgres</a> <br>
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
  class="w3-button w3-left-align w3-padding-small w3-block">
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
    <a  href="/links/ml/lineare_algebra.html">Linear Algebra</a> <br>
    <a  href="/links/ml/nlp.html">NLP</a> <br>
    <a  href="/links/ml/timeseries.html">Timeseries</a> <br>
    <a  href="/links/ml/large_language_models.html">Large Language Models</a> <br>
</div> 

<!--
====================================================
Programmierung
==================================================== 
-->  
<button 
  onclick="navitemToggle('PROG')"
  class="w3-button w3-left-align w3-padding-small w3-block">
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
