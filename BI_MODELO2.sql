USE [dsrp_registro_salud_BI]
GO


-- Crear tabla Dimensión Paciente
CREATE TABLE DimPaciente (
    PacienteKey INT IDENTITY(1,1) PRIMARY KEY,
    PacienteID INT,
    Nombre VARCHAR(255),
    Apellido VARCHAR(255),
    EstadoCivil VARCHAR(50),
    Direccion VARCHAR(255),
    Telefono VARCHAR(50),
    Correo VARCHAR(255)
);
GO

-- Crear tabla Dimensión Centro de Salud
CREATE TABLE DimCentroSalud (
    CentroSaludKey INT IDENTITY(1,1) PRIMARY KEY,
    CentroSaludID INT,
    Nombre VARCHAR(255),
    Direccion VARCHAR(255),
    Telefono VARCHAR(50)
);
GO

-- Crear tabla Dimensión Tiempo
CREATE TABLE DimTiempo (
    TiempoKey INT IDENTITY(1,1) PRIMARY KEY,
    Fecha DATE,
    Año INT,
    Mes INT,
    Dia INT,
    Trimestre INT
);
GO

--Crear tabla Dimensión Visita
CREATE TABLE DimVisita(
    VisitaID INT IDENTITY(1,1) PRIMARY KEY,
    FechaVisita DATE NOT NULL,
    TipoVisita VARCHAR(50) NOT NULL,
    CentroSaludID INT NOT NULL,
    PacienteID INT NOT NULL,
    SignosVitales VARCHAR(250),
    Observaciones VARCHAR(250)
);
GO

CREATE TABLE DimRegistroSaludd (
    RegistroID INT IDENTITY(1,1) PRIMARY KEY,
    VisitaID INT NOT NULL,
    PacienteID INT NOT NULL,
    TipoRegistro VARCHAR(50) NOT NULL,
    Resultado VARCHAR(250),
    PresionArterial VARCHAR(20),
    FrecuenciaCardiaca VARCHAR(20),
    Peso DECIMAL(5,2),
    Tratamiento VARCHAR(250),
    FechaRegistro DATE NOT NULL,
    CreadoPor INT NOT NULL
);
GO
CREATE TABLE [HECHOS_REEGGISTROS] (
	 VisitaKey INT IDENTITY(1,1) PRIMARY KEY,
    PacienteKey INT,
    CentroSaludKey INT,
    TiempoKey INT,
    MedicoKey INT,
	RegistroID INT,
	VisitaID INT,
    TipoVisita VARCHAR(255),
    SignosVitales VARCHAR(255),
    Observaciones VARCHAR(255),
    Tratamiento VARCHAR(255),
    FOREIGN KEY (PacienteKey) REFERENCES DimPaciente(PacienteKey),
    FOREIGN KEY (CentroSaludKey) REFERENCES DimCentroSalud(CentroSaludKey),
    FOREIGN KEY (TiempoKey) REFERENCES DimTiempo(TiempoKey),
    FOREIGN KEY (VisitaID) REFERENCES DimVisita(VisitaID),
	);

	select*from DimRegistroSaludd



--RELACIONES DE LA TABLA HECHOS 2.0
SELECT * FROM HECHOS_REEGGISTROS
ALTER TABLE[HECHOS_REEGGISTROS]
ADD CONSTRAINT FK_HECHOS_DimTiempo FOREIGN KEY (DimTiempo) REFERENCES DimTiempo(TiempoKey);

ALTER TABLE[HECHOS_REEGGISTROS]
ADD CONSTRAINT FK_HECHOS_DimPaciente FOREIGN KEY (DimPaciente) REFERENCES DimPaciente(PacienteKey);

ALTER TABLE[HECHOS_REEGGISTROS]
ADD CONSTRAINT FK_HECHOS_DimCentroSalud FOREIGN KEY (DimCentroSalud) REFERENCES DimCentroSalud(DimCentroSaludKey);

ALTER TABLE[HECHOS_REEGGISTROS]
ADD CONSTRAINT FK_HECHOS_DimVisita FOREIGN KEY (DimVisita) REFERENCES DimVisita(VisitaID);

ALTER TABLE[HECHOS_REEGGISTROS]
ADD CONSTRAINT FK_HECHOS_REEGGISTROS FOREIGN KEY (DIM_REEGGISTROS) REFERENCES DIM_REGGISTROS(id);


--------------poblando

