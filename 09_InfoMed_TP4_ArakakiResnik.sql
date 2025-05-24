-- 9. Obtener la cantidad de recetas emitidas por cada médico.

SELECT 
  Medicos.nombre AS medico, 
  COUNT(Recetas.id_receta) AS cantidad_recetas
FROM Recetas 
JOIN Medicos ON Recetas.id_medico = Medicos.id_medico
GROUP BY Medicos.nombre