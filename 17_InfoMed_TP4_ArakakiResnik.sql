-- 17. Obtener el nombre del medicamento junto con el total de recetas prescritas para ese medicamento, el nombre del médico que lo recetó y el nombre del paciente al que se le recetó, ordenado por total de recetas en orden descendente 

SELECT 
  Medicamentos.nombre AS medicamento,
  Medicos.nombre AS medico,
  Pacientes.nombre AS paciente,
  COUNT(*) AS total_recetas
FROM Recetas
JOIN Medicamentos ON Recetas.id_medicamento = Medicamentos.id_medicamento
JOIN Medicos ON Recetas.id_medico = Medicos.id_medico
JOIN Pacientes ON Recetas.id_paciente = Pacientes.id_paciente
GROUP BY Medicamentos.nombre, Medicos.nombre, Pacientes.nombre
ORDER BY total_recetas DESC; 