SELECT TIME_TABLE.TITLE
 	 , IFNULL(ORDERS.CNT,0) AS CNT
 FROM (SELECT '09-10' AS TITLE UNION 
 	   SELECT '10-11' AS TITLE UNION
 	   SELECT '11-12' AS TITLE UNION
 	   SELECT '12-13' AS TITLE UNION
 	   SELECT '13-14' AS TITLE UNION
 	   SELECT '14-15' AS TITLE UNION
 	   SELECT '15-16' AS TITLE UNION
 	   SELECT '16-17' AS TITLE UNION
 	   SELECT '17-18' AS TITLE UNION
 	   SELECT '18-19' AS TITLE UNION
 	   SELECT '19-20' AS TITLE UNION
 	   SELECT '20-21' AS TITLE UNION
 	   SELECT '21-22' AS TITLE ) TIME_TABLE
 LEFT OUTER JOIN (SELECT TITLE, COUNT(*) AS CNT
 				    FROM (SELECT (CASE WHEN HOUR(CREATE_DT) BETWEEN '09' AND '10'
									    THEN '09-10'
									    WHEN HOUR(CREATE_DT) BETWEEN '10' AND '11'
									    THEN '10-11'
									    WHEN HOUR(CREATE_DT) BETWEEN '11' AND '12'
									    THEN '11-12'
									    WHEN HOUR(CREATE_DT) BETWEEN '12' AND '13'
									    THEN '12-13'
									    WHEN HOUR(CREATE_DT) BETWEEN '13' AND '14'
									    THEN '13-14'
									    WHEN HOUR(CREATE_DT) BETWEEN '14' AND '15'
									    THEN '14-15'
									    WHEN HOUR(CREATE_DT) BETWEEN '15' AND '16'
									    THEN '15-16'
									    WHEN HOUR(CREATE_DT) BETWEEN '16' AND '17'
									    THEN '16-17'
									    WHEN HOUR(CREATE_DT) BETWEEN '17' AND '18'
									    THEN '17-18'
									    WHEN HOUR(CREATE_DT) BETWEEN '18' AND '19'
									    THEN '18-19'
									    WHEN HOUR(CREATE_DT) BETWEEN '19' AND '20'
									    THEN '19-20'
									    WHEN HOUR(CREATE_DT) BETWEEN '20' AND '21'
									    THEN '20-21'
									    WHEN HOUR(CREATE_DT) BETWEEN '21' AND '22'
									    THEN '21-22'
									    ELSE '' END ) AS TITLE
							 FROM ORDERS
							INNER JOIN ITEM
							   ON ORDERS.ORDER_IDX = ITEM.ORDER_IDX
							WHERE 1=1 
							  AND STORE='STORE-002'
							  AND DATE_SUB(NOW(), INTERVAL 1 MONTH) < CREATE_DT) ORDERS
				  GROUP BY ORDERS.TITLE) ORDERS
   ON TIME_TABLE.TITLE = ORDERS.TITLE
   
from orders ) orders )
select title, count(*) as count
from (select (
CASE WHEN HOUR(CREATE_DT) BETWEEN '09' AND '10'
    THEN '09-10'
    WHEN HOUR(CREATE_DT) BETWEEN '10' AND '11'
    THEN '10-11'
    WHEN HOUR(CREATE_DT) BETWEEN '11' AND '12'
    THEN '11-12'
    WHEN HOUR(CREATE_DT) BETWEEN '12' AND '13'
    THEN '12-13'
    WHEN HOUR(CREATE_DT) BETWEEN '13' AND '14'
    THEN '13-14'
    WHEN HOUR(CREATE_DT) BETWEEN '14' AND '15'
    THEN '14-15'
    WHEN HOUR(CREATE_DT) BETWEEN '15' AND '16'
    THEN '15-16'
    WHEN HOUR(CREATE_DT) BETWEEN '16' AND '17'
    THEN '16-17'
    WHEN HOUR(CREATE_DT) BETWEEN '17' AND '18'
    THEN '17-18'
    WHEN HOUR(CREATE_DT) BETWEEN '18' AND '19'
    THEN '18-19'
    WHEN HOUR(CREATE_DT) BETWEEN '19' AND '20'
    THEN '19-20'
    WHEN HOUR(CREATE_DT) BETWEEN '20' AND '21'
    THEN '20-21'
    WHEN HOUR(CREATE_DT) BETWEEN '21' AND '22'
    THEN '21-22'
    ELSE '' END ) AS TITLE
from orders ) orders
group by TITLE

SELECT TITLE, COUNT(*) AS CNT
 FROM (SELECT (CASE WHEN HOUR(CREATE_DT) BETWEEN '09' AND '10'
    THEN '09-10'
    WHEN HOUR(CREATE_DT) BETWEEN '10' AND '11'
    THEN '10-11'
    WHEN HOUR(CREATE_DT) BETWEEN '11' AND '12'
    THEN '11-12'
    WHEN HOUR(CREATE_DT) BETWEEN '12' AND '13'
    THEN '12-13'
    WHEN HOUR(CREATE_DT) BETWEEN '13' AND '14'
    THEN '13-14'
    WHEN HOUR(CREATE_DT) BETWEEN '14' AND '15'
    THEN '14-15'
    WHEN HOUR(CREATE_DT) BETWEEN '15' AND '16'
    THEN '15-16'
    WHEN HOUR(CREATE_DT) BETWEEN '16' AND '17'
    THEN '16-17'
    WHEN HOUR(CREATE_DT) BETWEEN '17' AND '18'
    THEN '17-18'
    WHEN HOUR(CREATE_DT) BETWEEN '18' AND '19'
    THEN '18-19'
    WHEN HOUR(CREATE_DT) BETWEEN '19' AND '20'
    THEN '19-20'
    WHEN HOUR(CREATE_DT) BETWEEN '20' AND '21'
    THEN '20-21'
    WHEN HOUR(CREATE_DT) BETWEEN '21' AND '22'
    THEN '21-22'
    ELSE '' END ) AS TITLE
 FROM ORDERS
INNER JOIN ITEM
   ON ORDERS.ORDER_IDX = ITEM.ORDER_IDX
    GROUP BY ORDERS.TITLE, ITEM.