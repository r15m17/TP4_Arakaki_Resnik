-- 10. Obtener todas las consultas médicas realizadas por el médico con ID igual a 3 durante el mes de agosto de 2024.

SELECT 
  Consultas.id_consulta,
  Consultas.fecha,
  Pacientes.nombre AS Paciente,
  Consultas.diagnostico,
  Consultas.tratamiento,
  Consultas.snomed_codigo
FROM Consultas 
JOIN Pacientes ON Consultas.id_paciente = Pacientes.id_paciente
WHERE Consultas.id_medico = 3
  AND Consultas.fecha BETWEEN '2024-08-01' AND '2024-08-31' 
