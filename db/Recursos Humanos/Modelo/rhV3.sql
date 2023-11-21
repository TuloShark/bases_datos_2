-- Enhanced Human Resources Database Schema

-- Roles Table
CREATE TABLE Roles (
    rolId INT AUTO_INCREMENT PRIMARY KEY,
    nombreRol VARCHAR(100) NOT NULL,
    descripcion VARCHAR(255)  -- Additional field for role description
);

-- Countries Table
CREATE TABLE Paises (
    paisId INT AUTO_INCREMENT PRIMARY KEY,
    nombrePais VARCHAR(100) NOT NULL,
    codigoPais CHAR(2)        -- Additional field for country code
);

-- Employee Personal Information Table
CREATE TABLE InfoPersonal (
    empleadoId INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    fechaNacimiento DATE,      -- Additional field for date of birth
    direccion VARCHAR(255),    -- Additional field for address
    email VARCHAR(255),        -- Additional field for email
    telefono VARCHAR(20)       -- Additional field for phone number
);

-- Employee Job Information Table
CREATE TABLE InfoLaboral (
    infoLaboralId INT AUTO_INCREMENT PRIMARY KEY,
    empleadoId INT,
    rolId INT,
    paisId INT,
    fechaInicio DATE NOT NULL,
    salario DECIMAL(10, 2) NOT NULL,
    fechaCreacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,  -- Audit field
    fechaActualizacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,  -- Audit field
    FOREIGN KEY (empleadoId) REFERENCES InfoPersonal(empleadoId),
    FOREIGN KEY (rolId) REFERENCES Roles(rolId),
    FOREIGN KEY (paisId) REFERENCES Paises(paisId)
);

-- Work Hours Record Table
CREATE TABLE RegistrosHoras (
    registroId INT AUTO_INCREMENT PRIMARY KEY,
    empleadoId INT,
    fecha DATE NOT NULL,
    horasRegulares INT DEFAULT 0,
    horasExtra INT DEFAULT 0,   -- Additional field for overtime hours
    FOREIGN KEY (empleadoId) REFERENCES InfoPersonal(empleadoId)
);

-- Social Charges Table by Country
CREATE TABLE CargasSocialesPorPais (
    cargaId INT AUTO_INCREMENT PRIMARY KEY,
    paisId INT,
    descripcion VARCHAR(255) NOT NULL,
    porcentaje DECIMAL(5, 2) NOT NULL,
    FOREIGN KEY (paisId) REFERENCES Paises(paisId)
);

CREATE TABLE PerformanceReviews (
    reviewId INT AUTO_INCREMENT PRIMARY KEY,
    empleadoId INT,
    fechaReview DATE NOT NULL,
    puntuacion INT,
    comentarios TEXT,
    FOREIGN KEY (empleadoId) REFERENCES InfoPersonal(empleadoId)
);

