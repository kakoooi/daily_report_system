-- MySQL dump 10.13  Distrib 8.1.0, for macos13 (arm64)
--
-- Host: localhost    Database: daily_report_system
-- ------------------------------------------------------
-- Server version	8.1.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees` (
  `id` int NOT NULL AUTO_INCREMENT,
  `admin_flag` int NOT NULL,
  `code` varchar(255) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `delete_flag` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `password` varchar(64) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_3um79qgwg340lpaw7phtwudtc` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (1,1,'A001','2024-01-18 17:58:21.915484',0,'大石 佳子','C681328B935FB704341D1B963D397F74AE69B7B932C90D9AD0E2E836B233ABC3','2024-01-18 18:13:38.583742'),(2,1,'A002','2024-01-18 18:02:34.955591',0,'大石 太郎','F78CDB43475E84CA614165E705CD0FC037AD8A9F81DBE60769563DED6EA96215','2024-01-18 18:02:34.955591'),(3,0,'A003','2024-01-18 18:02:58.817149',0,'煌木 太郎','A911E4DC0D4BC758AA1A9910EF5DB5A715969252A4BCF7BDC1DE8C104824C0E9','2024-01-18 18:14:19.373659'),(4,0,'A004','2024-01-18 18:03:22.490399',1,'煌木 次郎','422888117E9DB4DF1B6077CD785A73684A28038F52C075202C382AA30EEAD157','2024-01-18 18:19:40.016576'),(5,0,'A005','2024-02-28 20:39:00.027258',1,'青木　花','C681328B935FB704341D1B963D397F74AE69B7B932C90D9AD0E2E836B233ABC3','2024-02-28 20:39:40.999049'),(6,1,'A006','2024-02-28 20:39:32.472500',0,'石川　健','C681328B935FB704341D1B963D397F74AE69B7B932C90D9AD0E2E836B233ABC3','2024-02-28 20:39:32.472500');
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Favorite`
--

DROP TABLE IF EXISTS `Favorite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Favorite` (
  `id` int NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `employee_id` int NOT NULL,
  `report_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKeh114k47xlrmn0k58g4vi9eqm` (`employee_id`),
  KEY `FK3bkva06e78q08h33ramvjjcyg` (`report_id`),
  CONSTRAINT `FK3bkva06e78q08h33ramvjjcyg` FOREIGN KEY (`report_id`) REFERENCES `reports` (`id`),
  CONSTRAINT `FKa9in9ucpja193ers0833u7g60` FOREIGN KEY (`report_id`) REFERENCES `reports` (`id`),
  CONSTRAINT `FKeh114k47xlrmn0k58g4vi9eqm` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`),
  CONSTRAINT `FKqbvfi4bbn668wk4e9sstrfkon` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Favorite`
--

LOCK TABLES `Favorite` WRITE;
/*!40000 ALTER TABLE `Favorite` DISABLE KEYS */;
INSERT INTO `Favorite` VALUES (1,'2024-02-19 20:49:49.932231','2024-02-19 20:49:49.932231',1,1),(2,'2024-02-20 17:58:52.399706','2024-02-20 17:58:52.399706',1,2),(3,'2024-02-21 18:19:10.444987','2024-02-21 18:19:10.444987',2,4),(4,'2024-02-21 18:29:10.408630','2024-02-21 18:29:10.408630',1,3),(5,'2024-02-21 18:49:27.686934','2024-02-21 18:49:27.686934',3,3),(11,'2024-04-04 18:32:00.760277','2024-04-04 18:32:00.760277',1,4);
/*!40000 ALTER TABLE `Favorite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reports`
--

DROP TABLE IF EXISTS `reports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reports` (
  `id` int NOT NULL AUTO_INCREMENT,
  `content` longtext NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `report_date` date NOT NULL,
  `title` varchar(255) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `employee_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK7m58c0h3phjcm6bco7aqikfen` (`employee_id`),
  CONSTRAINT `FK7m58c0h3phjcm6bco7aqikfen` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reports`
--

LOCK TABLES `reports` WRITE;
/*!40000 ALTER TABLE `reports` DISABLE KEYS */;
INSERT INTO `reports` VALUES (1,'あ','2024-01-20 13:44:10.129623','2024-01-20','テスト１','2024-01-20 13:44:10.129623',1),(2,'い','2024-01-20 13:44:34.574153','2024-01-20','テスト２','2024-01-20 13:44:34.574153',2),(3,'う','2024-01-20 13:44:56.537471','2024-01-20','テスト３','2024-01-20 13:44:56.537471',3),(4,'アイウエオ\r\nかきくけこ\r\nサシスセソ','2024-01-20 13:49:16.683735','2024-01-20','テスト４','2024-02-18 23:24:34.734791',1),(5,'・株式会社丸丸','2024-02-28 20:40:07.888929','2024-02-28','会議資料作成','2024-02-28 20:40:07.888929',1);
/*!40000 ALTER TABLE `reports` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-04-08 13:24:57
