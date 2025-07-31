CREATE DATABASE  IF NOT EXISTS `entrega_3` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `entrega_3`;
-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: localhost    Database: entrega_3
-- ------------------------------------------------------
-- Server version	8.0.42

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Temporary view structure for view `detalle_planes`
--

DROP TABLE IF EXISTS `detalle_planes`;
/*!50001 DROP VIEW IF EXISTS `detalle_planes`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `detalle_planes` AS SELECT 
 1 AS `id_precio`,
 1 AS `nombre_plan`,
 1 AS `moneda`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `log_cambio_correo`
--

DROP TABLE IF EXISTS `log_cambio_correo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log_cambio_correo` (
  `id_log` int NOT NULL AUTO_INCREMENT,
  `id_usuario` int NOT NULL,
  `correo_anterior` varchar(50) DEFAULT NULL,
  `correo_nuevo` varchar(50) DEFAULT NULL,
  `fecha_cambio` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_log`),
  KEY `id_usuario` (`id_usuario`),
  CONSTRAINT `log_cambio_correo_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_cambio_correo`
--

LOCK TABLES `log_cambio_correo` WRITE;
/*!40000 ALTER TABLE `log_cambio_correo` DISABLE KEYS */;
/*!40000 ALTER TABLE `log_cambio_correo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_error_pago`
--

DROP TABLE IF EXISTS `log_error_pago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log_error_pago` (
  `id_log` int NOT NULL AUTO_INCREMENT,
  `id_usuario` int DEFAULT NULL,
  `id_precio` int DEFAULT NULL,
  `precio_ingresado` int DEFAULT NULL,
  `precio_correcto` int DEFAULT NULL,
  `fecha_error` date DEFAULT (curdate()),
  PRIMARY KEY (`id_log`),
  KEY `id_usuario` (`id_usuario`),
  CONSTRAINT `log_error_pago_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_error_pago`
--

LOCK TABLES `log_error_pago` WRITE;
/*!40000 ALTER TABLE `log_error_pago` DISABLE KEYS */;
INSERT INTO `log_error_pago` VALUES (1,1,1,99000,25000,'2025-07-31');
/*!40000 ALTER TABLE `log_error_pago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pago`
--

DROP TABLE IF EXISTS `pago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pago` (
  `id_pago` int NOT NULL AUTO_INCREMENT,
  `fk_id_usuario` int NOT NULL,
  `fk_id_precio` int NOT NULL,
  `precio` int NOT NULL,
  `fecha_pago` date NOT NULL DEFAULT (curdate()),
  PRIMARY KEY (`id_pago`),
  KEY `fk_id_usuario` (`fk_id_usuario`),
  KEY `fk_id_precio` (`fk_id_precio`),
  CONSTRAINT `pago_ibfk_1` FOREIGN KEY (`fk_id_usuario`) REFERENCES `usuario` (`id_usuario`),
  CONSTRAINT `pago_ibfk_2` FOREIGN KEY (`fk_id_precio`) REFERENCES `precio` (`id_precio`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pago`
--

LOCK TABLES `pago` WRITE;
/*!40000 ALTER TABLE `pago` DISABLE KEYS */;
INSERT INTO `pago` VALUES (1,1,1,25000,'2025-07-12'),(2,1,1,25000,'2025-07-13'),(3,2,6,120,'2025-07-13'),(4,3,2,50000,'2025-07-14'),(5,1,1,25000,'2025-07-01'),(6,2,2,50000,'2025-07-02'),(7,3,3,100000,'2025-07-03'),(8,4,4,30,'2025-07-04'),(9,5,5,60,'2025-07-05'),(10,6,6,120,'2025-07-06'),(11,7,1,25000,'2025-07-07'),(12,8,2,50000,'2025-07-08'),(13,9,3,100000,'2025-07-09'),(14,10,4,30,'2025-07-10'),(15,11,5,60,'2025-07-11'),(16,12,6,120,'2025-07-12'),(17,13,1,25000,'2025-07-13'),(18,14,2,50000,'2025-07-14'),(19,15,3,100000,'2025-07-15'),(20,16,4,30,'2025-07-16'),(21,17,5,60,'2025-07-17'),(22,18,6,120,'2025-07-18'),(23,19,1,25000,'2025-07-19'),(24,20,2,50000,'2025-07-20'),(25,21,3,100000,'2025-07-21'),(26,22,4,30,'2025-07-22'),(27,23,5,60,'2025-07-23'),(28,24,6,120,'2025-07-24'),(29,25,1,25000,'2025-07-25'),(30,26,2,50000,'2025-07-26'),(31,27,3,100000,'2025-07-27'),(32,28,4,30,'2025-07-28'),(33,29,5,60,'2025-07-29'),(34,30,6,120,'2025-07-30'),(35,31,1,25000,'2025-07-31'),(36,32,2,50000,'2025-07-31'),(37,33,3,100000,'2025-07-31'),(38,34,4,30,'2025-07-31'),(39,35,5,60,'2025-07-31'),(40,36,6,120,'2025-07-31'),(41,37,1,25000,'2025-07-31'),(42,38,2,50000,'2025-07-31'),(43,39,3,100000,'2025-07-31'),(44,40,4,30,'2025-07-31'),(45,41,5,60,'2025-07-31'),(46,42,6,120,'2025-07-31'),(47,43,1,25000,'2025-07-31'),(48,44,2,50000,'2025-07-31'),(49,45,3,100000,'2025-07-31'),(50,46,4,30,'2025-07-31'),(51,47,5,60,'2025-07-31'),(52,48,6,120,'2025-07-31'),(53,49,1,25000,'2025-07-31'),(54,50,2,50000,'2025-07-31'),(55,1,1,99000,'2025-07-12');
/*!40000 ALTER TABLE `pago` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `validar_precio_pago` BEFORE INSERT ON `pago` FOR EACH ROW BEGIN
	DECLARE precio_actual INT;
    
    SELECT precio INTO precio_actual
    FROM precio
    WHERE id_precio = new.fk_id_precio
    LIMIT 1;
 
 IF new.precio <> precio_actual THEN
 INSERT INTO log_error_pago(id_usuario,id_precio,precio_ingresado,precio_correcto)
 VALUES (new.fk_id_usuario, new.fk_id_precio, new.precio, precio_actual);
 END IF;
 
 END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `pais`
--

DROP TABLE IF EXISTS `pais`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pais` (
  `id_pais` int NOT NULL AUTO_INCREMENT,
  `nombre_pais` varchar(30) NOT NULL,
  `moneda` varchar(5) NOT NULL,
  PRIMARY KEY (`id_pais`),
  UNIQUE KEY `nombre_pais` (`nombre_pais`),
  UNIQUE KEY `moneda` (`moneda`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pais`
--

LOCK TABLES `pais` WRITE;
/*!40000 ALTER TABLE `pais` DISABLE KEYS */;
INSERT INTO `pais` VALUES (1,'Chile','CLP'),(2,'Argentina','USD');
/*!40000 ALTER TABLE `pais` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plan`
--

DROP TABLE IF EXISTS `plan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plan` (
  `id_plan` int NOT NULL AUTO_INCREMENT,
  `nombre_plan` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_plan`),
  UNIQUE KEY `nombre_plan` (`nombre_plan`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plan`
--

LOCK TABLES `plan` WRITE;
/*!40000 ALTER TABLE `plan` DISABLE KEYS */;
INSERT INTO `plan` VALUES (1,'basic'),(3,'full'),(2,'lite');
/*!40000 ALTER TABLE `plan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `precio`
--

DROP TABLE IF EXISTS `precio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `precio` (
  `id_precio` int NOT NULL AUTO_INCREMENT,
  `fk_id_plan` int DEFAULT NULL,
  `fk_id_pais` int DEFAULT NULL,
  `precio` int DEFAULT NULL,
  PRIMARY KEY (`id_precio`),
  KEY `fk_id_plan` (`fk_id_plan`),
  KEY `fk_id_pais` (`fk_id_pais`),
  CONSTRAINT `precio_ibfk_1` FOREIGN KEY (`fk_id_plan`) REFERENCES `plan` (`id_plan`),
  CONSTRAINT `precio_ibfk_2` FOREIGN KEY (`fk_id_pais`) REFERENCES `pais` (`id_pais`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `precio`
--

LOCK TABLES `precio` WRITE;
/*!40000 ALTER TABLE `precio` DISABLE KEYS */;
INSERT INTO `precio` VALUES (1,1,1,25000),(2,2,1,50000),(3,3,1,100000),(4,1,2,30),(5,2,2,60),(6,3,2,120);
/*!40000 ALTER TABLE `precio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `id_usuario` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) DEFAULT NULL,
  `apellido` varchar(30) DEFAULT NULL,
  `rut` int NOT NULL,
  `correo` varchar(50) NOT NULL,
  `fk_id_plan` int DEFAULT NULL,
  `fk_id_pais` int DEFAULT NULL,
  `nombre_plan` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `correo` (`correo`),
  KEY `fk_id_plan` (`fk_id_plan`),
  KEY `fk_id_pais` (`fk_id_pais`),
  CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`fk_id_plan`) REFERENCES `plan` (`id_plan`),
  CONSTRAINT `usuario_ibfk_2` FOREIGN KEY (`fk_id_pais`) REFERENCES `pais` (`id_pais`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'Nicolás','Vera',202994520,'nicolas.vera.gonz@gmail.com',1,1,'basic'),(2,'Nigulashi','Vera',123456789,'xuexiao@gmail.com',2,2,'lite'),(3,'Camilo','Gonzalez',987654321,'camilo.gonzalez@gmail.com',3,1,'full'),(4,'Juan','Pérez',11111111,'juan.perez1@gmail.com',1,1,'basic'),(5,'María','Gómez',22222222,'maria.gomez2@gmail.com',2,1,'lite'),(6,'Pedro','Soto',33333333,'pedro.soto3@gmail.com',3,1,'full'),(7,'Ana','Torres',44444444,'ana.torres4@gmail.com',1,2,'basic'),(8,'Luis','Muñoz',55555555,'luis.munoz5@gmail.com',2,2,'lite'),(9,'Laura','Silva',66666666,'laura.silva6@gmail.com',3,2,'full'),(10,'Carlos','Rojas',77777777,'carlos.rojas7@gmail.com',1,1,'basic'),(11,'Valeria','Fernández',88888888,'valeria.fernandez8@gmail.com',2,1,'lite'),(12,'Diego','López',99999999,'diego.lopez9@gmail.com',3,1,'full'),(13,'Sofía','Ramírez',10101010,'sofia.ramirez10@gmail.com',1,2,'basic'),(14,'Matías','Castillo',11111112,'matias.castillo11@gmail.com',2,2,'lite'),(15,'Camila','Martínez',12121212,'camila.martinez12@gmail.com',3,2,'full'),(16,'Felipe','Vega',13131313,'felipe.vega13@gmail.com',1,1,'basic'),(17,'Antonia','Herrera',14141414,'antonia.herrera14@gmail.com',2,1,'lite'),(18,'Tomás','Navarro',15151515,'tomas.navarro15@gmail.com',3,1,'full'),(19,'Isidora','Araya',16161616,'isidora.araya16@gmail.com',1,2,'basic'),(20,'Joaquín','Cáceres',17171717,'joaquin.caceres17@gmail.com',2,2,'lite'),(21,'Josefa','Fuentes',18181818,'josefa.fuentes18@gmail.com',3,2,'full'),(22,'Ignacio','Salas',19191919,'ignacio.salas19@gmail.com',1,1,'basic'),(23,'Fernanda','Lagos',20202020,'fernanda.lagos20@gmail.com',2,1,'lite'),(24,'Pablo','García',21212121,'pablo.garcia21@gmail.com',3,1,'full'),(25,'Daniela','Morales',22222223,'daniela.morales22@gmail.com',1,2,'basic'),(26,'Andrés','Espinoza',23232323,'andres.espinoza23@gmail.com',2,2,'lite'),(27,'Francisca','Reyes',24242424,'francisca.reyes24@gmail.com',3,2,'full'),(28,'Sebastián','Bravo',25252525,'sebastian.bravo25@gmail.com',1,1,'basic'),(29,'Martina','Alvarez',26262626,'martina.alvarez26@gmail.com',2,1,'lite'),(30,'Gonzalo','Mella',27272727,'gonzalo.mella27@gmail.com',3,1,'full'),(31,'Nicole','Bustamante',28282828,'nicole.bustamante28@gmail.com',1,2,'basic'),(32,'Javier','Cortés',29292929,'javier.cortes29@gmail.com',2,2,'lite'),(33,'Constanza','Saavedra',30303030,'constanza.saavedra30@gmail.com',3,2,'full'),(34,'Álvaro','Paredes',31313131,'alvaro.paredes31@gmail.com',1,1,'basic'),(35,'Cecilia','Godoy',32323232,'cecilia.godoy32@gmail.com',2,1,'lite'),(36,'Benjamín','Zúñiga',33333333,'benjamin.zuniga33@gmail.com',3,1,'full'),(37,'Pamela','Figueroa',34343434,'pamela.figueroa34@gmail.com',1,2,'basic'),(38,'Cristóbal','Toro',35353535,'cristobal.toro35@gmail.com',2,2,'lite'),(39,'Emilia','Sánchez',36363636,'emilia.sanchez36@gmail.com',3,2,'full'),(40,'Leonardo','Delgado',37373737,'leonardo.delgado37@gmail.com',1,1,'basic'),(41,'Romina','Campos',38383838,'romina.campos38@gmail.com',2,1,'lite'),(42,'Mauricio','Tapia',39393939,'mauricio.tapia39@gmail.com',3,1,'full'),(43,'Paula','Meza',40404040,'paula.meza40@gmail.com',1,2,'basic'),(44,'Rodrigo','Aguirre',41414141,'rodrigo.aguirre41@gmail.com',2,2,'lite'),(45,'Verónica','Carrasco',42424242,'veronica.carrasco42@gmail.com',3,2,'full'),(46,'Esteban','Orellana',43434343,'esteban.orellana43@gmail.com',1,1,'basic'),(47,'Natalia','Salinas',44444444,'natalia.salinas44@gmail.com',2,1,'lite'),(48,'Ricardo','Leiva',45454545,'ricardo.leiva45@gmail.com',3,1,'full'),(49,'Karla','Moraga',46464646,'karla.moraga46@gmail.com',1,2,'basic'),(50,'Felipe','Henríquez',47474747,'felipe.henriquez47@gmail.com',2,2,'lite'),(51,'Daniel','Barrientos',48484848,'daniel.barrientos48@gmail.com',3,2,'full'),(52,'Mónica','Navarrete',49494949,'monica.navarrete49@gmail.com',1,1,'basic'),(53,'Gabriel','Yáñez',50505050,'gabriel.yanez50@gmail.com',2,1,'lite');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trigger_log_cambio_correo` AFTER UPDATE ON `usuario` FOR EACH ROW BEGIN
  IF OLD.correo <> NEW.correo THEN
    INSERT INTO log_cambio_correo (id_usuario, correo_anterior, correo_nuevo)
    VALUES (OLD.id_usuario, OLD.correo, NEW.correo);
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `venta_usuario_ranking`
--

DROP TABLE IF EXISTS `venta_usuario_ranking`;
/*!50001 DROP VIEW IF EXISTS `venta_usuario_ranking`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `venta_usuario_ranking` AS SELECT 
 1 AS `correo`,
 1 AS `total_pagado`,
 1 AS `primer_pago`,
 1 AS `moneda`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `ventas_historicas_por_plan`
--

DROP TABLE IF EXISTS `ventas_historicas_por_plan`;
/*!50001 DROP VIEW IF EXISTS `ventas_historicas_por_plan`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `ventas_historicas_por_plan` AS SELECT 
 1 AS `id_precio`,
 1 AS `nombre_plan`,
 1 AS `moneda`,
 1 AS `ventas`,
 1 AS `fecha_pago`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'entrega_3'
--

--
-- Dumping routines for database 'entrega_3'
--
/*!50003 DROP FUNCTION IF EXISTS `obtener_nombre` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `obtener_nombre`(rut_funcion INT) RETURNS varchar(100) CHARSET utf8mb4
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
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `total_pagado_por_usuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `total_pagado_por_usuario`(correo_usuario VARCHAR(50)) RETURNS int
    READS SQL DATA
    DETERMINISTIC
BEGIN
	DECLARE total_pagado INT;
    SELECT IFNULL(SUM(p.precio),0)
    INTO total_pagado
    FROM pago p
    INNER JOIN usuario u ON p.fk_id_usuario = u.id_usuario
    WHERE u.correo = correo_usuario;
    
    RETURN total_pagado;
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `correccion_monto_pago` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `correccion_monto_pago`(
IN id_pago_f INT, 
monto_pago_f INT)
BEGIN
UPDATE pago
SET precio = monto_pago_f
WHERE id_pago = id_pago_f;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ventas_por_rango` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ventas_por_rango`(
IN fecha_inicio DATE,
IN fecha_fin DATE,
IN tipo_moneda VARCHAR(5)
)
BEGIN
SELECT * 
FROM ventas_historicas_por_plan
WHERE fecha_pago BETWEEN fecha_inicio AND fecha_fin 
AND (tipo_moneda IS NULL OR moneda = tipo_moneda);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `detalle_planes`
--

/*!50001 DROP VIEW IF EXISTS `detalle_planes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `detalle_planes` AS select `precio`.`id_precio` AS `id_precio`,`plan`.`nombre_plan` AS `nombre_plan`,`pais`.`moneda` AS `moneda` from ((`precio` left join `pais` on((`precio`.`fk_id_pais` = `pais`.`id_pais`))) left join `plan` on((`precio`.`fk_id_plan` = `plan`.`id_plan`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `venta_usuario_ranking`
--

/*!50001 DROP VIEW IF EXISTS `venta_usuario_ranking`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `venta_usuario_ranking` AS select `u`.`correo` AS `correo`,sum(`p`.`precio`) AS `total_pagado`,min(`p`.`fecha_pago`) AS `primer_pago`,`p`.`moneda` AS `moneda` from ((select `plan`.`moneda` AS `moneda`,`p`.`id_pago` AS `id_pago`,`p`.`fk_id_usuario` AS `fk_id_usuario`,`p`.`fk_id_precio` AS `fk_id_precio`,`p`.`precio` AS `precio`,`p`.`fecha_pago` AS `fecha_pago` from (`detalle_planes` `plan` join `pago` `p` on((`plan`.`id_precio` = `p`.`fk_id_precio`)))) `p` left join `usuario` `u` on((`p`.`fk_id_usuario` = `u`.`id_usuario`))) group by `u`.`correo`,`p`.`moneda` order by `p`.`moneda`,`total_pagado` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `ventas_historicas_por_plan`
--

/*!50001 DROP VIEW IF EXISTS `ventas_historicas_por_plan`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `ventas_historicas_por_plan` AS select `p`.`id_precio` AS `id_precio`,`d`.`nombre_plan` AS `nombre_plan`,`d`.`moneda` AS `moneda`,`p`.`ventas` AS `ventas`,`p`.`fecha_pago` AS `fecha_pago` from ((select `subconsulta`.`id_precio` AS `id_precio`,`subconsulta`.`fecha_pago` AS `fecha_pago`,ifnull(sum(`pago`.`precio`),0) AS `ventas` from ((select `p`.`id_precio` AS `id_precio`,`f`.`fecha_pago` AS `fecha_pago` from ((select distinct `pago`.`fecha_pago` AS `fecha_pago` from `pago` where (`pago`.`fecha_pago` is not null)) `f` join (select `precio`.`id_precio` AS `id_precio` from `precio`) `p`)) `subconsulta` left join `pago` on(((`subconsulta`.`id_precio` = `pago`.`fk_id_precio`) and (`subconsulta`.`fecha_pago` = `pago`.`fecha_pago`)))) group by `subconsulta`.`id_precio`,`subconsulta`.`fecha_pago` order by `subconsulta`.`fecha_pago`,`subconsulta`.`id_precio`) `p` left join `detalle_planes` `d` on((`p`.`id_precio` = `d`.`id_precio`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-07-31 19:40:33
