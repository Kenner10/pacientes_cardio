USE [dsrp_registro_salud]
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

-- Crear tabla Dimensión Médico
CREATE TABLE DimMedico (
    MedicoKey INT IDENTITY(1,1) PRIMARY KEY,
    MedicoID INT,
    Nombre VARCHAR(255),
    Especialidad VARCHAR(255)
);
GO

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