-- DimPaciente
INSERT INTO DimPaciente (PacienteID, Nombre, Apellido, EstadoCivil, Direccion, Telefono, Correo)
VALUES 
    (1, 'Juan', 'Perez', 'Soltero', 'Av. Principal 123', '555-1234', 'juan.perez@example.com'),
    (2, 'Maria', 'Lopez', 'Casada', 'Calle Secundaria 456', '555-5678', 'maria.lopez@example.com'),
    (3, 'Pedro', 'Garcia', 'Divorciado', 'Jr. de la Unión 789', '555-9101', 'pedro.garcia@example.com'),
    (4, 'Ana', 'Martinez', 'Viuda', 'Av. Central 321', '555-1122', 'ana.martinez@example.com'),
    (5, 'Luis', 'Fernandez', 'Soltero', 'Calle Los Olivos 654', '555-3344', 'luis.fernandez@example.com'),
    (6, 'Carlos', 'Ruiz', 'Casado', 'Av. Las Flores 345', '555-4455', 'carlos.ruiz@example.com'),
    (7, 'Lucia', 'Gomez', 'Soltera', 'Calle El Sol 678', '555-5566', 'lucia.gomez@example.com'),
    (8, 'Roberto', 'Diaz', 'Divorciado', 'Av. La Luna 123', '555-6677', 'roberto.diaz@example.com'),
    (9, 'Elena', 'Torres', 'Casada', 'Calle Las Estrellas 456', '555-7788', 'elena.torres@example.com'),
    (10, 'Jorge', 'Salazar', 'Soltero', 'Av. Los Pinos 789', '555-8899', 'jorge.salazar@example.com'),
    (11, 'Diana', 'Rojas', 'Viuda', 'Jr. Los Cedros 321', '555-9900', 'diana.rojas@example.com'),
    (12, 'Martin', 'Flores', 'Casado', 'Av. Las Palmeras 654', '555-1122', 'martin.flores@example.com'),
    (13, 'Patricia', 'Mendoza', 'Soltera', 'Calle El Roble 987', '555-2233', 'patricia.mendoza@example.com'),
    (14, 'Victor', 'Castro', 'Divorciado', 'Av. La Rosa 321', '555-3344', 'victor.castro@example.com'),
    (15, 'Carmen', 'Sanchez', 'Casada', 'Jr. La Paz 654', '555-4455', 'carmen.sanchez@example.com'),
    (16, 'Raul', 'Chavez', 'Soltero', 'Av. La Libertad 987', '555-5566', 'raul.chavez@example.com'),
    (17, 'Veronica', 'Gutierrez', 'Casada', 'Calle Las Orquideas 321', '555-6677', 'veronica.gutierrez@example.com'),
    (18, 'Sergio', 'Herrera', 'Divorciado', 'Av. Los Álamos 654', '555-7788', 'sergio.herrera@example.com'),
    (19, 'Laura', 'Paredes', 'Soltera', 'Jr. Las Lomas 987', '555-8899', 'laura.paredes@example.com'),
    (20, 'Rafael', 'Quispe', 'Casado', 'Av. Las Magnolias 321', '555-9900', 'rafael.quispe@example.com');

--  DimCentroSalud
INSERT INTO DimCentroSalud (CentroSaludID, Nombre, Direccion, Telefono)
VALUES 
    (1, 'Centro Salud San Juan', 'Av. San Juan 123', '555-2211'),
    (2, 'Hospital Central', 'Av. Central 456', '555-3344'),
    (3, 'Clínica Los Olivos', 'Jr. Los Olivos 789', '555-5566'),
    (4, 'Posta Médica Los Robles', 'Calle Los Robles 321', '555-7788'),
    (5, 'Centro de Salud Santa Ana', 'Av. Santa Ana 654', '555-9900'),
    (6, 'Centro Salud La Esperanza', 'Calle La Esperanza 345', '555-1111'),
    (7, 'Hospital del Sur', 'Av. Del Sur 678', '555-2222'),
    (8, 'Clínica Santa Maria', 'Jr. Santa Maria 123', '555-3333'),
    (9, 'Posta Médica San Pablo', 'Av. San Pablo 456', '555-4444'),
    (10, 'Centro de Salud La Merced', 'Calle La Merced 789', '555-5555'),
    (11, 'Centro Salud Los Cedros', 'Av. Los Cedros 321', '555-6666'),
    (12, 'Hospital Virgen del Carmen', 'Av. Virgen 654', '555-7777'),
    (13, 'Clínica Virgen de Guadalupe', 'Jr. Guadalupe 987', '555-8888'),
    (14, 'Posta Médica San Francisco', 'Av. San Francisco 321', '555-9999'),
    (15, 'Centro Salud Los Pinos', 'Calle Los Pinos 654', '555-0000'),
    (16, 'Clínica San Antonio', 'Jr. San Antonio 987', '555-1112'),
    (17, 'Centro de Salud Virgen del Rosario', 'Av. Rosario 321', '555-2223'),
    (18, 'Hospital Los Olivos', 'Calle Los Olivos 654', '555-3334'),
    (19, 'Posta Médica San Benito', 'Jr. San Benito 987', '555-4445'),
    (20, 'Centro de Salud Santa Clara', 'Av. Santa Clara 321', '555-5556');


