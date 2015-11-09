SELECT first_name,last_name, Days
FROM 
--Table that finds the name, the latest date that the driver worked and the sum of the days he worked
(SELECT d.first_name,d.last_name,
SUM(return_date-departure_date) as Days
FROM driver d 
JOIN trip t ON (d.employee_no= t.employee_no)
JOIN
-- Table that finds the last date of work of each employee 
(SELECT MAX(EXTRACT(month FROM return_date)) as max_date,t.employee_no
FROM driver d JOIN trip t ON (d.employee_no= t.employee_no)
GROUP BY(t.employee_no)
)k ON (d.employee_no = k.employee_no)
-- This is checking that the departure day is in the 6 month period with endind date the last day he worked
WHERE (k.max_date- (EXTRACT(month FROM return_date)) <=6 )
HAVING SUM(return_date-departure_date) >100
GROUP BY (d.first_name,d.last_name)
);