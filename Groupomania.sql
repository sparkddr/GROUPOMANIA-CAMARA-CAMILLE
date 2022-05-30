-- MySQL dump 10.13  Distrib 8.0.28, for macos10.15 (x86_64)
--
-- Host: localhost    Database: groupomania_bis
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Table structure for table `Comments`
--

DROP TABLE IF EXISTS `Comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Comments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `message` text NOT NULL,
  `userId` int NOT NULL,
  `postId` int NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`),
  KEY `postId` (`postId`),
  CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `Users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`postId`) REFERENCES `Posts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Comments`
--

LOCK TABLES `Comments` WRITE;
/*!40000 ALTER TABLE `Comments` DISABLE KEYS */;
INSERT INTO `Comments` VALUES (1,'C\'est clair',2,2,'2022-05-30 08:12:29','2022-05-30 08:12:29'),(2,'Wtf',3,1,'2022-05-30 08:12:29','2022-05-30 08:12:29'),(3,'OMG',1,4,'2022-05-30 08:12:29','2022-05-30 08:12:29'),(4,'Mais c\'est complétement fou cette histoire ',1,4,'2022-05-30 08:12:29','2022-05-30 08:12:29');
/*!40000 ALTER TABLE `Comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Posts`
--

DROP TABLE IF EXISTS `Posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Posts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `message` text,
  `pictureurl` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`),
  CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `Users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Posts`
--

LOCK TABLES `Posts` WRITE;
/*!40000 ALTER TABLE `Posts` DISABLE KEYS */;
INSERT INTO `Posts` VALUES (1,2,'Bonjour à tous et bienvenue',NULL,'2022-05-30 08:12:29','2022-05-30 08:12:29'),(2,3,'Hello tout le monde comment ça va?',NULL,'2022-05-30 08:12:29','2022-05-30 08:12:29'),(3,1,'Salut regardez cette vidéo elle est incroyable',NULL,'2022-05-30 08:12:29','2022-05-30 08:12:29'),(4,1,'Je vous transmets les dernières infos concernant la mise en place de la nouvelle salle. Est ce que certaines personnes seraient dispo pour venir m\'aider à installer l\'endroit pour la fête d\'inauguration?',NULL,'2022-05-30 08:12:29','2022-05-30 08:12:29'),(5,4,'Hello aujourd\'hui c\'est l\'anniversaire de Magg, j\'ai emmené un gateau pour fêter ça ! On se retrouve à 17H? ','http://localhost:8000/images/init/gif11653897627061.gif','2022-05-30 08:12:29','2022-05-30 08:12:29');
/*!40000 ALTER TABLE `Posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `signalPosts`
--

DROP TABLE IF EXISTS `signalPosts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `signalPosts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `postId` int NOT NULL,
  `message` text,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`),
  KEY `postId` (`postId`),
  CONSTRAINT `signalposts_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `Users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `signalposts_ibfk_2` FOREIGN KEY (`postId`) REFERENCES `Posts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `signalPosts`
--

LOCK TABLES `signalPosts` WRITE;
/*!40000 ALTER TABLE `signalPosts` DISABLE KEYS */;
/*!40000 ALTER TABLE `signalPosts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Likes`
--

DROP TABLE IF EXISTS `Likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Likes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `postId` int NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`),
  KEY `postId` (`postId`),
  CONSTRAINT `likes_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `Users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `likes_ibfk_2` FOREIGN KEY (`postId`) REFERENCES `Posts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Likes`
--

LOCK TABLES `Likes` WRITE;
/*!40000 ALTER TABLE `Likes` DISABLE KEYS */;
INSERT INTO `Likes` VALUES (1,1,5,'2022-05-30 08:14:05','2022-05-30 08:14:05'),(2,1,3,'2022-05-30 08:14:06','2022-05-30 08:14:06');
/*!40000 ALTER TABLE `Likes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Users`
--

DROP TABLE IF EXISTS `Users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `role` varchar(255) NOT NULL,
  `admin` tinyint(1) DEFAULT NULL,
  `profilpic` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Users`
--

LOCK TABLES `Users` WRITE;
/*!40000 ALTER TABLE `Users` DISABLE KEYS */;
INSERT INTO `Users` VALUES (1,'Camille','CAMARA','cc@gmail.com','$2b$10$Pq4HBqwJZuIXpRJUPm61OuPt3Ac0xMH/njykz1L8pQiK09fn/dG2W','dev',1,'http://localhost:8000/images/init/CaptuCam.png','2022-05-30 08:12:29','2022-05-30 08:12:29'),(2,'Cam','Cool','c@gmail.com','$2b$10$fxHmwrDSVH1AXos9zK7jRO0VfMjvZ87vhDK1H5UPlCSS6fXxENTo2','dev',0,'http://localhost:8000/images/init/avatar-2172a57fb3e0c04fb9caccb7ee79e810.jpg','2022-05-30 08:12:29','2022-05-30 08:12:29'),(3,'Joe','Cool','JC@gmail.com','$2b$10$h.kVnO/8.BVAvam.H6QUUuBK.aquZkUabMcjGbWDfJQqAKhw4royi','dev',0,'http://localhost:8000/images/init/avatar-ef101723885c846e757cc666923f5b58.jpg','2022-05-30 08:12:29','2022-05-30 08:12:29'),(4,'KARDE','Coolos','kc@gmail.com','$2b$10$h/1nKGBAyqjLYs5MZes2QOOaiG4/VBZPevvDhkSD9WpgPT6oQOCuW','dev',0,'http://localhost:8000/images/init/avatar-3dc2006986b01f5510c1963fe879e430.jpg','2022-05-30 08:12:29','2022-05-30 08:12:29'),(5,'CALME','TOI','CT@gmail.com','$2b$10$h/1nKGBAyqjLYs5MZes2QOOaiG4/VBZPevvDhkSD9WpgPT6oQOCuW','dev',0,'http://localhost:8000/images/init/avatar-3dc2006986b01f5510c1963fe879e430.jpg','2022-05-30 08:12:29','2022-05-30 08:12:29');
/*!40000 ALTER TABLE `Users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `signalComments`
--

DROP TABLE IF EXISTS `signalComments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `signalComments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `commentId` int NOT NULL,
  `message` text,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`),
  KEY `commentId` (`commentId`),
  CONSTRAINT `signalcomments_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `Users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `signalcomments_ibfk_2` FOREIGN KEY (`commentId`) REFERENCES `Comments` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `signalComments`
--

LOCK TABLES `signalComments` WRITE;
/*!40000 ALTER TABLE `signalComments` DISABLE KEYS */;
/*!40000 ALTER TABLE `signalComments` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-30 14:10:50
