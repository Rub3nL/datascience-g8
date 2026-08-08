
CREATE SCHEMA IN NOT EXISTS tienda;

USE tienda;

SHOW TABLES;


CREATE TABLE IF NOT EXISTS tienda.categorias (
    id      INT     NOT NULL,
    nombre  STRING  NOT NULL
);

CREATE TABLE IF NOT EXISTS tienda.productos (
    id      INT     NOT NULL,
    nombre  STRING  NOT NULL,
    precio  NUMERIC NOT NULL,
    stock   INT,
    categoria_id INT  NOT NULL
);

CREATE TABLE IF NOT EXISTS detalle_pedidos (
    pedido_id INT NOT NULL,
    producto_id INT NOT NULL,
    cantidad INT,
    precio_unit NUMERIC
);

CREATE TABLE IF NOT EXISTS pedidos (
    id INT NOT NULL,
    cliente_id INT NOT NULL,
    fecha DATE,
    total NUMERIC
);

CREATE TABLE IF NOT EXISTS clientes (
    id INT NOT NULL,
    nombre STRING NOT NULL,
    email STRING,
    pais STRING,
    telefono STRING
);


INSERT INTO categorias (id, nombre) VALUES
(1,'Electricidad'),
(2,,'Ropa'),
(3,'Hogar'),
(4,'Deportes'),
(5,'Juguetes');

INSERT INTO clientes (id, nombre, email, pais, telefono) VALUES
  (1,  'Ana López',       'ana.lopez@gmail.com',      'ES', '600111222'),
  (2,  'Luis Paz',        'luis.paz@mail.com',        'MX', NULL),
  (3,  'Marta Ruiz',      'marta.ruiz@gmail.com',     'ES', '600333444'),
  (4,  'Carlos Gómez',    'carlos.gomez@empresa.com', 'AR', '1155667788'),
  (5,  'Lucía Fernández', 'lucia.fdez@mail.com',      'ES', NULL),
  (6,  'Diego Torres',    'diego.torres@mail.com',    'MX', '5544332211'),
  (7,  'Sofía Herrera',   'sofia.herrera@gmail.com',  'CO', '3001234567'),
  (8,  'Pedro Sánchez',   'pedro.sanchez@mail.com',   'CL', '987654321'),
  (9,  'Elena Navarro',   'elena.navarro@mail.com',   'ES', '600555666'),  -- sin pedidos (LEFT JOIN)
  (10, 'Javier Molina',   'javier.molina@mail.com',   'AR', NULL);         -- sin pedidos (LEFT JOIN)

INSERT INTO productos (id, nombre, precio, stock, categoria_id) VALUES
  (1,  'Portátil 14 pulgadas',  899.00, 15,  1),
  (2,  'Auriculares Bluetooth',  59.90, 80,  1),
  (3,  'Smartphone X',          649.00, 25,  1),
  (4,  'Camiseta básica',        12.50, 200, 2),
  (5,  'Vaqueros clásicos',      39.95, 120, 2),
  (6,  'Chaqueta de invierno',   89.00, 40,  2),
  (7,  'Cafetera italiana',      24.90, 60,  3),
  (8,  'Lámpara de escritorio',  18.50, 75,  3),
  (9,  'Bicicleta urbana',      320.00, 10,  4),
  (10, 'Balón de fútbol',        15.99, 150, 4),
  (11, 'Puzzle 1000 piezas',      9.99, 90,  5),
  (12, 'Tarjeta regalo',         25.00, 999, NULL);  -- sin categoría a propósito

INSERT INTO pedidos (id, cliente_id, fecha, total) VALUES
  (1,  1, DATE'2019-05-12', 958.90),
  (2,  2, DATE'2020-03-08',  64.95),
  (3,  1, DATE'2020-11-30',  24.90),
  (4,  3, DATE'2021-02-14', 649.00),
  (5,  4, DATE'2021-07-01',  57.96),
  (6,  2, DATE'2022-01-20', 101.50),
  (7,  5, DATE'2022-06-05', 320.00),
  (8,  6, DATE'2022-09-17',  61.90),
  (9,  3, DATE'2023-03-03',  50.00),
  (10, 7, DATE'2023-08-22',  84.90),
  (11, 1, DATE'2024-04-10', 708.90),
  (12, 8, DATE'2024-10-05',  41.97),
  (13, 5, DATE'2025-01-15',  52.45),
  (14, 6, DATE'2025-05-30', 899.00),
  (15, 7, DATE'2025-12-02',  68.30),
  (16, 4, DATE'2026-03-18', 335.99);

INSERT INTO detalle_pedidos (pedido_id, producto_id, cantidad, precio_unit) VALUES
  (1,  1,  1, 899.00),
  (1,  2,  1,  59.90),
  (2,  4,  2,  12.50),
  (2,  5,  1,  39.95),
  (3,  7,  1,  24.90),
  (4,  3,  1, 649.00),
  (5,  10, 3,  15.99),
  (5,  11, 1,   9.99),
  (6,  6,  1,  89.00),
  (6,  4,  1,  12.50),
  (7,  9,  1, 320.00),
  (8,  8,  2,  18.50),
  (8,  7,  1,  24.90),
  (9,  4,  4,  12.50),
  (10, 2,  1,  59.90),
  (10, 12, 1,  25.00),
  (11, 3,  1, 649.00),
  (11, 2,  1,  59.90),
  (12, 11, 1,   9.99),
  (12, 10, 2,  15.99),
  (13, 5,  1,  39.95),
  (13, 4,  1,  12.50),
  (14, 1,  1, 899.00),
  (15, 7,  2,  24.90),
  (15, 8,  1,  18.50),
  (16, 9,  1, 320.00),
  (16, 10, 1,  15.99);




ENTREGABLE_2

FILE > EXPORT > IPYTHON NOTEBOOK < SUBIR A GIT HUB

SEMANA 5


ALTER TABLE productos ALTER COLUMN categoria_id DROP NOT NULL;

-- permite agregar un campo
ALTER TABLE clientes set TBLPROPERTIES ('delta.ColumnMapping.mode' = 'name')
ALTER TABLE clientes ADD COLUMN(
    dni STRING NOT NULL
);

SHOW TABLES;


DELETE FROM categorias 
WHERE id = 4;

SELECT * 
FROM categorias;

UPDATE categorias 
SET nombre = 'Electrónicay  videojuegos' 
WHERE id = 1;

SELECT * 
FROM categorias;

DESCRIBE HISTORY categorias;
SELECT * FROM categorias VERSION AS OF 2;

RESTORE TABLE categorias TO VERSION AS OF 2;

SELECT *
FROM productos;

SELECT nombre, stock
FROM productos;

SELECT 
  nombre AS producto, 
  precio * stock  AS precio_total_stock
FROM productos;

SELECT *
FROM productos
WHERE id > 5;

SELECT *
FROM productos
WHERE precio <> 40;

SELECT *
FROM productos
WHERE precio IN (25,60);

SELECT *
FROM productos
BETWEEN 10 AND 50;

SELECT *
FROM clientes
WHERE email like '%@empresa%'