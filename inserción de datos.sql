--añadiendo data
--centro de salud
INSERT INTO [dbo].[CENTRO_SALUD] (NOMBRE, DIRECCIÓN, TELEFONO)
VALUES
('Centro de Salud Lima', 'Av. Central 123, Lima', '012345678'),
('Centro de Salud Caao', 'Calle Comercio 456, Callao', '019876543'),
('Centro de Salud Surc', 'Av. Primavera 789, Surco', '013456789'),
('Centro de Salud Mi', 'Av. Pardo 123, Miraflores', '019834567'),
('Centro de Salud San', 'Calle Real 456, San Isidro', '019812345'),
('Centro de Salud La', 'Av. La Fontana 789, La Molina', '019823456'),
('Centro de Salud Ba', 'Av. Grau 123, Barranco', '019845678'),
('Centro de Salud Cho', 'Av. Defensores 456, Chorrillos', '019856789'),
('Centro de Salud San', 'Av. Javier Prado 789, San Borja', '019867890'),
('Centro de Salud Li', 'Av. Arenales 123, Lince', '019878901');

--paciente
INSERT INTO [dbo].[PACIENTE] (DNI, nombre, apellido, direccion, telefono, correo, estado_civil)
VALUES
('12345678', 'María', 'Gonzales', 'Calle Falsa 123, Lima', '987654321', 'maria.gonzales@example.com', 'Casada'),
('87654321', 'Juan', 'Perez', 'Av. Siempreviva 742, Callao', '987654322', 'juan.perez@example.com', 'Soltero'),
('11223344', 'Ana', 'Ramirez', 'Calle Los Olivos 456, Surco', '987654323', 'ana.ramirez@example.com', 'Viuda'),
('44332211', 'Luis', 'Lopez', 'Av. Los Angeles 789, Miraflores', '987654324', 'luis.lopez@example.com', 'Divorciado'),
('55667788', 'Carmen', 'Flores', 'Calle Pinos 123, San Isidro', '987654325', 'carmen.flores@example.com', 'Casada'),
('88776655', 'Jorge', 'Castro', 'Av. Sol 456, La Molina', '987654326', 'jorge.castro@example.com', 'Soltero'),
('99887766', 'Lucia', 'Mendoza', 'Av. Mar 789, Barranco', '987654327', 'lucia.mendoza@example.com', 'Casada'),
('66554433', 'Carlos', 'Ortega', 'Calle Luna 123, Chorrillos', '987654328', 'carlos.ortega@example.com', 'Divorciado'),
('77441122', 'Rosa', 'Reyes', 'Av. Cielo 456, San Borja', '987654329', 'rosa.reyes@example.com', 'Viuda'),
('33221144', 'Pedro', 'Diaz', 'Calle Estrellas 789, Lince', '987654330', 'pedro.diaz@example.com', 'Soltero');

--tipo de registro
INSERT INTO [dbo].[TIPO_REGISTRO] (NOMBRE, DETALLE)
VALUES
('Consulta General', 'Consulta médica general'),
('Control Prenatal', 'Examen y seguimiento de embarazo'),
('Vacunación', 'Administración de vacunas'),
('Control de Niño Sano', 'Evaluación periódica de salud infantil'),
('Consulta Especial', 'Consulta con especialista'),
('Atención de Urgencia', 'Atención de emergencia'),
('Control Geriátrico', 'Evaluación de salud para personas mayores'),
('Terapia Física', 'Sesiones de fisioterapia'),
('Psicología', 'Evaluación y terapia psicológica'),
('Nutrición', 'Asesoramiento y control nutricional');

--tipo de visita
INSERT INTO [dbo].[TIPO_VISITA] (NOMBRE, PACIENTE)
VALUES
('Consulta Médica', 'María Gonzales'),
('Control Prenatal', 'Juan Perez'),
('Vacunación', 'Ana Ramirez'),
('Control Niño Sano', 'Luis Lopez'),
('Consulta Especializada', 'Carmen Flores'),
('Atención de Urgencia', 'Jorge Castro'),
('Control Geriátrico', 'Lucia Mendoza'),
('Terapia Física', 'Carlos Ortega'),
('Psicología', 'Rosa Reyes'),
('Nutrición', 'Pedro Diaz');

--visita
INSERT INTO [dbo].[VISITA] (FECHA, TIPO_VISITA_ID, CENTRO_SALUD, ID_PACIENTE, SIGNOS_VITALES, OBSERVACIONES)
VALUES
('2024-08-25', 1, 'Centro de Salud Lima', 1, '120/80', 'Paciente en buen estado'),
('2024-08-26', 2, 'Centro de Salud Callao', 2, '110/70', 'Sin complicaciones'),
('2024-08-27', 3, 'Centro de Salud Surco', 3, '115/75', 'Vacunación completada'),
('2024-08-28', 4, 'Centro de Salud Miraflores', 4, '122/82', 'Desarrollo normal'),
('2024-08-29', 5, 'Centro de Salud San Isidro', 5, '118/76', 'Consulta con especialista'),
('2024-08-30', 6, 'Centro de Salud La Molina', 6, '130/85', 'Atendido en urgencias'),
('2024-08-31', 7, 'Centro de Salud Barranco', 7, '125/80', 'Evaluación geriátrica'),
('2024-09-01', 8, 'Centro de Salud Chorrillos', 8, '110/70', 'Terapia física realizada'),
('2024-09-02', 9, 'Centro de Salud San Borja', 9, '115/75', 'Terapia psicológica iniciada'),
('2024-09-03', 10, 'Centro de Salud Lince', 10, '120/80', 'Asesoramiento nutricional');

--registro de salud
INSERT INTO [dbo].[REGISTRO_SALUD] (TIPO_REGISTRO_ID, VISITA, ID_PACIENTE, SUCURSALES_ID, RESULTADO, PRESIÓN_ARTERIAL, FRECUENCIA, PESO, TRATAMIENTO, CREATED_AT, CREATED_BY)
VALUES
(1, 1, 1, 1, 'Normal', '120/80', '72', '70kg', 'Recomendaciones generales', GETDATE(), 1),
(2, 2, 2, 2, 'Normal', '110/70', '68', '65kg', 'Suplementos vitamínicos', GETDATE(), 2),
(3, 3, 3, 3, 'Vacunado', '115/75', '75', '60kg', 'Seguimiento necesario', GETDATE(), 3),
(4, 4, 4, 4, 'Desarrollo normal', '122/82', '70', '20kg', 'Continuar seguimiento', GETDATE(), 4),
(5, 5, 5, 5, 'Consulta realizada', '118/76', '72', '58kg', 'Tratamiento especializado', GETDATE(), 5),
(6, 6, 6, 6, 'Atención urgente', '130/85', '80', '78kg', 'Monitoreo en urgencias', GETDATE(), 6),
(7, 7, 7, 7, 'Evaluación geriátrica', '125/80', '70', '65kg', 'Recomendaciones para ancianos', GETDATE(), 7),
(8, 8, 8, 8, 'Terapia física', '110/70', '68', '75kg', 'Continuar con sesiones', GETDATE(), 8),
(9, 9, 9, 9, 'Terapia psicológica', '115/75', '72', '60kg', 'Seguimiento psicológico', GETDATE(), 9),
(10, 10, 10, 10, 'Asesoramiento nutricional', '120/80', '72', '80kg', 'Plan nutricional sugerido', GETDATE(), 10);


--detalle de visita
INSERT INTO [dbo].[DETALLE_VISITA] (ID_PACIENTE, VISITA_ID)
VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7)



