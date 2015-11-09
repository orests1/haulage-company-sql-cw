SELECT * 
FROM 
(
SELECT d.first_name,d.last_name, MIN(departure_date) as min_date , MAX(departure_date) as max_date,
SUM(return_date-departure_date) as Days
FROM driver d JOIN trip t ON (d.employee_no= t.employee_no)
HAVING SUM(return_date-departure_date) >100 
GROUP BY (d.first_name,d.last_name)
)
WHERE ( EXTRACT(month FROM max_date) - EXTRACT(month FROM min_date) )<= 5
;