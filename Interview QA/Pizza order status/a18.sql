/*
 Enter your query below.
 Please append a semicolon ";" at the end of the query
 */
SELECT
    CUSTOMER_NAME,
CASE
        WHEN SUM(STATUS = 'DELIVERED') = COUNT(*) THEN 'COMPLETED'
        WHEN SUM(STATUS = 'DELIVERED') > 0 THEN 'IN PROGRESS'
        WHEN SUM(STATUS = 'SUBMITTED') > 0 THEN 'AWAITING PROGRESS'
        ELSE 'AWAITING SUBMISSION'
    END AS FINAL_STATUS
FROM
    CUSTOMER_ORDER
GROUP BY
    CUSTOMER_NAME
ORDER BY
    CUSTOMER_NAME;