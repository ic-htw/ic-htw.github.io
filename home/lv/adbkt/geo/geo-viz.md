---
layout: default1
nav: adbkt-geo
title: "Ü: Visualisierung Geodaten"
is_slide: 0
---

# Visualisierung Geodaten in Python

## Shapes und Marker
> ![Bild](/home/lv/adbkt/a/geo/fig/viz1.png)

## Bounding Box
> ![Bild](/home/lv/adbkt/a/geo/fig/viz2.png)

## Voronoi-Tesselation
> ![Bild](/home/lv/adbkt/a/geo/fig/viz3.png)

## Code
- Geo in Python 
[(link)](/home/lv/adbkt/a/ipynb/intro-geo.ipynb) 
[(render)](https://github.com/ic-htw/ic-htw.github.io/blob/master/home/lv/adbkt/a/ipynb/intro-geo.ipynb)

## Gebäude-Shapes
Schreiben Sie in Python Code, der eine Visualisierung von Gebäude-Shapes erzeugt
> ![Bild](/home/lv/adbkt/a/geo/fig/gebaeude.png)

### Schritt 1: Abfrage an die Datenbank
#### Vorgehen
- Die Shapes befinden sich in der Tabelle: `gis_osm_buildings_a_free_1`
- Wählen Sie eine Breite und Länge als Zentrum der Visualisierung
- Wählen Sie eine Größe für die Bounding-Box, innerhalb der die Shapes liegen sollen
  - Die Angabe der Größe erfolgt in Grad
  - Wählen Sie 0.005 Grad
  - Das entspricht eine Seitenlänge der Box von ca. 350 Metern
- Entwickeln Sie eine Abfrage, die die relevanten Daten als Dataframe zurückliefert, d.h.folgende Spalten:
  - `osm_id as osmid`
  - `fclass`
  - `name as descr`
  - `ST_AsGeoJSON(geometry) as gj`

#### Links zur Doku
- ST_Expand [(link)](https://postgis.net/docs/ST_Expand.html)
- ST_Intersects [(link)](https://postgis.net/docs/ST_Intersects.html)
- ST_AsGeoJSON [(link)](https://postgis.net/docs/ST_AsGeoJSON.html)

### Schritt 2: Darstellung mittels Folium
#### Vorgehen
- Map anlegen: `m = folium.Map(location=…, zoom_start=15)` 
- Verwenden Sie die Apply-Funktion des Dataframes, um die folium.GeoJson-Objekte zu erzeugen, die zur Map hinzugefügt werden:
  ```
  for x in df.apply(lambda r: folium.GeoJson(…), axis=1):
      x.add_to(m)
  ```

#### Links zur Doku
- Folium Home [(link)](https://python-visualization.github.io/folium/latest/)
- Folium Beschreibung [(link)](https://realpython.com/python-folium-web-maps-from-data/)
- pandas.DataFrame.apply [(link)](http://pandas.pydata.org/pandas-docs/stable/reference/api/pandas.DataFrame.apply.html)
- folium.features.GeoJson [(link)](https://python-visualization.github.io/folium/latest/reference.html#folium.features.GeoJson)