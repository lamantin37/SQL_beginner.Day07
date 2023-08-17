SELECT p.name, SUM(r.total_count) total_count
FROM (
    SELECT
        pv.pizzeria_id,
        'visit' action_type,
        COUNT(*) total_count
    FROM person_visits pv
    GROUP BY pv.pizzeria_id
    UNION ALL
    SELECT
        m.pizzeria_id,
        'order' action_type,
        COUNT(*) total_count
    FROM person_order po
    JOIN menu m ON po.menu_id = m.id
    GROUP BY m.pizzeria_id
) r
JOIN pizzeria p ON r.pizzeria_id = p.id
GROUP BY p.name
ORDER BY total_count DESC, p.name ASC;

