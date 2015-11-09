accept my_departure char prompt 'Enter starting month number : '
accept my_return char prompt 'Enter last month number : '
SELECT *
FROM (
    SELECT cnt1.company_name,COUNT(cnt1.company_name) AS Pickups
    FROM (SELECT COUNT(*) as total, c.company_name
        FROM manifest m LEFT JOIN customer c ON (m.pickup_customer_ref=c.reference) JOIN trip t ON (m.trip_id=t.trip_id)
		WHERE (EXTRACT(month FROM t.departure_date) BETWEEN '&my_departure' AND '&my_return' ) 
        GROUP BY m.trip_id,c.company_name) cnt1
    GROUP BY cnt1.company_name
    ORDER BY COUNT(cnt1.company_name) DESC
)
WHERE rownum<=10
ORDER BY rownum
;