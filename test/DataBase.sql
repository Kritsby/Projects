CREATE DATABASE  IF NOT EXISTS `godb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `godb`;
-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: localhost    Database: godb
-- ------------------------------------------------------
-- Server version	8.0.26

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
-- Table structure for table `amounts`
--

DROP TABLE IF EXISTS `amounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `amounts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `sum` longtext,
  PRIMARY KEY (`id`),
  KEY `idx_amounts_deleted_at` (`deleted_at`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `amounts`
--

LOCK TABLES `amounts` WRITE;
/*!40000 ALTER TABLE `amounts` DISABLE KEYS */;
INSERT INTO `amounts` VALUES (1,'2021-09-15 02:44:12.545','2021-09-15 02:44:12.545',NULL,'6'),(2,'2021-09-15 02:44:30.127','2021-09-15 02:44:30.127',NULL,'2'),(3,'2021-09-15 02:44:36.992','2021-09-15 02:44:36.992',NULL,'3'),(4,'2021-09-15 02:44:48.106','2021-09-15 02:44:48.106',NULL,'3');
/*!40000 ALTER TABLE `amounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `books`
--

DROP TABLE IF EXISTS `books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `books` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `titlename` longtext,
  `description` longtext,
  `author` longtext,
  `year` longtext,
  `edition` longtext,
  PRIMARY KEY (`id`),
  KEY `idx_books_deleted_at` (`deleted_at`),
  CONSTRAINT `fk_books_amount` FOREIGN KEY (`id`) REFERENCES `amounts` (`id`),
  CONSTRAINT `fk_books_issued` FOREIGN KEY (`id`) REFERENCES `issueds` (`id`),
  CONSTRAINT `fk_books_publishing` FOREIGN KEY (`id`) REFERENCES `publishings` (`id`),
  CONSTRAINT `fk_books_where_book` FOREIGN KEY (`id`) REFERENCES `where_books` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books`
--

LOCK TABLES `books` WRITE;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
INSERT INTO `books` VALUES (1,'2021-09-15 02:44:12.552','2021-09-15 02:44:12.552',NULL,'To Kill a Mockingbird','Published in 1960, this timeless classic explores human behaviour and the collective conscience of The Deep South in the early 20th century. Humour entwines the delicate strands of prejudice, hatred, hypocrisy, love and innocence to create one of the best novels ever written.','Harper Lee','1960','Fantasy'),(2,'2021-09-15 02:44:30.129','2021-09-15 02:44:30.129',NULL,'Animal Farm','This famous 1945 satire, examines the realistic risks of revolution and the dynamics animals will inevitably give in to.','George Orwell','1945','Fantasy'),(3,'2021-09-15 02:44:36.994','2021-09-15 02:44:36.994',NULL,'The Book Thief','Set in Germany during 1939, The Book Thief follows Liesel as she rescues books from the tyranny of Nazi rule. Meanwhile, her family has hidden a Jewish fighter in their basement and death looks down on the family, narrating our tale. Experience bravery that is rarely found in the world, and friendship that is formed in the most unlikely of situations.','Markus Zusak','1939','Fantasy'),(4,'2021-09-15 02:44:48.109','2021-09-15 02:44:48.109',NULL,'The Great Gatsby','Published in 1925, Fitzgerald’s The Great Gatsby explores the decadence of the Jazz Age, and one man’s introduction into a world where even those with the most indulgent lives cannot earn love.','F. Scott Fitzgerald','1925','Fantasy');
/*!40000 ALTER TABLE `books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `issueds`
--

DROP TABLE IF EXISTS `issueds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `issueds` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `hands` longtext,
  `amount_of_hands` longtext,
  PRIMARY KEY (`id`),
  KEY `idx_issueds_deleted_at` (`deleted_at`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `issueds`
--

LOCK TABLES `issueds` WRITE;
/*!40000 ALTER TABLE `issueds` DISABLE KEYS */;
INSERT INTO `issueds` VALUES (1,'2021-09-15 02:44:12.549','2021-09-15 02:44:12.549',NULL,'yes','6'),(2,'2021-09-15 02:44:30.129','2021-09-15 02:44:30.129',NULL,'no','2'),(3,'2021-09-15 02:44:36.993','2021-09-15 02:44:36.993',NULL,'yes','2'),(4,'2021-09-15 02:44:48.108','2021-09-15 02:44:48.108',NULL,'yes','2');
/*!40000 ALTER TABLE `issueds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publishings`
--

DROP TABLE IF EXISTS `publishings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `publishings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `name` longtext,
  `year_publishing` longtext,
  PRIMARY KEY (`id`),
  KEY `idx_publishings_deleted_at` (`deleted_at`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publishings`
--

LOCK TABLES `publishings` WRITE;
/*!40000 ALTER TABLE `publishings` DISABLE KEYS */;
INSERT INTO `publishings` VALUES (1,'2021-09-15 02:44:12.472','2021-09-15 02:44:12.472',NULL,'Eksmo',''),(2,'2021-09-15 02:44:30.127','2021-09-15 02:44:30.127',NULL,'Eksmo',''),(3,'2021-09-15 02:44:36.991','2021-09-15 02:44:36.991',NULL,'Eksmo',''),(4,'2021-09-15 02:44:48.104','2021-09-15 02:44:48.104',NULL,'Eksmo','');
/*!40000 ALTER TABLE `publishings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `where_books`
--

DROP TABLE IF EXISTS `where_books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `where_books` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `number` longtext,
  PRIMARY KEY (`id`),
  KEY `idx_where_books_deleted_at` (`deleted_at`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `where_books`
--

LOCK TABLES `where_books` WRITE;
/*!40000 ALTER TABLE `where_books` DISABLE KEYS */;
INSERT INTO `where_books` VALUES (1,'2021-09-15 02:44:12.547','2021-09-15 02:44:12.547',NULL,'Two'),(2,'2021-09-15 02:44:30.128','2021-09-15 02:44:30.128',NULL,'five'),(3,'2021-09-15 02:44:36.992','2021-09-15 02:44:36.992',NULL,'One'),(4,'2021-09-15 02:44:48.107','2021-09-15 02:44:48.107',NULL,'One');
/*!40000 ALTER TABLE `where_books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'godb'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-09-15  2:47:47
