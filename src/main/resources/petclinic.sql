-- MySQL dump 10.13  Distrib 5.6.23, for osx10.8 (x86_64)
--
-- Host: localhost    Database: petclinic
-- ------------------------------------------------------
-- Server version	5.6.23

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cli_especie`
--

DROP TABLE IF EXISTS `cli_especie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cli_especie` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cli_especie`
--

LOCK TABLES `cli_especie` WRITE;
/*!40000 ALTER TABLE `cli_especie` DISABLE KEYS */;
INSERT INTO `cli_especie` VALUES (2,'Can'),(11,'Felino'),(12,'Reptil'),(14,'Equino'),(15,'Ave');
/*!40000 ALTER TABLE `cli_especie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cli_mascota`
--

DROP TABLE IF EXISTS `cli_mascota`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cli_mascota` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `color` varchar(200) DEFAULT NULL,
  `nro_identificacion` varchar(45) DEFAULT NULL,
  `sexo` tinyint(4) DEFAULT NULL,
  `foto` varchar(200) DEFAULT NULL,
  `id_propietario` bigint(20) NOT NULL,
  `id_especie` bigint(20) NOT NULL,
  `id_raza` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_cli_mascota_cli_propietario1_idx` (`id_propietario`),
  KEY `fk_cli_mascota_cli_especie1_idx` (`id_especie`),
  KEY `fk_cli_mascota_cli_raza1_idx` (`id_raza`),
  CONSTRAINT `fk_cli_mascota_cli_especie1` FOREIGN KEY (`id_especie`) REFERENCES `cli_especie` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_cli_mascota_cli_propietario1` FOREIGN KEY (`id_propietario`) REFERENCES `cli_propietario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_cli_mascota_cli_raza1` FOREIGN KEY (`id_raza`) REFERENCES `cli_raza` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cli_mascota`
--

LOCK TABLES `cli_mascota` WRITE;
/*!40000 ALTER TABLE `cli_mascota` DISABLE KEYS */;
INSERT INTO `cli_mascota` VALUES (3,'Patagonia','2008-02-12','Indigo','345435',0,NULL,1,2,1),(4,'Napoleon','2012-12-02','Negro','1212',1,NULL,3,2,1),(5,'Bohemio','2012-01-20','Indigo','0394',1,NULL,4,2,6);
/*!40000 ALTER TABLE `cli_mascota` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cli_propietario`
--

DROP TABLE IF EXISTS `cli_propietario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cli_propietario` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_persona` bigint(20) NOT NULL,
  `fecha_registro` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_cli_cliente_gen_persona1_idx` (`id_persona`),
  CONSTRAINT `fk_cli_cliente_gen_persona1` FOREIGN KEY (`id_persona`) REFERENCES `gen_persona` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cli_propietario`
--

LOCK TABLES `cli_propietario` WRITE;
/*!40000 ALTER TABLE `cli_propietario` DISABLE KEYS */;
INSERT INTO `cli_propietario` VALUES (1,9,'2015-08-01 20:52:34'),(2,10,'2015-08-01 20:53:00'),(3,11,'2015-08-01 21:41:41'),(4,12,'2015-08-01 21:43:24');
/*!40000 ALTER TABLE `cli_propietario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cli_raza`
--

DROP TABLE IF EXISTS `cli_raza`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cli_raza` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `id_especie` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_cli_raza_cli_especie1_idx` (`id_especie`),
  CONSTRAINT `fk_cli_raza_cli_especie1` FOREIGN KEY (`id_especie`) REFERENCES `cli_especie` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cli_raza`
--

LOCK TABLES `cli_raza` WRITE;
/*!40000 ALTER TABLE `cli_raza` DISABLE KEYS */;
INSERT INTO `cli_raza` VALUES (1,'Viringo',2),(2,'Chiribaya',2),(4,'Pastor Alemán',2),(5,'Angola',11),(6,'Siames',2),(7,'Iguana',12),(8,'Comodo',2),(9,'Caballo',14),(10,'Buho',15),(11,'Cacatua',15);
/*!40000 ALTER TABLE `cli_raza` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cli_veterinario`
--

DROP TABLE IF EXISTS `cli_veterinario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cli_veterinario` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_persona` bigint(20) NOT NULL,
  `fecha_registro` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_cli_veterinario_gen_persona1_idx` (`id_persona`),
  CONSTRAINT `fk_cli_veterinario_gen_persona1` FOREIGN KEY (`id_persona`) REFERENCES `gen_persona` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cli_veterinario`
--

LOCK TABLES `cli_veterinario` WRITE;
/*!40000 ALTER TABLE `cli_veterinario` DISABLE KEYS */;
INSERT INTO `cli_veterinario` VALUES (1,2,'2015-08-01 19:12:30.915'),(2,5,'2015-08-01 19:24:37.213');
/*!40000 ALTER TABLE `cli_veterinario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cli_visita`
--

DROP TABLE IF EXISTS `cli_visita`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cli_visita` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `fecha_ingreso` datetime DEFAULT NULL,
  `fecha_salida` datetime DEFAULT NULL,
  `motivo` text,
  `diagnostico` text,
  `tratamiento` text,
  `dieta` text,
  `proxima_visita` date DEFAULT NULL,
  `id_mascota` bigint(20) NOT NULL,
  `id_veterinario` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_cli_visita_cli_mascota1_idx` (`id_mascota`),
  KEY `fk_cli_visita_cli_veterinario1_idx` (`id_veterinario`),
  CONSTRAINT `fk_cli_visita_cli_mascota1` FOREIGN KEY (`id_mascota`) REFERENCES `cli_mascota` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_cli_visita_cli_veterinario1` FOREIGN KEY (`id_veterinario`) REFERENCES `cli_veterinario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cli_visita`
--

LOCK TABLES `cli_visita` WRITE;
/*!40000 ALTER TABLE `cli_visita` DISABLE KEYS */;
INSERT INTO `cli_visita` VALUES (11,'2015-08-02 01:50:02',NULL,'Descanso en la posada por 2 noches.',NULL,NULL,NULL,NULL,5,2),(12,'2015-08-02 01:50:18','2015-08-02 01:51:15','Ingreso por ingesta de chocolate.','Enfermo por consumo de chocolate.','Lavado gástrico. ','Bastante agua.','2015-05-02',4,2);
/*!40000 ALTER TABLE `cli_visita` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gen_persona`
--

DROP TABLE IF EXISTS `gen_persona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gen_persona` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombres` varchar(200) DEFAULT NULL,
  `apellidos` varchar(200) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `celular` varchar(45) DEFAULT NULL,
  `telefono` varchar(45) DEFAULT NULL,
  `direccion` varchar(200) DEFAULT NULL,
  `sexo` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gen_persona`
--

LOCK TABLES `gen_persona` WRITE;
/*!40000 ALTER TABLE `gen_persona` DISABLE KEYS */;
INSERT INTO `gen_persona` VALUES (1,'Administrador','PetClinic','admin@gmail.com','971117877','','',1),(2,'Antonio','Wei','antonio@gmail.com','90909090','','',1),(3,'José','EA','jose@gmail.com','971117877','01 7284505',NULL,NULL),(4,'José','34535','jose@gmail.com','234','234',NULL,NULL),(5,'Carmen','Elizabet','carmen@gmail.com','993939393','08383343','Jr. Las Acacias 3434 - Lima',0),(6,'Asistente','Primario','asistente@gmail.com','971117877','051 01 20440340','Av. Javier Prado 3434',0),(7,'Alexndr','Administrador','alxndr@gmail.com','971117877','','',1),(8,'234','234234','23423@sdfsd.com','4','234','',1),(9,'Miguel','Mateos','miguel@gmail.com','987636367','01 738 34343','Jr. Las Acacias 3434 - Lima',1),(10,'Fey','Fay','fey@gmail.com','98394949','','',0),(11,'Julieta','Venegas','julieta@gmail.com','98384858','','',0),(12,'Andres','Calamaro','andrelo@gmail.com','937477574','','',1);
/*!40000 ALTER TABLE `gen_persona` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gen_usuario`
--

DROP TABLE IF EXISTS `gen_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gen_usuario` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `email` varchar(45) DEFAULT NULL,
  `password` varchar(200) DEFAULT NULL,
  `estado` varchar(45) DEFAULT NULL,
  `perfil` varchar(45) DEFAULT NULL,
  `id_persona` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_gen_usuario_gen_persona_idx` (`id_persona`),
  CONSTRAINT `fk_gen_usuario_gen_persona` FOREIGN KEY (`id_persona`) REFERENCES `gen_persona` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gen_usuario`
--

LOCK TABLES `gen_usuario` WRITE;
/*!40000 ALTER TABLE `gen_usuario` DISABLE KEYS */;
INSERT INTO `gen_usuario` VALUES (1,'admin@gmail.com','redhot','ACT','ADMIN',1),(2,'asistente@gmail.com','redhot','ACT','ASIS',6),(3,'alxndr@gmail.com','alxndr@gmail.com','INA','ASIS',7);
/*!40000 ALTER TABLE `gen_usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-08-02  7:46:51
