/**1. Welche Nutzer haben eine Tankkarte als gültige Zahlart hinterlegt? Geben Sie die NUTZER_ID und den EMITTENTEN aus!**/

SELECT N.NUTZER_ID,
  Z.EMMITENT
FROM NUTZER N
JOIN ZAHLART Z
ON N.NUTZER_ID = Z.NUTZER_ID
JOIN ZAHLTYP z_typ
ON Z.ZTYP_ID       = Z_TYP.ZTYP_ID
AND Z.ZTYP_ID      = 3     -- 3 is gleich Tankarte
AND Z.GUELTIG_BIS IS NULL; -- gültig bis Datum muss leer sein
;

/**2. Wie viele aktive Fahrzeuge hat der Nutzer mit dem Namen Czeslaw Baltronowicz registriert. Geben Sie die NUTZER_ID, VORNAME, NACHNAME und die Anzahl der Fahrzeuge aus**/

SELECT N.NUTZER_ID,
  N.VORNAME,
  N.NACHNAME ,
  COUNT(DISTINCT F.KENNZEICHEN ) AS ANZAHL_FAHRZEUGE
FROM FAHRZEUG F
JOIN NUTZER N
ON F.NUTZER_ID        = N.NUTZER_ID
AND N.STATUS          = 'active'
AND F.ABMELDEDATUM   IS NULL
AND UPPER(N.VORNAME)  = 'CZESLAW' -- upper um Fehler in Gross- und Kleinschreibung zu umgehen
AND UPPER(N.NACHNAME) = 'BALTRONOWICZ'
GROUP BY N.NUTZER_ID,
  N.VORNAME,
  N.NACHNAME;
  
  /**3.Wie viele aktive ausländische Fahrzeuge haben ein Fahrzeuggerät verbaut? Ordnen Sie das Ergebnis nach Anzahl der Fahrzeuggeräte absteigend und Nach Zuslassungsland alphabetisch aufsteigend **/
  
SELECT FZ.ZULASSUNGSLAND,
  COUNT(FZG.FZ_ID) AS ANZAHL_FAHRZEUGGERAET
FROM NUTZER N
JOIN FAHRZEUG FZ
ON N.NUTZER_ID = FZ.NUTZER_ID
JOIN FAHRZEUGGERAT FZG
ON FZ.FZ_ID = FZG.FZ_ID
AND FZ.ZULASSUNGSLAND NOT LIKE 'Deutschland'
AND FZ.ABMELDEDATUM IS NULL
AND FZG.STATUS       = 'active'
GROUP BY FZ.ZULASSUNGSLAND
ORDER BY COUNT(FZG.FZ_ID) DESC ,
  FZ.ZULASSUNGSLAND ASC;
  
  
  /**4.Wie viele Deutsche Fahrzeuge wurden im 4.Quartal 2012 angemeldet und haben zulässiges Gesamtgewicht von mindestens 12 Tonnen? Geben Sie das Kennzeichen und auch den dazugehörigen Nutzernamen aus!**/
  
SELECT F.KENNZEICHEN,
  F.NUTZER_ID
FROM Fahrzeug f
WHERE TO_CHAR(F.ANMELDEDATUM,'YYYYQ') = '20124'
AND F.ZULASSUNGSLAND                  = 'Deutschland'
AND F.GEWICHT                        >= 12000;
 
  
  /**5.Welche Mautschadstoffklasse wurde am häufigsten in die Mauterhebung durch ein Fahrzeuggerät verbucht? Geben Sie die Anzahl der Mauterhebungen, die  MAUTSCHADSTOFFKLASSE und die BESCHREIBUNG an!**/
  
SELECT ANZAHL AS ANZAHL,
  MAUTSCHADSTOFFKLASSE,
  BESCHREIBUNG
