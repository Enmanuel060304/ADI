USE ADI_DB

--Valores de tabla ROLE
INSERT INTO ROLE (ID, NAME)
VALUES (0, 'USER');
INSERT INTO ROLE (ID, NAME)
VALUES (1, 'ADMIN');

--Valores de Tabla Emplead
INSERT  EMPLEADO ( NOMBRE, APELLIDO, EMAIL, TELEFONO, DIRECCION, ID_ROLE)
VALUES ( 'Juan', 'Perez', 'JUAN@gmail.com', '123456789', 'Calle 123', 0);
INSERT  EMPLEADO ( NOMBRE, APELLIDO, EMAIL, TELEFONO, DIRECCION, ID_ROLE)
VALUES ( 'Maria', 'Gomez', 'MARIA@GMAIL.CO', '123456789', 'Calle 123', 0);

--valores tabla cliente
INSERT INTO CLIENTE (ID, NOMBRE, APELLIDO, EMAIL, TELEFONO, DIRECCION)
VALUES (1, 'Juan', 'Martínez', 'juan@example.com', '555-1234', 'Calle Principal 123'),
       (2, 'María', 'García', 'maria@example.com', '555-5678', 'Avenida Central 456'),
       (3, 'Pedro', 'López', 'pedro@example.com', '555-9101', 'Plaza Mayor 789'),
       (4, 'Ana', 'Sánchez', 'ana@example.com', '555-2345', 'Callejón Secreto 12'),
       (5, 'Luis', 'Rodríguez', 'luis@example.com', '555-6789', 'Paseo del Sol 34'),
       (6, 'Laura', 'Fernández', 'laura@example.com', '555-1112', 'Carrera Feliz 56'),
       (7, 'Carlos', 'Pérez', 'carlos@example.com', '555-1314', 'Calle Nueva 78'),
       (8, 'Sofía', 'Díaz', 'sofia@example.com', '555-1516', 'Avenida del Bosque 90'),
       (9, 'Javier', 'Gómez', 'javier@example.com', '555-1718', 'Camino Viejo 23'),
       (10, 'Elena', 'Hernández', 'elena@example.com', '555-1920', 'Ronda Antigua 45'),
       (11, 'Miguel', 'Jiménez', 'miguel@example.com', '555-2122', 'Sendero Nuevo 67'),
       (12, 'Raquel', 'Martín', 'raquel@example.com', '555-2324', 'Paseo del Monte 89'),
       (13, 'David', 'Ruiz', 'david@example.com', '555-2526', 'Callejuela Estrecha 10'),
       (14, 'Carmen', 'Torres', 'carmen@example.com', '555-2728', 'Plaza Vieja 32'),
       (15, 'Pablo', 'Ortega', 'pablo@example.com', '555-2930', 'Cuesta del Cielo 54'),
       (16, 'Isabel', 'Santos', 'isabel@example.com', '555-3132', 'Avenida Principal 76'),
       (17, 'Diego', 'Flores', 'diego@example.com', '555-3334', 'Calle Mayor 98'),
       (18, 'Lucía', 'Vázquez', 'lucia@example.com', '555-3536', 'Ronda Grande 12'),
       (19, 'Andrés', 'Navarro', 'andres@example.com', '555-3738', 'Paseo del Lago 14'),
       (20, 'Beatriz', 'Gutiérrez', 'beatriz@example.com', '555-3940', 'Avenida del Mar 16');

--valores tabla proveedor
INSERT INTO PROVEEDOR (ID, NOMBRE, EMAIL, TELEFONO, DIRECCION)
VALUES (1, 'Juan Martínez', 'juanmartinez@example.com', '555-1000', 'Calle Comercial 123'),
       (2, 'María García', 'mariagarcia@example.com', '555-2000', 'Avenida Industrial 456'),
       (3, 'Pedro López', 'pedrolopez@example.com', '555-3000', 'Carretera Logística 789'),
       (4, 'Ana Sánchez', 'anasanchez@example.com', '555-4000', 'Plaza Empresarial 12'),
       (5, 'Luis Rodríguez', 'luisrodriguez@example.com', '555-5000', 'Calle Fabricación 34');

