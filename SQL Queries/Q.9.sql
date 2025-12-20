SELECT Weather_Condition, AVG(Severity) AS avg_severity
FROM us_accidents_march23_sampled_500k
WHERE YEAR(Start_Time) < 2023 AND City = 'Los Angeles'
GROUP BY Weather_Condition
ORDER BY avg_severity DESC
LIMIT 5