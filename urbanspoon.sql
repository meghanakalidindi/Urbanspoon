-- MySQL dump 10.13  Distrib 5.5.55, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: urbanspoon
-- ------------------------------------------------------
-- Server version	5.5.55-0ubuntu0.14.04.1

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
-- Table structure for table `branch`
--

DROP TABLE IF EXISTS `branch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `branch` (
  `branch_id` int(11) NOT NULL AUTO_INCREMENT,
  `location` varchar(45) NOT NULL,
  `city` varchar(45) NOT NULL,
  `state` varchar(45) NOT NULL,
  `postal_code` varchar(45) NOT NULL,
  `country` varchar(45) NOT NULL,
  `email_id` varchar(45) NOT NULL,
  `phone_number` bigint(10) NOT NULL,
  `restaurant_id` int(11) NOT NULL,
  `image_path` varchar(45) NOT NULL,
  PRIMARY KEY (`branch_id`),
  UNIQUE KEY `email_id_UNIQUE` (`email_id`),
  UNIQUE KEY `phone_number_UNIQUE` (`phone_number`),
  KEY `restaurant_id_idx` (`restaurant_id`),
  CONSTRAINT `restaurant_id` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurant` (`restaurant_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `branch`
--

LOCK TABLES `branch` WRITE;
/*!40000 ALTER TABLE `branch` DISABLE KEYS */;
INSERT INTO `branch` VALUES (1,'Kondapur','Hyderabad','Telangana','500081','India','kondapur@swagathgrand.com',4064646575,1,'images/branches/swa_konda.jpg'),(2,'Attapur','Hyderabad','Telangana','500081','India','attapur@swagathgrand.com',4064646578,1,'images/branches/swa_atta.jpg'),(3,'Begumpet','Hyderabad','Telangana','500081','India','begumpet@paradise.com',4064646565,2,'images/branches/para_begum.jpg'),(4,'Gachibowli','Hyderabad','Telangana','500082','India',' gachibowli@paradise.com',4064646579,2,'images/branches/para_gachi.jpg'),(5,'Jubilee','hyderbad','Telangana','50081','India','800@gmail.com',0,15,'/home/it/Desktop/eclipse/UrbanSpoon//Urbanspo'),(18,'ameerpet','hyd','ts','555555','india','chutney@123.com',1212121212,27,'/home/it/Desktop/eclipse/UrbanSpoon//Urbanspo');
/*!40000 ALTER TABLE `branch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cuisine`
--

DROP TABLE IF EXISTS `cuisine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cuisine` (
  `cuisine_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `country` varchar(45) NOT NULL,
  `description` varchar(250) NOT NULL,
  PRIMARY KEY (`cuisine_id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cuisine`
--

LOCK TABLES `cuisine` WRITE;
/*!40000 ALTER TABLE `cuisine` DISABLE KEYS */;
INSERT INTO `cuisine` VALUES (1,'North Indian','India','Liked By Indians from Northern Hemisphere'),(2,'South Indian','India','Liked By Indian from Southern Hemisphere'),(3,'japnese','japan','japnese is non veg'),(4,'mexican','mexico','yummy');
/*!40000 ALTER TABLE `cuisine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedback_recipe`
--

DROP TABLE IF EXISTS `feedback_recipe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `feedback_recipe` (
  `feedback_id` int(11) NOT NULL AUTO_INCREMENT,
  `comments` varchar(250) NOT NULL,
  `feedback_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `branch_id` int(11) NOT NULL,
  `recipe_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `rating` int(11) DEFAULT NULL,
  PRIMARY KEY (`feedback_id`),
  KEY `recipe_id_idx` (`recipe_id`),
  KEY `branch_id_idx` (`branch_id`),
  KEY `user_id_idx` (`user_id`),
  CONSTRAINT `branch_id` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`branch_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `recipe_id` FOREIGN KEY (`recipe_id`) REFERENCES `recipe` (`recipe_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedback_recipe`
--

LOCK TABLES `feedback_recipe` WRITE;
/*!40000 ALTER TABLE `feedback_recipe` DISABLE KEYS */;
INSERT INTO `feedback_recipe` VALUES (1,'heeeeeee','2017-04-07 18:30:00',1,1,1,4),(2,'heeeeeee','2017-04-07 18:30:00',2,2,2,NULL),(4,'hello','2017-04-07 18:30:00',2,3,1,NULL),(5,'fine','2017-06-07 07:01:45',1,1,1,1),(6,'chala ante chala bagundi','2017-06-08 08:16:13',4,3,1,5);
/*!40000 ALTER TABLE `feedback_recipe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recipe`
--

DROP TABLE IF EXISTS `recipe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recipe` (
  `recipe_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `cuisine_id` int(11) NOT NULL,
  `description` varchar(250) NOT NULL,
  `image_path` varchar(45) NOT NULL,
  `is_veg` set('0','1') NOT NULL,
  PRIMARY KEY (`recipe_id`),
  KEY `cuisine_id_idx` (`cuisine_id`),
  CONSTRAINT `cuisine_id` FOREIGN KEY (`cuisine_id`) REFERENCES `cuisine` (`cuisine_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipe`
--

LOCK TABLES `recipe` WRITE;
/*!40000 ALTER TABLE `recipe` DISABLE KEYS */;
INSERT INTO `recipe` VALUES (1,'Palakura Pakodi',2,'Palakura Pakodi','images/recipes/palakura_pakodi.jpg','0'),(2,'Vulligudda Pakodi',2,'Vulligudda Pakodi','images/recipes/vulligadda_pakodi.jpg','0'),(3,'Paneer65',2,'Paneer65','images/recipes/paneer65.jpg','0'),(4,'Chilli Chicken',2,'Chilli Chicken','images/recipes/chilli_chicken.jpg','1'),(5,'Kaju kodi',2,'Kaju kodi','images/recipes/kaju_kodi.jpg','1'),(6,'papada Platter',1,'papada Platter','images/recipes/papada_platter.jpg','0'),(7,'Veg Kurkari',2,'Veg Kurkari','images/recipes/vegkur_kari.jpg','0'),(8,'paneer Tikka Multani',1,'paneer Tikka Multani','images/recipes/paneer_tikkamultani.jpg','0'),(9,'Chaamp Tajdar',1,'Chaamp Tajdar','images/recipes/Chaamp_Tajdar.jpg','1'),(10,'Tandoori Murgh',1,'Tandoori Murgh','images/recipes/Tandoori_Murgh.jpg','1');
/*!40000 ALTER TABLE `recipe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restaurant`
--

DROP TABLE IF EXISTS `restaurant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `restaurant` (
  `restaurant_id` int(11) NOT NULL AUTO_INCREMENT,
  `registration_name` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `registration_id` varchar(45) NOT NULL,
  PRIMARY KEY (`restaurant_id`),
  UNIQUE KEY `registration_id_UNIQUE` (`registration_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurant`
--

LOCK TABLES `restaurant` WRITE;
/*!40000 ALTER TABLE `restaurant` DISABLE KEYS */;
INSERT INTO `restaurant` VALUES (1,'swagathGrand','12345','swagath123'),(2,'paradise','12345','paradise123'),(3,'Ohris','12345','ohris123'),(4,'Tgrill','abcd','tgrill123'),(15,'800','800','800id'),(17,'keerthana','keerthi','777'),(27,'Chutney','pappu@123','chutney123');
/*!40000 ALTER TABLE `restaurant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `serve`
--

DROP TABLE IF EXISTS `serve`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `serve` (
  `price` double NOT NULL,
  `branch_id` int(11) NOT NULL,
  `recipe_id` int(11) NOT NULL,
  PRIMARY KEY (`branch_id`,`recipe_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `serve`
--

LOCK TABLES `serve` WRITE;
/*!40000 ALTER TABLE `serve` DISABLE KEYS */;
INSERT INTO `serve` VALUES (189,1,1),(150,1,3),(150,1,4),(120,1,5),(200,1,6),(220,1,7),(160,1,8),(190,1,9),(480,1,10),(189,2,1),(150,2,2),(150,2,3),(150,2,4),(309,2,5),(200,2,6),(220,2,7),(160,2,8),(190,2,9),(480,2,10);
/*!40000 ALTER TABLE `serve` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `email_id` varchar(45) NOT NULL,
  `phone_number` bigint(10) NOT NULL,
  `password` varchar(45) NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `email_id_UNIQUE` (`email_id`),
  UNIQUE KEY `phone_number_UNIQUE` (`phone_number`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'satya','prasad','satyaprasad.a@talentsprint.com',9640055911,'12345'),(2,'pavan','ak','pavan.a@talentsprint.com',8500859624,'12345'),(3,'Divya','Varma','divyasree777@gmail.com',9666717167,'divyavarmadandu'),(4,'ugioasr','ahsrrd','mp123@gmail.com',68594576,'1234'),(5,'gjnmx','gjg','m123@gmail.com',747896568,'1234'),(6,'rajani','kanth','rk@gmail.com',9848097654,'rk123'),(8,'hannah','baker','hannah@gmail.com',998765135,'baker'),(9,'kamal','hassan','kh@gmail.com',9640759431,'kh123'),(14,'uma','kanth','uk@gmail.com',7848012345,'143'),(17,'dasf','fdS','SA@GMAIL.COM',1234567890,'234');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-06-08 16:30:49
