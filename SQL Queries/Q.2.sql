SELECT 
	MONTH(Start_Time) AS Month, 
	COUNT(*) AS total_accidents
FROM us_accidents_march23_sampled_500k
WHERE YEAR(Start_Time) < '2023'
GROUP BY MONTH(Start_Time)
ORDER BY Month;
