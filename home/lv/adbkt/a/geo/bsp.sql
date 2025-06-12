Attribute and License: http://postgis.net/workshops/postgis-intro

select *
from gis_osm_pois_a_free_1 
where osm_id ='41361350';

select *, st_centroid(geometry) as center
from gis_osm_pois_a_free_1 
where osm_id ='41361350';

select ST_MakeEnvelope(13.518118858337404,52.45335495170562,13.532881736755371,52.45929126340994, 4326)
select ST_MakeEnvelope(13.523375988006594,52.457251563734225,13.532248735427858,52.46021955697443, 4326)


select null, null, null, null,
  ST_MakeEnvelope(13.518118858337404,52.45335495170562,13.532881736755371,52.45929126340994, 4326)
union all
select *
from gis_osm_pois_a_free_1 
where st_intersects(
  ST_MakeEnvelope(13.518118858337404,52.45335495170562,13.532881736755371,52.45929126340994, 4326),
  geometry);
  
select name, shape 
from bezirk; 

select name, shape
from bezirk
union all
select 'bb' as name, ST_Extent(shape) as shape
from bezirk;


select bez, pos
from haltestelle;

select ST_Transform((st_dump(ST_VoronoiPolygons(st_collect(h.posp)))).geom, 4326) as shape
from haltestelle h
union all
select pos from haltestelle;



select pos from haltestelle
union all
select ST_Transform((st_dump(ST_VoronoiPolygons(st_collect(h.posp)))).geom, 4326) as shape
from haltestelle h;


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

select floor(st_distance(
  -- Berlin
  st_point(13.4049, 52.5200, 4326)::geography,
  -- München
  st_point(11.5667, 48.1333, 4326)::geography    
)) / 1000 as dst;

select floor(st_distance(
  -- Berlin
  st_transform(st_point(13.4049, 52.5200, 4326), 31468),
  -- München
  st_transform(st_point(11.5667, 48.1333, 4326), 31468)    
)) / 1000 as dst;

-- Berlin
select st_point(13.4049, 52.5200, 4326)
select st_transform(st_point(13.4049, 52.5200, 4326), 31468)
-- München
select st_point(11.5667 48.1333, 4326)  
select st_transform(st_point(11.5667, 48.1333, 4326), 31468)

-- Zentrum Deutschland
select st_transform(st_point(4391723.01, 5672810.04, 31468), 4326);


----------------------------------------------------------------------------------------------------
-- index
----------------------------------------------------------------------------------------------------
select ST_MakeEnvelope(13.5233,52.4572,13.5322,52.4602, 4326);
select st_point(13.5270, 52.4585, 4326);

select * from bln_edges limit 10;
select * from gis_osm_buildings_a_free_1 limit 10;

select * 
from bln_edges be
where 
  st_intersects(be.geometry, ST_MakeEnvelope(13.5233,52.4572,13.5322,52.4602, 4326))
  and not name is null;



select * 
from bln_edges be
where 
  st_intersects(be.geometry, st_buffer(ST_MakeEnvelope(13.5233,52.4572,13.5322,52.4602, 4326), 0.001)) 
  and not name is null;


select * 
from gis_osm_buildings_a_free_1 b
where 
  st_intersects(b.geometry, ST_MakeEnvelope(13.5233,52.4572,13.5322,52.4602, 4326));
  
select * 
from gis_osm_buildings_a_free_1 b
order by b.geometry <-> st_point(13.5270, 52.4585, 4326)
limit 300;

select * 
from gis_osm_water_a_free_1 b
order by b.geometry <-> st_point(13.5270, 52.4585, 4326)
limit 500;

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
      round(min(st_area(pi.geometry::geography))) as api,
      round(sum(st_area(b.geometry::geography))) as ab
    from gis_osm_buildings_a_free_1 b join pi on st_contains(pi.geometry, b.geometry)
  )
select *, d.api-d.ab as diff from d;

