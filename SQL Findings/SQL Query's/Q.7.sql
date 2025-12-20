SELECT 
	DATE_FORMAT(Start_Time, '%H') AS Time_hourly,
    COUNT(*) AS total_accidents,
    AVG(Severity) AS avg_severity
FROM us_accidents_march23_sampled_500k
WHERE YEAR(Start_Time) < 2023 AND State = 'CA'
GROUP BY Time_hourly
ORDER BY total_accidents DESC
