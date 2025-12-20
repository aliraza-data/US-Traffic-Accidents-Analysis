WITH WindCond AS (
	SELECT 
		ID,
		Wind_Speed_mph,
		CASE 
		WHEN Wind_Speed_mph >25 THEN 'Windy'
		ELSE 'Calm'
		END AS Windcondition
	FROM us_accidents_march23_sampled_500k
    WHERE Visibility_mi IS NOT NULL
)

SELECT
	Windcondition, 
	AVG(TIMESTAMPDIFF(HOUR, Start_Time, End_Time)) AS avg_duration
FROM WindCond
LEFT JOIN us_accidents_march23_sampled_500k USING (ID)
WHERE YEAR(Start_Time) < 2023 AND City = 'Los Angeles'
GROUP BY Windcondition
