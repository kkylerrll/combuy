-- MariaDB dump 10.19  Distrib 10.4.28-MariaDB, for osx10.10 (x86_64)
--
-- Host: localhost    Database: cambuy
-- ------------------------------------------------------
-- Server version	10.4.28-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `cambuy`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `cambuy` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci */;

USE `cambuy`;

--
-- Table structure for table `bannerimg`
--

DROP TABLE IF EXISTS `bannerimg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bannerimg` (
  `img_id` int(11) NOT NULL AUTO_INCREMENT,
  `dir` varchar(100) NOT NULL,
  `filename` varchar(100) NOT NULL,
  `link` varchar(100) NOT NULL,
  PRIMARY KEY (`img_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bannerimg`
--

LOCK TABLES `bannerimg` WRITE;
/*!40000 ALTER TABLE `bannerimg` DISABLE KEYS */;
/*!40000 ALTER TABLE `bannerimg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `brand`
--

DROP TABLE IF EXISTS `brand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `brand` (
  `brand_id` int(11) NOT NULL,
  `brand` varchar(50) NOT NULL,
  `content` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`brand_id`),
  CONSTRAINT `brand_ibfk_1` FOREIGN KEY (`brand_id`) REFERENCES `product` (`brand_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brand`
--

LOCK TABLES `brand` WRITE;
/*!40000 ALTER TABLE `brand` DISABLE KEYS */;
/*!40000 ALTER TABLE `brand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `card`
--

DROP TABLE IF EXISTS `card`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `card` (
  `card_num` int(11) NOT NULL,
  `expiry_date` int(11) NOT NULL,
  `security_code` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`card_num`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `card`
--

LOCK TABLES `card` WRITE;
/*!40000 ALTER TABLE `card` DISABLE KEYS */;
/*!40000 ALTER TABLE `card` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `category_id` int(11) NOT NULL,
  `category` varchar(50) NOT NULL,
  `content` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`category_id`),
  CONSTRAINT `category_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `product` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `collect`
--

DROP TABLE IF EXISTS `collect`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `collect` (
  `user_id` int(11) NOT NULL,
  `prod_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`prod_id`),
  KEY `prod_id` (`prod_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collect`
--

LOCK TABLES `collect` WRITE;
/*!40000 ALTER TABLE `collect` DISABLE KEYS */;
/*!40000 ALTER TABLE `collect` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comment` (
  `comment_id` int(11) NOT NULL,
  `uploadtime` datetime NOT NULL,
  `rate` tinyint(4) NOT NULL,
  `content` varchar(300) NOT NULL,
  PRIMARY KEY (`comment_id`),
  CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`comment_id`) REFERENCES `comment_order` (`comment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment_order`
--

DROP TABLE IF EXISTS `comment_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comment_order` (
  `comment_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  PRIMARY KEY (`comment_id`,`order_id`),
  KEY `order_id` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment_order`
--

LOCK TABLES `comment_order` WRITE;
/*!40000 ALTER TABLE `comment_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `comment_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `format`
--

DROP TABLE IF EXISTS `format`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `format` (
  `format_id` int(11) NOT NULL AUTO_INCREMENT,
  `prod_id` int(11) NOT NULL,
  `content` varchar(2000) DEFAULT NULL,
  `cpu` varchar(200) DEFAULT NULL,
  `gpu` varchar(200) DEFAULT NULL,
  `ram` varchar(200) DEFAULT NULL,
  `weight` varchar(200) DEFAULT NULL,
  `os` varchar(200) DEFAULT NULL,
  `warranty` varchar(200) DEFAULT NULL,
  `size` varchar(200) DEFAULT NULL,
  `screen` varchar(200) DEFAULT NULL,
  `battery` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`format_id`,`prod_id`),
  KEY `prod_id` (`prod_id`),
  CONSTRAINT `format_ibfk_2` FOREIGN KEY (`format_id`) REFERENCES `order_product` (`format_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `format`
--

LOCK TABLES `format` WRITE;
/*!40000 ALTER TABLE `format` DISABLE KEYS */;
/*!40000 ALTER TABLE `format` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `order_date` datetime NOT NULL,
  `recipient` varchar(100) NOT NULL,
  `recipient_address` varchar(300) NOT NULL,
  `recipient_phone` varchar(50) NOT NULL,
  `state` tinyint(4) NOT NULL DEFAULT 1,
  `pay` tinyint(4) NOT NULL DEFAULT 0,
  `pay_method` tinyint(4) NOT NULL,
  PRIMARY KEY (`order_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `order_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `order_product` (`order_id`),
  CONSTRAINT `order_ibfk_2` FOREIGN KEY (`order_id`) REFERENCES `comment_order` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_product`
--

DROP TABLE IF EXISTS `order_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_product` (
  `order_id` int(11) NOT NULL,
  `prod_id` int(11) NOT NULL,
  `format_id` int(11) NOT NULL,
  `count` int(11) NOT NULL,
  PRIMARY KEY (`order_id`,`prod_id`,`format_id`) USING BTREE,
  KEY `prod_id` (`prod_id`),
  KEY `format_id` (`format_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_product`
--

LOCK TABLES `order_product` WRITE;
/*!40000 ALTER TABLE `order_product` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `prod_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `brand_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `prdname` varchar(50) NOT NULL,
  `upload_date` date NOT NULL,
  `content` varchar(500) DEFAULT NULL,
  `sell_spec_name` varchar(50) DEFAULT NULL,
  `price` int(11) NOT NULL DEFAULT 0,
  `stock` int(11) NOT NULL DEFAULT 0,
  `publish` tinyint(4) NOT NULL DEFAULT 0,
  `transport` tinyint(4) NOT NULL DEFAULT 3,
  `payment` tinyint(4) NOT NULL DEFAULT 3,
  `creat_time` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`prod_id`),
  KEY `user_id` (`user_id`),
  KEY `brand_id` (`brand_id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `product_ibfk_1` FOREIGN KEY (`prod_id`) REFERENCES `collect` (`prod_id`),
  CONSTRAINT `product_ibfk_2` FOREIGN KEY (`prod_id`) REFERENCES `shopcart` (`prod_id`),
  CONSTRAINT `product_ibfk_3` FOREIGN KEY (`prod_id`) REFERENCES `productimg` (`prod_id`),
  CONSTRAINT `product_ibfk_4` FOREIGN KEY (`prod_id`) REFERENCES `product_tag` (`prod_id`),
  CONSTRAINT `product_ibfk_5` FOREIGN KEY (`prod_id`) REFERENCES `order_product` (`prod_id`),
  CONSTRAINT `product_ibfk_6` FOREIGN KEY (`prod_id`) REFERENCES `format` (`prod_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_tag`
--

DROP TABLE IF EXISTS `product_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_tag` (
  `prod_id` int(11) NOT NULL,
  `tag` int(11) NOT NULL,
  PRIMARY KEY (`prod_id`,`tag`),
  KEY `tag` (`tag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_tag`
--

LOCK TABLES `product_tag` WRITE;
/*!40000 ALTER TABLE `product_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productimg`
--

DROP TABLE IF EXISTS `productimg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `productimg` (
  `img_id` int(11) NOT NULL AUTO_INCREMENT,
  `prod_id` int(11) NOT NULL,
  `dir` varchar(100) NOT NULL,
  `filename` varchar(100) NOT NULL,
  `type` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`img_id`),
  KEY `prod_id` (`prod_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productimg`
--

LOCK TABLES `productimg` WRITE;
/*!40000 ALTER TABLE `productimg` DISABLE KEYS */;
/*!40000 ALTER TABLE `productimg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shopcart`
--

DROP TABLE IF EXISTS `shopcart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shopcart` (
  `user_id` int(11) NOT NULL,
  `prod_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`prod_id`),
  KEY `prod_id` (`prod_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shopcart`
--

LOCK TABLES `shopcart` WRITE;
/*!40000 ALTER TABLE `shopcart` DISABLE KEYS */;
/*!40000 ALTER TABLE `shopcart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag`
--

DROP TABLE IF EXISTS `tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tag` (
  `tag` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`tag`),
  CONSTRAINT `tag_ibfk_1` FOREIGN KEY (`tag`) REFERENCES `product_tag` (`tag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag`
--

LOCK TABLES `tag` WRITE;
/*!40000 ALTER TABLE `tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `right` tinyint(4) NOT NULL DEFAULT 2,
  `acc` varchar(20) NOT NULL,
  `pwd` varchar(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `birth` date NOT NULL,
  `address` varchar(300) NOT NULL,
  `photo` varchar(300) DEFAULT NULL,
  `chenge_pwd_time` date NOT NULL,
  `creat_time` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`user_id`),
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `card` (`user_id`),
  CONSTRAINT `user_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `collect` (`user_id`),
  CONSTRAINT `user_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `shopcart` (`user_id`),
  CONSTRAINT `user_ibfk_4` FOREIGN KEY (`user_id`) REFERENCES `product` (`user_id`),
  CONSTRAINT `user_ibfk_5` FOREIGN KEY (`user_id`) REFERENCES `order` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'cambuy'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-24 11:55:46
