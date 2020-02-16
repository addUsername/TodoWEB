CREATE DATABASE  IF NOT EXISTS `login` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `login`;
-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: login
-- ------------------------------------------------------
-- Server version	8.0.19

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
-- Table structure for table `login2`
--

DROP TABLE IF EXISTS `login2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `login2` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user` varchar(15) NOT NULL,
  `pass` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user` (`user`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login2`
--

LOCK TABLES `login2` WRITE;
/*!40000 ALTER TABLE `login2` DISABLE KEYS */;
INSERT INTO `login2` VALUES (1,'sergio','912ec803b2ce49e4a541068d495ab570'),(2,'serg´fio','912ec803b2ce49e4a541068d495ab570'),(3,'gol','d2a57dc1d883fd21fb9951699df71cc7'),(5,'qwer','202cb962ac59075b964b07152d234b70');
/*!40000 ALTER TABLE `login2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `todo`
--

DROP TABLE IF EXISTS `todo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `todo` (
  `PKey` int NOT NULL AUTO_INCREMENT,
  `id_user` int NOT NULL,
  `language` varchar(10) NOT NULL,
  `project` varchar(50) NOT NULL,
  `state` int NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`PKey`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `todo`
--

LOCK TABLES `todo` WRITE;
/*!40000 ALTER TABLE `todo` DISABLE KEYS */;
INSERT INTO `todo` VALUES (31,1,'lang','java',1,'http://localhost:8080/Login2/Indetail.jsp?id=30'),(32,1,'JSPySQL','DOWNLOAD',4,'http://localhost:8080/Login2/Indetail.jsp?id=31'),(33,1,'File','MODIFY',1,'http://localhost:8080/Login2/Indetail.jsp?id=32'),(34,1,'JSPyHTML','USERS',3,'http://localhost:8080/Login2/Indetail.jsp?id=33'),(35,1,'JSPyJS','ALERT',1,'http://localhost:8080/Login2/Indetail.jsp?id=34'),(36,1,'JavaScript','NOTIFY',2,'http://localhost:8080/Login2/Indetail.jsp?id=35'),(40,1,'pyJava','GOLAPP',1,'http://localhost:8080/Login2/Indetail.jsp?id=39'),(46,1,'FileSql','DELETE',4,'http://localhost:8080/Login2/Indetail.jsp?id=40'),(63,1,'ss','ss',1,'http://localhost:8080/Login2/Indetail.jsp?id=46'),(65,3,'all','GOLAPP',1,'http://localhost:8080/Login2/Indetail.jsp?id=63'),(66,3,'pyJs','SCRIPTS',2,'http://localhost:8080/Login2/Indetail.jsp?id=65'),(67,3,'java','JSP',1,'http://localhost:8080/Login2/Indetail.jsp?id=66'),(68,3,'mySql','BBDD',1,'http://localhost:8080/Login2/Indetail.jsp?id=67'),(69,3,'server','web',1,'http://localhost:8080/Login2/Indetail.jsp?id=68');
/*!40000 ALTER TABLE `todo` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-02-16 11:21:32
