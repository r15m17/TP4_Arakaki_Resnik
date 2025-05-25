--16. Obtener el nombre del médico junto con el nombre del paciente y el número total de consultas realizadas por cada médico para cada paciente, ordenado por médico y paciente.

SELECT 
  Medicos.nombre AS medico,
  Pacientes.nombre AS paciente,
  COUNT(*) AS cantidad_de_consultas
FROM Consultas
JOIN Medicos ON Consultas.id_medico = Medicos.id_medico
JOIN Pacientes ON Consultas.id_paciente = Pacientes.id_paciente
GROUP BY Medicos.nombre, Pacientes.nombre
ORDER BY Medicos.nombre, Pacientes.nombre;

