## INSERCIÓN DE DATOS ENTREGA 2 ##

#Tabla 'plan'
INSERT INTO plan(id_plan,nombre_plan)
VALUES (NULL,"basic"),(NULL,"lite"),(NULL,"full");

SELECT * FROM plan;

#Tabla 'pais'
INSERT INTO pais(id_pais,nombre_pais,moneda)
VALUES (NULL,"Chile","CLP"),(NULL,"Argentina","USD");

SELECT * FROM pais;

#Tabla 'usuario'
INSERT INTO usuario(id_usuario,nombre,apellido,rut,correo,fk_id_pais,fk_id_plan,nombre_plan)
VALUES(NULL,"Nicolás","Vera",202994520,"nicolas.vera.gonz@gmail.com",1,1,"basic"),
(NULL,"Nigulashi","Vera",123456789,"xuexiao@gmail.com",2,2,"lite"),
(NULL,"Camilo","Gonzalez",987654321,"camilo.gonzalez@gmail.com",1,3,"full"),
(NULL, 'Juan', 'Pérez', 11111111, 'juan.perez1@gmail.com', 1, 1, 'basic'),
(NULL, 'María', 'Gómez', 22222222, 'maria.gomez2@gmail.com', 1, 2, 'lite'),
(NULL, 'Pedro', 'Soto', 33333333, 'pedro.soto3@gmail.com', 1, 3, 'full'),
(NULL, 'Ana', 'Torres', 44444444, 'ana.torres4@gmail.com', 2, 1, 'basic'),
(NULL, 'Luis', 'Muñoz', 55555555, 'luis.munoz5@gmail.com', 2, 2, 'lite'),
(NULL, 'Laura', 'Silva', 66666666, 'laura.silva6@gmail.com', 2, 3, 'full'),
(NULL, 'Carlos', 'Rojas', 77777777, 'carlos.rojas7@gmail.com', 1, 1, 'basic'),
(NULL, 'Valeria', 'Fernández', 88888888, 'valeria.fernandez8@gmail.com', 1, 2, 'lite'),
(NULL, 'Diego', 'López', 99999999, 'diego.lopez9@gmail.com', 1, 3, 'full'),
(NULL, 'Sofía', 'Ramírez', 10101010, 'sofia.ramirez10@gmail.com', 2, 1, 'basic'),
(NULL, 'Matías', 'Castillo', 11111112, 'matias.castillo11@gmail.com', 2, 2, 'lite'),
(NULL, 'Camila', 'Martínez', 12121212, 'camila.martinez12@gmail.com', 2, 3, 'full'),
(NULL, 'Felipe', 'Vega', 13131313, 'felipe.vega13@gmail.com', 1, 1, 'basic'),
(NULL, 'Antonia', 'Herrera', 14141414, 'antonia.herrera14@gmail.com', 1, 2, 'lite'),
(NULL, 'Tomás', 'Navarro', 15151515, 'tomas.navarro15@gmail.com', 1, 3, 'full'),
(NULL, 'Isidora', 'Araya', 16161616, 'isidora.araya16@gmail.com', 2, 1, 'basic'),
(NULL, 'Joaquín', 'Cáceres', 17171717, 'joaquin.caceres17@gmail.com', 2, 2, 'lite'),
(NULL, 'Josefa', 'Fuentes', 18181818, 'josefa.fuentes18@gmail.com', 2, 3, 'full'),
(NULL, 'Ignacio', 'Salas', 19191919, 'ignacio.salas19@gmail.com', 1, 1, 'basic'),
(NULL, 'Fernanda', 'Lagos', 20202020, 'fernanda.lagos20@gmail.com', 1, 2, 'lite'),
(NULL, 'Pablo', 'García', 21212121, 'pablo.garcia21@gmail.com', 1, 3, 'full'),
(NULL, 'Daniela', 'Morales', 22222223, 'daniela.morales22@gmail.com', 2, 1, 'basic'),
(NULL, 'Andrés', 'Espinoza', 23232323, 'andres.espinoza23@gmail.com', 2, 2, 'lite'),
(NULL, 'Francisca', 'Reyes', 24242424, 'francisca.reyes24@gmail.com', 2, 3, 'full'),
(NULL, 'Sebastián', 'Bravo', 25252525, 'sebastian.bravo25@gmail.com', 1, 1, 'basic'),
(NULL, 'Martina', 'Alvarez', 26262626, 'martina.alvarez26@gmail.com', 1, 2, 'lite'),
(NULL, 'Gonzalo', 'Mella', 27272727, 'gonzalo.mella27@gmail.com', 1, 3, 'full'),
(NULL, 'Nicole', 'Bustamante', 28282828, 'nicole.bustamante28@gmail.com', 2, 1, 'basic'),
(NULL, 'Javier', 'Cortés', 29292929, 'javier.cortes29@gmail.com', 2, 2, 'lite'),
(NULL, 'Constanza', 'Saavedra', 30303030, 'constanza.saavedra30@gmail.com', 2, 3, 'full'),
(NULL, 'Álvaro', 'Paredes', 31313131, 'alvaro.paredes31@gmail.com', 1, 1, 'basic'),
(NULL, 'Cecilia', 'Godoy', 32323232, 'cecilia.godoy32@gmail.com', 1, 2, 'lite'),
(NULL, 'Benjamín', 'Zúñiga', 33333333, 'benjamin.zuniga33@gmail.com', 1, 3, 'full'),
(NULL, 'Pamela', 'Figueroa', 34343434, 'pamela.figueroa34@gmail.com', 2, 1, 'basic'),
(NULL, 'Cristóbal', 'Toro', 35353535, 'cristobal.toro35@gmail.com', 2, 2, 'lite'),
(NULL, 'Emilia', 'Sánchez', 36363636, 'emilia.sanchez36@gmail.com', 2, 3, 'full'),
(NULL, 'Leonardo', 'Delgado', 37373737, 'leonardo.delgado37@gmail.com', 1, 1, 'basic'),
(NULL, 'Romina', 'Campos', 38383838, 'romina.campos38@gmail.com', 1, 2, 'lite'),
(NULL, 'Mauricio', 'Tapia', 39393939, 'mauricio.tapia39@gmail.com', 1, 3, 'full'),
(NULL, 'Paula', 'Meza', 40404040, 'paula.meza40@gmail.com', 2, 1, 'basic'),
(NULL, 'Rodrigo', 'Aguirre', 41414141, 'rodrigo.aguirre41@gmail.com', 2, 2, 'lite'),
(NULL, 'Verónica', 'Carrasco', 42424242, 'veronica.carrasco42@gmail.com', 2, 3, 'full'),
(NULL, 'Esteban', 'Orellana', 43434343, 'esteban.orellana43@gmail.com', 1, 1, 'basic'),
(NULL, 'Natalia', 'Salinas', 44444444, 'natalia.salinas44@gmail.com', 1, 2, 'lite'),
(NULL, 'Ricardo', 'Leiva', 45454545, 'ricardo.leiva45@gmail.com', 1, 3, 'full'),
(NULL, 'Karla', 'Moraga', 46464646, 'karla.moraga46@gmail.com', 2, 1, 'basic'),
(NULL, 'Felipe', 'Henríquez', 47474747, 'felipe.henriquez47@gmail.com', 2, 2, 'lite'),
(NULL, 'Daniel', 'Barrientos', 48484848, 'daniel.barrientos48@gmail.com', 2, 3, 'full'),
(NULL, 'Mónica', 'Navarrete', 49494949, 'monica.navarrete49@gmail.com', 1, 1, 'basic'),
(NULL, 'Gabriel', 'Yáñez', 50505050, 'gabriel.yanez50@gmail.com', 1, 2, 'lite');

