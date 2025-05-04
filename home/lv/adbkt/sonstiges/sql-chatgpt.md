---
layout: default1
nav: adbkt-sonstiges
is_slide: 0
---

# SQL mit ChatGPT

- Versuchen sie Retail Sales [(link)](/home/lv/adbkt/uebungen/retail.html) und die rekursive Abfrage [(link)](/home/lv/adbkt/uebungen/rec-sql.html) mit ChatGPT zu lösen
- Präsentieren sie ihr Ergebnisse
- Verwenden sie ChatKI [(link)](https://www.htw-berlin.de/lehre/lehre-gestalten/kuenstliche-intelligenz-ki-in-lehre-und-pruefungen-an-der-htw-berlin/chatki-chatgpt-an-der-htw-berlin/)
- Sollten sie einen (kostenpflichtigen) Account für ChatGPT haben, können sie natürlich auch den verwenden

## Tabelle `retail_sales`
  ```sql
  create table retail_sales (
    sales_month date,
    naics_code varchar,
    kind_of_business varchar,
    reason_for_null varchar,
    sales decimal
  );
  ```

## Tabelle `tree0`
  ```sql
  create table tree0 (
    id integer not null primary key,
    p integer,
    v integer
  );
  ```
