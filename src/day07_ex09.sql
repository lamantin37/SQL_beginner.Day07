SELECT
    p.address,
    ROUND(MAX(p.age::numeric) - MIN(p.age::numeric) / MAX(p.age::numeric), 2) formula,
    ROUND(AVG(p.age::numeric), 2) average,
    MAX(p.age::numeric) - MIN(p.age::numeric) / MAX(p.age::numeric) > AVG(p.age::numeric) comparison
FROM person p
GROUP BY p.address
ORDER BY p.address;