SELECT * FROM usuario;

#Tabla 'precio'

INSERT INTO precio(id_precio,fk_id_plan,fk_id_pais,precio)
VALUES  (NULL,1,1,25000),
		(NULL,2,1,50000),
        (NULL,3,1,100000),
        (NULL,1,2,30),
        (NULL,2,2,60),
        (NULL,3,2,120);

SELECT * FROM precio;

#Tabla 'pago'

INSERT INTO pago(id_pago,fk_id_usuario,fk_id_precio,precio,fecha_pago)
VALUES(NULL,1,1,25000,'2025-07-12'),
(NULL,1,1,25000,'2025-07-13'),
(NULL,2,6,120,'2025-07-13'),
(NULL,3,2,50000,'2025-07-14'),
(NULL, 1, 1, 25000, '2025-07-01'),
(NULL, 2, 2, 50000, '2025-07-02'),
(NULL, 3, 3, 100000, '2025-07-03'),
(NULL, 4, 4, 30, '2025-07-04'),
(NULL, 5, 5, 60, '2025-07-05'),
(NULL, 6, 6, 120, '2025-07-06'),
(NULL, 7, 1, 25000, '2025-07-07'),
(NULL, 8, 2, 50000, '2025-07-08'),
(NULL, 9, 3, 100000, '2025-07-09'),
(NULL, 10, 4, 30, '2025-07-10'),
(NULL, 11, 5, 60, '2025-07-11'),
(NULL, 12, 6, 120, '2025-07-12'),
(NULL, 13, 1, 25000, '2025-07-13'),
(NULL, 14, 2, 50000, '2025-07-14'),
(NULL, 15, 3, 100000, '2025-07-15'),
(NULL, 16, 4, 30, '2025-07-16'),
(NULL, 17, 5, 60, '2025-07-17'),
(NULL, 18, 6, 120, '2025-07-18'),
(NULL, 19, 1, 25000, '2025-07-19'),
(NULL, 20, 2, 50000, '2025-07-20'),
(NULL, 21, 3, 100000, '2025-07-21'),
(NULL, 22, 4, 30, '2025-07-22'),
(NULL, 23, 5, 60, '2025-07-23'),
(NULL, 24, 6, 120, '2025-07-24'),
(NULL, 25, 1, 25000, '2025-07-25'),
(NULL, 26, 2, 50000, '2025-07-26'),
(NULL, 27, 3, 100000, '2025-07-27'),
(NULL, 28, 4, 30, '2025-07-28'),
(NULL, 29, 5, 60, '2025-07-29'),
(NULL, 30, 6, 120, '2025-07-30'),
(NULL, 31, 1, 25000, '2025-07-31'),
(NULL, 32, 2, 50000, '2025-07-31'),
(NULL, 33, 3, 100000, '2025-07-31'),
(NULL, 34, 4, 30, '2025-07-31'),
(NULL, 35, 5, 60, '2025-07-31'),
(NULL, 36, 6, 120, '2025-07-31'),
(NULL, 37, 1, 25000, '2025-07-31'),
(NULL, 38, 2, 50000, '2025-07-31'),
(NULL, 39, 3, 100000, '2025-07-31'),
(NULL, 40, 4, 30, '2025-07-31'),
(NULL, 41, 5, 60, '2025-07-31'),
(NULL, 42, 6, 120, '2025-07-31'),
(NULL, 43, 1, 25000, '2025-07-31'),
(NULL, 44, 2, 50000, '2025-07-31'),
(NULL, 45, 3, 100000, '2025-07-31'),
(NULL, 46, 4, 30, '2025-07-31'),
(NULL, 47, 5, 60, '2025-07-31'),
(NULL, 48, 6, 120, '2025-07-31'),
(NULL, 49, 1, 25000, '2025-07-31'),
(NULL, 50, 2, 50000, '2025-07-31');

SELECT * from pago;


# Tabla 'log_error_pago' activando el trigger creado en el script 'entrega_2'
 
 INSERT INTO pago(id_pago,fk_id_usuario,fk_id_precio,precio,fecha_pago)
 VALUES (NULL,1,1,99000,'2025-07-12');

SELECT * FROM log_error_pago;
 
 


