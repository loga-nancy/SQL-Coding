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

WITH CTE
AS
(      
        SELECT
            DATE_MODIFIED,
            SUBSTR(FILE_NAME, INSTR(FILE_NAME, '.')+1) AS EXTENSION,
            COUNT(*) AS CNT
        FROM
            FILES
        GROUP BY
            DATE_MODIFIED,
            SUBSTR(FILE_NAME, INSTR(FILE_NAME, '.')+1)
       ) 
       SELECT  DATE_MODIFIED,
    LISTAGG(SUBSTR(EXTENSION, INSTR(EXTENSION, '.')+1), ',') WITHIN GROUP(
        ORDER BY
            EXTENSION DESC 
    ) as CNT1,
    MAX(CNT) FROM CTE where (DATE_MODIFIED,cnt)IN
    (
           select DATE_MODIFIED,max(cnt) from CTE GROUP BY DATE_MODIFIED
           )GROUP BY DATE_MODIFIED ORDER BY 1;
            
        
   
 group by date,xetension
date extenstion count(*)
1     py          2
1      pptx       2

date  listagg(ext)  max(cnt)with respect to count(*),date
1     py,pptx         2






exit;