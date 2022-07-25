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


select c.name,m.name,SUM(m.price*s.quantity) as revenue from motorcycle_model m 
JOIN
sales s on m.id=s.model_id 
JOIN
COUNTRY C on c.id=s.country_id where s.sales_date like '%2018%'
group by c.name,m.name order by 3 desc, 1 asc;






    

exit;