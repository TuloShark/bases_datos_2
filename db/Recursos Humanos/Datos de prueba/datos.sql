-- Additional Roles
INSERT INTO Roles (nombreRol, descripcion) VALUES
('Analista de Datos', 'Analiza y gestiona la información de la empresa'),
('Desarrollador', 'Desarrolla y mantiene sistemas de software'),
('Gerente de Proyectos', 'Gestiona proyectos y equipos');

-- Additional Countries
INSERT INTO Paises (nombrePais, codigoPais) VALUES
('España', 'ES'),
('Argentina', 'AR'),
('Brasil', 'BR');

-- Sample Employees
INSERT INTO InfoPersonal (nombre, fechaNacimiento, direccion, email, telefono) VALUES
('Luisa Martínez', '1988-07-15', 'Barcelona, España', 'luisa.martinez@email.com', '+34 123 456 789'),
('Carlos Gómez', '1992-03-22', 'Buenos Aires, Argentina', 'carlos.gomez@email.com', '+54 11 2345 6789'),
('Ana Souza', '1985-11-30', 'São Paulo, Brasil', 'ana.souza@email.com', '+55 11 98765 4321');

-- Assign Roles and Salaries
INSERT INTO InfoLaboral (empleadoId, rolId, paisId, fechaInicio, salario) VALUES
(4, 5, 4, '2019-09-01', 3700.00),
(5, 6, 5, '2021-02-15', 3200.00),
(6, 7, 6, '2018-06-20', 4000.00);

-- Work Hours for New Employees
INSERT INTO RegistrosHoras (empleadoId, fecha, horasRegulares, horasExtra) VALUES
(4, '2023-11-02', 8, 1),
(5, '2023-11-02', 8, 0),
(6, '2023-11-02', 8, 2);

-- Social Charges for New Countries
INSERT INTO CargasSocialesPorPais (paisId, descripcion, porcentaje) VALUES
(4, 'Seguridad Social Española', 8.30),
(5, 'Sistema de Jubilaciones y Pensiones Argentino', 11.00),
(6, 'Previdência Social Brasileira', 9.00);

-- Insert Roles
INSERT INTO Roles (nombreRol, descripcion) VALUES
('Jefe de Recursos Humanos', 'Encargado de liderar el departamento de RRHH'),
('Generador de Planillas', 'Responsable de la creación y gestión de planillas de pago'),
('Asistente de RRHH', 'Asiste en diversas tareas del departamento de RRHH'),
('Analista de RRHH', 'Analiza datos y estadísticas del personal');

-- Insert Countries
INSERT INTO Paises (nombrePais, codigoPais) VALUES
('Costa Rica', 'CR'),
('Estados Unidos', 'US'),
('México', 'MX');

-- Insert Employee Personal Information
INSERT INTO InfoPersonal (nombre, fechaNacimiento, direccion, email, telefono) VALUES
('Maria Fernández', '1985-04-12', 'San José, Costa Rica', 'maria.fernandez@email.com', '+506 1234 5678'),
('Juan Pérez', '1990-08-25', 'Ciudad de México, México', 'juan.perez@email.com', '+52 55 1234 5678'),
('Emily Johnson', '1982-01-15', 'New York, USA', 'emily.johnson@email.com', '+1 212 123 4567');

-- Insert Employee Job Information
INSERT INTO InfoLaboral (empleadoId, rolId, paisId, fechaInicio, salario) VALUES
(1, 1, 1, '2020-01-10', 4500.00),
(2, 3, 3, '2021-05-15', 3000.00),
(3, 4, 2, '2019-11-01', 5500.00);

-- Insert Work Hours Record
INSERT INTO RegistrosHoras (empleadoId, fecha, horasRegulares, horasExtra) VALUES
(1, '2023-11-01', 8, 2),
(2, '2023-11-01', 8, 0),
(3, '2023-11-01', 8, 1);

-- Insert Social Charges by Country
INSERT INTO CargasSocialesPorPais (paisId, descripcion, porcentaje) VALUES
(1, 'Caja Costarricense de Seguro Social', 9.50),
(2, 'Seguro Social Mexicano', 7.75),
(3, 'Social Security Tax USA', 6.20);

-- Insert more roles
INSERT INTO Roles (nombreRol, descripcion) VALUES
('Especialista en RRHH', 'Especializado en temas de recursos humanos'),
('Técnico de Soporte', 'Encargado de soporte técnico interno y externo'),
('Ejecutivo de Ventas', 'Responsable de la gestión de ventas y clientes');

-- Insert more countries
INSERT INTO Paises (nombrePais, codigoPais) VALUES
('Alemania', 'DE'),
('Canada', 'CA'),
('Japón', 'JP');

-- Insert more employee personal information
INSERT INTO InfoPersonal (nombre, fechaNacimiento, direccion, email, telefono) VALUES
('Sophie Becker', '1990-12-10', 'Berlin, Alemania', 'sophie.becker@email.com', '+49 030 123456'),
('Michael Smith', '1986-05-20', 'Toronto, Canada', 'michael.smith@email.com', '+1 416 123 4567'),
('Haruto Tanaka', '1993-07-30', 'Tokyo, Japón', 'haruto.tanaka@email.com', '+81 3 1234 5678');

-- Assign roles, countries, and salaries to these employees
INSERT INTO InfoLaboral (empleadoId, rolId, paisId, fechaInicio, salario) VALUES
(7, 8, 7, '2020-03-01', 3800.00),
(8, 9, 8, '2022-01-15', 4200.00),
(9, 10, 9, '2021-07-20', 3600.00);

-- Insert work hours for these employees
INSERT INTO RegistrosHoras (empleadoId, fecha, horasRegulares, horasExtra) VALUES
(7, '2023-11-03', 8, 0),
(8, '2023-11-03', 8, 2),
(9, '2023-11-03', 8, 1);

-- Insert social charges for these countries
INSERT INTO CargasSocialesPorPais (paisId, descripcion, porcentaje) VALUES
(7, 'Sozialversicherung', 9.45),
(8, 'Canadian Pension Plan', 8.25),
(9, 'Chinese Pension', 10.00);

