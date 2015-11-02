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
SELECT  unvailability.vehicle_type_id,unvailability.registration
FROM
-- That's the 'unvailability' table that shows the vehicles that are beeing used between those dates
(SELECT  marked.departure_date, marked.return_date,marked.registration,marked.vehicle_type_id
	FROM
	-- That is the 'marked' table that is marking with 1 the vehicles that are unavailable for the chosen dates
	-- and 0 the free ones
	(SELECT t.departure_date,t.return_date,t.registration,v.vehicle_type_id,
		SUM 
		( CASE WHEN 
			(
				-- If a departure date from a trip is between our dates then the vehicle from that trip is unavailable
				( t.departure_date  BETWEEN TO_DATE('&my_departure','dd/mm/yy') AND TO_DATE('&my_return','dd/mm/yy'))
				OR 
				-- OR If a return date from a trip is between our dates then the vehicle from that trip is unavailable
				(t.return_date BETWEEN TO_DATE('&my_departure','dd/mm/yy') AND TO_DATE('&my_return','dd/mm/yy'))
			)
			-- 1 if vehicle is beeing used on our dates , 0 if not.
			THEN 1 ELSE 0 END
		) used
		FROM trip t JOIN vehicle v ON (t.registration=v.registration)
		GROUP BY t.departure_date,t.return_date,t.registration,v.vehicle_type_id
		)marked
		-- Choosing to see only the unavailable ones
		WHERE used>0
	GROUP BY marked.departure_date, marked.return_date,marked.registration,marked.vehicle_type_id)unvailability
GROUP BY unvailability.registration,unvailability.vehicle_type_id
;