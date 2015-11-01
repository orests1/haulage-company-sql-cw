SELECT d.employee_no,first_name,last_name,sum(return_date-departure_date) 
from driver d JOIN trip t ON (d.employee_no = t.employee_no)
group by (d.employee_no);

