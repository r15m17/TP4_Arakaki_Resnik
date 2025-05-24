-- 7. Cantidad de pacientes que viven en cada ciudad.

SELECT ciudad, COUNT(*) AS cantidad_pacientes
FROM Pacientes
GROUP BY ciudad;