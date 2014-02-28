-- MySQL dump 10.13  Distrib 5.5.27, for Win64 (x86)
--
-- Host: localhost    Database: talendstore
-- ------------------------------------------------------
-- Server version	5.5.27

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
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `id` varchar(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `publisher` varchar(100) NOT NULL,
  `numRating` tinyint(4) NOT NULL,
  `rating` float NOT NULL,
  `icon` varchar(30) NOT NULL,
  `description` varchar(255) NOT NULL,
  `price` float NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES ('231035933','Talend Dog T-Shirt','Talend Inc.',123,2,'dog.png','Doggie t-shirt from American Apparel !!',12),('231035934','Talend Jr. Spaghetti Tank','Talend Inc.',34,4,'spaghetti.png','Spaghetti tank from American Apparel !',16.99),('231035935','Talend Golf Shirt','Talend Inc.',127,3.4,'golf.png','Golf-style, collared t-shirt !!',16.99),('231035936','Talend Fitted T-Shirt','Talend Inc.',127,4.5,'shirt.png','Fitted T. ultra-fine combed ring spun cotton !!',15.99),('231035939','Talend Large Mug','Talend Inc.',127,3,'large.png','15 oz. ceramic Large Mug',12),('231035937','Talend Stein','Talend Inc.',127,4.3,'stein.png','22 oz. ceramic stein with gold trim',13.99),('231035938','Talend Mugs','Talend Inc.',93,2.9,'mugs.png','Large mug, easy-grip handle',15.99),('231035940','Talend Cap','Talend Inc.',127,3.5,'cap.png','Adjustable, 100% brushed cotton Cap',14.99),('231035941','Talend Trucker Hat','Talend Inc.',64,2.4,'hat.png','Standard Trucker Hat, resilient polyester foam front, adjustable headband !',10.99);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `TCDC_TG_products_I` AFTER INSERT ON `products`
 FOR EACH ROW INSERT INTO `talendstore`.`TCDC_products` 
  ( 
   `TALEND_CDC_SUBSCRIBERS_NAME`,
   `TALEND_CDC_STATE`,
   `TALEND_CDC_TYPE`,
   `TALEND_CDC_CREATION_DATE`,
   `id`
  ) SELECT 
     `TALEND_CDC_SUBSCRIBER_NAME`,
     '0',
     'I',
     sysdate(),
     new.`id`      
    FROM `talendstore`.`TSUBSCRIBERS`
    WHERE `TALEND_CDC_TABLE_TO_WATCH`='TalendStore.products' */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `TCDC_TG_products_U` AFTER UPDATE ON `products`
 FOR EACH ROW INSERT INTO `talendstore`.`TCDC_products` 
  ( 
   `TALEND_CDC_SUBSCRIBERS_NAME`,
   `TALEND_CDC_STATE`,
   `TALEND_CDC_TYPE`,
   `TALEND_CDC_CREATION_DATE`,
   `id`
  ) SELECT 
     `TALEND_CDC_SUBSCRIBER_NAME`,
     '0',
     'U',
     sysdate(),
     new.`id`
    FROM `talendstore`.`TSUBSCRIBERS`
    WHERE `TALEND_CDC_TABLE_TO_WATCH`='TalendStore.products' */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `TCDC_TG_products_D` AFTER DELETE ON `products`
 FOR EACH ROW INSERT INTO `talendstore`.`TCDC_products` 
  ( 
   `TALEND_CDC_SUBSCRIBERS_NAME`,
   `TALEND_CDC_STATE`,
   `TALEND_CDC_TYPE`,
   `TALEND_CDC_CREATION_DATE`,
   `id`
  ) SELECT 
     `TALEND_CDC_SUBSCRIBER_NAME`,
     '0',
     'D',
     sysdate(),
     old.`id` 
    FROM `talendstore`.`TSUBSCRIBERS`
    WHERE `TALEND_CDC_TABLE_TO_WATCH`='TalendStore.products' */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-02-27 21:42:28
