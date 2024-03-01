CREATE TABLE Clientes (
    id INT PRIMARY KEY IDENTITY,
    nombre NVARCHAR(100),
    direccion NVARCHAR(255),
    telefono NVARCHAR(20)
);

CREATE TABLE Productos (
    id INT PRIMARY KEY IDENTITY,
    codigo NVARCHAR(10),
    nombre NVARCHAR(100),
    precio_unitario DECIMAL(10, 2)
);

CREATE TABLE Ventas (
    id INT PRIMARY KEY IDENTITY,
    numero NVARCHAR(20),
    fecha DATE,
    total DECIMAL(10, 2),
    cliente_id INT,
    FOREIGN KEY (cliente_id) REFERENCES Clientes(id)
);

CREATE TABLE Ventas_Productos (
    venta_id INT,
    producto_id INT,
    cantidad INT,
    subtotal DECIMAL(10, 2),
    PRIMARY KEY (venta_id, producto_id),
    FOREIGN KEY (venta_id) REFERENCES Ventas(id),
    FOREIGN KEY (producto_id) REFERENCES Productos(id)
);