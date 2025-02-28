select * from wwww order by yyyy, mm;

----------------------------------------------------------------------------------
-- Aggregation
----------------------------------------------------------------------------------
select 
  yyyy, 
  mm, 
  v1,
  sum(v1) over (partition by yyyy order by mm) as kumuliert,
  sum(v1) over (partition by yyyy) as jahr,
  sum(v1) over (order by yyyy, mm) as alles_kumuliert,
  sum(v1) over () as alles
from wwww
where yyyy in ('2020', '2021') and mm in ('01', '02', '03', '04')
order by yyyy, mm
;

select 
  yyyy, 
  mm, 
  v1,
  sum(v1) over (partition by yyyy) as jahr,
  round((cast(v1 as numeric) / sum(v1) over (partition by yyyy)) * 100, 2) as prozent
from wwww
where yyyy in ('2021')
order by yyyy, mm
;

select 
  yyyy, 
  mm, 
  v2,
  sum(v2) over (order by v2) as vv2
from wwww
where yyyy in ('2021')
order by v2
;

select 
  yyyy, 
  mm, 
  v1,
  v4,
  sum(v1) filter (where v4='b') over (partition by yyyy) as jahr_gefiltert
from wwww
-- where yyyy in ('2021')
order by yyyy, mm
;

select 
  yyyy, 
  mm, 
  v1,
  v4,
  sum(v1) filter (where v4='b') over (order by mm) as kumuliert_gefiltert
from wwww
where yyyy in ('2021')
order by yyyy, mm
;

----------------------------------------------------------------------------------
-- Rang
----------------------------------------------------------------------------------
select 
  yyyy, 
  mm, 
  v1,
  rank() over (order by v1 desc) as rang,
  dense_rank() over (order by v1 desc) as dichter_rang,
  percent_rank() over (order by v1 desc) as prozent_rang,
  row_number() over (order by v1 desc) as zeilennummer
from wwww
where yyyy in ('2021')
order by yyyy, mm
;

select 
  yyyy, 
  mm, 
  v1,
  rank() over (partition by yyyy order by v1 desc) as rang,
  dense_rank() over (partition by yyyy order by v1 desc) as dichter_rang,
  row_number() over (partition by yyyy order by v1 desc) as zeilennummer
from wwww
where yyyy in ('2020', '2021')
;


----------------------------------------------------------------------------------
-- Gleitende Durchschnitte
----------------------------------------------------------------------------------
select 
  yyyy, 
  mm, 
  v1,
  avg(v1) over (order by mm rows between 1 preceding and 1 following) as jahr
from wwww
where yyyy in ('2019')
order by yyyy, mm
;


----------------------------------------------------------------------------------
-- Positionierung
----------------------------------------------------------------------------------
select 
  mm, 
  v1,
  lag(mm) over (order by mm) as eins_vorher,
  lag(mm, 4) over (order by mm) as vier_vorher,
  first_value(mm) over (order by mm) as erster,
  last_value(mm) over (order by mm rows between unbounded preceding and unbounded following) as letzter,
  nth_value(mm, 3) over (order by mm rows between unbounded preceding and unbounded following) as dritter
from wwww
where yyyy in ('2021')
order by mm
;

select 
  mm, 
  v1,
  lag(v1) over (order by mm) as eins_vorher,
  lag(v1, 4) over (order by mm) as vier_vorher,
  first_value(v1) over (order by mm) as erster,
  last_value(v1) over (order by mm rows between unbounded preceding and unbounded following) as letzter,
  nth_value(v1, 3) over (order by mm rows between unbounded preceding and unbounded following) as dritter
from wwww
where yyyy in ('2021')
order by mm
;

select 
  yyyy, 
  mm, 
  lag(yyyy || '-' || mm) over (partition by mm order by yyyy, mm) as ein_jahr_vorher,
  lag(yyyy || '-' || mm, 2) over (partition by mm order by yyyy, mm) as zwei_jahre_vorher
from wwww
where mm in ('01', '02', '08')
order by yyyy, mm
;

----------------------------------------------------------------------------------
-- Verteilungen
----------------------------------------------------------------------------------
select 
  yyyy, 
  mm, 
  v3,
  row_number() over (order by v3) as nr,
  ntile(6) over (order by v3) as bucket,
  cume_dist() over (order by v3) as verteilung
from wwww
where yyyy in ('2020', '2021')
order by v3
;

select 
  yyyy, 
  mm, 
  v3,
  row_number() over (partition by yyyy order by v3) as nr,
  ntile(6) over (partition by yyyy order by v3) bucket,
  cume_dist() over (partition by yyyy order by v3) as verteilung
from wwww
where yyyy in ('2020', '2021')
order by yyyy, v3
;
