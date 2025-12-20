SELECT 
    city,
    COUNT(*) AS total_accidents
FROM us_accidents_march23_sampled_500k
WHERE YEAR(Start_Time) < 2023 AND State = 'CA'
GROUP BY city
ORDER BY total_accidents DESC;
