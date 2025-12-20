SELECT
	City,
	AVG(TIMESTAMPDIFF(HOUR, Start_Time, End_Time)) AS avg_duration
FROM us_accidents_march23_sampled_500k
WHERE YEAR(Start_Time) < 2023 AND City = 'Los Angeles'
GROUP BY City
ORDER BY avg_duration DESC



