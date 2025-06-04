select *, st_centroid(geometry) as center
from gis_osm_pois_a_free_1 
where osm_id ='41361350';

select *
from gis_osm_pois_a_free_1 
where osm_id ='41361350';

select ST_MakeEnvelope(13.518118858337404,52.45335495170562,13.532881736755371,52.45929126340994, 4326)

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
