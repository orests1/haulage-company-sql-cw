--In any six months, gets drivers who spend more than 100 days away.
SELECT d.first_name,d.last_name,
--summarises all durations of all trips for each driver
SUM(return_date-departure_date) as Days
FROM driver d JOIN trip t ON (d.employee_no= t.employee_no)
WHERE ( t.departure_date <= ADD_MONTHS(t.departure_date,6) )
--check if a driver's total time is eligible for a bonus (more than 100) 
HAVING SUM(return_date-departure_date) >100 
GROUP BY (d.first_name,d.last_name);
