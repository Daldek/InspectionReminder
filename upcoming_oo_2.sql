SELECT
	oo_2.jednostka_broni
	, MAX(oo_2.data_waznosci) AS data_waznosci
FROM oo_2
WHERE
	oo_2.data_waznosci BETWEEN NOW()::DATE
	AND NOW()::DATE + INTERVAL '30 DAYS'
GROUP BY oo_2.jednostka_broni
