-- ENTREGA 3 CURSO CODERHOUSE SQL
-- Estudiante: Nicolás Vera
-- Consignia: 81855

#################################################
#                                               #
#        CORRECCIÓN ENTREGAS ANTERIORES         #
#                                               #
#################################################

## Según lo indicado la entrega anterior, crearé un schema que recopile información sobre una plataforma educativa para estudiantes escolares. 
## En esta serán capaces de comprar distintos tipos de planes, los cuales cada uno aplican una cantidad de beneficios que se consumen al momento de comprarlos (es decir, no tienen una duración específica). 

## Correcciones entrega 1:
## 1. Se cambian los nombres de las tablas a singular ("usuarios -> "usuario", "precios" -> "precio", etc). 
## 2. Se realizó FK única y exclusivamente referenciando a Primary Keys. Adicionalmente, se agrega al inicio del nombre de la variable las letras "fk_" en caso de ser una Foreign Key, para facilitar la identificación del mismo.

## Correciones entrega 2:

## 1. Quitar la fk de pais en la tabla precio, ya que ya está puesta en la tabla pagos
## 2. Se agregará 1 vista, función, store procedure y trigger más. 

##########################################################################
#                                                                        #
#                  PARTE 1:  CREACIÓN DE SCHEMA Y TABLAS                 #
#                                                                        #                                  
##########################################################################

#####################################
#                                   #
#               SCHEMA              #
#                                   #
#####################################


DROP SCHEMA IF EXISTS entrega_3;
CREATE SCHEMA entrega_3;
USE entrega_3;


#####################################
#                                   #
#        CREACIÓN DE TABLAS         #
#                                   #
#####################################

## Tabla  - Planes de estudio 
# Nombre de la tabla: "plan"

CREATE TABLE IF NOT EXISTS plan(
id_plan INT PRIMARY KEY AUTO_INCREMENT,
nombre_plan VARCHAR(20) UNIQUE 
);

##Tabla  - País y Moneda de origen
# nombre de la tabla: pais
CREATE TABLE IF NOT EXISTS pais(
id_pais INT PRIMARY KEY AUTO_INCREMENT,
nombre_pais VARCHAR(30) UNIQUE NOT NULL,
moneda VARCHAR(5) UNIQUE NOT NULL
);


## Tabla - Estudiantes de la plataforma
# Nombre de la tabla: "usuario"
CREATE TABLE IF NOT EXISTS usuario(
id_usuario INT PRIMARY KEY AUTO_INCREMENT,
nombre VARCHAR(30),
apellido VARCHAR(30),
rut INT NOT NULL,
correo VARCHAR(50) NOT NULL UNIQUE, 
fk_id_plan INT,
fk_id_pais INT,
nombre_plan VARCHAR(20), 
FOREIGN KEY (fk_id_plan) REFERENCES plan(id_plan),
FOREIGN KEY (fk_id_pais) REFERENCES pais(id_pais)
);


## Tabla  - Precios de los planes
# Nombre de la tabla: "precio"
CREATE TABLE IF NOT EXISTS precio(
id_precio INT PRIMARY KEY AUTO_INCREMENT,
fk_id_plan INT,
fk_id_pais INT, 
precio INT,
FOREIGN KEY (fk_id_plan) REFERENCES plan(id_plan),
FOREIGN KEY (fk_id_pais) REFERENCES pais(id_pais)
);

## Tabla  - Pagos de clientes
# Nombre de la tabla: "pago"

CREATE TABLE IF NOT EXISTS pago(
id_pago INT PRIMARY KEY AUTO_INCREMENT,
fk_id_usuario INT NOT NULL,
fk_id_precio INT NOT NULL,
precio INT NOT NULL, 
fecha_pago DATE DEFAULT (CURRENT_DATE) NOT NULL,

FOREIGN KEY (fk_id_usuario) REFERENCES usuario(id_usuario),
FOREIGN KEY (fk_id_precio) REFERENCES precio(id_precio)
);

## Tabla - Errores de pago

CREATE TABLE log_error_pago(
id_log INT AUTO_INCREMENT PRIMARY KEY,
id_usuario INT,
id_precio INT,
precio_ingresado INT,
precio_correcto INT,
fecha_error DATE DEFAULT (CURRENT_DATE),
FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario)
);


# Tabla 'log_cambio_correo' para identificar cuando el usuario quiera cambiar su correo en la plataforma