--VALORES PARA TABLA LINEA
INSERT INTO LINEA (NOMBRE)
VALUES ('Corriente'),
       ('Plata'),
       ('Luxury');

--valores para tabla categoria

-- Categorías para la línea 1
INSERT INTO CATEGORIA (NAME, ID_LINEA)
VALUES ('Diademas', 1),
       ('Pulsera', 1),
       ('Reloj', 1),
       ('Set Completo', 1);

--valores para tabla producto
INSERT INTO PRODUCTO (ID, NOMBRE, PRECIO, STOCK, ID_CATEGORIA)
VALUES (1, 'Collar de plata', 99.99, 100, 1),
       (2, 'Pulsera de oro', 149.99, 80, 2),
       (3, 'Aretes de diamantes', 199.99, 120, 3),
       (4, 'Anillo de compromiso', 299.99, 150, 1),
       (5, 'Broche de perlas', 79.99, 70, 2),
       (6, 'Pendientes de rubíes', 249.99, 90, 3),
       (7, 'Colgante de zafiros', 179.99, 110, 1),
       (8, 'Collar de esmeraldas', 349.99, 130, 2),
       (9, 'Pulsera de plata', 59.99, 160, 3),
       (10, 'Aretes de oro blanco', 199.99, 180, 1),
       (11, 'Anillo de amatista', 129.99, 140, 2),
       (12, 'Collar de diamantes', 499.99, 100, 3),
       (13, 'Broche de oro rosa', 89.99, 120, 1),
       (14, 'Pendientes de perlas', 129.99, 90, 2),
       (15, 'Colgante de turquesa', 159.99, 110, 3),
       (16, 'Pulsera de amatista', 79.99, 70, 1),
       (17, 'Anillo de oro amarillo', 199.99, 130, 2),
       (18, 'Aretes de plata', 49.99, 150, 3),
       (19, 'Colgante de ópalo', 169.99, 70, 1),
       (20, 'Pulsera de rubíes', 249.99, 90, 2);


--valores para tabla venta
INSERT INTO VENTA (ID, ID_CLIENTE, ID_EMPLEADO, FECHA)
VALUES (1, 5, 1, '2024-04-01'),
       (2, 12, 2, '2024-04-02'),
       (3, 8, 1, '2024-04-03'),
       (4, 15, 2, '2024-04-04'),
       (5, 3, 1, '2024-04-05'),
       (6, 18, 2, '2024-04-06'),
       (7, 9, 1, '2024-04-07'),
       (8, 2, 2, '2024-04-08'),
       (9, 11, 1, '2024-04-09'),
       (10, 16, 2, '2024-04-10'),
       (11, 7, 1, '2024-04-11'),
       (12, 20, 2, '2024-04-12'),
       (13, 6, 1, '2024-04-13'),
       (14, 19, 2, '2024-04-14'),
       (15, 10, 1, '2024-04-15'),
       (16, 1, 2, '2024-04-16'),
       (17, 17, 1, '2024-04-17'),
       (18, 4, 2, '2024-04-18'),
       (19, 13, 1, '2024-04-19'),
       (20, 14, 2, '2024-04-20'),
       (21, 5, 1, '2024-04-21'),
       (22, 12, 2, '2024-04-22'),
       (23, 8, 1, '2024-04-23'),
       (24, 15, 2, '2024-04-24'),
       (25, 3, 1, '2024-04-25'),
       (26, 18, 2, '2024-04-26'),
       (27, 9, 1, '2024-04-27'),
       (28, 2, 2, '2024-04-28'),
       (29, 11, 1, '2024-04-29'),
       (30, 16, 2, '2024-04-30');


