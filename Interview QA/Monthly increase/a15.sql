SET NULL "NULL";
SET SERVEROUTPUT ON;
SET FEEDBACK OFF;
SET ECHO OFF;
SET HEADING OFF;
SET WRAP OFF;
SET LINESIZE 10000;
SET TAB OFF;
SET PAGES 0;
SET DEFINE OFF;
/*
 Enter your query below.
 Please append a semicolon ";" at the end of the query
 */
SELECT LTRIM(MNTH, '0'),
    TO_CHAR((S /(CS - S)) * 100, 'FM999.0')  --percentage as per previous cs
FROM (
        SELECT SUBSTR(RECORD_DATE, 6, 2) AS MNTH,
            SUM(CASES_COUNT) AS S,
            SUM(SUM(CASES_COUNT)) OVER (
                ORDER BY SUBSTR(RECORD_DATE, 6, 2) --previous values sum of current values by month
            ) AS CS
        FROM DAILY_CASES
        GROUP BY SUBSTR(RECORD_DATE, 6, 2)
    ) A
WHERE MNTH != 1;
exit;