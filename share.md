# DmDb



# DbTech



# Dataman



# ADBKT

## 06.11.23
```
MATCH
  (ha:Haltestelle)<-[aa:ProjAbA]-(a:Abschnitt)-[ab:ProjAbB]->(hb:Haltestelle),
  (a)-[iul:InUL]->(ul:Unterlinie)-[il:InL]->(l:Linie)
WITH 
  l.bez as bez, 
  ul.ulid AS ulid, 
  a.nr AS nr, 
  '+' + ha.bez as bez_a, 
  a.haelt + hb.bez as bez_b
ORDER BY bez, ulid, nr
WITH bez as Linie, ulid as Unterlinie, head(collect(bez_a)) + collect(bez_b) AS Verlauf
return Linie, Unterlinie, Verlauf;
```
## 16.10.23

5
```
sql = """

with 

  w as (

    select 

      cast(date_part('year',sales_month) as integer) as sales_year,

      sum(sales) as wsales

    from retail_sales

    where kind_of_business = 'Women''s clothing stores'

    group by 1

  ),

  m as (

    select 

      cast(date_part('year',sales_month) as integer) as sales_year,

      sum(sales) as msales

    from retail_sales

    where kind_of_business = 'Men''s clothing stores'

    group by 1

  )

select sales_year, wsales - msales as sales_diff_womens_minus_mens

from w join m using(sales_year)

order by 1

"""

with engine.connect() as con:

    df = pd.read_sql_query(text(sql), con)

# df


df.set_index('sales_year').plot.bar(
    figsize=(10,6),
    ylabel="sales, Dollar (million)"
)
```


6
```
sql = """

with 

  rs1 as (

    select 

      cast(date_part('year',sales_month) as integer) as sales_year,

      kind_of_business,

      sum(sales) as yksales

    from retail_sales

    group by 1, 2

  ),

  rs2 as (

    select

      sales_year, 

      kind_of_business,

      yksales * 100 / sum(yksales) over (partition by sales_year) as percent

    from rs1

  )

select sales_year, kind_of_business, percent

from rs2

where kind_of_business in ('Men''s clothing stores','Women''s clothing stores')

"""


# Visualization

df.pivot(index='sales_year', columns='kind_of_business', values='percent').plot.bar(

    figsize=(10,6),

    ylabel="percent"

)
```

