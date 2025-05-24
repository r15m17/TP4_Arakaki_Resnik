--2. Se tiene la fecha de nacimiento de los pacientes. Se desea calcular la edad de los pacientes y almacenarla de forma dinámica en el sistema ya que es un valor típicamente consultado, junto con otra información relevante del paciente.


/*No queremos guardar la edad como una columna fija en la base de datos porque se desactualiza con el tiempo. 
Por lo que la solución sería crear una vista que incluya la edad calculada de forma dinámica. Adicionalmente, unimos dos tablas, 
la tabla pacientes y la tabla sexobiologico para crear una vista que contenga la edad calculada junto con la descripción del sexo para poder 
mostrar la información relevante del paciente de manera directa sin tener que hacer consultas combinadas. 
*/

CREATE VIEW vista_pacientes_con_edad AS
SELECT 
  Pacientes.id_paciente,
  Pacientes.nombre,
  Pacientes.fecha_nacimiento,
  EXTRACT(YEAR FROM age(CURRENT_DATE, Pacientes.fecha_nacimiento)) AS edad,
  SexoBiologico.descripcion AS sexo,
  Pacientes.numero,
  Pacientes.calle,
  Pacientes.ciudad
FROM 
  Pacientes
JOIN 
  SexoBiologico ON Pacientes.id_sexo = SexoBiologico.id_sexo;

