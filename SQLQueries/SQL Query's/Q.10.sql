WITH Hum_Range AS (
	SELECT 
		ID,
		Humidity_pct,
		CASE 
		WHEN Humidity_pct > 80 THEN 'High Humidity'
		ELSE 'Low Humidity'
		END AS Humidity
	FROM us_accidents_march23_sampled_500k
    WHERE Humidity_pct IS NOT NULL
)
SELECT
	Humidity, 
    AVG(TIMESTAMPDIFF(MINUTE, Start_Time, End_Time)) AS avg_duration
FROM Hum_Range
LEFT JOIN us_accidents_march23_sampled_500k USING (ID)
WHERE YEAR(Start_Time) < 2023 AND City = 'Los Angeles'
GROUP BY Humidity
ORDER BY avg_duration

