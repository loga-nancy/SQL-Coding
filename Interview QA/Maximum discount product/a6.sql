SELECT CATEGORY,MIN(PRODUCT_ID),MAX(DISCOUNT) FROM (
SELECT CATEGORY,PRODUCT_ID,DISCOUNT FROM PRODUCT WHERE
(
    CATEGORY,DISCOUNT
)
IN(
SELECT Category,max(discount) from product group by category)) A Group by category ORDER BY 1;