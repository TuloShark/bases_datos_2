-- Crear la tabla de Bodegas
CREATE TABLE Bodegas (
    bodegaId INT IDENTITY PRIMARY KEY,
    nombre NVARCHAR(100),
    ubicacion NVARCHAR(100)
);

-- Crear la tabla de Afinidades
CREATE TABLE Afinidades (
    afinidadId INT IDENTITY PRIMARY KEY,
    descripcion NVARCHAR(100)
);

-- Crear la tabla de Empleados
CREATE TABLE Empleados (
    empleadoId INT IDENTITY PRIMARY KEY,
    nombre NVARCHAR(100),
    rol NVARCHAR(50),
    salario DECIMAL(10, 2),
    moneda NVARCHAR(3),
    bodegaId INT,
    FOREIGN KEY (bodegaId) REFERENCES Bodegas(bodegaId)
);

-- Crear la tabla de Productos
CREATE TABLE Productos (
    productoId INT IDENTITY PRIMARY KEY,
    nombre NVARCHAR(100),
    descripcion NVARCHAR(255),
    cantidad INT,
    afinidadId INT,
    FOREIGN KEY (afinidadId) REFERENCES Afinidades(afinidadId)
);

-- Inserción de Afinidades en la tabla
INSERT INTO Afinidades (descripcion) VALUES ('electronica');
INSERT INTO Afinidades (descripcion) VALUES ('ropa');
INSERT INTO Afinidades (descripcion) VALUES ('alimentos');
INSERT INTO Afinidades (descripcion) VALUES ('hogar');
INSERT INTO Afinidades (descripcion) VALUES ('ferreteria');
INSERT INTO Afinidades (descripcion) VALUES ('juguetes');
INSERT INTO Afinidades (descripcion) VALUES ('libros');
INSERT INTO Afinidades (descripcion) VALUES ('deportes');
INSERT INTO Afinidades (descripcion) VALUES ('automotriz');

-- Bodegas
INSERT INTO Bodegas (nombre, ubicacion) VALUES ('Bodega Norte', 'Norteamerica');
INSERT INTO Bodegas (nombre, ubicacion) VALUES ('Bodega Sur', 'Suramerica');
INSERT INTO Bodegas (nombre, ubicacion) VALUES ('Bodega Caribe', 'Islas del Caribe');

-- Empleados en Bodega Norte
INSERT INTO Empleados (nombre, rol, salario, moneda, bodegaId) VALUES ('Juan Perez', 'bodeguero', 3000.00, 'USD', 1);
INSERT INTO Empleados (nombre, rol, salario, moneda, bodegaId) VALUES ('Ana Gomez', 'jefe de logistica', 4500.00, 'USD', 1);
-- Productos en Bodega Norte
INSERT INTO Productos (nombre, descripcion, cantidad, afinidadId) VALUES ('laptop hp', 'laptop hp modelo x123', 40, 1);
INSERT INTO Productos (nombre, descripcion, cantidad, afinidadId) VALUES ('tijeras', 'tijeras negras', 100, 5);

-- Empleados en Bodega Sur
INSERT INTO Empleados (nombre, rol, salario, moneda, bodegaId) VALUES ('Carlos Ruiz', 'bodeguero', 2500.00, 'COP', 2);
INSERT INTO Empleados (nombre, rol, salario, moneda, bodegaId) VALUES ('Luisa Martinez', 'jefe de bodega', 4000.00, 'COP', 2);
-- Productos en Bodega Sur
INSERT INTO Productos (nombre, descripcion, cantidad, afinidadId) VALUES ('smartphone samsung', 'smartphone samsung galaxy s10', 30, 1);
INSERT INTO Productos (nombre, descripcion, cantidad, afinidadId) VALUES ('jeans levi', 'jeans levi talla 32', 100, 2);

-- Empleados en Bodega Caribe
INSERT INTO Empleados (nombre, rol, salario, moneda, bodegaId) VALUES ('Marcos Diaz', 'bodeguero', 3500.00, 'EUR', 3);
INSERT INTO Empleados (nombre, rol, salario, moneda, bodegaId) VALUES ('Sofia Castro', 'administrativo', 3000.00, 'EUR', 3);
-- Productos en Bodega Caribe
INSERT INTO Productos (nombre, descripcion, cantidad, afinidadId) VALUES ('tablet apple', 'tablet apple ipad 10 pulgadas', 20, 1);
INSERT INTO Productos (nombre, descripcion, cantidad, afinidadId) VALUES ('gorra', 'gorra de beisbol', 200, 2);



