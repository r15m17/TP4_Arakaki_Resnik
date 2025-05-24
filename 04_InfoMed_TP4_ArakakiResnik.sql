-- 4. Seleccionar el nombre y la matrícula de cada médico cuya especialidad sea identificada por el id 4.

--Adicionalmente le colocamos una columna con el ID y la descripción del ID para ver que efectivamente tienen un id igual a 4 
-- y la especialidad a la cual hace referencia.

SELECT 
  Medicos.nombre AS nombre_medico,
  Medicos.matricula,
  Especialidades.id_especialidad,
  Especialidades.nombre AS especialidad
FROM 
  Medicos
JOIN 
  Especialidades ON Medicos.especialidad_id = Especialidades.id_especialidad
WHERE 
  Especialidades.id_especialidad = 4;  