--  DimTiempo
INSERT INTO DimTiempo (Fecha, Año, Mes, Dia, Trimestre)
VALUES 
    ('2024-01-01', 2024, 1, 1, 1),
    ('2024-02-15', 2024, 2, 15, 1),
    ('2024-03-20', 2024, 3, 20, 1),
    ('2024-04-10', 2024, 4, 10, 2),
    ('2024-05-25', 2024, 5, 25, 2),
    ('2024-06-30', 2024, 6, 30, 2),
    ('2024-07-05', 2024, 7, 5, 3),
    ('2024-08-15', 2024, 8, 15, 3),
    ('2024-09-22', 2024, 9, 22, 3),
    ('2024-10-12', 2024, 10, 12, 4),
    ('2024-11-05', 2024, 11, 5, 4),
    ('2024-12-25', 2024, 12, 25, 4),
    ('2023-01-11', 2023, 1, 11, 1),
    ('2023-02-22', 2023, 2, 22, 1),
    ('2023-03-29', 2023, 3, 29, 1),
    ('2023-04-08', 2023, 4, 8, 2),
    ('2023-05-18', 2023, 5, 18, 2),
    ('2023-06-27', 2023, 6, 27, 2),
    ('2023-07-17', 2023, 7, 17, 3),
    ('2023-08-28', 2023, 8, 28, 3);


-- DimVisita
INSERT INTO dbo.DimVisita (FechaVisita, TipoVisita, CentroSaludID, PacienteID, SignosVitales, Observaciones)
VALUES 
    ('2024-09-01', 'Consulta General', 1, 1, 'Presión: 120/80, Pulso: 75', 'Paciente reporta mejoría después de la consulta anterior'),
    ('2024-09-02', 'Control de Presión', 1, 2, 'Presión: 130/85, Pulso: 80', 'Control mensual de presión arterial'),
    ('2024-09-03', 'Consulta Cardiología', 2, 3, 'Presión: 140/90, Pulso: 90', 'Paciente refiere palpitaciones irregulares, se recomienda ECG'),
    ('2024-09-04', 'Chequeo General', 2, 4, 'Presión: 110/70, Pulso: 70', 'Chequeo general anual sin observaciones importantes'),
    ('2024-09-05', 'Consulta Pediátrica', 3, 5, 'Presión: 100/60, Pulso: 85', 'Vacuna de refuerzo aplicada sin complicaciones'),
    ('2024-09-06', 'Revisión Médica', 3, 6, 'Presión: 125/80, Pulso: 72', 'Revisión postoperatoria, herida en buen estado'),
    ('2024-09-07', 'Consulta Ginecológica', 1, 7, 'Presión: 115/75, Pulso: 78', 'Dolor abdominal, se solicitarán análisis adicionales'),
    ('2024-09-08', 'Chequeo General', 2, 8, 'Presión: 120/80, Pulso: 76', 'Revisión médica rutinaria sin hallazgos relevantes'),
    ('2024-09-09', 'Revisión de Peso', 3, 9, 'Presión: 110/70, Pulso: 74', 'Paciente ha perdido 2kg desde la última revisión'),
    ('2024-09-10', 'Control de Diabetes', 1, 10, 'Presión: 135/85, Pulso: 82', 'Niveles de glucosa estables, se recomienda continuar con la medicación'),
	 ('2024-10-25', 'Consulta General', 10, 10, '125/85', 'Presión ligeramente elevada'),
    ('2024-11-05', 'Consulta Cardiológica', 11, 11, '120/80', 'Ritmo cardíaco controlado'),
    ('2024-12-20', 'Chequeo General', 12, 12, '130/90', 'Peso y presión en revisión'),
    ('2023-01-15', 'Consulta General', 13, 13, '125/85', 'Paciente con hipertensión'),
    ('2023-02-18', 'Consulta Nutricional', 14, 14, '120/80', 'Paciente con dieta controlada'),
    ('2023-03-12', 'Consulta Cardiológica', 15, 15, '115/75', 'Ritmo cardíaco normal'),
    ('2023-04-25', 'Consulta General', 16, 16, '130/90', 'Presión elevada, en control'),
    ('2023-05-18', 'Consulta de Control', 17, 17, '120/80', 'Paciente estable'),
    ('2023-06-28', 'Chequeo General', 18, 18, '110/70', 'Peso adecuado'),
    ('2023-07-22', 'Consulta Pediátrica', 19, 19, '120/85', 'Niño saludable'),
    ('2023-08-29', 'Consulta General', 20, 20, '125/80', 'Estado de salud óptimo');