FROM
  (SELECT COUNT(F.SSKL_ID) AS ANZAHL,
    SSKL.MAUTSCHADSTOFFKLASSE,
    SSKL.BESCHREIBUNG
  FROM FAHRZEUG F
  JOIN FAHRZEUGGERAT FZG
  ON F.FZ_ID = FZG.FZ_ID
  JOIN MAUTERHEBUNG MH
  ON FZG.FZG_ID = MH.FZG_ID
  JOIN SCHADSTOFFKLASSE SSKL
  ON F.SSKL_ID = SSKL.SSKL_ID
  GROUP BY SSKL.MAUTSCHADSTOFFKLASSE,
    SSKL.BESCHREIBUNG
  ORDER BY COUNT(F.SSKL_ID) DESC
  )
WHERE rownum = 1;


oder aber auch :


SELECT COUNT(F.SSKL_ID) AS ANZAHL,
  SSKL.MAUTSCHADSTOFFKLASSE,
  SSKL.BESCHREIBUNG
FROM FAHRZEUG F
JOIN FAHRZEUGGERAT FZG
ON F.FZ_ID = FZG.FZ_ID
JOIN MAUTERHEBUNG MH
ON FZG.FZG_ID = MH.FZG_ID
JOIN SCHADSTOFFKLASSE SSKL
ON F.SSKL_ID = SSKL.SSKL_ID
GROUP BY SSKL.MAUTSCHADSTOFFKLASSE,
  SSKL.BESCHREIBUNG
HAVING (COUNT(F.SSKL_ID)) =
  (SELECT MAX(COUNT(F.SSKL_ID)) AS ANZAHL
  FROM FAHRZEUG F
  JOIN FAHRZEUGGERAT FZG
  ON F.FZ_ID = FZG.FZ_ID
  JOIN MAUTERHEBUNG MH
  ON FZG.FZG_ID = MH.FZG_ID
  JOIN SCHADSTOFFKLASSE SSKL
  ON F.SSKL_ID = SSKL.SSKL_ID
  GROUP BY SSKL.MAUTSCHADSTOFFKLASSE,
    SSKL.BESCHREIBUNG
  );


  /**6. Wie hoch ist der Durchschnitt aller stornierten Buchungen gegenüber aller abgeschlossenen Buchungen aus dem manuellen Erhebungsverfahren. Geben Sie den Durchschnitt gerundet auf vier Nachkommastellen an, sowie die Anzahl aller stornierten und abgeschlossenen Buchungen!**/
 
SELECT ROUND(AVG(STORNIERT),4 ) ANTEIL_STORNIERT,
  COUNT(B_ID) AS ANZAHL_STRONIERT_ABGESCHLOSSEN
FROM
  (SELECT B.B_ID,
    CASE
      WHEN B.B_ID = 2
      THEN 1
      ELSE 0
    END STORNIERT ,
    CASE
      WHEN B.B_ID = 3
      THEN 1
      ELSE 0
    END ABGESCHLOSSEN
  FROM BUCHUNG B 
  where B_ID IN (2,3)
  );    
  
  
  /**7.Welche Rechnungen beziehen sich auf mehr als eine Streckenbefahrung (Mauterhebung). Geben Sie die Rechnungsnummer, den Mautabschnittsnamen, den Nutzernamen, das Kennzeichen und die Kosten für die Befahrung des Mautabschnitts an!**/
  
 SELECT R.R_ID,
  MS.NAME ,
  N.VORNAME,
  N.NACHNAME,
  F.KENNZEICHEN,
  MH.KOSTEN
FROM RECHNUNG R
JOIN POSITION P
ON R.R_ID = P.R_ID
JOIN MAUTERHEBUNG mh
ON P.MAUT_ID = MH.MAUT_ID
JOIN MAUTABSCHNITT ms
ON MH.ABSCHNITTS_ID = MS.ABSCHNITTS_ID
JOIN Nutzer n
ON R.NUTZER_ID = N.NUTZER_ID
JOIN FAHRZEUGGERAT FZG ON MH.FZG_ID = FZG.FZG_ID JOIN FAHRZEUG F ON F.FZ_ID = FZG.FZ_ID
AND R.R_ID    IN
  (SELECT P.R_ID AS Rechnungsnummer
  FROM Position p
  GROUP BY P.R_ID
  HAVING COUNT(P.MAUT_ID) >=2
  );
  
  
  
  /**8.Ermitteln Sie die TOP 5 inländischen Nutzer mit den höchsten Mautumsätzen aus dem manuellen (Buchungen) und automatischen Verfahren (Mauterhebung). Geben sie die Nutzernummer und die Summe der Mautumsätze absteigend sortiert an!**/

