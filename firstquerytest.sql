select count(*) from (SELECT c.company_name, count(*)
FROM manifest m LEFT JOIN customer c ON (m.pickup_customer_ref=c.reference)
GROUP BY c.company_name
having count(*)>1 AND c.reference = m.pickup_customer_ref
ORDER BY c.company_name) as blah
;