CREATE TABLE IF NOT EXISTS log_cambio_correo (
  id_log INT AUTO_INCREMENT PRIMARY KEY,
  id_usuario INT NOT NULL,
  correo_anterior VARCHAR(50),
  correo_nuevo VARCHAR(50),
  fecha_cambio DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario)
);


##########################################################################
#                                                                        #
#        PARTE 2:  VISTAS, FUNCIONES, STORES PROCEDURES, TRIGGERS        #
#                                                                        #                                  
##########################################################################


#####################################
#                                   #
#               VISTAS              #
#                                   #
#####################################

## VISTA 1: detalle_planes
# Descripción detallada: Tabla que muestra todos los planes con sus monedas respectivas
# Objetivo: Facilitar la consulta de cruce de datos entre las tablas

CREATE VIEW detalle_planes AS
SELECT precio.id_precio,
	   plan.nombre_plan,
       pais.moneda
FROM precio
       LEFT JOIN pais ON precio.fk_id_pais = pais.id_pais
       LEFT JOIN plan ON precio.fk_id_plan = plan.id_plan;     
    
    
# Ejemplo uso Vista
SELECT * FROM detalle_planes;

 
## VISTA 2: ventas_historias_por_plan    
# Descripción detallada: Detalle de las ventas realizadas agrupadas según el id_precio. Se ocupa esta variable debido a las diferencias de montos en moneda (USD, CLP, COP). 
# Objetivo: Ver cual fue el producto que más se vendió en el día actual, para así tomar decisiones para el día siguiente. 

CREATE VIEW ventas_historicas_por_plan AS
SELECT p.id_precio, d.nombre_plan, d.moneda, p.ventas, p.fecha_pago FROM (SELECT 
  subconsulta.id_precio,
  subconsulta.fecha_pago,
  IFNULL(SUM(pago.precio), 0) AS ventas
FROM 
  (SELECT 
      p.id_precio,
      f.fecha_pago
   FROM 
     (SELECT DISTINCT fecha_pago FROM pago WHERE fecha_pago IS NOT NULL) f
   CROSS JOIN 
     (SELECT id_precio FROM precio) p
  ) AS subconsulta
LEFT JOIN pago ON subconsulta.id_precio = pago.fk_id_precio AND subconsulta.fecha_pago = pago.fecha_pago
GROUP BY subconsulta.id_precio, subconsulta.fecha_pago
ORDER BY subconsulta.fecha_pago, subconsulta.id_precio) p
LEFT JOIN detalle_planes d ON p.id_precio = d.id_precio;

# Ejemplo uso Vista

SELECT * from ventas_historicas_por_plan; 

## VISTA 3: venta_usuario_ranking 
# Descripción detallada: Ranking de los usuarios con mayores pagos en la plataforma.
# Objetivo: Identificar a los mejores clientes para ofrecerles beneficios en el futuro.

CREATE VIEW venta_usuario_ranking AS
SELECT u.correo,
SUM(p.precio) AS total_pagado,
MIN(p.fecha_pago) AS primer_pago,
p.moneda
FROM (SELECT 
plan.moneda,
p.*
FROM detalle_planes plan
INNER JOIN pago p ON plan.id_precio = p.fk_id_precio) p
LEFT JOIN usuario u ON p.fk_id_usuario = u.id_usuario
GROUP BY correo,moneda
ORDER BY moneda, total_pagado DESC;


#####################################
#                                   #
#             FUNCIONES             #
#                                   #
#####################################

## FUNCIÓN 1: obtener_nombre
## Descripción detallada: CREARÉ UNA FUNCIÓN QUE ME PERMITA IDENTIFICAR EL NOMBRE COMPLETO DE UN USUARIO INGRESANDO SU NÚMERO DE IDENTIFICACIÓN (RUT)

DELIMITER //

CREATE FUNCTION obtener_nombre(rut_funcion INT)
RETURNS VARCHAR(100)
DETERMINISTIC
BEGIN
	DECLARE nombre_completo VARCHAR(100);
    
    SELECT CONCAT(nombre, ' ', apellido)
    INTO nombre_completo
    FROM usuario
    WHERE rut = rut_funcion;
    
IF nombre_completo IS NULL THEN
	RETURN 'Verificador Nacional no Encontrado';
END IF;

