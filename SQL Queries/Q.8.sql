WITH Timetabel AS(
	SELECT 
		Id,
		DATE_FORMAT(Start_Time, '%H:%i') AS Time
	FROM us_accidents_march23_sampled_500k
),
RushPeriod AS (
	SELECT 
		ID,
		Time,
		CASE 
		WHEN Time BETWEEN '06:00' AND '08:59' THEN 'Morning_Rush'
		WHEN Time BETWEEN '16:00' AND '19:59' THEN 'Evening_Rush'
		ELSE 'Normal'
		END AS Rush_Period
	FROM Timetabel
)
 SELECT 
	Rush_Period,
	AVG(Severity) AS avg_severity,
    COUNT(*) AS total_accidents
FROM RushPeriod
LEFT JOIN us_accidents_march23_sampled_500k USING (ID)
WHERE YEAR(Start_Time) < 2023 AND City = 'Los Angeles'
GROUP BY Rush_Period
ORDER BY avg_severity DESC
 