-- DimRegistroSalud
INSERT INTO DimRegistroSalud (VisitaID, PacienteID, TipoRegistro, Resultado, PresionArterial, FrecuenciaCardiaca, Peso, Tratamiento, FechaRegistro, CreadoPor)
VALUES 
    (1, 1, 'Chequeo General', 'Normal', '120/80', '75', 68.50, 'Ninguno', '2024-09-01', 1001),
    (2, 2, 'Chequeo de Presión', 'Hipertensión', '140/90', '80', 85.70, 'Tratamiento con Amlodipino', '2024-09-02', 1002),
    (3, 3, 'Chequeo de Peso', 'Obesidad', '110/70', '65', 105.50, 'Control de dieta', '2024-09-03', 1003),
    (4, 4, 'Chequeo Cardiológico', 'Arritmia', '115/75', '90', 72.30, 'Tratamiento con Atenolol', '2024-09-04', 1004),
    (5, 5, 'Chequeo General', 'Normal', '125/80', '70', 60.80, 'Ninguno', '2024-09-05', 1005),
    (6, 6, 'Chequeo de Peso', 'Sobrepeso', '110/70', '70', 78.50, 'Control de dieta', '2024-09-06', 1006),
    (7, 7, 'Chequeo Cardiológico', 'Normal', '120/80', '75', 65.20, 'Ninguno', '2024-09-07', 1007),
    (8, 8, 'Chequeo General', 'Hipotensión', '100/60', '65', 54.80, 'Aumento de sal en la dieta', '2024-09-08', 1008),
    (9, 9, 'Chequeo de Presión', 'Normal', '120/80', '72', 70.50, 'Ninguno', '2024-09-09', 1009),
    (10, 10, 'Chequeo General', 'Normal', '125/85', '77', 80.00, 'Ninguno', '2024-09-10', 1010),
    (11, 11, 'Chequeo Cardiológico', 'Normal', '120/80', '75', 68.00, 'Control de ritmo', '2024-11-05', 1011),
    (12, 12, 'Chequeo General', 'Presión alta', '130/90', '85', 80.00, 'Control de presión', '2024-12-20', 1012),
    (13, 13, 'Chequeo General', 'Hipertensión', '130/90', '80', 82.00, 'Tratamiento con Losartán', '2023-01-15', 1013),
    (14, 14, 'Chequeo Nutricional', 'Normal', '120/80', '70', 65.00, 'Ninguno', '2023-02-18', 1014),
    (15, 15, 'Chequeo Cardiológico', 'Arritmia leve', '115/75', '85', 75.00, 'Control de ritmo', '2023-03-12', 1015),
    (16, 16, 'Chequeo General', 'Hipertensión', '130/90', '85', 88.00, 'Tratamiento con Losartán', '2023-04-25', 1016),
    (17, 17, 'Chequeo de Control', 'Normal', '120/80', '75', 68.50, 'Ninguno', '2023-05-18', 1017),
    (18, 18, 'Chequeo General', 'Normal', '110/70', '70', 65.00, 'Ninguno', '2023-06-28', 1018),
    (19, 19, 'Chequeo Pediátrico', 'Normal', '120/85', '35', 22.50, 'Seguimiento de crecimiento', '2023-07-22', 1019),
    (20, 20, 'Chequeo General', 'Normal', '125/80', '70', 68.00, 'Ninguno', '2023-08-29', 1020);

--  DimHechos
INSERT INTO [HECHOS_REEGGISTROS] (PacienteKey,VisitaID,RegistroID, CentroSaludKey, TiempoKey, MedicoKey, TipoVisita, SignosVitales, Observaciones, Tratamiento)
SELECT P.PacienteKey,
       C.CentroSaludKey,
	   V.VisitaID,
	   R.RegistroID,
       T.TiempoKey,
       M.MedicoKey,
       V.TIPO_VISITA_ID,
       V.SIGNOS_VITALES,
       V.OBSERVACIONES,
       RS.TRATAMIENTO
FROM REGISTRO_SALUD AS R
JOIN DimPaciente AS P ON P.PacienteID = V.ID_PACIENTE
JOIN DimCentroSalud AS C ON C.CentroSaludID = V.CENTRO_SALUD
JOIN DimTiempo AS T ON T.Fecha = CAST(V.FECHA AS DATE)
JOIN DimMedico AS M ON M.MedicoID = 1 -- Ejemplo, asignar médico
JOIN dbo.REGISTRO_SALUD AS RS ON RS.VISITA = V.ID;
consulta_dimensiones.sql
Mostrando consulta_dimensiones.sql