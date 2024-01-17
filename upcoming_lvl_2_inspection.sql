SELECT
	inspection_lvl_2.equipment_id
	, MAX(inspection_lvl_2.expiry_date) AS expiry_date
FROM
	inspection_lvl_2
WHERE
	inspection_lvl_2.expiry_date BETWEEN NOW()::DATE
	AND NOW()::DATE + INTERVAL '30 DAYS'
GROUP BY
	inspection_lvl_2.equipment_id
