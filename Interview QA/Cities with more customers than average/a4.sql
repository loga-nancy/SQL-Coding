SELECT
    CO.COUNTRY_NAME,
    CI.CITY_NAME,
    COUNT(CUSTOMER_NAME)
FROM
    COUNTRY CO
    INNER JOIN CITY CI ON CO.ID = CI.COUNTRY_ID
    INNER JOIN CUSTOMER CU ON CI.ID = CU.CITY_ID
GROUP BY
    CO.COUNTRY_NAME,
    CI.CITY_NAME
HAVING
    COUNT(CUSTOMER_NAME) > (
        SELECT
            AVG(TEMP.CNT)
        FROM
            (
                SELECT
                    C.ID,
                    COUNT(CUSTOMER_NAME) as CNT
                from
                    CITY C
                    INNER JOIN CUSTOMER CU ON C.ID = CU.CITY_ID
                GROUP BY
                    C.ID
            ) TEMP
    )
ORDER BY
    1 ASC;