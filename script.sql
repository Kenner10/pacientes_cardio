USE [master]
GO
/****** Object:  Database [dsrp_registro_salud]    Script Date: 14/09/2024 20:03:33 ******/
CREATE DATABASE [dsrp_registro_salud]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'dsrp_registro_salud', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\dsrp_registro_salud.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'dsrp_registro_salud_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\dsrp_registro_salud_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [dsrp_registro_salud] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [dsrp_registro_salud].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [dsrp_registro_salud] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [dsrp_registro_salud] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [dsrp_registro_salud] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [dsrp_registro_salud] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [dsrp_registro_salud] SET ARITHABORT OFF 
GO
ALTER DATABASE [dsrp_registro_salud] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [dsrp_registro_salud] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [dsrp_registro_salud] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [dsrp_registro_salud] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [dsrp_registro_salud] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [dsrp_registro_salud] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [dsrp_registro_salud] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [dsrp_registro_salud] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [dsrp_registro_salud] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [dsrp_registro_salud] SET  DISABLE_BROKER 
GO
ALTER DATABASE [dsrp_registro_salud] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [dsrp_registro_salud] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [dsrp_registro_salud] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [dsrp_registro_salud] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [dsrp_registro_salud] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [dsrp_registro_salud] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [dsrp_registro_salud] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [dsrp_registro_salud] SET RECOVERY FULL 
GO
ALTER DATABASE [dsrp_registro_salud] SET  MULTI_USER 
GO
ALTER DATABASE [dsrp_registro_salud] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [dsrp_registro_salud] SET DB_CHAINING OFF 
GO
ALTER DATABASE [dsrp_registro_salud] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [dsrp_registro_salud] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [dsrp_registro_salud] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [dsrp_registro_salud] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'dsrp_registro_salud', N'ON'
GO
ALTER DATABASE [dsrp_registro_salud] SET QUERY_STORE = OFF
GO
USE [dsrp_registro_salud]
GO
/****** Object:  Table [dbo].[CENTRO_SALUD]    Script Date: 14/09/2024 20:03:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CENTRO_SALUD](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NOMBRE] [varchar](20) NOT NULL,
	[DIRECCIÓN] [varchar](100) NOT NULL,
	[TELEFONO] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DETALLE_VISITA]    Script Date: 14/09/2024 20:03:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DETALLE_VISITA](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ID_PACIENTE] [int] NOT NULL,
	[VISITA_ID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimCentroSalud]    Script Date: 14/09/2024 20:03:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimCentroSalud](
	[CentroSaludKey] [int] IDENTITY(1,1) NOT NULL,
	[CentroSaludID] [int] NULL,
	[Nombre] [varchar](255) NULL,
	[Direccion] [varchar](255) NULL,
	[Telefono] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[CentroSaludKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimMedico]    Script Date: 14/09/2024 20:03:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimMedico](
	[MedicoKey] [int] IDENTITY(1,1) NOT NULL,
	[MedicoID] [int] NULL,
	[Nombre] [varchar](255) NULL,
	[Especialidad] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[MedicoKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimPaciente]    Script Date: 14/09/2024 20:03:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimPaciente](
	[PacienteKey] [int] IDENTITY(1,1) NOT NULL,
	[PacienteID] [int] NULL,
	[Nombre] [varchar](255) NULL,
	[Apellido] [varchar](255) NULL,
	[EstadoCivil] [varchar](50) NULL,
	[Direccion] [varchar](255) NULL,
	[Telefono] [varchar](50) NULL,
	[Correo] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[PacienteKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimTiempo]    Script Date: 14/09/2024 20:03:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimTiempo](
	[TiempoKey] [int] IDENTITY(1,1) NOT NULL,
	[Fecha] [date] NULL,
	[Año] [int] NULL,
	[Mes] [int] NULL,
	[Dia] [int] NULL,
	[Trimestre] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[TiempoKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FactVisitas]    Script Date: 14/09/2024 20:03:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FactVisitas](
	[VisitaKey] [int] IDENTITY(1,1) NOT NULL,
	[PacienteKey] [int] NULL,
	[CentroSaludKey] [int] NULL,
	[TiempoKey] [int] NULL,
	[MedicoKey] [int] NULL,
	[TipoVisita] [varchar](255) NULL,
	[SignosVitales] [varchar](255) NULL,
	[Observaciones] [varchar](255) NULL,
	[Tratamiento] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[VisitaKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PACIENTE]    Script Date: 14/09/2024 20:03:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PACIENTE](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DNI] [varchar](20) NOT NULL,
	[nombre] [varchar](225) NOT NULL,
	[apellido] [varchar](100) NOT NULL,
	[direccion] [varchar](100) NULL,
	[telefono] [varchar](20) NULL,
	[correo] [varchar](100) NULL,
	[estado_civil] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[REGISTRO_SALUD]    Script Date: 14/09/2024 20:03:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[REGISTRO_SALUD](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TIPO_REGISTRO_ID] [int] NOT NULL,
	[VISITA] [int] NOT NULL,
	[ID_PACIENTE] [int] NOT NULL,
	[SUCURSALES_ID] [int] NOT NULL,
	[RESULTADO] [varchar](100) NULL,
	[PRESIÓN_ARTERIAL] [varchar](1) NOT NULL,
	[FRECUENCIA] [varchar](100) NOT NULL,
	[PESO] [varchar](100) NOT NULL,
	[TRATAMIENTO] [varchar](250) NULL,
	[CREATED_AT] [datetime] NOT NULL,
	[UPDATED_AT] [datetime] NULL,
	[DELETED_AT] [datetime] NULL,
	[CREATED_BY] [int] NOT NULL,
	[UPDATED_BY] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TIPO_REGISTRO]    Script Date: 14/09/2024 20:03:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TIPO_REGISTRO](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NOMBRE] [varchar](20) NOT NULL,
	[DETALLE] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TIPO_VISITA]    Script Date: 14/09/2024 20:03:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TIPO_VISITA](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NOMBRE] [varchar](100) NOT NULL,
	[PACIENTE] [varchar](225) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VISITA]    Script Date: 14/09/2024 20:03:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VISITA](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FECHA] [datetime] NOT NULL,
	[TIPO_VISITA_ID] [int] NULL,
	[CENTRO_SALUD] [varchar](225) NOT NULL,
	[ID_PACIENTE] [int] NOT NULL,
	[SIGNOS_VITALES] [varchar](100) NULL,
	[OBSERVACIONES] [varchar](225) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[CENTRO_SALUD] ON 

INSERT [dbo].[CENTRO_SALUD] ([ID], [NOMBRE], [DIRECCIÓN], [TELEFONO]) VALUES (93, N'Centro de Salud Lima', N'Av. Central 123, Lima', N'012345678')
INSERT [dbo].[CENTRO_SALUD] ([ID], [NOMBRE], [DIRECCIÓN], [TELEFONO]) VALUES (94, N'Centro de Salud Caao', N'Calle Comercio 456, Callao', N'019876543')
INSERT [dbo].[CENTRO_SALUD] ([ID], [NOMBRE], [DIRECCIÓN], [TELEFONO]) VALUES (95, N'Centro de Salud Surc', N'Av. Primavera 789, Surco', N'013456789')
INSERT [dbo].[CENTRO_SALUD] ([ID], [NOMBRE], [DIRECCIÓN], [TELEFONO]) VALUES (96, N'Centro de Salud Mi', N'Av. Pardo 123, Miraflores', N'019834567')
INSERT [dbo].[CENTRO_SALUD] ([ID], [NOMBRE], [DIRECCIÓN], [TELEFONO]) VALUES (97, N'Centro de Salud San', N'Calle Real 456, San Isidro', N'019812345')
INSERT [dbo].[CENTRO_SALUD] ([ID], [NOMBRE], [DIRECCIÓN], [TELEFONO]) VALUES (98, N'Centro de Salud La', N'Av. La Fontana 789, La Molina', N'019823456')
INSERT [dbo].[CENTRO_SALUD] ([ID], [NOMBRE], [DIRECCIÓN], [TELEFONO]) VALUES (99, N'Centro de Salud Ba', N'Av. Grau 123, Barranco', N'019845678')
INSERT [dbo].[CENTRO_SALUD] ([ID], [NOMBRE], [DIRECCIÓN], [TELEFONO]) VALUES (100, N'Centro de Salud Cho', N'Av. Defensores 456, Chorrillos', N'019856789')
INSERT [dbo].[CENTRO_SALUD] ([ID], [NOMBRE], [DIRECCIÓN], [TELEFONO]) VALUES (101, N'Centro de Salud San', N'Av. Javier Prado 789, San Borja', N'019867890')
INSERT [dbo].[CENTRO_SALUD] ([ID], [NOMBRE], [DIRECCIÓN], [TELEFONO]) VALUES (102, N'Centro de Salud Li', N'Av. Arenales 123, Lince', N'019878901')
INSERT [dbo].[CENTRO_SALUD] ([ID], [NOMBRE], [DIRECCIÓN], [TELEFONO]) VALUES (103, N'Centro de Salud Lima', N'Av. Central 123, Lima', N'012345678')
INSERT [dbo].[CENTRO_SALUD] ([ID], [NOMBRE], [DIRECCIÓN], [TELEFONO]) VALUES (104, N'Centro de Salud Caao', N'Calle Comercio 456, Callao', N'019876543')
INSERT [dbo].[CENTRO_SALUD] ([ID], [NOMBRE], [DIRECCIÓN], [TELEFONO]) VALUES (105, N'Centro de Salud Surc', N'Av. Primavera 789, Surco', N'013456789')
INSERT [dbo].[CENTRO_SALUD] ([ID], [NOMBRE], [DIRECCIÓN], [TELEFONO]) VALUES (106, N'Centro de Salud Mi', N'Av. Pardo 123, Miraflores', N'019834567')
INSERT [dbo].[CENTRO_SALUD] ([ID], [NOMBRE], [DIRECCIÓN], [TELEFONO]) VALUES (107, N'Centro de Salud San', N'Calle Real 456, San Isidro', N'019812345')
INSERT [dbo].[CENTRO_SALUD] ([ID], [NOMBRE], [DIRECCIÓN], [TELEFONO]) VALUES (108, N'Centro de Salud La', N'Av. La Fontana 789, La Molina', N'019823456')
INSERT [dbo].[CENTRO_SALUD] ([ID], [NOMBRE], [DIRECCIÓN], [TELEFONO]) VALUES (109, N'Centro de Salud Ba', N'Av. Grau 123, Barranco', N'019845678')
INSERT [dbo].[CENTRO_SALUD] ([ID], [NOMBRE], [DIRECCIÓN], [TELEFONO]) VALUES (110, N'Centro de Salud Cho', N'Av. Defensores 456, Chorrillos', N'019856789')
INSERT [dbo].[CENTRO_SALUD] ([ID], [NOMBRE], [DIRECCIÓN], [TELEFONO]) VALUES (111, N'Centro de Salud San', N'Av. Javier Prado 789, San Borja', N'019867890')
INSERT [dbo].[CENTRO_SALUD] ([ID], [NOMBRE], [DIRECCIÓN], [TELEFONO]) VALUES (112, N'Centro de Salud Li', N'Av. Arenales 123, Lince', N'019878901')
SET IDENTITY_INSERT [dbo].[CENTRO_SALUD] OFF
GO
SET IDENTITY_INSERT [dbo].[DimCentroSalud] ON 

INSERT [dbo].[DimCentroSalud] ([CentroSaludKey], [CentroSaludID], [Nombre], [Direccion], [Telefono]) VALUES (1, 93, N'Centro de Salud Lima', N'Av. Central 123, Lima', N'012345678')
INSERT [dbo].[DimCentroSalud] ([CentroSaludKey], [CentroSaludID], [Nombre], [Direccion], [Telefono]) VALUES (2, 94, N'Centro de Salud Caao', N'Calle Comercio 456, Callao', N'019876543')
INSERT [dbo].[DimCentroSalud] ([CentroSaludKey], [CentroSaludID], [Nombre], [Direccion], [Telefono]) VALUES (3, 95, N'Centro de Salud Surc', N'Av. Primavera 789, Surco', N'013456789')
INSERT [dbo].[DimCentroSalud] ([CentroSaludKey], [CentroSaludID], [Nombre], [Direccion], [Telefono]) VALUES (4, 96, N'Centro de Salud Mi', N'Av. Pardo 123, Miraflores', N'019834567')
INSERT [dbo].[DimCentroSalud] ([CentroSaludKey], [CentroSaludID], [Nombre], [Direccion], [Telefono]) VALUES (5, 97, N'Centro de Salud San', N'Calle Real 456, San Isidro', N'019812345')
INSERT [dbo].[DimCentroSalud] ([CentroSaludKey], [CentroSaludID], [Nombre], [Direccion], [Telefono]) VALUES (6, 98, N'Centro de Salud La', N'Av. La Fontana 789, La Molina', N'019823456')
INSERT [dbo].[DimCentroSalud] ([CentroSaludKey], [CentroSaludID], [Nombre], [Direccion], [Telefono]) VALUES (7, 99, N'Centro de Salud Ba', N'Av. Grau 123, Barranco', N'019845678')
INSERT [dbo].[DimCentroSalud] ([CentroSaludKey], [CentroSaludID], [Nombre], [Direccion], [Telefono]) VALUES (8, 100, N'Centro de Salud Cho', N'Av. Defensores 456, Chorrillos', N'019856789')
INSERT [dbo].[DimCentroSalud] ([CentroSaludKey], [CentroSaludID], [Nombre], [Direccion], [Telefono]) VALUES (9, 101, N'Centro de Salud San', N'Av. Javier Prado 789, San Borja', N'019867890')
INSERT [dbo].[DimCentroSalud] ([CentroSaludKey], [CentroSaludID], [Nombre], [Direccion], [Telefono]) VALUES (10, 102, N'Centro de Salud Li', N'Av. Arenales 123, Lince', N'019878901')
INSERT [dbo].[DimCentroSalud] ([CentroSaludKey], [CentroSaludID], [Nombre], [Direccion], [Telefono]) VALUES (11, 103, N'Centro de Salud Lima', N'Av. Central 123, Lima', N'012345678')
INSERT [dbo].[DimCentroSalud] ([CentroSaludKey], [CentroSaludID], [Nombre], [Direccion], [Telefono]) VALUES (12, 104, N'Centro de Salud Caao', N'Calle Comercio 456, Callao', N'019876543')
INSERT [dbo].[DimCentroSalud] ([CentroSaludKey], [CentroSaludID], [Nombre], [Direccion], [Telefono]) VALUES (13, 105, N'Centro de Salud Surc', N'Av. Primavera 789, Surco', N'013456789')
INSERT [dbo].[DimCentroSalud] ([CentroSaludKey], [CentroSaludID], [Nombre], [Direccion], [Telefono]) VALUES (14, 106, N'Centro de Salud Mi', N'Av. Pardo 123, Miraflores', N'019834567')
INSERT [dbo].[DimCentroSalud] ([CentroSaludKey], [CentroSaludID], [Nombre], [Direccion], [Telefono]) VALUES (15, 107, N'Centro de Salud San', N'Calle Real 456, San Isidro', N'019812345')
INSERT [dbo].[DimCentroSalud] ([CentroSaludKey], [CentroSaludID], [Nombre], [Direccion], [Telefono]) VALUES (16, 108, N'Centro de Salud La', N'Av. La Fontana 789, La Molina', N'019823456')
INSERT [dbo].[DimCentroSalud] ([CentroSaludKey], [CentroSaludID], [Nombre], [Direccion], [Telefono]) VALUES (17, 109, N'Centro de Salud Ba', N'Av. Grau 123, Barranco', N'019845678')
INSERT [dbo].[DimCentroSalud] ([CentroSaludKey], [CentroSaludID], [Nombre], [Direccion], [Telefono]) VALUES (18, 110, N'Centro de Salud Cho', N'Av. Defensores 456, Chorrillos', N'019856789')
INSERT [dbo].[DimCentroSalud] ([CentroSaludKey], [CentroSaludID], [Nombre], [Direccion], [Telefono]) VALUES (19, 111, N'Centro de Salud San', N'Av. Javier Prado 789, San Borja', N'019867890')
INSERT [dbo].[DimCentroSalud] ([CentroSaludKey], [CentroSaludID], [Nombre], [Direccion], [Telefono]) VALUES (20, 112, N'Centro de Salud Li', N'Av. Arenales 123, Lince', N'019878901')
SET IDENTITY_INSERT [dbo].[DimCentroSalud] OFF
GO
SET IDENTITY_INSERT [dbo].[DimMedico] ON 

INSERT [dbo].[DimMedico] ([MedicoKey], [MedicoID], [Nombre], [Especialidad]) VALUES (1, 1, N'Dr. Juan Perez', N'Cardiología')
INSERT [dbo].[DimMedico] ([MedicoKey], [MedicoID], [Nombre], [Especialidad]) VALUES (2, 2, N'Dra. Ana López', N'Pediatría')
INSERT [dbo].[DimMedico] ([MedicoKey], [MedicoID], [Nombre], [Especialidad]) VALUES (3, 3, N'Dr. Carlos Ruiz', N'Ginecología')
SET IDENTITY_INSERT [dbo].[DimMedico] OFF
GO
SET IDENTITY_INSERT [dbo].[DimPaciente] ON 

INSERT [dbo].[DimPaciente] ([PacienteKey], [PacienteID], [Nombre], [Apellido], [EstadoCivil], [Direccion], [Telefono], [Correo]) VALUES (1, 1, N'María', N'Gonzales', N'Casada', N'Calle Falsa 123, Lima', N'987654321', N'maria.gonzales@example.com')
INSERT [dbo].[DimPaciente] ([PacienteKey], [PacienteID], [Nombre], [Apellido], [EstadoCivil], [Direccion], [Telefono], [Correo]) VALUES (2, 2, N'Juan', N'Perez', N'Soltero', N'Av. Siempreviva 742, Callao', N'987654322', N'juan.perez@example.com')
INSERT [dbo].[DimPaciente] ([PacienteKey], [PacienteID], [Nombre], [Apellido], [EstadoCivil], [Direccion], [Telefono], [Correo]) VALUES (3, 3, N'Ana', N'Ramirez', N'Viuda', N'Calle Los Olivos 456, Surco', N'987654323', N'ana.ramirez@example.com')
INSERT [dbo].[DimPaciente] ([PacienteKey], [PacienteID], [Nombre], [Apellido], [EstadoCivil], [Direccion], [Telefono], [Correo]) VALUES (4, 4, N'Luis', N'Lopez', N'Divorciado', N'Av. Los Angeles 789, Miraflores', N'987654324', N'luis.lopez@example.com')
INSERT [dbo].[DimPaciente] ([PacienteKey], [PacienteID], [Nombre], [Apellido], [EstadoCivil], [Direccion], [Telefono], [Correo]) VALUES (5, 5, N'Carmen', N'Flores', N'Casada', N'Calle Pinos 123, San Isidro', N'987654325', N'carmen.flores@example.com')
INSERT [dbo].[DimPaciente] ([PacienteKey], [PacienteID], [Nombre], [Apellido], [EstadoCivil], [Direccion], [Telefono], [Correo]) VALUES (6, 6, N'Jorge', N'Castro', N'Soltero', N'Av. Sol 456, La Molina', N'987654326', N'jorge.castro@example.com')
INSERT [dbo].[DimPaciente] ([PacienteKey], [PacienteID], [Nombre], [Apellido], [EstadoCivil], [Direccion], [Telefono], [Correo]) VALUES (7, 7, N'Lucia', N'Mendoza', N'Casada', N'Av. Mar 789, Barranco', N'987654327', N'lucia.mendoza@example.com')
INSERT [dbo].[DimPaciente] ([PacienteKey], [PacienteID], [Nombre], [Apellido], [EstadoCivil], [Direccion], [Telefono], [Correo]) VALUES (8, 8, N'Carlos', N'Ortega', N'Divorciado', N'Calle Luna 123, Chorrillos', N'987654328', N'carlos.ortega@example.com')
INSERT [dbo].[DimPaciente] ([PacienteKey], [PacienteID], [Nombre], [Apellido], [EstadoCivil], [Direccion], [Telefono], [Correo]) VALUES (9, 9, N'Rosa', N'Reyes', N'Viuda', N'Av. Cielo 456, San Borja', N'987654329', N'rosa.reyes@example.com')
INSERT [dbo].[DimPaciente] ([PacienteKey], [PacienteID], [Nombre], [Apellido], [EstadoCivil], [Direccion], [Telefono], [Correo]) VALUES (10, 10, N'Pedro', N'Diaz', N'Soltero', N'Calle Estrellas 789, Lince', N'987654330', N'pedro.diaz@example.com')
SET IDENTITY_INSERT [dbo].[DimPaciente] OFF
GO
SET IDENTITY_INSERT [dbo].[PACIENTE] ON 

INSERT [dbo].[PACIENTE] ([ID], [DNI], [nombre], [apellido], [direccion], [telefono], [correo], [estado_civil]) VALUES (1, N'12345678', N'María', N'Gonzales', N'Calle Falsa 123, Lima', N'987654321', N'maria.gonzales@example.com', N'Casada')
INSERT [dbo].[PACIENTE] ([ID], [DNI], [nombre], [apellido], [direccion], [telefono], [correo], [estado_civil]) VALUES (2, N'87654321', N'Juan', N'Perez', N'Av. Siempreviva 742, Callao', N'987654322', N'juan.perez@example.com', N'Soltero')
INSERT [dbo].[PACIENTE] ([ID], [DNI], [nombre], [apellido], [direccion], [telefono], [correo], [estado_civil]) VALUES (3, N'11223344', N'Ana', N'Ramirez', N'Calle Los Olivos 456, Surco', N'987654323', N'ana.ramirez@example.com', N'Viuda')
INSERT [dbo].[PACIENTE] ([ID], [DNI], [nombre], [apellido], [direccion], [telefono], [correo], [estado_civil]) VALUES (4, N'44332211', N'Luis', N'Lopez', N'Av. Los Angeles 789, Miraflores', N'987654324', N'luis.lopez@example.com', N'Divorciado')
INSERT [dbo].[PACIENTE] ([ID], [DNI], [nombre], [apellido], [direccion], [telefono], [correo], [estado_civil]) VALUES (5, N'55667788', N'Carmen', N'Flores', N'Calle Pinos 123, San Isidro', N'987654325', N'carmen.flores@example.com', N'Casada')
INSERT [dbo].[PACIENTE] ([ID], [DNI], [nombre], [apellido], [direccion], [telefono], [correo], [estado_civil]) VALUES (6, N'88776655', N'Jorge', N'Castro', N'Av. Sol 456, La Molina', N'987654326', N'jorge.castro@example.com', N'Soltero')
INSERT [dbo].[PACIENTE] ([ID], [DNI], [nombre], [apellido], [direccion], [telefono], [correo], [estado_civil]) VALUES (7, N'99887766', N'Lucia', N'Mendoza', N'Av. Mar 789, Barranco', N'987654327', N'lucia.mendoza@example.com', N'Casada')
INSERT [dbo].[PACIENTE] ([ID], [DNI], [nombre], [apellido], [direccion], [telefono], [correo], [estado_civil]) VALUES (8, N'66554433', N'Carlos', N'Ortega', N'Calle Luna 123, Chorrillos', N'987654328', N'carlos.ortega@example.com', N'Divorciado')
INSERT [dbo].[PACIENTE] ([ID], [DNI], [nombre], [apellido], [direccion], [telefono], [correo], [estado_civil]) VALUES (9, N'77441122', N'Rosa', N'Reyes', N'Av. Cielo 456, San Borja', N'987654329', N'rosa.reyes@example.com', N'Viuda')
INSERT [dbo].[PACIENTE] ([ID], [DNI], [nombre], [apellido], [direccion], [telefono], [correo], [estado_civil]) VALUES (10, N'33221144', N'Pedro', N'Diaz', N'Calle Estrellas 789, Lince', N'987654330', N'pedro.diaz@example.com', N'Soltero')
SET IDENTITY_INSERT [dbo].[PACIENTE] OFF
GO
SET IDENTITY_INSERT [dbo].[TIPO_REGISTRO] ON 

INSERT [dbo].[TIPO_REGISTRO] ([ID], [NOMBRE], [DETALLE]) VALUES (6, N'Consulta General', N'Consulta médica general')
INSERT [dbo].[TIPO_REGISTRO] ([ID], [NOMBRE], [DETALLE]) VALUES (7, N'Control Prenatal', N'Examen y seguimiento de embarazo')
INSERT [dbo].[TIPO_REGISTRO] ([ID], [NOMBRE], [DETALLE]) VALUES (8, N'Vacunación', N'Administración de vacunas')
INSERT [dbo].[TIPO_REGISTRO] ([ID], [NOMBRE], [DETALLE]) VALUES (9, N'Control de Niño Sano', N'Evaluación periódica de salud infantil')
INSERT [dbo].[TIPO_REGISTRO] ([ID], [NOMBRE], [DETALLE]) VALUES (10, N'Consulta Especial', N'Consulta con especialista')
INSERT [dbo].[TIPO_REGISTRO] ([ID], [NOMBRE], [DETALLE]) VALUES (11, N'Atención de Urgencia', N'Atención de emergencia')
INSERT [dbo].[TIPO_REGISTRO] ([ID], [NOMBRE], [DETALLE]) VALUES (12, N'Control Geriátrico', N'Evaluación de salud para personas mayores')
INSERT [dbo].[TIPO_REGISTRO] ([ID], [NOMBRE], [DETALLE]) VALUES (13, N'Terapia Física', N'Sesiones de fisioterapia')
INSERT [dbo].[TIPO_REGISTRO] ([ID], [NOMBRE], [DETALLE]) VALUES (14, N'Psicología', N'Evaluación y terapia psicológica')
INSERT [dbo].[TIPO_REGISTRO] ([ID], [NOMBRE], [DETALLE]) VALUES (15, N'Nutrición', N'Asesoramiento y control nutricional')
SET IDENTITY_INSERT [dbo].[TIPO_REGISTRO] OFF
GO
SET IDENTITY_INSERT [dbo].[TIPO_VISITA] ON 

INSERT [dbo].[TIPO_VISITA] ([ID], [NOMBRE], [PACIENTE]) VALUES (1, N'Consulta Médica', N'María Gonzales')
INSERT [dbo].[TIPO_VISITA] ([ID], [NOMBRE], [PACIENTE]) VALUES (2, N'Control Prenatal', N'Juan Perez')
INSERT [dbo].[TIPO_VISITA] ([ID], [NOMBRE], [PACIENTE]) VALUES (3, N'Vacunación', N'Ana Ramirez')
INSERT [dbo].[TIPO_VISITA] ([ID], [NOMBRE], [PACIENTE]) VALUES (4, N'Control Niño Sano', N'Luis Lopez')
INSERT [dbo].[TIPO_VISITA] ([ID], [NOMBRE], [PACIENTE]) VALUES (5, N'Consulta Especializada', N'Carmen Flores')
INSERT [dbo].[TIPO_VISITA] ([ID], [NOMBRE], [PACIENTE]) VALUES (6, N'Atención de Urgencia', N'Jorge Castro')
INSERT [dbo].[TIPO_VISITA] ([ID], [NOMBRE], [PACIENTE]) VALUES (7, N'Control Geriátrico', N'Lucia Mendoza')
INSERT [dbo].[TIPO_VISITA] ([ID], [NOMBRE], [PACIENTE]) VALUES (8, N'Terapia Física', N'Carlos Ortega')
INSERT [dbo].[TIPO_VISITA] ([ID], [NOMBRE], [PACIENTE]) VALUES (9, N'Psicología', N'Rosa Reyes')
INSERT [dbo].[TIPO_VISITA] ([ID], [NOMBRE], [PACIENTE]) VALUES (10, N'Nutrición', N'Pedro Diaz')
SET IDENTITY_INSERT [dbo].[TIPO_VISITA] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__PACIENTE__C035B8DDAC293DB7]    Script Date: 14/09/2024 20:03:34 ******/
ALTER TABLE [dbo].[PACIENTE] ADD UNIQUE NONCLUSTERED 
(
	[DNI] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[REGISTRO_SALUD] ADD  DEFAULT (getdate()) FOR [CREATED_AT]
GO
ALTER TABLE [dbo].[VISITA] ADD  DEFAULT (getdate()) FOR [FECHA]
GO
ALTER TABLE [dbo].[DETALLE_VISITA]  WITH CHECK ADD  CONSTRAINT [KF_DATALLE_VISITA] FOREIGN KEY([ID_PACIENTE])
REFERENCES [dbo].[PACIENTE] ([ID])
GO
ALTER TABLE [dbo].[DETALLE_VISITA] CHECK CONSTRAINT [KF_DATALLE_VISITA]
GO
ALTER TABLE [dbo].[DETALLE_VISITA]  WITH CHECK ADD  CONSTRAINT [KF_VISITA_ID] FOREIGN KEY([VISITA_ID])
REFERENCES [dbo].[VISITA] ([ID])
GO
ALTER TABLE [dbo].[DETALLE_VISITA] CHECK CONSTRAINT [KF_VISITA_ID]
GO
ALTER TABLE [dbo].[FactVisitas]  WITH CHECK ADD FOREIGN KEY([CentroSaludKey])
REFERENCES [dbo].[DimCentroSalud] ([CentroSaludKey])
GO
ALTER TABLE [dbo].[FactVisitas]  WITH CHECK ADD FOREIGN KEY([MedicoKey])
REFERENCES [dbo].[DimMedico] ([MedicoKey])
GO
ALTER TABLE [dbo].[FactVisitas]  WITH CHECK ADD FOREIGN KEY([PacienteKey])
REFERENCES [dbo].[DimPaciente] ([PacienteKey])
GO
ALTER TABLE [dbo].[FactVisitas]  WITH CHECK ADD FOREIGN KEY([TiempoKey])
REFERENCES [dbo].[DimTiempo] ([TiempoKey])
GO
ALTER TABLE [dbo].[REGISTRO_SALUD]  WITH CHECK ADD  CONSTRAINT [FK_ID_PACIENTE] FOREIGN KEY([ID_PACIENTE])
REFERENCES [dbo].[VISITA] ([ID])
GO
ALTER TABLE [dbo].[REGISTRO_SALUD] CHECK CONSTRAINT [FK_ID_PACIENTE]
GO
ALTER TABLE [dbo].[REGISTRO_SALUD]  WITH CHECK ADD  CONSTRAINT [FK_SUCURSALES_ID] FOREIGN KEY([SUCURSALES_ID])
REFERENCES [dbo].[CENTRO_SALUD] ([ID])
GO
ALTER TABLE [dbo].[REGISTRO_SALUD] CHECK CONSTRAINT [FK_SUCURSALES_ID]
GO
ALTER TABLE [dbo].[REGISTRO_SALUD]  WITH CHECK ADD  CONSTRAINT [FK_TIPO_REGEISTRO_ID] FOREIGN KEY([TIPO_REGISTRO_ID])
REFERENCES [dbo].[TIPO_REGISTRO] ([ID])
GO
ALTER TABLE [dbo].[REGISTRO_SALUD] CHECK CONSTRAINT [FK_TIPO_REGEISTRO_ID]
GO
ALTER TABLE [dbo].[REGISTRO_SALUD]  WITH CHECK ADD  CONSTRAINT [FK_VISITA] FOREIGN KEY([VISITA])
REFERENCES [dbo].[VISITA] ([ID])
GO
ALTER TABLE [dbo].[REGISTRO_SALUD] CHECK CONSTRAINT [FK_VISITA]
GO
ALTER TABLE [dbo].[VISITA]  WITH CHECK ADD  CONSTRAINT [FK_TIPO_VISITA_ID] FOREIGN KEY([TIPO_VISITA_ID])
REFERENCES [dbo].[TIPO_VISITA] ([ID])
GO
ALTER TABLE [dbo].[VISITA] CHECK CONSTRAINT [FK_TIPO_VISITA_ID]
GO
USE [master]
GO
ALTER DATABASE [dsrp_registro_salud] SET  READ_WRITE 
GO
