-- 14. Obtener el nombre del medicamento más recetado junto con la cantidad de recetas emitidas para ese medicamento.

SELECT 
  Medicamentos.nombre AS Medicamento,
  COUNT(*) AS cantidad_de_recetas
FROM Recetas
JOIN Medicamentos ON Recetas.id_medicamento = Medicamentos.id_medicamento
GROUP BY Medicamentos.nombre
HAVING COUNT(*) = (
  SELECT MAX(cantidad)
  FROM (
    SELECT COUNT(*) AS cantidad
    FROM Recetas
    GROUP BY id_medicamento
  ) AS sub
)
