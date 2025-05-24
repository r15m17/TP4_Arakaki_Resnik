-- 12. Obtener el nombre de los medicamentos prescritos más de una vez por el médico con ID igual a 2.
SELECT 
  Medicamentos.nombre,
  COUNT(*) AS veces_prescripto
FROM Recetas
JOIN Medicamentos ON Recetas.id_medicamento = Medicamentos.id_medicamento
WHERE Recetas.id_medico = 2
GROUP BY Medicamentos.nombre
HAVING COUNT(*) >= 2; 

