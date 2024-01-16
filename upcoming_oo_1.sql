SELECT
	oo_1.jednostka_broni
	, MAX(oo_1.data_waznosci) AS data_waznosci
FROM
	oo_1
WHERE
	oo_1.data_waznosci BETWEEN NOW()::DATE
	AND NOW()::DATE + INTERVAL '30 DAYS'
GROUP BY
	oo_1.jednostka_broni
