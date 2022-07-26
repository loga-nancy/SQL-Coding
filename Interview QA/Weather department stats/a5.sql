WITH CTE AS 
(
SELECT 
STATE_ID ,AVG(TEMPERATURE) AS TEMP,AVG(HUMIDITY) AS HUMID FROM 
STATE_WEATHER_STATS
WHERE RECORD_DATE LIKE '%2018-11%'
GROUP BY STATE_ID 
)
SELECT S.NAME , CN.NAME , TO_CHAR(HUMID,'99.9999')
, CASE WHEN TEMP >= 0 AND TEMP < 15 THEN 'COLD'
                              WHEN TEMP >= 15 AND TEMP < 30 THEN 'WARM'
                              WHEN TEMP >= 30  THEN 'HOT' END AS TEMPRATURE FROM CTE C
INNER JOIN STATE S ON C.STATE_ID = S.ID 
INNER JOIN COUNTRY CN ON S.COUNTRY_ID = CN.ID 
ORDER BY 3 DESC,1 asc;