
-- str-10
SELECT aufgabe || 'a' as a
FROM t10;

-- str-20
SELECT substr(aufgabe, 2, 3) as a
FROM t10;

-- str-30
SELECT length(aufgabe) as l
FROM t10;

-- str-40
SELECT 
  to_char(substr(aufgabe, 9, 1), '000') 
    as n
FROM t10;
