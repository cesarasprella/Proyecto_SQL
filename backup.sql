-- En el backup de la base de datos se incluyeron las siguientes tablas:
-- equipos, estadisticas_individuales, jugadoras, partidos y torneo.

-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: localhost    Database: estadisticas_basquet
-- ------------------------------------------------------
-- Server version	8.0.29

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
-- Table structure for table `equipos`
--

DROP TABLE IF EXISTS `equipos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `equipos` (
  `id_equipo` int NOT NULL,
  `nombre_equipo` varchar(45) DEFAULT NULL,
  `direc` varchar(50) DEFAULT NULL,
  `ciudad` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id_equipo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipos`
--

LOCK TABLES `equipos` WRITE;
/*!40000 ALTER TABLE `equipos` DISABLE KEYS */;
INSERT INTO `equipos` VALUES (1,'Meridiano V','67 e 17 y 18','La Plata'),(2,'Juventud','35 e 1 y 2','La Plata'),(3,'Hogar Social','Montevideo 100','Berisso'),(4,'Círculo Policial','17 y 526','La Plata'),(5,'Capital Chica','66 e 156 y 157','Los Hornos'),(6,'Villa San Carlos','Montevideo 2285','Berisso'),(7,'San Vicente','9 de julio 180','San Vicente'),(8,'Reconquista','40 e 15 y 16','La Plata'),(9,'Platense','21 e 51 y 53','La Plata'),(10,'Unidos del Dique','47 y 129','Ensenada'),(11,'Gimnasia y Esgrima La Plata','4 e 51 y 53','La Plata'),(12,'Selección Argentina U 19','CeNARD','CABA'),(13,'Estudiantes','1 y 57','La Plata'),(14,'Banco Provincia','476 e 20 y 21','City Bell'),(15,'Atenas','13 e 57 y 58','La Plata'),(16,'Fomento Los Hornos','137 y 61','Los Hornos');
/*!40000 ALTER TABLE `equipos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estadisticas_individuales`
--

DROP TABLE IF EXISTS `estadisticas_individuales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estadisticas_individuales` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_partido` int NOT NULL,
  `id_numero` int NOT NULL,
  `pts` int DEFAULT NULL,
  `reb` int DEFAULT NULL,
  `asist` int DEFAULT NULL,
  `perd` int DEFAULT NULL,
  `rob` int DEFAULT NULL,
  `min` decimal(4,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_partido` (`id_partido`),
  KEY `id_numero` (`id_numero`),
  CONSTRAINT `estadisticas_individuales_ibfk_1` FOREIGN KEY (`id_partido`) REFERENCES `partidos` (`id`),
  CONSTRAINT `estadisticas_individuales_ibfk_2` FOREIGN KEY (`id_numero`) REFERENCES `jugadoras` (`id_numero`)
) ENGINE=InnoDB AUTO_INCREMENT=99 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estadisticas_individuales`
--

LOCK TABLES `estadisticas_individuales` WRITE;
/*!40000 ALTER TABLE `estadisticas_individuales` DISABLE KEYS */;
INSERT INTO `estadisticas_individuales` VALUES (1,1,6,14,3,5,1,4,37.53),(2,2,9,8,2,2,1,1,26.13),(3,2,0,2,2,0,1,0,17.28),(4,2,13,2,2,0,2,2,26.29),(5,2,7,5,9,2,1,1,36.17),(6,2,10,26,6,2,3,1,40.00),(7,2,4,0,0,0,0,0,0.00),(8,2,26,0,1,2,0,0,7.52),(9,2,15,5,0,0,1,0,11.48),(10,2,5,0,3,2,0,2,11.23),(11,2,6,6,5,2,0,0,22.26),(12,2,46,0,0,0,0,0,0.00),(13,3,13,7,3,1,6,0,31.08),(14,3,9,3,0,0,1,0,19.48),(15,3,10,10,8,4,0,2,34.07),(16,3,7,8,4,0,1,0,27.28),(17,3,4,14,7,0,2,0,37.53),(18,3,5,3,4,0,0,1,14.41),(19,3,8,0,1,1,0,0,2.55),(20,3,26,0,1,1,1,0,4.53),(21,3,0,0,2,0,0,0,5.35),(22,3,15,0,0,0,0,2,9.28),(23,3,6,2,2,2,0,0,11.58),(24,3,46,0,0,0,0,0,0.00),(25,4,9,13,2,2,2,1,26.13),(26,4,0,6,2,0,1,3,17.28),(27,4,13,7,2,0,0,1,26.29),(28,4,7,9,9,2,2,3,36.17),(29,4,10,0,0,0,0,0,0.00),(30,4,4,14,6,2,2,2,40.00),(31,4,26,4,1,2,1,2,7.52),(32,4,15,6,0,0,0,1,11.48),(33,4,5,0,0,0,0,0,0.00),(34,4,6,2,3,2,2,1,22.26),(35,4,46,0,0,0,0,0,0.00),(36,4,8,7,5,2,1,0,11.23),(37,5,46,4,0,1,1,0,15.43),(38,5,15,17,1,1,1,2,20.00),(39,5,12,8,6,1,0,1,21.35),(40,5,5,4,6,6,0,2,20.00),(41,5,0,20,3,1,0,3,20.00),(42,5,26,7,0,4,0,3,14.16),(43,5,13,10,2,2,2,3,20.00),(44,5,6,2,2,2,0,1,15.44),(45,5,8,6,2,0,0,1,13.06),(46,5,9,10,3,2,1,4,15.25),(47,5,4,13,5,5,1,0,24.07),(48,6,13,16,2,4,3,0,24.53),(49,7,4,15,5,1,2,0,31.34),(50,8,7,15,7,4,2,1,40.00),(51,9,26,3,1,0,5,3,24.53),(52,9,9,6,2,1,1,1,20.11),(53,9,5,6,4,1,1,1,15.54),(54,9,4,13,6,3,1,3,40.00),(55,9,7,19,12,1,2,2,40.00),(56,9,8,0,0,0,0,0,0.00),(57,9,0,0,0,2,1,0,21.33),(58,9,13,2,2,0,6,0,14.11),(59,9,12,0,0,0,0,0,0.55),(60,9,6,2,0,3,2,3,15.04),(61,9,15,0,1,0,1,0,7.16),(62,9,46,0,0,0,0,0,0.00),(63,10,26,14,2,5,2,1,21.33),(64,10,4,14,6,2,2,9,34.16),(65,11,26,4,2,2,1,0,17.32),(66,11,0,4,4,1,1,0,15.10),(67,11,15,3,1,0,0,0,13.11),(68,11,46,0,0,0,0,0,1.04),(69,11,7,16,7,2,0,1,34.04),(70,11,5,0,2,2,0,1,14.10),(71,11,6,4,0,2,2,2,23.25),(72,11,8,2,1,0,0,0,4.01),(73,11,13,0,7,1,3,0,20.34),(74,11,9,3,6,0,1,0,15.54),(75,11,12,0,0,0,0,0,6.33),(76,11,4,22,4,1,3,1,34.16),(77,12,7,8,3,1,2,2,20.34),(78,13,13,3,1,2,0,0,17.59),(79,13,15,0,0,0,0,0,10.30),(80,13,9,16,0,2,0,0,31.34),(81,13,7,10,6,0,0,0,38.50),(82,13,4,8,4,0,0,0,38.50),(83,13,8,0,0,0,0,0,0.00),(84,13,5,7,2,0,2,0,12.20),(85,13,12,0,0,0,0,0,0.00),(86,13,0,0,0,0,0,0,6.01),(87,13,6,5,1,0,0,0,21.52),(88,13,26,3,1,0,0,0,22.00),(89,13,30,0,0,0,0,0,0.00),(90,14,26,4,4,0,3,2,37.05),(91,14,15,7,3,0,1,0,17.35),(92,14,9,4,2,0,0,0,14.38),(93,14,6,4,1,2,3,0,18.08),(94,14,0,8,5,0,1,1,28.19),(95,14,4,7,10,0,3,0,40.00),(96,14,7,11,2,2,2,0,39.39),(97,14,5,0,0,1,1,0,4.31),(98,15,7,20,8,2,1,1,40.00);
/*!40000 ALTER TABLE `estadisticas_individuales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jugadoras`
--

DROP TABLE IF EXISTS `jugadoras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jugadoras` (
  `id_numero` int NOT NULL,
  `id_equipo` int NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `pos` varchar(15) DEFAULT NULL,
  `edad` int DEFAULT NULL,
  `alt` decimal(3,2) DEFAULT NULL,
  PRIMARY KEY (`id_numero`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jugadoras`
--

LOCK TABLES `jugadoras` WRITE;
/*!40000 ALTER TABLE `jugadoras` DISABLE KEYS */;
INSERT INTO `jugadoras` VALUES (0,1,'Sofía Gómez','alera',24,1.65),(4,1,'Jessica De La Haye','ala-pivot',36,1.75),(5,1,'Pilar Pulido','alera',26,1.70),(6,1,'Florencia Cirigliano','escolta',26,1.60),(7,1,'Marina Zubillaga','pivot',30,1.77),(8,1,'Milena De Luca','ala-pivot',22,1.65),(9,1,'María De Sabantonio','alera',37,1.60),(10,1,'Sofía Cruz','ala-pivot',22,1.80),(12,1,'Carolina Romaniello','pivot',25,1.70),(13,1,'Natalia Cirigliano','base',31,1.63),(15,1,'Ana Clara Iannone','alera',29,1.60),(26,1,'Yamila Vilte','base',22,1.60),(30,1,'Mora Pereira','base',17,1.55),(46,1,'Suyai Wegener','escolta',17,1.60);
/*!40000 ALTER TABLE `jugadoras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `partidos`
--

DROP TABLE IF EXISTS `partidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `partidos` (
  `id` int NOT NULL,
  `dia` date DEFAULT NULL,
  `nombre_torneo` varchar(45) DEFAULT NULL,
  `id_equipo1` int DEFAULT NULL,
  `id_equipo2` int DEFAULT NULL,
  `resultado` varchar(7) NOT NULL,
  `win` tinyint(1) DEFAULT NULL,
  `instancia` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `nombre_torneo` (`nombre_torneo`),
  KEY `id_equipo1` (`id_equipo1`),
  KEY `id_equipo2` (`id_equipo2`),
  CONSTRAINT `partidos_ibfk_1` FOREIGN KEY (`nombre_torneo`) REFERENCES `torneo` (`nombre_torneo`),
  CONSTRAINT `partidos_ibfk_2` FOREIGN KEY (`id_equipo1`) REFERENCES `equipos` (`id_equipo`),
  CONSTRAINT `partidos_ibfk_3` FOREIGN KEY (`id_equipo2`) REFERENCES `equipos` (`id_equipo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `partidos`
--

LOCK TABLES `partidos` WRITE;
/*!40000 ALTER TABLE `partidos` DISABLE KEYS */;
INSERT INTO `partidos` VALUES (1,'2022-03-25','Amistoso',1,11,'70-45',1,'Amistoso'),(2,'2022-04-03','Apertura',1,2,'54-60',0,'Fecha 1'),(3,'2022-04-10','Apertura',1,3,'54-60',0,'Fecha 2'),(4,'2022-04-24','Apertura',1,4,'68-32',1,'Fecha 3'),(5,'2022-05-01','Apertura',1,5,'101-19',1,'Fecha 4'),(6,'2022-05-08','Apertura',1,6,'58-51',1,'Fecha 5'),(7,'2022-05-15','Apertura',1,7,'52-45',1,'Fecha 6'),(8,'2022-05-22','Apertura',1,8,'43-49',0,'Fecha 7'),(9,'2022-05-29','Apertura',1,9,'51-36',1,'Fecha 8'),(10,'2022-06-05','Apertura',1,10,'83-21',1,'Fecha 9'),(11,'2022-06-26','Apertura',1,7,'58-42',1,'Cuartos de final'),(12,'2022-07-01','Amistoso',1,12,'40-70',0,'Amistoso'),(13,'2022-07-03','Apertura',1,8,'52-70',0,'Semifinal'),(14,'2022-08-07','Clausura',1,2,'45-41',1,'Fecha 1'),(15,'2022-08-14','Clausura',1,3,'41-35',1,'Fecha 2');
/*!40000 ALTER TABLE `partidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `torneo`
--

DROP TABLE IF EXISTS `torneo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `torneo` (
  `nombre_torneo` varchar(45) NOT NULL,
  `organizador` varchar(45) DEFAULT NULL,
  `equipos` int DEFAULT NULL,
  PRIMARY KEY (`nombre_torneo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `torneo`
--

LOCK TABLES `torneo` WRITE;
/*!40000 ALTER TABLE `torneo` DISABLE KEYS */;
INSERT INTO `torneo` VALUES ('Amistoso',NULL,NULL),('Apertura','APdeB',10),('Clausura','APdeB',9);
/*!40000 ALTER TABLE `torneo` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-09-01 17:40:51
