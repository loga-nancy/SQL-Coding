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


 WITH CTE AS (
    SELECT
        CD.NAME,
        CD.PHONE_NUMBER,
        SUM(C.DURATION) AS DURATION
    FROM
        CUSTOMER_DETAIL cd
        INNER JOIN CALL_RECORD c ON CD.PHONE_NUMBER = C.INCOMING_NUMBER
    WHERE
        C.DIALED_ON LIKE '%2018-05%'
    GROUP BY
        CD.NAME,
        CD.PHONE_NUMBER
    UNION
    SELECT
        CD.NAME,
        CD.PHONE_NUMBER,
        SUM(
            CASE
                WHEN MOD(C.DURATION, 120) = C.DURATION THEN 500 
                ELSE ((C.DURATION -120) * 2) + 500
            END
        ) AS DURATION
    FROM
        CUSTOMER_DETAIL cd
        INNER JOIN CALL_RECORD c ON CD.PHONE_NUMBER = C.OUTGOING_NUMBER
    WHERE
        C.DIALED_ON LIKE '%2018-05%'
    GROUP BY
        CD.NAME,
        CD.PHONE_NUMBER
)
SELECT
    NAME,
    PHONE_NUMBER,
    SUM(DURATION)
FROM
    CTE
    GROUP BY NAME,PHONE_NUMBER; 
       

 
        

       
        

    
   
    
exit;