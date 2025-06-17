Attribute and License: http://postgis.net/workshops/postgis-intro
----------------------------------------------------------------------------------------------------
-- visualisierungen
----------------------------------------------------------------------------------------------------
select name, geometry, st_centroid(geometry) as center
from gis_osm_pois_a_free_1 
where osm_id ='41361350';

select ST_MakeEnvelope(13.5233,52.4572,13.5322,52.4602, 4326);

select null, null, null, null,
  ST_MakeEnvelope(13.5233,52.4572,13.5322,52.4602, 4326)
union all
select *
from gis_osm_pois_a_free_1 
where st_intersects(ST_MakeEnvelope(13.5233,52.4572,13.5322,52.4602, 4326), geometry);

select geometry
from bln_edges 
where st_intersects(ST_MakeEnvelope(13.5233,52.4572,13.5322,52.4602, 4326), geometry);

  
select name, shape from bezirk
union all
select 'bb' as name, ST_Extent(shape) as shape from bezirk;


select bez, pos from haltestelle;

select * 
from gis_osm_buildings_a_free_1 b
order by b.geometry <-> st_point(13.5270, 52.4585, 4326)
limit 300;

select * 
from gis_osm_water_a_free_1 b
order by b.geometry <-> st_point(13.5270, 52.4585, 4326)
limit 400;

----------------------------------------------------------------------------------------------------
-- voronoi - fetch auf 500 setzen
----------------------------------------------------------------------------------------------------
-- bb von berlin
select ST_MakeEnvelope(13.0883, 52.3382, 13.7611, 52.6755, 4326)

select pos as shape
from haltestelle;

select st_collect(pos) as shape
from haltestelle;

select ST_VoronoiPolygons(st_collect(pos)) as shape from haltestelle h;

select pos from haltestelle
union all
select ST_VoronoiPolygons(st_collect(pos)) as shape from haltestelle h;



----------------------------------------------------------------------------------------------------
-- geometry vs geography
----------------------------------------------------------------------------------------------------
select * from spatial_ref_sys;

select st_distance(
  -- Berlin
  st_point(13.4049, 52.5200, 4326),
  -- München
  st_point(11.5667, 48.1333, 4326)    
) as dst;

select st_distance(
  -- Berlin
  st_point(13.4049, 52.5200, 4326)::geography,
  -- München
  st_point(11.5667, 48.1333, 4326)::geography    
) as dst;

select st_distance(
  -- Berlin
  st_transform(
    st_point(13.4049, 52.5200, 4326), 
    31468
  ),
  -- München
  st_transform(
    st_point(11.5667, 48.1333, 4326), 
    31468
  )    
) as dst;

-- Berlin
select st_point(13.4049, 52.5200, 4326)
select st_transform(st_point(13.4049, 52.5200, 4326), 31468)
-- München
select st_point(11.5667 48.1333, 4326)  
select st_transform(st_point(11.5667, 48.1333, 4326), 31468)

-- Zentrum Deutschland
select st_transform(st_point(4391723.01, 5672810.04, 31468), 4326);

----------------------------------------------------------------------------------------------------
-- pfaueninsel
----------------------------------------------------------------------------------------------------
with 
  pi as (
    select * 
    from gis_osm_places_a_free_1 
    where name = 'Pfaueninsel'
  )
select b.geometry
from gis_osm_buildings_a_free_1 b join pi on st_contains(pi.geometry, b.geometry)
union all
select  pi.geometry from pi;

with 
  pi as (
    select * 
    from gis_osm_places_a_free_1 
    where name = 'Pfaueninsel'
  )
select st_area(b.geometry::geography)
from gis_osm_buildings_a_free_1 b join pi on st_contains(pi.geometry, b.geometry)
union all
select  st_area(pi.geometry::geography) from pi;

with 
  pi as (
    select * 
    from gis_osm_places_a_free_1 
    where name = 'Pfaueninsel'
  )
select st_area(st_transform(b.geometry, 31468))
from gis_osm_buildings_a_free_1 b join pi on st_contains(pi.geometry, b.geometry)
union all
select  st_area(st_transform(pi.geometry, 31468)) from pi;

with 
  pi as (
    select geometry
    from gis_osm_places_a_free_1 
    where name = 'Pfaueninsel'
  ),
  d as (
    select
      round(min(st_area(pi.geometry::geography))) as flaeche_insel,
      round(sum(st_area(b.geometry::geography))) as flaeche_gebaeude
    from gis_osm_buildings_a_free_1 b join pi on st_contains(pi.geometry, b.geometry)
  )
select *, d.flaeche_insel-d.flaeche_gebaeude as diff from d;


----------------------------------------------------------------------------------------------------
-- index
----------------------------------------------------------------------------------------------------
create index idx_bln_edges_geometry on ugeobln.bln_edges using gist (geometry);
drop index idx_bln_edges_geometry;

create index idx_bln_bezirk_museum on ugeobln.bln_bezirk_museum_shape using gist (shape);
drop index idx_bln_bezirk_museum_shape;



select * from bln_edges limit 10;
select count(*) from bln_edges;
select * from gis_osm_buildings_a_free_1 limit 10;

-- mit  index: 83846, < 0.170sec
-- ohne index: 83846, > 5sec
select count(*)
from bln_edges be 
     join bln_bezirk_museum bm on st_intersects(be.geometry, bm.shape)
where bm.name='Pankow';

select * from bezirk where name='Pankow';

-- mit  index: 181201, < 0.055sec
-- ohne index: 181201, > 1.490sec
select count(*)
from bln_edges be 
     join bln_bezirk_museum bm on be.geometry && bm.shape
where bm.name='Pankow';	 
	 
	 
