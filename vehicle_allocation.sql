SELECT v.vehicle_type_id,v.registration
FROM vehicle v
MINUS
SELECT  pipa.vehicle_type_id,pipa.registration
FROM
(SELECT  malakia.departure_date, malakia.return_date,malakia.registration,malakia.vehicle_type_id
FROM
(SELECT t.departure_date,t.return_date,t.registration,v.vehicle_type_id,
SUM ( CASE WHEN ((TO_DATE('&Departure','dd/mm/yy') NOT BETWEEN t.departure_date AND t.return_date)
AND (TO_DATE('&Return','dd/mm/yy') NOT BETWEEN t.departure_date AND  t.return_date) )THEN 1 ELSE 0 END) skata
FROM trip t JOIN vehicle v ON (t.registration=v.registration)
GROUP BY t.departure_date,t.return_date,t.registration,v.vehicle_type_id
ORDER BY skata ASC)malakia
WHERE skata=0
GROUP BY malakia.departure_date, malakia.return_date,malakia.registration,malakia.vehicle_type_id)pipa
GROUP BY pipa.registration,pipa.vehicle_type_id
;