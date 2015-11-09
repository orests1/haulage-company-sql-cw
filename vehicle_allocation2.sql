--We want the user to enter the departure and return date only once
accept my_departure char prompt 'Enter value for departure date  (dd/mm/yy): '
accept my_return char prompt 'Enter value for return date  (dd/mm/yy): '
-- That's the whole vehicle table
SELECT v.vehicle_type_id,v.registration
FROM vehicle v
-- The idea is to subtract the vehicles that are unvailable  from the whole vehicle table and 
--therefore we will only show the available ones.
MINUS
-- That's the table of that shows only the unavailable vehicles marked with 1
SELECT  unvailable_tbl.vehicle_type_id,unvailable_tbl.registration
FROM
-- That's the 'unavailable_tbl' table that marks the unavailable vehicles with 1
(SELECT  malakia.departure_date, malakia.return_date,malakia.registration,malakia.vehicle_type_id
	FROM
	--
	(SELECT t.departure_date,t.return_date,t.registration,v.vehicle_type_id,
		SUM ( CASE WHEN (( t.departure_date  BETWEEN TO_DATE('&my_departure','dd/mm/yy') AND TO_DATE('&my_return','dd/mm/yy') )
			OR 
			(t.return_date BETWEEN TO_DATE('&my_departure','dd/mm/yy') AND TO_DATE('&my_return','dd/mm/yy'))
		)
		THEN 1 ELSE 0 END) used
		FROM trip t JOIN vehicle v ON (t.registration=v.registration)
		GROUP BY t.departure_date,t.return_date,t.registration,v.vehicle_type_id
		ORDER BY skata ASC)malakia
		WHERE skata>0
	GROUP BY malakia.departure_date, malakia.return_date,malakia.registration,malakia.vehicle_type_id)unvailable_tbl
GROUP BY unvailable_tbl.registration,unvailable_tbl.vehicle_type_id
;