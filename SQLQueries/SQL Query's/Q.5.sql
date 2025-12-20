WITH WeekNumber AS(
	SELECT 
		ID,
		DAYOFWEEK(Start_Time) as day_of_week
	FROM us_accidents_march23_sampled_500k
	WHERE YEAR(Start_Time) < 2023 AND State = 'CA'
),
WeekType AS(
	SELECT 
		ID,
		day_of_week,
		CASE
		WHEN day_of_week BETWEEN '2' AND '6' THEN 'WeekDay'
		ELSE 'Weekend'
		END AS 'Day_type'
	FROM WeekNumber
)
SELECT 
	Day_type,
     COUNT(*) AS total_accidents,
    AVG(Severity) AS avg_severity
FROM WeekType
LEFT JOIN us_accidents_march23_sampled_500k USING (ID)
WHERE YEAR(Start_Time) < 2023 AND City = 'Los Angeles'
GROUP BY Day_type
