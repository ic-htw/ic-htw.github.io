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


