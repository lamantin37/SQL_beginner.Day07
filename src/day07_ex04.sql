SELECT p.name person_name, COUNT(*) number_of_visits
FROM person p
JOIN person_visits pv ON p.id = pv.person_id
GROUP BY p.id, p.name
HAVING COUNT(*) > 3;
