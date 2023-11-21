
-- Crear la tabla de Empleados

CREATE TABLE Roles (
    rolId INT AUTO_INCREMENT PRIMARY KEY,
    nombreRol VARCHAR(100)
);


CREATE TABLE Paises (
    paisId INT AUTO_INCREMENT PRIMARY KEY,
    nombrePais VARCHAR(100)
);

CREATE TABLE Empleados (
    empleadoId INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255),
    rolId INT,
    paisId INT,
    fechaInicio DATE,
    salario DECIMAL(10, 2),
    FOREIGN KEY (rolId) REFERENCES Roles(rolId),
    FOREIGN KEY (paisId) REFERENCES Paises(paisId)
);
CREATE TABLE RegistrosHoras (
    registroId INT AUTO_INCREMENT PRIMARY KEY,
    empleadoId INT,
    fecha DATE,
    horasTrabajadas INT,
    FOREIGN KEY (empleadoId) REFERENCES Empleados(empleadoId)
);

-- Crear la tabla de Cargas Sociales por Pais
CREATE TABLE CargasSocialesPorPais (
    cargaId INT AUTO_INCREMENT PRIMARY KEY,
    paisId INT,
    descripcion VARCHAR(255),
    porcentaje DECIMAL(5, 2),
    FOREIGN KEY (paisId) REFERENCES Paises(paisId)
);
