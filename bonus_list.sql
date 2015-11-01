SELECT d.first_name,d.last_name,
SUM(return_date-departure_date) as Days
FROM driver d JOIN trip t ON (d.employee_no= t.employee_no)
WHERE ( (extract (month from t.departure_date))>0 AND (extract (month from t.departure_date))<7 ) 
OR  ( (extract (month from t.departure_date))>6 AND (extract (month from t.departure_date))<13 )
HAVING SUM(return_date-departure_date) >100 
GROUP BY (d.first_name,d.last_name);
