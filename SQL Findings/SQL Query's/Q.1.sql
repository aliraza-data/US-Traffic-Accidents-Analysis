SELECT 
	YEAR(Start_Time) AS year, 
	COUNT(*) AS total_accidents
FROM us_accidents_march23_sampled_500k
WHERE YEAR(Start_Time) < '2023'
GROUP BY YEAR(Start_Time)
ORDER BY year;
