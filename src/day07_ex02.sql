WITH visits AS (
    SELECT
        p.name AS restaurant_name,
        COUNT(pv.pizzeria_id) AS count,
        'visit' AS action_type
    FROM person_visits pv
    JOIN pizzeria p ON pv.pizzeria_id = p.id
    GROUP BY p.name
    ORDER BY count DESC
    LIMIT 3
),
orders AS (
    SELECT
        p.name AS restaurant_name,
        COUNT(po.menu_id) AS count,
        'order' AS action_type
    FROM person_order po
    JOIN menu m ON po.menu_id = m.id
    JOIN pizzeria p ON m.pizzeria_id = p.id
    GROUP BY p.name
    ORDER BY count DESC
    LIMIT 3
)
SELECT *
FROM visits
UNION ALL
SELECT *
FROM orders
ORDER BY action_type ASC, count DESC;