SELECT *
FROM
  (SELECT nutzer_id,
    SUM(Mautumsatz) AS Mautumsatz
  FROM
    (SELECT FZ.NUTZER_ID,
      SUM(MH.KOSTEN) AS Mautumsatz
    FROM Fahrzeug fz
    JOIN nutzer n
    ON FZ.NUTZER_ID = N.NUTZER_ID
    JOIN fahrzeuggerat fzg
    ON FZ.FZ_ID = FZG.FZ_ID
    JOIN Mauterhebung mh
    ON FZG.FZG_ID = MH.FZG_ID
    AND N.LAND    = 'Deutschland'
    GROUP BY FZ.NUTZER_ID
    UNION ALL
    SELECT FZ.NUTZER_ID,
      SUM(B.KOSTEN) AS MAUTUMSATZ
    FROM FAHRZEUG FZ
    JOIN BUCHUNG B
    ON FZ.KENNZEICHEN = B.KENNZEICHEN
    AND B.B_ID        = 3
    GROUP BY FZ.NUTZER_ID
    )
  GROUP BY NUTZER_ID
  ORDER BY MAUTUMSATZ DESC
  )
WHERE rownum <= 5;
  
  /**9. Welche der registrierten aktiven Fahrzeug haben die Mautkategorie_ID 26. Geben Sie das Kennzeichen und die Achsanzahl der Fahrzeuge aus!**/
  
SELECT FZ.KENNZEICHEN,
  FZ.ACHSEN
FROM FAHRZEUG FZ
JOIN SCHADSTOFFKLASSE SSKL
ON FZ.SSKL_ID = SSKL.SSKL_ID
JOIN MAUTKATEGORIE K
ON SSKL.SSKL_ID      = K.SSKL_ID
AND K.KATEGORIE_ID   = 26
AND FZ.ABMELDEDATUM IS NULL
AND k.achszahl       =
  CASE
    WHEN fz.achsen = 2 THEN '= 2'
    WHEN fz.achsen = 3 THEN '= 3'
    WHEN fz.achsen = 4 THEN '= 4'
    ELSE'>= 5'
  END;
  
  
  /**10. Wie hoch wäre die Maut für eine Abschnittbefahrung des Fahrzeug mit dem amtlichen Kennzeichen D 9765 auf dem Mautabschnitt mit der ID 1433. Geben Sie das Kennzeichen, die Länge des Abschnitt und die Höhe der Maut in Euro auf zwei Nachkommastellen gerundet an. **/



SELECT FZ.KENNZEICHEN,
  (SELECT LAENGE
  FROM MAUTABSCHNITT
  WHERE ABSCHNITTS_ID = 1433
  ) AS LAENGE_IN_METER,
  ROUND(( ((
  (SELECT LAENGE FROM MAUTABSCHNITT WHERE ABSCHNITTS_ID = 1433
  ) /1000)* MAUTSATZ_JE_KM  )/100),2) Maut_IN_EURO
FROM FAHRZEUG FZ
JOIN SCHADSTOFFKLASSE SSKL
ON FZ.SSKL_ID = SSKL.SSKL_ID
JOIN MAUTKATEGORIE K
ON SSKL.SSKL_ID    = K.SSKL_ID
AND FZ.KENNZEICHEN = 'D 9765'
AND k.achszahl     =
  CASE
    WHEN fz.achsen = 2 THEN '= 2'
    WHEN fz.achsen = 3 THEN '= 3'
    WHEN fz.achsen = 4 THEN '= 4'
    ELSE'>= 5'
  END;

  
  