RETURN nombre_completo;
END //

SELECT obtener_nombre(202994520);

DELIMITER ;

## FUNCIÓN 2: total_pagado_por usuario
## Descripción detallada: Quiero ver el total pagado por un usuario específico según su correo.

DELIMITER //

CREATE FUNCTION total_pagado_por_usuario(correo_usuario VARCHAR(50))
RETURNS INT
DETERMINISTIC
READS SQL DATA
BEGIN
	DECLARE total_pagado INT;
    SELECT IFNULL(SUM(p.precio),0)
    INTO total_pagado
    FROM pago p
    INNER JOIN usuario u ON p.fk_id_usuario = u.id_usuario
    WHERE u.correo = correo_usuario;
    
    RETURN total_pagado;
    END //

DELIMITER ;

#Uso de función

SELECT total_pagado_por_usuario('nicolas.vera.gonz@gmail.com');

#####################################
#                                   #
#          STORE PROCEDURES         #
#                                   #
#####################################

## STORE PROCEDURES 1: 
# Objetivo: CREAREMOS UN STORE PROCEDURE QUE MUESTRE LA VISTA DE VENTAS EN UN RANGO EN PARTICULAR
# Descripción Detallada: 

DELIMITER //

CREATE PROCEDURE ventas_por_rango(
IN fecha_inicio DATE,
IN fecha_fin DATE,
IN tipo_moneda VARCHAR(5)
)
BEGIN
SELECT * 
FROM ventas_historicas_por_plan
WHERE fecha_pago BETWEEN fecha_inicio AND fecha_fin 
AND (tipo_moneda IS NULL OR moneda = tipo_moneda);

END //

DELIMITER ;

## Ejemplo uso Store Procedure
CALL ventas_por_rango ('2025-07-13','2025-07-14',NULL);



## STORE PROCEDURE 2: correccion_monto_pago
## Descripción detallada: Procedimiento que permite cambiar el precio registrado en uno de los pagos realizados anteriormente.

DELIMITER //

CREATE PROCEDURE correccion_monto_pago(
IN id_pago_f INT, 
monto_pago_f INT)
BEGIN
UPDATE pago
SET precio = monto_pago_f
WHERE id_pago = id_pago_f;
END;
//

DELIMITER ;

## Ejemplo Uso Store Procedure
CALL correccion_monto_pago(1,1000);
SELECT * from pago WHERE id_pago = 1;


#####################################
#                                   #
#              TRIGGERS             #
#                                   #
#####################################

# TRIGGER 1: validacion_precio
# Descripción: Se valida si el precio que está ingresando en la tabla 'pago' coincide con el que está en ese momento en la tabla 'precio'.
# Los precios pueden ir cambiando durante el tiempo, por lo que no se debe hacer una referencia estricta para el registro de pagos históricos. Por lo mismo, lo mejor es validarlo mediante un trigger. 

DELIMITER //

 CREATE TRIGGER validar_precio_pago
 BEFORE INSERT ON pago
 FOR EACH ROW
 BEGIN
	DECLARE precio_actual INT;
    
    SELECT precio INTO precio_actual
    FROM precio
    WHERE id_precio = new.fk_id_precio
    LIMIT 1;
 
 IF new.precio <> precio_actual THEN
 INSERT INTO log_error_pago(id_usuario,id_precio,precio_ingresado,precio_correcto)
 VALUES (new.fk_id_usuario, new.fk_id_precio, new.precio, precio_actual);
 END IF;
 
 END //
 
 DELIMITER ; 
 
 # TRIGGER 2: trigger_log_cambio_correo
# Descripción: Deja el registro de los cambios de correos que tengan los usuarios, en el caso de querer identificar cambios anteriores
 
DELIMITER //

CREATE TRIGGER trigger_log_cambio_correo
AFTER UPDATE ON usuario
FOR EACH ROW
BEGIN
  IF OLD.correo <> NEW.correo THEN
    INSERT INTO log_cambio_correo (id_usuario, correo_anterior, correo_nuevo)
    VALUES (OLD.id_usuario, OLD.correo, NEW.correo);
  END IF;
END//

DELIMITER ;

## TEST DE TRIGGER
#UPDATE usuario
#SET correo = 'nico@gmail.com'
#WHERE correo = 'nicolas.vera.gonz@gmail.com';
#SELECT * FROM log_cambio_correo;


 