
drop table [DIM_PACIENTE],[DIM_TIEMPO],[DIM_VISITA], [DIM_CENTRO_SALUD]


CREATE TABLE [DIM_PACIENTE] (
	[id] int IDENTITY(1,1) NOT NULL UNIQUE,
	[NOMBRE] nvarchar(100) NOT NULL,
	[SEGMENTO] nvarchar(100) NOT NULL,
	PRIMARY KEY ([id])
);

CREATE TABLE [DIM_TIEMPO] (
	[id] int IDENTITY(1,1) NOT NULL UNIQUE,
	[DIA] nvarchar(max) DEFAULT '100',
	[MES] nvarchar(max) DEFAULT '1O0',
	[AÑO] nvarchar(max) DEFAULT '100',
	[TRIMETRE] int,
	PRIMARY KEY ([id])
);

CREATE TABLE [DIM_VISITA] (
	[id] int IDENTITY(1,1) NOT NULL UNIQUE,
	[TIPO_VISITA] nvarchar(100) NOT NULL,
	[VISITA_ID] nvarchar(100) NOT NULL,
	PRIMARY KEY ([id])
);

CREATE TABLE [DIM_CENTRO_SALUD] (
	[id] int IDENTITY(1,1) NOT NULL UNIQUE,
	[CENTRO_ID] nvarchar(100) NOT NULL,
	[NOMBRE] nvarchar(100) NOT NULL,
	PRIMARY KEY ([id])
);

CREATE TABLE [HECHOS_REEGISTROS] (
	[id] int IDENTITY(1,1) NOT NULL UNIQUE,
	[DIM_TIEMPO] int NOT NULL UNIQUE,
	[DIM_PACIENTE] int NOT NULL UNIQUE,
	[DIM_CENTRO_SALUD] int NOT NULL UNIQUE,
	[DIM_VISITA] int NOT NULL UNIQUE,
	[DIM_REGISTROS] INTEGER,
	[CANTIDAD_REGISTROS] int NOT NULL,
	[VISITA] nvarchar(100) NOT NULL,
	[PACIENTE] nvarchar(100) NOT NULL,
	PRIMARY KEY ([id])
);

CREATE TABLE [DIM_REGISTROS] (
	[id] INTEGER NOT NULL IDENTITY UNIQUE,
	[TIPO_REGISTRO] VARCHAR,
	PRIMARY KEY([ID])
	);
	GO
--------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------
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

-- Crear tabla Hechos Visitas
CREATE TABLE FactVisitas (
    VisitaKey INT IDENTITY(1,1) PRIMARY KEY,
    PacienteKey INT,
    CentroSaludKey INT,
    TiempoKey INT,
    MedicoKey INT,
    TipoVisita VARCHAR(255),
    SignosVitales VARCHAR(255),
    Observaciones VARCHAR(255),
    Tratamiento VARCHAR(255),
    FOREIGN KEY (PacienteKey) REFERENCES DimPaciente(PacienteKey),
    FOREIGN KEY (CentroSaludKey) REFERENCES DimCentroSalud(CentroSaludKey),
    FOREIGN KEY (TiempoKey) REFERENCES DimTiempo(TiempoKey),
    FOREIGN KEY (MedicoKey) REFERENCES DimMedico(MedicoKey)
);
GO

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


--RELACIONES DE LA TABLA HECHOS 1.0
SELECT * FROM HECHOS_REEGISTROS
ALTER TABLE[HECHOS_REEGGISTROS]
ADD CONSTRAINT FK_HECHOS_DIM_TIEMPO FOREIGN KEY (DIM_TIEMPO) REFERENCES DIM_TIEMPO(id);

ALTER TABLE[HECHOS_REEGISTROS]
ADD CONSTRAINT FK_HECHOS_DIM_PACIENTE FOREIGN KEY (DIM_PACIENTE) REFERENCES DIM_PACIENTE(id);

ALTER TABLE[HECHOS_REEGISTROS]
ADD CONSTRAINT FK_HECHOS_DIM_CENTRO_SALUD FOREIGN KEY (DIM_CENTRO_SALUD) REFERENCES DIM_CENTRO_SALUD(id);

ALTER TABLE[HECHOS_REEGISTROS]
ADD CONSTRAINT FK_HECHOS_DIM_VISITA FOREIGN KEY (DIM_VISITA) REFERENCES DIM_VISITA(id);

ALTER TABLE[HECHOS_REEGISTROS]
ADD CONSTRAINT FK_HECHOS_DIM_REGISTROS FOREIGN KEY (DIM_REGISTROS) REFERENCES DIM_REGISTROS(id);




-----------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------
-- DimPaciente
INSERT INTO DIM_PACIENTE (PacienteID, Nombre, Apellido, EstadoCivil, Direccion, Telefono, Correo)
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
consulta_dimensiones.sql
Mostrando consulta_dimensiones.sql




ALTER TABLE DIM_PACIENTE
ADD PACIENTE INT;

ALTER TABLE DIM_VISITA
ADD TIPO_VISITA_ID INT;

ALTER TABLE DIM_CENTRO_SALUD
ADD CENTRO_SALUD INT NOT NULL;

ALTER TABLE DIM_PACIENTE
ADD PACIENTE_ID INT;

ALTER TABLE DIM_TIEMPO
ADD TIEMPO INT;