--valores para tabla compra
INSERT INTO COMPRA (ID, FECHA, ID_PROVEEDOR, Id_EMPLEADO)
VALUES (1, '2024-04-01', 3, 1),
       (2, '2024-04-02', 2, 2),
       (3, '2024-04-03', 1, 1),
       (4, '2024-04-04', 4, 2),
       (5, '2024-04-05', 5, 1),
       (6, '2024-04-06', 3, 2),
       (7, '2024-04-07', 2, 1),
       (8, '2024-04-08', 1, 2),
       (9, '2024-04-09', 4, 1),
       (10, '2024-04-10', 5, 2),
       (11, '2024-04-11', 3, 1),
       (12, '2024-04-12', 2, 2),
       (13, '2024-04-13', 1, 1),
       (14, '2024-04-14', 4, 2),
       (15, '2024-04-15', 5, 1),
       (16, '2024-04-16', 3, 2),
       (17, '2024-04-17', 2, 1),
       (18, '2024-04-18', 1, 2),
       (19, '2024-04-19', 4, 1),
       (20, '2024-04-20', 5, 2),
       (21, '2024-04-21', 3, 1),
       (22, '2024-04-22', 2, 2),
       (23, '2024-04-23', 1, 1),
       (24, '2024-04-24', 4, 2),
       (25, '2024-04-25', 5, 1),
       (26, '2024-04-26', 3, 2),
       (27, '2024-04-27', 2, 1),
       (28, '2024-04-28', 1, 2),
       (29, '2024-04-29', 4, 1),
       (30, '2024-04-30', 5, 2);


--valores para tabla detalle_Venta

Insert into DETALLE_VENTA (ID_VENTA, ID_PRODUCTO, CANTIDAD, PRECIO, DESCRIPCION)
values (1, 1, 1, 99.99, 'Collar de plata'),
       (2, 2, 1, 149.99, 'Pulsera de oro'),
       (3, 3, 1, 199.99, 'Aretes de diamantes'),
       (4, 4, 1, 299.99, 'Anillo de compromiso'),
       (5, 5, 1, 79.99, 'Broche de perlas'),
       (6, 6, 1, 249.99, 'Pendientes de rubíes'),
       (7, 7, 1, 179.99, 'Colgante de zafiros'),
       (8, 8, 1, 349.99, 'Collar de esmeraldas'),
       (9, 9, 1, 59.99, 'Pulsera de plata'),
       (10, 10, 1, 199.99, 'Aretes de oro blanco'),
       (11, 11, 1, 129.99, 'Anillo de amatista'),
       (12, 12, 1, 499.99, 'Collar de diamantes'),
       (13, 13, 1, 89.99, 'Broche de oro rosa'),
       (14, 14, 1, 129.99, 'Pendientes de perlas'),
       (15, 15, 1, 159.99, 'Colgante de turquesa'),
       (16, 16, 1, 79.99, 'Pulsera de amatista'),
       (17, 17, 1, 199.99, 'Anillo de oro amarillo'),
       (18, 18, 1, 49.99, 'Aretes de plata'),
       (19, 19, 1, 169.99, 'Colgante de ópalo'),
       (20, 20, 1, 249.99, 'Pulsera de rubíes');

--valores para tabla detalle_compra
INSERT INTO DETALLE_COMPRA (ID_COMPRA, ID_PRODUCTO, CANTIDAD, PRECIO, DESCRIPCION)
VALUES (1, 1, 1, 99.99, 'Collar de plata'),
       (2, 2, 1, 149.99, 'Pulsera de oro'),
       (3, 3, 1, 199.99, 'Aretes de diamantes'),
       (4, 4, 1, 299.99, 'Anillo de compromiso'),
       (5, 5, 1, 79.99, 'Broche de perlas'),
       (6, 6, 1, 249.99, 'Pendientes de rubíes'),
       (7, 7, 1, 179.99, 'Colgante de zafiros'),
       (8, 8, 1, 349.99, 'Collar de esmeraldas'),
       (9, 9, 1, 59.99, 'Pulsera de plata'),
       (10, 10, 1, 199.99, 'Aretes de oro blanco'),
       (11, 11, 1, 129.99, 'Anillo de amatista'),
       (12, 12, 1, 499.99, 'Collar de diamantes'),
       (13, 13, 1, 89.99, 'Broche de oro rosa'),
       (14, 14, 1, 129.99, 'Pendientes de perlas'),
       (15, 15, 1, 159.99, 'Colgante de turquesa'),
       (16, 16, 1, 79.99, 'Pulsera de amatista'),
       (17, 17, 1, 199.99, 'Anillo de oro amarillo'),
       (18, 18, 1, 49.99, 'Aretes de plata'),
       (19, 19, 1, 169.99, 'Colgante de ópalo'),
       (20, 20, 1, 249.99, 'Pulsera de rubíes');
