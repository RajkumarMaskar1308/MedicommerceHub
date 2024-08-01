-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: diagnostics_products_trading_system
-- ------------------------------------------------------
-- Server version	5.7.10-log
use diagnostics_products_trading_system;


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
-- Table structure for table `add_product`
--

DROP TABLE IF EXISTS `add_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `add_product` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_name` varchar(500) DEFAULT NULL,
  `manufacturer` varchar(500) DEFAULT NULL,
  `manufactured_date` varchar(500) DEFAULT NULL,
  `type` varchar(200) DEFAULT NULL,
  `product_category` varchar(100) DEFAULT NULL,
  `expire_date` varchar(10) DEFAULT NULL,
  `mrp` bigint(20) DEFAULT NULL,
  `gst` bigint(10) DEFAULT NULL,
  `offer_price` bigint(100) DEFAULT NULL,
  `quantity` varchar(100) DEFAULT NULL,
  `image` varchar(900) DEFAULT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `add_product`
--

LOCK TABLES `add_product` WRITE;
/*!40000 ALTER TABLE `add_product` DISABLE KEYS */;
INSERT INTO `add_product` VALUES (1,'CliniQuant Micro','akanksha traders','2023-01-01','Biochemistry','Biochemistry analyzer','2023-12-01',13500,18,12500,'101','products/cliniquant micro.jpg'),(2,'CliniQuant Micro','akanksha traders','2023-02-09','Biochemistry','Biochemistry analyzer','2023-02-09',13500,18,12500,'101','products/WhatsApp Image 2023-02-09 at 7.09.21 PM.jpeg'),(3,'aaa','aaa','2023-12-31','aaa',NULL,'2023-12-31',10,10,10,'101','products/logo.jpg'),(4,'aaa','aaa','2023-12-31','aaa',NULL,'2023-12-31',10,10,10,'120','products/logo.jpg');
/*!40000 ALTER TABLE `add_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `address_details`
--

DROP TABLE IF EXISTS `address_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `address_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `company_name` varchar(500) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `first_name` varchar(200) DEFAULT NULL,
  `last_name` varchar(200) DEFAULT NULL,
  `address_line1` varchar(200) DEFAULT NULL,
  `address_line2` varchar(200) DEFAULT NULL,
  `city` varchar(200) DEFAULT NULL,
  `state` varchar(200) DEFAULT NULL,
  `pincode` bigint(15) DEFAULT NULL,
  `contact` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address_details`
--

LOCK TABLES `address_details` WRITE;
/*!40000 ALTER TABLE `address_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `address_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_signup`
--

DROP TABLE IF EXISTS `admin_signup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_signup` (
  `admin_id` int(11) NOT NULL AUTO_INCREMENT,
  `company_name` varchar(45) DEFAULT NULL,
  `first_name` varchar(45) DEFAULT NULL,
  `address_line1` varchar(45) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `district` varchar(45) DEFAULT NULL,
  `pincode` bigint(10) DEFAULT NULL,
  `gstno` varchar(45) DEFAULT NULL,
  `accountno` bigint(15) DEFAULT NULL,
  `password` varchar(200) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `last_name` varchar(200) DEFAULT NULL,
  `address_line2` varchar(200) DEFAULT NULL,
  `state` varchar(200) DEFAULT NULL,
  `taluka` varchar(45) DEFAULT NULL,
  `contact_no` bigint(10) DEFAULT NULL,
  `bank_name` varchar(45) DEFAULT NULL,
  `ifsc` varchar(45) DEFAULT NULL,
  `cpassword` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_signup`
--

LOCK TABLES `admin_signup` WRITE;
/*!40000 ALTER TABLE `admin_signup` DISABLE KEYS */;
INSERT INTO `admin_signup` VALUES (1,'Akankshan Enterprise','Akanksha','Sangli','Sangli','Sangli',416509,'null',1234567890,'Akanksha@123','akanksha@gmail.com','Ghatage','Sangli','Maharashtra','Sangli',9876543210,'null','12345','Akanksha@123');
/*!40000 ALTER TABLE `admin_signup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `billing_form`
--

DROP TABLE IF EXISTS `billing_form`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `billing_form` (
  `company_name` varchar(500) DEFAULT NULL,
  `first_name` varchar(200) DEFAULT NULL,
  `address_line1` varchar(200) DEFAULT NULL,
  `city` varchar(200) DEFAULT NULL,
  `pincode` bigint(10) DEFAULT NULL,
  `password` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `billing_form`
--

LOCK TABLES `billing_form` WRITE;
/*!40000 ALTER TABLE `billing_form` DISABLE KEYS */;
/*!40000 ALTER TABLE `billing_form` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cart` (
  `cart_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `product_name` varchar(500) DEFAULT NULL,
  `manufacturer` varchar(500) DEFAULT NULL,
  `manufactured_date` varchar(500) DEFAULT NULL,
  `type` varchar(200) DEFAULT NULL,
  `product_category` varchar(100) DEFAULT NULL,
  `expire_date` varchar(10) DEFAULT NULL,
  `mrp` bigint(20) DEFAULT NULL,
  `gst` bigint(10) DEFAULT NULL,
  `offer_price` bigint(100) DEFAULT NULL,
  `image` varchar(900) DEFAULT NULL,
  `quantity` varchar(100) DEFAULT NULL,
  `total` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`cart_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (1,1,1,'CliniQuant Micro','akanksha traders','2023-01-01','Biochemistry','Biochemistry analyzer','2023-12-01',13500,18,12500,'products/cliniquant micro.jpg','1','14750');
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cinfo`
--

DROP TABLE IF EXISTS `cinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cinfo` (
  `crimeid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `gender` varchar(100) DEFAULT NULL,
  `identityofcriminal` varchar(200) DEFAULT NULL,
  `crimelocatoion` varchar(200) DEFAULT NULL,
  `crimedate` bigint(100) DEFAULT NULL,
  `crimetype` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`crimeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cinfo`
--

LOCK TABLES `cinfo` WRITE;
/*!40000 ALTER TABLE `cinfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `cinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fir`
--

DROP TABLE IF EXISTS `fir`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fir` (
  `FIRNO` bigint(100) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `complaint` varchar(100) DEFAULT NULL,
  `contact` bigint(100) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `EmailId` varchar(100) DEFAULT NULL,
  `gender` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fir`
--

LOCK TABLES `fir` WRITE;
/*!40000 ALTER TABLE `fir` DISABLE KEYS */;
/*!40000 ALTER TABLE `fir` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login`
--

DROP TABLE IF EXISTS `login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `login` (
  `email` varchar(200) DEFAULT NULL,
  `password` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login`
--

LOCK TABLES `login` WRITE;
/*!40000 ALTER TABLE `login` DISABLE KEYS */;
/*!40000 ALTER TABLE `login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `image` varchar(500) DEFAULT NULL,
  `product_name` varchar(200) DEFAULT NULL,
  `order_date` date DEFAULT NULL,
  `delivery_date` varchar(100) DEFAULT NULL,
  `company_name` varchar(500) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `first_name` varchar(200) DEFAULT NULL,
  `last_name` varchar(200) DEFAULT NULL,
  `qauntity` varchar(10) DEFAULT NULL,
  `total_amount` varchar(100) DEFAULT NULL,
  `dstatus` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,3,1,'products/cliniquant micro.jpg','CliniQuant Micro','2023-02-26','2023/03/05',NULL,NULL,NULL,NULL,'1','14750','Pending'),(2,3,1,'products/cliniquant micro.jpg','CliniQuant Micro','2023-02-26','',NULL,NULL,NULL,NULL,'1','14750','Dispatched'),(3,3,1,'products/cliniquant micro.jpg','CliniQuant Micro','2023-02-26','2023/03/05',NULL,NULL,NULL,NULL,'1','14750','Delivered'),(4,1,3,'products/logo.jpg','aaa','2023-03-11','2023-03-24',NULL,NULL,NULL,NULL,'10','110','Cancelled'),(5,1,2,'products/WhatsApp Image 2023-02-09 at 7.09.21 PM.jpeg','CliniQuant Micro','2023-04-22','2023-04-30',NULL,NULL,NULL,NULL,'11','162250','Delivered'),(6,1,1,'products/cliniquant micro.jpg','CliniQuant Micro','2023-04-22','2023/04/29',NULL,NULL,NULL,NULL,'2','29500','Pending'),(7,1,1,'products/cliniquant micro.jpg','CliniQuant Micro','2023-04-22','2023/04/29',NULL,NULL,NULL,NULL,'5','73750','Pending'),(8,1,1,'products/cliniquant micro.jpg','CliniQuant Micro','2023-04-22','2023/04/29',NULL,NULL,NULL,NULL,'5','73750','Pending'),(9,1,1,'products/cliniquant micro.jpg','CliniQuant Micro','2023-06-30','2023-07-09',NULL,NULL,NULL,NULL,'12','177000','Delivered'),(10,1,3,'products/logo.jpg','aaa','2023-07-04','2023-07-31',NULL,NULL,NULL,NULL,'5','55','Delivered');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_detail`
--

DROP TABLE IF EXISTS `payment_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment_detail` (
  `payment_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `card_no` bigint(15) DEFAULT NULL,
  `expiretion_date` varchar(45) DEFAULT NULL,
  `cv_code` bigint(15) DEFAULT NULL,
  `card_owner` varchar(45) DEFAULT NULL,
  `order_date` date DEFAULT NULL,
  `paymentmode` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`payment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_detail`
--

LOCK TABLES `payment_detail` WRITE;
/*!40000 ALTER TABLE `payment_detail` DISABLE KEYS */;
INSERT INTO `payment_detail` VALUES (1,3,0,'',0,'','2023-02-26','Scan Payment'),(2,1,0,'',0,'','2023-03-11','Scan Payment'),(3,1,0,'',0,'','2023-04-22','Scan Payment'),(4,1,0,'',0,'','2023-04-22','Scan Payment'),(5,1,0,'',0,'','2023-06-30','Scan Payment'),(6,1,0,'',0,'','2023-07-04','Scan Payment');
/*!40000 ALTER TABLE `payment_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_signup`
--

DROP TABLE IF EXISTS `user_signup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_signup` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `company_name` varchar(45) DEFAULT NULL,
  `first_name` varchar(45) DEFAULT NULL,
  `address_line1` varchar(45) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `district` varchar(45) DEFAULT NULL,
  `pincode` bigint(10) DEFAULT NULL,
  `gstno` varchar(45) DEFAULT NULL,
  `accountno` bigint(15) DEFAULT NULL,
  `password` varchar(200) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `last_name` varchar(200) DEFAULT NULL,
  `address_line2` varchar(200) DEFAULT NULL,
  `state` varchar(200) DEFAULT NULL,
  `taluka` varchar(45) DEFAULT NULL,
  `contact_no` bigint(10) DEFAULT NULL,
  `bank_name` varchar(45) DEFAULT NULL,
  `ifsc` varchar(45) DEFAULT NULL,
  `cpassword` varchar(200) DEFAULT NULL,
  `photo` varchar(450) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_signup`
--

LOCK TABLES `user_signup` WRITE;
/*!40000 ALTER TABLE `user_signup` DISABLE KEYS */;
INSERT INTO `user_signup` VALUES (1,'Akankshan Enterprise','Akanksha','Sangli','Sangli','Sangli',416509,'null',1234567890,'Akanksha@123','akanksha@gmail.com','Ghatage','Sangli','Maharashtra','Sangli',9876543210,'null','12345','Akanksha@123','signup_logo.png');
/*!40000 ALTER TABLE `user_signup` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-07-14 15:53:55
