SELECT *
FROM (
    SELECT cnt1.company_name,COUNT(cnt1.company_name)
    FROM (SELECT COUNT(*) as total, c.company_name
        FROM manifest m LEFT JOIN customer c ON (m.pickup_customer_ref=c.reference)
        GROUP BY m.trip_id,c.company_name) cnt1
    GROUP BY cnt1.company_name
    ORDER BY COUNT(cnt1.company_name) DESC
)
WHERE rownum<=10
ORDER BY rownum
;