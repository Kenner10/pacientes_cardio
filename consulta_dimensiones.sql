-- DimPaciente
INSERT INTO DimPaciente (PacienteID, Nombre, Apellido, EstadoCivil, Direccion, Telefono, Correo)
SELECT ID, nombre, apellido, estado_civil, direccion, telefono, correo
FROM dbo.PACIENTE;

--  DimCentroSalud
INSERT INTO DimCentroSalud (CentroSaludID, Nombre, Direccion, Telefono)
SELECT ID, NOMBRE, DIRECCIÓN, TELEFONO
FROM dbo.CENTRO_SALUD;

--  DimTiempo
INSERT INTO DimTiempo (Fecha, Año, Mes, Dia, Trimestre)
SELECT DISTINCT CAST(VISITA.FECHA AS DATE),
       YEAR(VISITA.FECHA),
       MONTH(VISITA.FECHA),
       DAY(VISITA.FECHA),
       DATEPART(QUARTER, VISITA.FECHA)
FROM dbo.VISITA AS VISITA;

--  DimMedico
-- Hubiera sido interesante tener una tabla de medicos, se hubiera apreciado de esta forma
INSERT INTO DimMedico (MedicoID, Nombre, Especialidad)
VALUES (1, 'Dr. Juan Perez', 'Cardiología'),
       (2, 'Dra. Ana López', 'Pediatría'),
       (3, 'Dr. Carlos Ruiz', 'Ginecología');

--  FactVisitas
INSERT INTO FactVisitas (PacienteKey, CentroSaludKey, TiempoKey, MedicoKey, TipoVisita, SignosVitales, Observaciones, Tratamiento)
SELECT P.PacienteKey,
       C.CentroSaludKey,
       T.TiempoKey,
       M.MedicoKey,
       V.TIPO_VISITA_ID,
       V.SIGNOS_VITALES,
       V.OBSERVACIONES,
       RS.TRATAMIENTO
FROM dbo.VISITA AS V
JOIN DimPaciente AS P ON P.PacienteID = V.ID_PACIENTE
JOIN DimCentroSalud AS C ON C.CentroSaludID = V.CENTRO_SALUD
JOIN DimTiempo AS T ON T.Fecha = CAST(V.FECHA AS DATE)
JOIN DimMedico AS M ON M.MedicoID = 1 -- Ejemplo, asignar médico
JOIN dbo.REGISTRO_SALUD AS RS ON RS.VISITA = V.ID;
