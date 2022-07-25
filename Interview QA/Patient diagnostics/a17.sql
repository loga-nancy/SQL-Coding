SET NULL "NULL";
SET FEEDBACK OFF;
SET ECHO OFF;
SET HEADING OFF;
SET WRAP OFF;
SET LINESIZE 10000;
SET TAB OFF;
SET PAGES 0;
SET DEFINE OFF;
SET SERVEROUTPUT ON;

/*
Enter your query below.
Please append a semicolon ";" at the end of the query
*/

SELECT
    *
FROM
    (
        SELECT
            CASE
                WHEN AGE >= 18
                AND AGE <= 45 THEN '18-45'
                WHEN AGE >= 46
                AND AGE <= 60 THEN '46-60'
                WHEN AGE >= 61 THEN '61+'
            END AS AGE_GROUP,
CASE
                WHEN SCORE = 1 THEN 'NEGATIVE'
                WHEN SCORE >= 1
                AND SCORE <= 4 THEN 'MILD'
                WHEN SCORE = 5 THEN 'MODERATE'
                WHEN SCORE >= 6 THEN 'SEVERE'
            END AS STATUS
        FROM
            CTSCORE
    ) A PIVOT(
        COUNT(STATUS) FOR STATUS IN ('NEGATIVE', 'MILD', 'MODERATE', 'SEVERE')
    );
exit;