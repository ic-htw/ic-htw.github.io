<!--
====================================================
Collapse / Expand
==================================================== 
--> 
{% if include.mode == "short" %}
<div class="w3-bar"> 
  <button 
    onclick="setAllNavitemsOn()"
    class="w3-button w3-aqua">
  +
  </button>
  <button 
    onclick="setAllNavitemsOff()"
    class="w3-button w3-aqua">
  -
  </button>
</div>
{% endif %}

<!--
====================================================
Ausgewählte Datenbankkonzepte/-techniken
==================================================== 
-->  
<button 
  onclick="navitemToggle('ADBKT')"
  class="w3-button w3-block w3-left-align w3-light-grey">
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
  class="w3-button w3-block w3-left-align w3-light-grey">
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
  class="w3-button w3-block w3-left-align w3-light-grey">
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
  class="w3-button w3-block w3-left-align w3-light-grey">
{% if include.mode == "short" %}
DMDB
{% else %}
Datenmodellierung und Datenbanksysteme
{% endif %}
</button>

<div class="DMDB w3-padding">
    <a  href="/lv/dmdb/p/intro.html">Überblick</a> <br>
    <a  href="/lv/dmdb/p/plan.html">Plan</a> <br>
    <a  href="/lv/dmdb/p/rel.html">Relationenmodell</a> <br>
    SQL<br>
        &nbsp;&nbsp;&nbsp;&nbsp;
        <a  href="/lv/dmdb/p/sql-one.html">Abfragen auf einer Tabelle</a> <br>
        &nbsp;&nbsp;&nbsp;&nbsp;
        <a  href="/lv/dmdb/p/sql-join.html">Verbund</a> <br>
    <a  href="/lv/dmdb/p/material.html">Material</a> <br>
</div> 


<!--
====================================================
Projekt Business Intelligence
==================================================== 
-->  
<button 
  onclick="navitemToggle('PBI')"
  class="w3-button w3-block w3-left-align w3-light-grey">
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
Allgemeines
==================================================== 
-->  
<button 
  onclick="navitemToggle('Allgemeines')"
  class="w3-button w3-block w3-left-align w3-light-grey">
{% if include.mode == "short" %}
Allgemeines
{% else %}
Allgemeines
{% endif %}
</button>

<div class="Allgemeines w3-padding">
    <a  href="/links/allgemeines/temp.html">Noch lesen</a> <br>
    <a  href="/links/allgemeines/posts.html">Posts</a> <br>
    <a  href="/links/allgemeines/blogs-sites.html">Blogs, Sites</a> <br>
    <a  href="/links/allgemeines/courses-videos-slides-books.html">Courses, Videos, Slides, Books</a> <br>
    <a  href="/links/allgemeines/linux.html">Linux</a> <br>
    <a  href="/links/allgemeines/misc.html">Sonstiges</a> <br>
    <a  href="/links/allgemeines/services.html">Services</a> <br>
    <a  href="/links/allgemeines/tools.html">Werkzeuge</a> <br>
</div> 


<!--
====================================================
Datenbanksysteme
==================================================== 
-->  
<button 
  onclick="navitemToggle('DBS')"
  class="w3-button w3-block w3-left-align w3-light-grey">
{% if include.mode == "short" %}
DBS
{% else %}
Datenbanksysteme
{% endif %}
</button>

<div class="DBS w3-padding">
    <a  href="/links/dbs/languages.html">Abfragesprachen</a> <br>
    <a  href="/links/dbs/allgemeines.html">Allgemeines</a> <br>
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
</div> 

<!--
====================================================
Maschinelles Lernen
==================================================== 
-->  
<button 
  onclick="navitemToggle('ML')"
  class="w3-button w3-block w3-left-align w3-light-grey">
{% if include.mode == "short" %}
ML
{% else %}
Maschinelles Lernen
{% endif %}
</button>

<div class="ML w3-padding">
    <a  href="/links/ml/customer-analytics.html">Kundenanalyse</a> <br>
    <a  href="/links/ml/deep-learning.html">Deep Learning</a> <br>
    <a  href="/links/ml/recommendation.html">Empfehlungssysteme</a> <br>
</div> 

<!--
====================================================
Programmierung
==================================================== 
-->  
<button 
  onclick="navitemToggle('PROG')"
  class="w3-button w3-block w3-left-align w3-light-grey">
{% if include.mode == "short" %}
PROG
{% else %}
Programmierung
{% endif %}
</button>

<div class="PROG w3-padding">
    <a  href="/links/prog/allgemeines.html">Allgemeines</a> <br>
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
  class="w3-button w3-block w3-left-align w3-light-grey">
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
