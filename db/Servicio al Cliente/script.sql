-- Table Creation

CREATE TABLE IF NOT EXISTS public.clients (
    clienteid SERIAL PRIMARY KEY,
    nombre VARCHAR(100),
    email VARCHAR(100),
    direccion TEXT,
    telefono VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS public.empleados (
    empleadoid SERIAL PRIMARY KEY,
    nombre VARCHAR(100),
    rol VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS public.orders (
    orderid SERIAL PRIMARY KEY,
    clienteid INTEGER,
    orderdate TIMESTAMP,
    shippingstatus VARCHAR(50),
    FOREIGN KEY (clienteid) REFERENCES public.clients (clienteid)
);

CREATE TABLE IF NOT EXISTS public.consultas (
    consultaid SERIAL PRIMARY KEY,
    clienteid INTEGER,
    empleadoid INTEGER,
    fechahora TIMESTAMP,
    tipoconsulta VARCHAR(50),
    detalle TEXT,
    estado VARCHAR(50),
    FOREIGN KEY (clienteid) REFERENCES public.clients (clienteid),
    FOREIGN KEY (empleadoid) REFERENCES public.empleados (empleadoid)
);

CREATE TABLE IF NOT EXISTS public.seguimientoconsultas (
    seguimientoid SERIAL PRIMARY KEY,
    consultaid INTEGER,
    fechahora TIMESTAMP,
    nota TEXT,
    FOREIGN KEY (consultaid) REFERENCES public.consultas (consultaid)
);

-- Data Insertion

-- Clients
INSERT INTO public.clients (nombre, email, direccion, telefono) VALUES
('Juan Perez', 'juan.perez@example.com', '123 Main St, Ciudad', '123-456-7890'),
('Ana Gomez', 'ana.gomez@example.com', '456 Elm St, Ciudad', '987-654-3210'),
('Luis Morales', 'luis.morales@example.com', '789 Oak St, Ciudad', '555-666-7777'),
('Sofia Cruz', 'sofia.cruz@example.com', '159 Pine St, Ciudad', '321-654-9870'),
('Marco Antonio', 'marco.antonio@example.com', '753 Maple St, Ciudad', '456-789-1230');

-- Employees
INSERT INTO public.empleados (nombre, rol) VALUES
('Carlos Ruiz', 'Agente de Servicio'),
('Maria Fernanda', 'Gerente'),
('Jorge Alonso', 'Especialista de Producto'),
('Lucia Méndez', 'Coordinadora de Servicio'),
('Miguel Ángel', 'Representante de Ventas');

-- Orders
INSERT INTO public.orders (clienteid, orderdate, shippingstatus) VALUES
(1, '2023-11-01 10:00:00', 'Enviado'),
(2, '2023-11-02 11:00:00', 'Procesando'),
(3, '2023-11-03 12:00:00', 'Entregado'),
(4, '2023-11-04 09:30:00', 'Enviado'),
(5, '2023-11-05 08:45:00', 'Cancelado');

-- Consultas
INSERT INTO public.consultas (clienteid, empleadoid, fechahora, tipoconsulta, detalle, estado) VALUES
(1, 1, '2023-11-04 13:00:00', 'Queja', 'Producto defectuoso', 'Abierto'),
(2, 2, '2023-11-05 14:00:00', 'Consulta', 'Consulta sobre garantía', 'Cerrado'),
(3, 3, '2023-11-06 15:00:00', 'Problema', 'Problema con la entrega', 'En Proceso'),
(4, 4, '2023-11-07 10:00:00', 'Consulta', 'Duda sobre producto', 'Resuelto'),
(5, 5, '2023-11-08 11:30:00', 'Queja', 'Retraso en la entrega', 'Abierto');

-- Seguimiento Consultas
INSERT INTO public.seguimientoconsultas (consultaid, fechahora, nota) VALUES
(1, '2023-11-07 16:00:00', 'Llamada al cliente para seguimiento'),
(2, '2023-11-08 17:00:00', 'Respuesta enviada por email'),
(3, '2023-11-09 18:00:00', 'Contacto con la empresa de envíos'),
(4, '2023-11-10 09:15:00', 'Consulta resuelta y cerrada'),
(5, '2023-11-11 10:20:00', 'Seguimiento en proceso');
