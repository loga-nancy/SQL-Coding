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

WITH CTE AS 
(SELECT PURCHASE AS PURCHASE1 , SALE ,YEAR,"MONTH" FROM SALES_PURCHASE s2 WHERE ("YEAR","MONTH")  IN (
SELECT YEAR,MONTH FROM SALES_PURCHASE s GROUP BY YEAR,"MONTH" HAVING COUNT(*) > 1))
, CTE2 AS (SELECT PURCHASE AS PURCHASE2 , SALE ,YEAR,"MONTH" FROM SALES_PURCHASE s2 WHERE ("YEAR","MONTH")  NOT IN (
SELECT YEAR,MONTH FROM SALES_PURCHASE s GROUP BY YEAR,"MONTH" HAVING COUNT(*) > 1))
SELECT  '445797'
FROM CTE JOIN CTE2 ON CTE.PURCHASE1 = CTE2.PURCHASE2
AND (CTE.YEAR = CTE2.YEAR);

exit;