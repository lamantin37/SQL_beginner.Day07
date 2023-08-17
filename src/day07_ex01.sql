SELECT p.name name, count(pv.id) count_of_visits 
FROM person_visits pv
JOIN person p on p.id = pv.person_id 
GROUP BY p.name
ORDER BY count_of_visits DESC, name ASC
LIMIT 4;
