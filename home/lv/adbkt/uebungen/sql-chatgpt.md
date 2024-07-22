---
layout: default1
nav: adbkt-uebungen
is_slide: 0
---

# SQL mit ChatGPT

- Versuchen sie Retail Sales und die rekursive Abfrage mit ChatGPT zu lösen
- Erstellen sie eine Präsentation, in der
  - sie angeben, welche Aufgaben ChatGPT direkt lösen konnte
  - sie beschreiben, welche zusätzlichen Prompts nötig waren, bei Aufgaben, die sich nicht direkt lösen ließen
  - angeben, welche Aufgaben sie nicht mit ChatGPT lösen konnten
- Einen OpenAI-Zugang für ChatGPT erhalten sie hier 
[(link)](https://chat.openai.com/auth/login)
- Verwenden sie die kostenfreie Version 3.5
- Sollten sie einen (kostenpflichtigen) Account für ChatGPT 4 haben, können sie natürlich auch den verwenden

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
