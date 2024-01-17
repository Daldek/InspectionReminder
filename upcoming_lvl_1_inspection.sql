SELECT
	inspection_lvl_1.equipment_id
	, MAX(inspection_lvl_1.expiry_date) AS expiry_date
FROM
	inspection_lvl_1
WHERE
	inspection_lvl_1.expiry_date BETWEEN NOW()::DATE
	AND NOW()::DATE + INTERVAL '30 DAYS'
GROUP BY
	inspection_lvl_1.equipment_id
