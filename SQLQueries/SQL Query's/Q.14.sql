WITH DayGroup AS(
	SELECT 
		ID,
		HOUR(Start_Time) AS Time_hourly,
		CASE
		WHEN HOUR(Start_Time) BETWEEN 6 AND 17 THEN 'Day'
		ELSE 'Night'
		END AS 'Day_Group'
	FROM us_accidents_march23_sampled_500k
	WHERE YEAR(Start_Time) < 2023 AND State = 'CA'
)
SELECT 
	Day_Group,
    AVG(TIMESTAMPDIFF(HOUR, Start_Time, End_Time)) AS avg_duration
FROM DayGroup
LEFT JOIN us_accidents_march23_sampled_500k USING (ID)
WHERE YEAR(Start_Time) < 2023 AND City = 'Los Angeles'
GROUP BY Day_Group
ORDER BY avg_duration DESC
