accept my_departure char prompt 'Enter value for departure date: '
accept my_return char prompt 'Enter value for return date: '
SELECT v.vehicle_type_id,v.registration
FROM vehicle v
MINUS
SELECT  pipa.vehicle_type_id,pipa.registration
FROM
(SELECT  malakia.departure_date, malakia.return_date,malakia.registration,malakia.vehicle_type_id
FROM
(SELECT t.departure_date,t.return_date,t.registration,v.vehicle_type_id,
SUM ( CASE WHEN (( t.departure_date  BETWEEN TO_DATE('&my_departure','dd/mm/yy') AND TO_DATE('&my_return','dd/mm/yy') )
OR 
(t.return_date BETWEEN TO_DATE('&my_departure','dd/mm/yy') AND TO_DATE('&my_return','dd/mm/yy'))
)
 THEN 1 ELSE 0 END) skata
FROM trip t JOIN vehicle v ON (t.registration=v.registration)
GROUP BY t.departure_date,t.return_date,t.registration,v.vehicle_type_id
ORDER BY skata ASC)malakia
WHERE skata>0
GROUP BY malakia.departure_date, malakia.return_date,malakia.registration,malakia.vehicle_type_id)pipa
GROUP BY pipa.registration,pipa.vehicle_type_id
;