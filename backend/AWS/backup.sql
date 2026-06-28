-- MySQL dump 10.13  Distrib 8.4.10, for Linux (x86_64)
--
-- Host: localhost    Database: sunlink_power
-- ------------------------------------------------------
-- Server version	8.4.10-0ubuntu0.26.04.1

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
-- Table structure for table `Admins`
--

DROP TABLE IF EXISTS `Admins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Admins` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password_hash` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `full_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` enum('super_admin','admin','editor') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'admin',
  `is_active` tinyint(1) DEFAULT '1',
  `last_login` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  KEY `idx_username` (`username`),
  KEY `idx_active` (`is_active`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Admins`
--

LOCK TABLES `Admins` WRITE;
/*!40000 ALTER TABLE `Admins` DISABLE KEYS */;
INSERT INTO `Admins` VALUES (1,'admin','$2a$12$rfNxTGtgOhOW0jR8oQlW6ehDkdvEDV64chK84LYuO8gndOpUZoNXK','admin@sunlinkpower.com','System Administrator','super_admin',1,'2026-06-26 09:24:23','2026-04-21 21:08:13','2026-06-26 09:24:23');
/*!40000 ALTER TABLE `Admins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Categories`
--

DROP TABLE IF EXISTS `Categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `image_url` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`),
  KEY `idx_categories_slug` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Categories`
--

LOCK TABLES `Categories` WRITE;
/*!40000 ALTER TABLE `Categories` DISABLE KEYS */;
INSERT INTO `Categories` VALUES (1,'Solar Panels','High-efficiency photovoltaic modules for residential, commercial, industrial, and utility-scale solar systems.','/uploads/categories/4343acf7-5a8a-4f7d-8802-ddd000057371-1782467507849-409900920.png','solar-panels','2026-06-25 21:18:39','2026-06-26 09:51:49'),(2,'Inverters','Off-grid, hybrid, single-phase, and three-phase solar inverters for reliable power conversion and storage integration.','/uploads/categories/8f1dd68d-cf5f-43c4-aa8a-badd879ac182-1782462573550-831151423.png','inverters','2026-06-25 21:18:39','2026-06-26 08:29:33'),(3,'Batteries','LiFePO4 energy storage batteries including wall-mounted, rack-mounted, stackable, and high-voltage cabinet systems.','/uploads/categories/9bd50c3b-0c14-4ef0-b70f-d7549eee8646-1782458822937-895406616.png','batteries','2026-06-25 21:18:39','2026-06-26 07:27:02'),(4,'Charge Controllers','PWM and MPPT solar charge controllers for battery charging, PV input optimization, and system protection.','/uploads/categories/7c68926c-0390-4473-8331-9f4b37d8cf6b-1782459264074-557368368.png','charge-controllers','2026-06-25 21:18:39','2026-06-26 07:34:24'),(5,'Accessories','Solar cables, MC4 connectors, mounting brackets, rails, fasteners, and installation accessories.','/uploads/categories/a0056e39-f509-46b3-a98a-9b32adb7838e-1782457791288-269630513.png','accessories','2026-06-25 21:18:39','2026-06-26 07:09:51'),(6,'Solar Lights','Solar lighting products for roads, public spaces, compounds, landscapes, indoor use, and off-grid applications.',NULL,'solar-lights','2026-06-25 21:18:39','2026-06-25 21:18:39'),(7,'Solar Street Lights','Integrated solar street lights with mono solar panels, LiFePO4 batteries, LED modules, radar sensors, and optional camera features.','/uploads/categories/ad5d4c36-3cf2-419f-9cd0-967020a79033-1782466589289-879067817.png','solar-street-lights','2026-06-25 21:18:39','2026-06-26 09:36:30'),(8,'Solar Flood Lights','Outdoor solar flood lights for yards, farms, warehouses, compounds, playgrounds, parking areas, and security lighting.','/uploads/categories/7397b339-bee1-47b7-af75-23bac0780f57-1782463526620-508033205.png','solar-flood-lights','2026-06-25 21:18:39','2026-06-26 08:45:26'),(9,'Solar Garden Lights','Decorative and functional solar lawn, garden, pathway, and landscape lighting products.','/uploads/categories/0864bf6b-a595-4978-9117-5588ad88bdee-1782463819595-276285538.png','solar-garden-lights','2026-06-25 21:18:39','2026-06-26 08:50:19'),(10,'Solar Strip Lights','Flexible solar strip lighting for outdoor decoration, signage, paths, and low-voltage solar lighting applications.',NULL,'solar-strip-lights','2026-06-25 21:18:39','2026-06-25 21:18:39'),(11,'Solar Batten Lights','Solar-powered batten tube lights for rooms, shops, corridors, field offices, and spaces without reliable grid electricity.','/uploads/categories/e2d6a633-15a8-4960-8e43-f7f94f492e2b-1782463007852-241582474.png','solar-batten-lights','2026-06-25 21:18:39','2026-06-26 08:36:47'),(12,'Solar Fans','Portable rechargeable solar fans for homes, clinics, shops, schools, and off-grid comfort applications.','/uploads/categories/2e3b5d5d-04d0-4be2-bd1b-37a132838aa1-1782463187780-840516239.png','solar-fans','2026-06-25 21:18:39','2026-06-26 08:39:47'),(13,'Solar Light and Fan Packages','Integrated solar kits combining lighting, fan cooling, battery storage, mobile charging, and solar input for daily use.','/uploads/categories/c98bc2b8-cd38-4e48-ad57-beb8d78ff02a-1782467744626-78728752.png','solar-light-and-fan-packages','2026-06-25 21:18:39','2026-06-26 09:55:44'),(14,'Energy Storage Systems','Residential, commercial, industrial, containerized, and PV plus ESS plus EV charging energy storage solutions.','/uploads/categories/36a43aa9-9e61-496b-af65-7ae504be6593-1782460471547-704973606.png','energy-storage-systems','2026-06-25 21:18:39','2026-06-26 07:54:31'),(15,'EV Chargers','EV charging systems and PV plus ESS plus EVSE solutions for fleet yards, public charging, and commercial parking.','/uploads/categories/99f50865-55f9-4de5-b92a-6d0c98aecdfd-1782460920736-261520278.png','ev-chargers','2026-06-25 21:18:39','2026-06-26 08:02:00'),(16,'UPS Systems','Industrial uninterruptible power supply systems for critical backup and stable pure sine wave output.','/uploads/categories/43154830-7605-40ea-a396-e19a9061c651-1782464383709-772856481.png','ups-systems','2026-06-25 21:18:39','2026-06-26 08:59:43'),(17,'BIPV Carports','Solar carport structures integrating vehicle shelter, PV generation, and optional EV charging deployment.','/uploads/categories/99eda8ca-f32a-4ec1-9334-72c8949fd3a9-1782459101635-828876549.png','bipv-carports','2026-06-25 21:18:39','2026-06-26 07:31:41'),(18,'Energy Management Systems','EMS software and controller platforms for monitoring, dispatching, and coordinating PV, ESS, load, grid, and EV charging.','/uploads/categories/711598ea-6d18-4a15-8766-f992982741be-1782459931376-582307577.png','energy-management-systems','2026-06-25 21:18:39','2026-06-26 07:45:31'),(19,'Combiner Boxes','PV combiner boxes for DC string protection, surge protection, isolation, and organized inverter input wiring.','/uploads/categories/ac4573c0-1029-4d1c-8d13-8f0029a6163c-1782459594776-105776579.png','combiner-boxes','2026-06-25 21:18:39','2026-06-26 07:39:54'),(20,'Solar Water Pumps','Solar water pump systems for agriculture, irrigation, boreholes, livestock, and rural water supply.','/uploads/categories/2e98cf05-798c-471e-8bf4-ededc428a95b-1782464231321-822155899.png','solar-water-pumps','2026-06-25 21:18:39','2026-06-26 08:57:11'),(21,'Solar Generators','Portable and semi-mobile solar generator systems for emergency backup, outdoor work, and remote power.','/uploads/categories/8dee2195-54c5-4718-b6ec-8ac92db38d4c-1782464072829-98696335.png','solar-generators','2026-06-25 21:18:39','2026-06-26 08:54:32');
/*!40000 ALTER TABLE `Categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `KitImages`
--

DROP TABLE IF EXISTS `KitImages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `KitImages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `kit_id` int NOT NULL,
  `image_url` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `alt_text` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sort_order` int DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_kit_images_kit_id` (`kit_id`),
  CONSTRAINT `KitImages_ibfk_1` FOREIGN KEY (`kit_id`) REFERENCES `Kits` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `KitImages`
--

LOCK TABLES `KitImages` WRITE;
/*!40000 ALTER TABLE `KitImages` DISABLE KEYS */;
INSERT INTO `KitImages` VALUES (1,2,'/uploads/kits/kithome3kw2-1782468022847-814712650.jpg','3.0KW Home Solar System - Gallery Image 1',0,'2026-06-26 10:00:22'),(2,2,'/uploads/kits/kithome3kw-1782468022892-662065390.jpg','3.0KW Home Solar System - Gallery Image 2',1,'2026-06-26 10:00:22'),(3,17,'/uploads/kits/300whome2-1782468570840-285430175.jpg','3000W Solar Power Generator Kit - Gallery Image 1',0,'2026-06-26 10:09:30'),(4,17,'/uploads/kits/300whome-1782468570880-308661358.jpg','3000W Solar Power Generator Kit - Gallery Image 2',1,'2026-06-26 10:09:30'),(5,16,'/uploads/kits/300whome2-1782468644990-591774562.jpg','1500W Solar Power Generator Kit - Gallery Image 1',0,'2026-06-26 10:10:45'),(6,16,'/uploads/kits/300whome-1782468645029-992612088.jpg','1500W Solar Power Generator Kit - Gallery Image 2',1,'2026-06-26 10:10:45'),(7,1,'/uploads/kits/kit-image-2-1782550920015-194855519.jpg','1.5KW Home Solar System - Gallery Image 1',0,'2026-06-27 09:02:00');
/*!40000 ALTER TABLE `KitImages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `KitProducts`
--

DROP TABLE IF EXISTS `KitProducts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `KitProducts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `kit_id` int NOT NULL,
  `product_id` int NOT NULL,
  `quantity` int DEFAULT '1',
  `sort_order` int DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_kit_product` (`kit_id`,`product_id`),
  KEY `idx_kit_products_kit_id` (`kit_id`),
  KEY `idx_kit_products_product_id` (`product_id`),
  CONSTRAINT `KitProducts_ibfk_1` FOREIGN KEY (`kit_id`) REFERENCES `Kits` (`id`) ON DELETE CASCADE,
  CONSTRAINT `KitProducts_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `Products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=175 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `KitProducts`
--

LOCK TABLES `KitProducts` WRITE;
/*!40000 ALTER TABLE `KitProducts` DISABLE KEYS */;
INSERT INTO `KitProducts` VALUES (13,3,103,12,1,'2026-06-26 09:23:30'),(14,3,203,1,2,'2026-06-26 09:23:30'),(15,3,303,1,3,'2026-06-26 09:23:30'),(16,3,501,2,4,'2026-06-26 09:23:30'),(17,3,504,1,5,'2026-06-26 09:23:30'),(18,3,506,1,6,'2026-06-26 09:23:30'),(19,3,1802,1,7,'2026-06-26 09:23:30'),(27,5,103,36,1,'2026-06-26 09:23:30'),(28,5,208,1,2,'2026-06-26 09:23:30'),(29,5,305,2,3,'2026-06-26 09:23:30'),(30,5,502,3,4,'2026-06-26 09:23:30'),(31,5,506,2,5,'2026-06-26 09:23:30'),(32,5,1804,1,6,'2026-06-26 09:23:30'),(33,6,103,55,1,'2026-06-26 09:23:30'),(34,6,209,1,2,'2026-06-26 09:23:30'),(35,6,305,3,3,'2026-06-26 09:23:30'),(36,6,502,4,4,'2026-06-26 09:23:30'),(37,6,506,3,5,'2026-06-26 09:23:30'),(38,6,1804,1,6,'2026-06-26 09:23:30'),(39,7,103,90,1,'2026-06-26 09:23:30'),(40,7,209,1,2,'2026-06-26 09:23:30'),(41,7,311,1,3,'2026-06-26 09:23:30'),(42,7,1701,1,4,'2026-06-26 09:23:30'),(43,7,1804,1,5,'2026-06-26 09:23:30'),(44,7,506,4,6,'2026-06-26 09:23:30'),(45,8,103,182,1,'2026-06-26 09:23:30'),(46,8,1304,1,2,'2026-06-26 09:23:30'),(47,8,1701,1,3,'2026-06-26 09:23:30'),(48,8,1805,1,4,'2026-06-26 09:23:30'),(49,8,506,8,5,'2026-06-26 09:23:30'),(50,9,104,327,1,'2026-06-26 09:23:30'),(51,9,1305,1,2,'2026-06-26 09:23:30'),(52,9,1701,1,3,'2026-06-26 09:23:30'),(53,9,1805,2,4,'2026-06-26 09:23:30'),(54,9,506,12,5,'2026-06-26 09:23:30'),(55,10,104,860,1,'2026-06-26 09:23:30'),(56,10,1306,1,2,'2026-06-26 09:23:30'),(57,10,1701,1,3,'2026-06-26 09:23:30'),(58,10,1805,4,4,'2026-06-26 09:23:30'),(59,10,506,30,5,'2026-06-26 09:23:30'),(60,11,104,860,1,'2026-06-26 09:23:30'),(61,11,1306,1,2,'2026-06-26 09:23:30'),(62,11,1701,1,3,'2026-06-26 09:23:30'),(63,11,1805,4,4,'2026-06-26 09:23:30'),(64,12,104,1720,1,'2026-06-26 09:23:30'),(65,12,1306,2,2,'2026-06-26 09:23:30'),(66,12,1701,1,3,'2026-06-26 09:23:30'),(67,12,1805,8,4,'2026-06-26 09:23:30'),(71,14,313,1,1,'2026-06-26 09:23:30'),(72,14,209,1,2,'2026-06-26 09:23:30'),(73,14,1701,1,3,'2026-06-26 09:23:30'),(74,15,1306,1,1,'2026-06-26 09:23:30'),(75,15,1403,1,2,'2026-06-26 09:23:30'),(76,15,1701,1,3,'2026-06-26 09:23:30'),(83,18,2003,1,1,'2026-06-26 09:23:30'),(84,18,103,12,2,'2026-06-26 09:23:30'),(85,18,504,1,3,'2026-06-26 09:23:30'),(86,19,306,1,1,'2026-06-26 09:23:30'),(87,19,307,1,2,'2026-06-26 09:23:30'),(88,19,204,1,3,'2026-06-26 09:23:30'),(89,20,308,1,1,'2026-06-26 09:23:30'),(90,20,309,1,2,'2026-06-26 09:23:30'),(91,20,207,1,3,'2026-06-26 09:23:30'),(92,21,1201,1,1,'2026-06-26 09:23:30'),(93,21,1202,1,2,'2026-06-26 09:23:30'),(94,21,1102,1,3,'2026-06-26 09:23:30'),(95,21,1001,2,4,'2026-06-26 09:23:30'),(102,23,104,180,1,'2026-06-26 09:23:30'),(103,23,1306,1,2,'2026-06-26 09:23:30'),(104,23,1403,1,3,'2026-06-26 09:23:30'),(105,23,1601,1,4,'2026-06-26 09:23:30'),(106,23,1701,1,5,'2026-06-26 09:23:30'),(107,24,103,12,1,'2026-06-26 09:23:30'),(108,24,203,1,2,'2026-06-26 09:23:30'),(109,24,303,1,3,'2026-06-26 09:23:30'),(110,24,506,1,4,'2026-06-26 09:23:30'),(111,24,1802,1,5,'2026-06-26 09:23:30'),(112,25,103,36,1,'2026-06-26 09:23:30'),(113,25,208,1,2,'2026-06-26 09:23:30'),(114,25,310,1,3,'2026-06-26 09:23:30'),(115,25,506,2,4,'2026-06-26 09:23:30'),(116,25,1804,1,5,'2026-06-26 09:23:30'),(117,26,311,1,1,'2026-06-26 09:23:30'),(118,26,312,1,2,'2026-06-26 09:23:30'),(119,26,313,1,3,'2026-06-26 09:23:30'),(120,26,207,1,4,'2026-06-26 09:23:30'),(121,26,1701,1,5,'2026-06-26 09:23:30'),(141,2,101,10,0,'2026-06-26 10:00:22'),(142,2,201,1,1,'2026-06-26 10:00:22'),(143,2,302,1,2,'2026-06-26 10:00:22'),(144,2,501,1,3,'2026-06-26 10:00:22'),(145,2,504,1,4,'2026-06-26 10:00:22'),(146,2,505,1,5,'2026-06-26 10:00:22'),(147,17,2002,1,0,'2026-06-26 10:09:30'),(148,17,101,10,1,'2026-06-26 10:09:30'),(149,17,504,1,2,'2026-06-26 10:09:30'),(150,16,2001,1,0,'2026-06-26 10:10:45'),(151,16,106,4,1,'2026-06-26 10:10:45'),(152,16,501,1,2,'2026-06-26 10:10:45'),(153,13,312,1,0,'2026-06-26 10:18:38'),(154,13,207,1,1,'2026-06-26 10:18:38'),(155,13,1701,1,2,'2026-06-26 10:18:38'),(156,22,103,20,0,'2026-06-26 10:24:35'),(157,22,206,1,1,'2026-06-26 10:24:35'),(158,22,309,1,2,'2026-06-26 10:24:35'),(159,22,1902,1,3,'2026-06-26 10:24:35'),(160,22,702,2,4,'2026-06-26 10:24:35'),(161,22,501,2,5,'2026-06-26 10:24:35'),(162,4,103,18,0,'2026-06-26 10:39:49'),(163,4,205,1,1,'2026-06-26 10:39:49'),(164,4,304,1,2,'2026-06-26 10:39:49'),(165,4,501,2,3,'2026-06-26 10:39:49'),(166,4,504,1,4,'2026-06-26 10:39:49'),(167,4,506,1,5,'2026-06-26 10:39:49'),(168,4,1803,1,6,'2026-06-26 10:39:49'),(169,1,101,5,0,'2026-06-27 09:02:00'),(170,1,201,1,1,'2026-06-27 09:02:00'),(171,1,301,1,2,'2026-06-27 09:02:00'),(172,1,501,1,3,'2026-06-27 09:02:00'),(173,1,503,2,4,'2026-06-27 09:02:00'),(174,1,505,1,5,'2026-06-27 09:02:00');
/*!40000 ALTER TABLE `KitProducts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Kits`
--

DROP TABLE IF EXISTS `Kits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Kits` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `image_url` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_featured` tinyint(1) DEFAULT '0',
  `stock_status` enum('in_stock','out_of_stock','pre_order') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'in_stock',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`),
  KEY `idx_kits_slug` (`slug`),
  KEY `idx_kits_featured` (`is_featured`),
  KEY `idx_kits_stock` (`stock_status`),
  FULLTEXT KEY `idx_kits_search` (`name`,`description`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Kits`
--

LOCK TABLES `Kits` WRITE;
/*!40000 ALTER TABLE `Kits` DISABLE KEYS */;
INSERT INTO `Kits` VALUES (1,'1.5KW Home Solar System','Compact Entelechy-style residential solar kit for lighting, phone charging, router backup, fan use, and small daily loads. Designed for starter homes, shops, and off-grid rooms.','/uploads/kits/1-5kw-kit-1782550919719-550521652.png','home-solar-system-1-5kw',1,'in_stock','2026-06-26 09:23:30','2026-06-27 09:02:00'),(2,'3.0KW Home Solar System','Entry Entelechy-style home solar package for small houses, shops, classrooms, and backup power with panels, inverter, LiFePO4 storage, mounting, cabling, and connectors.','/uploads/kits/3kw-1782468021741-636315567.png','home-solar-system-3kw',1,'in_stock','2026-06-26 09:23:30','2026-06-26 10:00:22'),(3,'6.2KW Home Solar System','Mid-size household and small business kit aligned to the 6.2KW home solar system family for refrigeration, lighting, entertainment, fans, and moderate appliance loads.',NULL,'home-solar-system-6kw',1,'in_stock','2026-06-26 09:23:30','2026-06-26 09:23:30'),(4,'6.2KW-10KW Home Solar System','Large residential and light commercial solar system aligned to Entelechy-style 6.2KW-10KW capacity bands with higher inverter capacity and scalable battery storage.','/uploads/kits/3kw2w-1782470388340-848507547.png','home-solar-system-10kw',1,'in_stock','2026-06-26 09:23:30','2026-06-26 10:39:49'),(5,'20KW-30KW Home Solar System','Large villa, estate, office, or compound solar system aligned to Entelechy-style 20KW-30KW home solar system packaging.',NULL,'home-solar-system-20kw',0,'in_stock','2026-06-26 09:23:30','2026-06-26 09:23:30'),(6,'30KW Home and Facility Solar System','High-capacity solar system for compounds, facilities, farms, and offices with three-phase inverter capability and larger PV array sizing.',NULL,'home-solar-system-30kw',0,'in_stock','2026-06-26 09:23:30','2026-06-26 09:23:30'),(7,'30KW-50KW Commercial Solar System','Commercial solar kit for shops, offices, hotels, clinics, schools, warehouses, and small factories.',NULL,'commercial-solar-system-30-50kw',1,'in_stock','2026-06-26 09:23:30','2026-06-26 09:23:30'),(8,'60KW-100KW Commercial Solar System','Higher-capacity commercial solar kit for factories, malls, hotels, schools, and business facilities needing stronger energy cost control.',NULL,'commercial-solar-system-60-100kw',1,'in_stock','2026-06-26 09:23:30','2026-06-26 09:23:30'),(9,'120KW-180KW Industrial Solar System','Industrial solar package for warehouses, manufacturing, production sites, and high-consumption facilities.',NULL,'industrial-solar-system-120-180kw',0,'in_stock','2026-06-26 09:23:30','2026-06-26 09:23:30'),(10,'250KW-500KW Industrial Solar System','Project-scale solar and storage solution for industrial parks, large factories, logistics bases, and high-demand commercial sites.',NULL,'industrial-solar-system-250-500kw',0,'in_stock','2026-06-26 09:23:30','2026-06-26 09:23:30'),(11,'500KW Container Solar System','Containerized solar and storage solution for industrial power, microgrids, EV charging depots, and remote infrastructure.',NULL,'container-solar-system-500kw',0,'in_stock','2026-06-26 09:23:30','2026-06-26 09:23:30'),(12,'1MW Container Solar System','Large-scale containerized PV plus ESS solution for industrial sites, charging depots, and utility support projects.',NULL,'container-solar-system-1000kw',0,'in_stock','2026-06-26 09:23:30','2026-06-26 09:23:30'),(13,'100kWh Industrial and Commercial ESS Kit','Battery energy storage package for backup, peak shaving, solar self-consumption, and commercial energy stability.','/uploads/kits/ffddfdfd-1782469117078-693955843.png','ic-ess-100kwh',1,'in_stock','2026-06-26 09:23:30','2026-06-26 10:18:38'),(14,'200kWh Industrial and Commercial ESS Kit','Expanded ESS package for factories, hotels, campuses, telecom, and commercial facilities requiring longer runtime.',NULL,'ic-ess-200kwh',0,'in_stock','2026-06-26 09:23:30','2026-06-26 09:23:30'),(15,'500kWh Industrial and Commercial ESS Kit','High-capacity ESS solution for larger facilities, microgrids, EV charging stations, and PV storage projects.',NULL,'ic-ess-500kwh',0,'in_stock','2026-06-26 09:23:30','2026-06-26 09:23:30'),(16,'1500W Solar Power Generator Kit','Portable solar power generator kit for emergency backup, outdoor work, camping, small shops, and mobile power.','/uploads/kits/3kw2w-1782468643894-557340461.png','solar-generator-1500w',1,'in_stock','2026-06-26 09:23:30','2026-06-26 10:10:45'),(17,'3000W Solar Power Generator Kit','Portable and semi-mobile solar power generator package for stronger backup, field teams, and small business use.','/uploads/kits/3kw2w-1782468569721-709798468.png','solar-generator-3000w',1,'in_stock','2026-06-26 09:23:30','2026-06-26 10:09:30'),(18,'6200W Solar Power Generator Kit','High-output solar power generator kit for remote sites, resilient household loads, and field operations.',NULL,'solar-generator-6200w',0,'in_stock','2026-06-26 09:23:30','2026-06-26 09:23:30'),(19,'2.5KWh-17KWh Powerwall Battery Kit','Wall-mounted LiFePO4 powerwall battery family paired with compatible hybrid inverter options for residential solar backup.',NULL,'powerwall-battery-kit',0,'in_stock','2026-06-26 09:23:30','2026-06-26 09:23:30'),(20,'Rack Mounted Battery Kit','Rack-mounted LiFePO4 battery package for telecom, server room, commercial backup, and modular solar storage.',NULL,'rack-battery-kit',0,'in_stock','2026-06-26 09:23:30','2026-06-26 09:23:30'),(21,'Solar Light and Fan Home Kit','Integrated home kit with solar panel, rechargeable battery, LED lighting, solar fan, and mobile charging for daily off-grid use.',NULL,'solar-light-fan-home-kit',1,'in_stock','2026-06-26 09:23:30','2026-06-26 09:23:30'),(22,'Agri Solar Kit','Solar kit for farms, irrigation support, borehole sites, livestock operations, rural lighting, and agricultural productivity.','/uploads/kits/agrisolar-1782469474487-455526562.png','agri-solar',1,'in_stock','2026-06-26 09:23:30','2026-06-26 10:24:35'),(23,'Solar EV Station Kit','PV plus ESS plus EV charging station kit for commercial parking, fleet yards, logistics bases, and clean transport projects.',NULL,'solar-ev-station',1,'in_stock','2026-06-26 09:23:30','2026-06-26 09:23:30'),(24,'3KW-8KW US Standard Dual Output Solar System','US standard dual-output residential solar system family for split load planning, backup circuits, and medium home energy independence.',NULL,'us-standard-dual-output-solar-system-3-8kw',0,'in_stock','2026-06-26 09:23:30','2026-06-26 09:23:30'),(25,'10KW-20KW US Standard Split-Phase Solar System','US standard split-phase solar system family for higher residential and light commercial requirements with larger PV input and lithium battery storage.',NULL,'us-standard-split-phase-solar-system-10-20kw',0,'in_stock','2026-06-26 09:23:30','2026-06-26 09:23:30'),(26,'High Voltage Rack Battery Kit','High-voltage rack battery system for three-phase solar storage and larger commercial energy projects.',NULL,'high-voltage-rack-battery-kit',0,'in_stock','2026-06-26 09:23:30','2026-06-26 09:23:30');
/*!40000 ALTER TABLE `Kits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ProductImages`
--

DROP TABLE IF EXISTS `ProductImages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ProductImages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL,
  `image_url` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `alt_text` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sort_order` int DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_product_images_product_id` (`product_id`),
  CONSTRAINT `ProductImages_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `Products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ProductImages`
--

LOCK TABLES `ProductImages` WRITE;
/*!40000 ALTER TABLE `ProductImages` DISABLE KEYS */;
INSERT INTO `ProductImages` VALUES (1,205,'/uploads/products/SUN-3-6-10K-SG05LP1-EU-SM2-P-1782553335768-406004959.webp',NULL,0,'2026-06-27 09:42:16'),(2,205,'/uploads/products/7-8k-sg05lp1-4-1782553336338-373739381.webp',NULL,1,'2026-06-27 09:42:16'),(3,205,'/uploads/products/c87b2375-4deb-46fe-9da0-901125de599d-1782553336360-974296417.webp',NULL,2,'2026-06-27 09:42:16'),(4,205,'/uploads/products/SUN-3-6-10K-SG05LP1-EU-SM2-P-1782553453176-137425279.webp',NULL,0,'2026-06-27 09:44:13'),(5,205,'/uploads/products/7-8k-sg05lp1-4-1782553453756-752143122.webp',NULL,1,'2026-06-27 09:44:13'),(6,205,'/uploads/products/c87b2375-4deb-46fe-9da0-901125de599d-1782553453826-511878535.webp',NULL,2,'2026-06-27 09:44:13');
/*!40000 ALTER TABLE `ProductImages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Products`
--

DROP TABLE IF EXISTS `Products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `category_id` int NOT NULL,
  `name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `wattage` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `durability_rating` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `battery_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `warranty_info` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_url` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `manual_pdf_url` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `video_url` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `metadata` json DEFAULT NULL COMMENT 'Technical specifications in JSON format',
  `is_featured` tinyint(1) DEFAULT '0',
  `stock_status` enum('in_stock','out_of_stock','pre_order') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'in_stock',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_products_category` (`category_id`),
  KEY `idx_products_featured` (`is_featured`),
  KEY `idx_products_stock` (`stock_status`),
  KEY `idx_products_category_featured` (`category_id`,`is_featured`),
  FULLTEXT KEY `idx_products_search` (`name`,`description`),
  CONSTRAINT `Products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `Categories` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2004 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Products`
--

LOCK TABLES `Products` WRITE;
/*!40000 ALTER TABLE `Products` DISABLE KEYS */;
INSERT INTO `Products` VALUES (101,1,'Mono Half-Cell Solar Panel Grade A 300W',0.00,'Grade A monocrystalline half-cell PV module for compact residential systems, solar generators, lighting kits, and small off-grid installations.','300W','Grade A Mono Half-Cell',NULL,'8 years product guarantee; 25 years performance design',NULL,NULL,NULL,'{\"power\": \"300W\", \"cell_grade\": \"Grade A\", \"technology\": \"Monocrystalline half-cell\", \"application\": \"residential, kit, off-grid\", \"module_type\": \"framed PV module\"}',1,'in_stock','2026-06-26 09:23:30','2026-06-26 09:23:30'),(102,1,'Mono Half-Cell Solar Panel Grade A 450W',0.00,'High-output monocrystalline PV module for home, commercial, and agricultural solar systems requiring strong generation density.','450W','Grade A Mono Half-Cell',NULL,'12 years product warranty; 25 years performance design',NULL,NULL,NULL,'{\"power\": \"450W\", \"technology\": \"Monocrystalline half-cell\", \"application\": \"home, commercial, agriculture\", \"module_type\": \"framed PV module\"}',1,'in_stock','2026-06-26 09:23:30','2026-06-26 09:23:30'),(103,1,'Mono Half-Cell Solar Panel Grade A 550W',0.00,'High-efficiency 550W solar panel for residential, commercial, and industrial PV arrays.','550W','Grade A Mono PERC / Half-Cell',NULL,'12 years product warranty; 25 years performance design',NULL,NULL,NULL,'{\"power\": \"550W\", \"efficiency\": \"21 percent class\", \"technology\": \"Monocrystalline half-cell\", \"application\": \"residential, commercial, industrial\", \"recommended_for\": \"large PV arrays\"}',1,'in_stock','2026-06-26 09:23:30','2026-06-26 09:23:30'),(104,1,'N-Type TOPCon Solar Panel 580W',0.00,'Premium N-type TOPCon PV module for higher yield, lower degradation, and commercial or utility-scale systems.','580W','N-Type TOPCon',NULL,'12 years product warranty; 25 years performance design',NULL,NULL,NULL,'{\"power\": \"580W\", \"advantages\": \"low degradation, high yield\", \"technology\": \"N-Type TOPCon\", \"application\": \"commercial, industrial, utility\"}',1,'in_stock','2026-06-26 09:23:30','2026-06-26 09:23:30'),(105,1,'Bifacial Dual-Glass Solar Panel 600W',0.00,'Bifacial dual-glass module for ground mount, carport, and utility projects where rear-side gain can improve total generation.','600W','Bifacial Dual Glass',NULL,'12 years product warranty; 30 years performance design',NULL,NULL,NULL,'{\"power\": \"600W\", \"feature\": \"rear-side generation gain\", \"technology\": \"Bifacial dual glass\", \"application\": \"carport, ground mount, utility\"}',0,'in_stock','2026-06-26 09:23:30','2026-06-26 09:23:30'),(106,1,'Flexible Solar Panel 200W',0.00,'Lightweight flexible solar panel for mobile, curved, temporary, and portable applications.','200W','Flexible Mono',NULL,'2 years product warranty',NULL,NULL,NULL,'{\"power\": \"200W\", \"technology\": \"Flexible monocrystalline\", \"application\": \"portable, vehicle, marine, temporary power\"}',0,'in_stock','2026-06-26 09:23:30','2026-06-26 09:23:30'),(201,2,'High Frequency Hybrid Solar Inverter 1.5kW',0.00,'Entry high-frequency hybrid solar inverter for 1.5kW home solar systems, small backup loads, and compact solar generator style packages.','1.5kW','High Frequency Hybrid MPPT','','2 years guarantee','/uploads/products/1kw-inverter-1782551479126-782860734.jpg',NULL,'','{\"mppt\": \"built-in\", \"type\": \"high_frequency_hybrid_inverter\", \"waveform\": \"pure sine wave\", \"application\": \"1.5kW home solar system\", \"rated_power\": \"1.5kW\", \"battery_support\": \"lithium and lead-acid by configuration\", \"source_alignment\": \"entelechy_style\"}',1,'in_stock','2026-06-26 09:23:30','2026-06-27 09:11:20'),(202,2,'High Frequency Hybrid Solar Inverter 3.0kW',0.00,'High-frequency hybrid solar inverter for 3.0kW home solar systems, small shops, offices, and reliable backup power.','3.0kW','High Frequency Hybrid MPPT','','2 years guarantee','/uploads/products/14189152-5e85-4297-a010-7d16f6e00fd3-1782554311676-511690814.jpg',NULL,'','{\"mppt\": \"built-in\", \"type\": \"high_frequency_hybrid_inverter\", \"waveform\": \"pure sine wave\", \"application\": \"3.0kW home solar system\", \"rated_power\": \"3.0kW\", \"battery_support\": \"lithium and lead-acid by configuration\"}',1,'in_stock','2026-06-26 09:23:30','2026-06-27 09:58:31'),(203,2,'High Frequency Hybrid Solar Inverter 6.2kW',0.00,'High-output high-frequency hybrid inverter for Entelechy-style 6.2kW to 10kW home solar system configurations.','6.2kW','High Frequency Hybrid MPPT',NULL,'2 years guarantee',NULL,NULL,NULL,'{\"mppt\": \"built-in\", \"type\": \"high_frequency_hybrid_inverter\", \"waveform\": \"pure sine wave\", \"application\": \"6.2kW-10kW home solar system\", \"rated_power\": \"6.2kW\", \"battery_support\": \"lithium battery compatible\", \"source_alignment\": \"entelechy_style\"}',1,'in_stock','2026-06-26 09:23:30','2026-06-26 09:23:30'),(204,2,'High Frequency Hybrid Solar Inverter 8.5kW',0.00,'Large single-phase hybrid inverter for higher household backup loads and small commercial solar storage systems.','8.5kW','High Frequency Hybrid MPPT',NULL,'2 years guarantee',NULL,NULL,NULL,'{\"mppt\": \"built-in\", \"type\": \"high_frequency_hybrid_inverter\", \"waveform\": \"pure sine wave\", \"application\": \"large home backup, small commercial backup\", \"rated_power\": \"8.5kW\", \"source_alignment\": \"entelechy_style\"}',1,'in_stock','2026-06-26 09:23:30','2026-06-26 09:23:30'),(205,2,'High Frequency Hybrid Solar Inverter 10.2kW',0.00,'High-performance hybrid inverter integrating pure sine wave output, intelligent charging, dual MPPT solar input, and battery management for 10kW class home systems.','10.2kW','High Frequency Hybrid Dual MPPT','','5 years warranty','/uploads/products/7-8k-sg05lp1-2-1782553453174-174656336.webp',NULL,'','{\"mppt\": \"dual MPPT\", \"monitoring\": \"mobile app and remote monitoring optional\", \"rated_power\": \"10.2kW\", \"max_pv_input\": \"11000W class\", \"battery_voltage\": \"48V DC\"}',1,'in_stock','2026-06-26 09:23:30','2026-06-27 09:44:13'),(206,2,'High Frequency Hybrid Solar Inverter 11.0kW',0.00,'Large-capacity hybrid inverter for 11.0kW home solar systems, offices, telecom, and remote project sites requiring strong backup.','11.0kW','High Frequency Hybrid MPPT',NULL,'2 years guarantee',NULL,NULL,NULL,'{\"type\": \"high_frequency_hybrid_inverter\", \"application\": \"11kW home, office, remote site\", \"rated_power\": \"11.0kW\", \"battery_voltage\": \"51.2V compatible\", \"source_alignment\": \"entelechy_style\"}',0,'in_stock','2026-06-26 09:23:30','2026-06-26 09:23:30'),(207,2,'High Voltage Hybrid Solar Inverter 15kW Three Phase',0.00,'Three-phase high-voltage hybrid inverter for commercial solar systems, small factories, and higher-power storage installations.','15kW','High Voltage Three Phase Hybrid','','5 years warranty','/uploads/products/1005e4ba-862e-4c09-a0a0-2ab582aa0a23-1782554871860-408382885.jpg',NULL,'','{\"type\": \"high_voltage_hybrid_inverter\", \"phase\": \"three phase\", \"application\": \"commercial, industrial\", \"rated_power\": \"15kW\"}',0,'in_stock','2026-06-26 09:23:30','2026-06-27 10:07:51'),(208,2,'High Voltage Hybrid Solar Inverter 20kW Three Phase',0.00,'High-voltage three-phase hybrid inverter for commercial buildings, warehouses, and industrial PV plus storage systems.','20kW','High Voltage Three Phase Hybrid',NULL,'5 years warranty',NULL,NULL,NULL,'{\"type\": \"high_voltage_hybrid_inverter\", \"phase\": \"three phase\", \"application\": \"commercial, industrial\", \"rated_power\": \"20kW\", \"source_alignment\": \"entelechy_style\"}',0,'in_stock','2026-06-26 09:23:30','2026-06-26 09:23:30'),(209,2,'High Voltage Hybrid Solar Inverter 30kW Three Phase',0.00,'High-capacity high-voltage three-phase hybrid inverter for 30kW to 60kW commercial solar system families.','30kW','High Voltage Three Phase Hybrid',NULL,'5 years warranty',NULL,NULL,NULL,'{\"type\": \"high_voltage_hybrid_inverter\", \"phase\": \"three phase\", \"application\": \"30kW-60kW commercial solar systems\", \"rated_power\": \"30kW\", \"source_alignment\": \"entelechy_style\"}',0,'in_stock','2026-06-26 09:23:30','2026-06-26 09:23:30'),(301,3,'Powerwall LiFePO4 Battery 51.2V 2.5kWh',0.00,'Compact Entelechy-style powerwall battery module for small solar kits, emergency backup, lighting systems, and solar generators.','2.5kWh','Powerwall Long Cycle Life','LiFePO4','5 years guarantee','/uploads/products/powerwall-battery-1782548107802-401870241.jpg',NULL,'','{\"energy\": \"2.5kWh\", \"voltage\": \"51.2V\", \"chemistry\": \"LiFePO4\", \"application\": \"small kit, backup, solar generator\", \"display_family\": \"2.5KWh powerwall\", \"source_alignment\": \"entelechy_style\"}',1,'in_stock','2026-06-26 09:23:30','2026-06-27 08:15:08'),(302,3,'Powerwall LiFePO4 Battery 51.2V 5.12kWh',0.00,'Wall-mounted 5kWh class LiFePO4 powerwall battery for residential solar backup and hybrid inverter systems.','5.12kWh','Powerwall 6000 Cycle Class','LiFePO4','5 years warranty','/uploads/products/5kw-battery-1782550244241-643525537.jpg',NULL,'','{\"energy\": \"5.12kWh\", \"voltage\": \"51.2V\", \"capacity\": \"100Ah class\", \"chemistry\": \"LiFePO4\", \"communication\": \"RS485/CAN optional\", \"display_family\": \"5KWh powerwall\", \"source_alignment\": \"entelechy_style_plus_sunlink_pdf\", \"depth_of_discharge\": \"up to 95 percent class\"}',1,'in_stock','2026-06-26 09:23:30','2026-06-27 08:50:44'),(303,3,'Powerwall LiFePO4 Battery 51.2V 10.24kWh',0.00,'10kWh class powerwall LiFePO4 battery for home and light commercial solar storage.','10.24kWh','Powerwall Long Cycle Life','LiFePO4','5 years warranty','/uploads/products/battery-10kw-1782549443817-20348161.jpg',NULL,'','{\"energy\": \"10.24kWh\", \"voltage\": \"51.2V\", \"chemistry\": \"LiFePO4\", \"application\": \"residential, light commercial\", \"display_family\": \"10KWh powerwall\", \"source_alignment\": \"entelechy_style_plus_sunlink_pdf\"}',1,'in_stock','2026-06-26 09:23:30','2026-06-27 08:37:24'),(304,3,'Powerwall LiFePO4 Battery 51.2V 16kWh',0.00,'Large powerwall LiFePO4 battery for Entelechy-style 15kWh to 17kWh residential storage families.','16kWh','Powerwall Long Cycle Life','LiFePO4','5 years warranty','/uploads/products/16kwbattery-1782549981031-491873057.jpg',NULL,'','{\"energy\": \"16kWh\", \"voltage\": \"51.2V\", \"chemistry\": \"LiFePO4\", \"application\": \"large home, commercial backup\", \"display_family\": \"15KWh-17KWh powerwall\", \"source_alignment\": \"entelechy_style_plus_sunlink_pdf\"}',1,'in_stock','2026-06-26 09:23:30','2026-06-27 08:46:21'),(305,3,'Powerwall LiFePO4 Battery 51.2V 17.5kWh',0.00,'High-capacity 17.5kWh powerwall battery for large homes, offices, and scalable backup systems.','17.5kWh','Powerwall Long Cycle Life','LiFePO4','5 years warranty',NULL,NULL,NULL,'{\"energy\": \"17.5kWh\", \"voltage\": \"51.2V\", \"chemistry\": \"LiFePO4\", \"application\": \"large home, office, scalable backup\", \"display_family\": \"15KWh-17KWh powerwall\", \"source_alignment\": \"entelechy_style_plus_sunlink_pdf\"}',0,'in_stock','2026-06-26 09:23:30','2026-06-26 09:23:30'),(306,3,'Powerwall LiFePO4 Battery 48V 100Ah 4.8kWh',0.00,'Wall-mounted LiFePO4 battery for clean residential and light commercial installations.','4.8kWh','Powerwall Wall Mounted','LiFePO4','5 years warranty',NULL,NULL,NULL,'{\"energy\": \"4.8kWh\", \"voltage\": \"48V\", \"capacity\": \"100Ah\", \"mounting\": \"wall mounted\", \"chemistry\": \"LiFePO4\", \"source_alignment\": \"entelechy_style\"}',0,'in_stock','2026-06-26 09:23:30','2026-06-26 09:23:30'),(307,3,'Powerwall LiFePO4 Battery 51.2V 200Ah 10.24kWh',0.00,'Higher-capacity wall-mounted LiFePO4 powerwall battery for residential solar storage and hybrid inverter pairing.','10.24kWh','Powerwall Wall Mounted','LiFePO4','5 years warranty','/uploads/products/battery-10kw-1782550432597-14821434.jpg',NULL,'','{\"energy\": \"10.24kWh\", \"voltage\": \"51.2V\", \"capacity\": \"200Ah\", \"mounting\": \"wall mounted\", \"chemistry\": \"LiFePO4\", \"source_alignment\": \"entelechy_style_plus_sunlink_pdf\"}',0,'in_stock','2026-06-26 09:23:30','2026-06-27 08:53:53'),(308,3,'Rack-Mounted LiFePO4 Battery 48V 100Ah 4.8kWh',0.00,'Rack-mounted battery module for telecom, server room, UPS, and modular solar storage applications.','4.8kWh','Rack Mounted','LiFePO4','5 years warranty',NULL,NULL,NULL,'{\"energy\": \"4.8kWh\", \"voltage\": \"48V\", \"capacity\": \"100Ah\", \"mounting\": \"rack mounted\", \"chemistry\": \"LiFePO4\"}',0,'in_stock','2026-06-26 09:23:30','2026-06-26 09:23:30'),(309,3,'Rack-Mounted LiFePO4 Battery 51.2V 200Ah 10.24kWh',0.00,'Rack-mounted 10.24kWh LiFePO4 module for modular commercial storage and expandable backup systems.','10.24kWh','Rack Mounted','LiFePO4','5 years warranty',NULL,NULL,NULL,'{\"energy\": \"10.24kWh\", \"voltage\": \"51.2V\", \"capacity\": \"200Ah\", \"mounting\": \"rack mounted\", \"chemistry\": \"LiFePO4\"}',0,'in_stock','2026-06-26 09:23:30','2026-06-26 09:23:30'),(310,3,'Vertical Low Voltage Stack Battery 20.48kWh',0.00,'Stackable low-voltage LiFePO4 battery tower for residential and commercial solar storage.','20.48kWh','Stackable Low Voltage','LiFePO4','5 years warranty',NULL,NULL,NULL,'{\"energy\": \"20.48kWh\", \"mounting\": \"vertical stack\", \"chemistry\": \"LiFePO4\", \"voltage_class\": \"low voltage\"}',0,'in_stock','2026-06-26 09:23:30','2026-06-26 09:23:30'),(311,3,'High Voltage Rack Battery Cabinet 51.2kWh',0.00,'High-voltage rack battery cabinet for three-phase solar storage and commercial backup.','51.2kWh','High Voltage Cabinet','LiFePO4','5 years warranty',NULL,NULL,NULL,'{\"energy\": \"51.2kWh\", \"chemistry\": \"LiFePO4\", \"application\": \"commercial, three-phase storage\", \"voltage_class\": \"high voltage\"}',0,'in_stock','2026-06-26 09:23:30','2026-06-26 09:23:30'),(312,3,'I&C High Voltage Rack Battery System 107.52kWh',0.00,'Industrial and commercial high-voltage rack battery system for ESS projects and critical backup.','107.52kWh','I&C High Voltage','LiFePO4','Project warranty by configuration','/uploads/products/battery-rack-1782548844542-657440806.jpg',NULL,'','{\"energy\": \"107.52kWh\", \"chemistry\": \"LiFePO4\", \"application\": \"industrial and commercial ESS\", \"voltage_class\": \"high voltage\"}',1,'in_stock','2026-06-26 09:23:30','2026-06-27 08:27:25'),(313,3,'I&C High Voltage Rack Battery System 215.04kWh',0.00,'Large industrial and commercial high-voltage battery system for ESS, peak shaving, and PV storage projects.','215.04kWh','I&C High Voltage','LiFePO4','Project warranty by configuration','/uploads/products/battery-rack-2-1782549208850-753034550.jpg',NULL,'','{\"energy\": \"215.04kWh\", \"chemistry\": \"LiFePO4\", \"application\": \"industrial and commercial ESS\", \"voltage_class\": \"high voltage\"}',1,'in_stock','2026-06-26 09:23:30','2026-06-27 08:33:29'),(401,4,'MPPT Charge Controller 40A',0.00,'MPPT solar charge controller for smaller off-grid PV systems and battery charging applications.','40A','MPPT',NULL,'2 years warranty',NULL,NULL,NULL,'{\"type\": \"MPPT\", \"application\": \"small off-grid solar charging\", \"rated_current\": \"40A\"}',0,'in_stock','2026-06-26 09:23:30','2026-06-26 09:23:30'),(402,4,'MPPT Charge Controller 60A',0.00,'MPPT controller for medium PV battery systems requiring improved charging efficiency and battery protection.','60A','MPPT',NULL,'2 years warranty',NULL,NULL,NULL,'{\"type\": \"MPPT\", \"application\": \"medium solar battery system\", \"rated_current\": \"60A\"}',0,'in_stock','2026-06-26 09:23:30','2026-06-26 09:23:30'),(403,4,'MPPT Charge Controller 100A',0.00,'High-current MPPT charge controller for larger standalone PV battery systems.','100A','MPPT',NULL,'2 years warranty',NULL,NULL,NULL,'{\"type\": \"MPPT\", \"application\": \"large standalone PV system\", \"rated_current\": \"100A\"}',0,'in_stock','2026-06-26 09:23:30','2026-06-26 09:23:30'),(501,5,'PV Cable 4mm 100m Roll',0.00,'Outdoor photovoltaic cable for safe DC wiring between solar panels, combiner boxes, and inverters.',NULL,'Outdoor Solar Grade',NULL,NULL,NULL,NULL,NULL,'{\"size\": \"4mm2\", \"length\": \"100m\", \"conductor\": \"tinned copper\", \"application\": \"solar DC wiring\", \"rated_voltage\": \"DC 1500V class\"}',0,'in_stock','2026-06-26 09:23:30','2026-06-26 09:23:30'),(502,5,'PV Cable 6mm 100m Roll',0.00,'Heavy-duty PV cable for larger solar strings and longer DC cable runs.',NULL,'Outdoor Solar Grade',NULL,NULL,NULL,NULL,NULL,'{\"size\": \"6mm2\", \"length\": \"100m\", \"application\": \"solar DC wiring\", \"rated_voltage\": \"DC 1500V class\"}',0,'in_stock','2026-06-26 09:23:30','2026-06-26 09:23:30'),(503,5,'MC4 Connector Pair',0.00,'Water-resistant MC4-compatible connector pair for PV module and string wiring.',NULL,'Outdoor Solar Grade',NULL,NULL,NULL,NULL,NULL,'{\"type\": \"MC4 compatible connector\", \"application\": \"PV string wiring\", \"weather_resistant\": \"yes\"}',0,'in_stock','2026-06-26 09:23:30','2026-06-26 09:23:30'),(504,5,'Battery Cable and MC4 Connector Set',0.00,'Cable and connector set for connecting batteries, inverter, and PV input during solar system installation.',NULL,'Standard',NULL,NULL,NULL,NULL,NULL,'{\"includes\": \"battery cable and MC4 connector set\", \"application\": \"solar kit installation\"}',0,'in_stock','2026-06-26 09:23:30','2026-06-26 09:23:30'),(505,5,'Solar Mounting Bracket Set - Small System',0.00,'Corrosion-resistant aluminum mounting set for small roof or ground solar installations.',NULL,'Anodized Aluminum',NULL,'25 years service-life design',NULL,NULL,NULL,'{\"material\": \"anodized aluminum and stainless fasteners\", \"mounting\": \"roof or ground\", \"application\": \"small PV mounting\"}',0,'in_stock','2026-06-26 09:23:30','2026-06-26 09:23:30'),(506,5,'Solar Mounting Bracket Set - Large System',0.00,'Heavy-duty aluminum bracket and rail set for larger residential, commercial, and agricultural PV arrays.',NULL,'Anodized Aluminum',NULL,'25 years service-life design',NULL,NULL,NULL,'{\"material\": \"anodized aluminum and stainless fasteners\", \"mounting\": \"roof or ground\", \"application\": \"large PV mounting\"}',0,'in_stock','2026-06-26 09:23:30','2026-06-26 09:23:30'),(601,7,'Smart Solar Street Light 100W',0.00,'Integrated 100W solar street light with mono solar panel, LiFePO4 battery, LED output, and radar sensor option.','100W','Outdoor Solar Grade','LiFePO4','2 years warranty',NULL,NULL,NULL,'{\"cct\": \"6000K-6500K\", \"power\": \"100W\", \"sensor\": \"radar optional\", \"series\": \"Smart Solar Street Light\", \"battery\": \"LiFePO4\"}',1,'in_stock','2026-06-26 09:23:30','2026-06-26 09:23:30'),(602,7,'Smart Solar Street Light 200W',0.00,'Integrated 200W smart solar street light for roads, estates, compounds, farms, and community lighting.','200W','Outdoor Solar Grade','LiFePO4','2 years warranty',NULL,NULL,NULL,'{\"cct\": \"6000K-6500K\", \"power\": \"200W\", \"sensor\": \"radar optional\", \"series\": \"Smart Solar Street Light\", \"battery\": \"LiFePO4\"}',1,'in_stock','2026-06-26 09:23:30','2026-06-26 09:23:30'),(603,7,'Smart Solar Street Light 300W',0.00,'High-output solar street light for wider roads, public areas, and commercial compounds.','300W','Outdoor Solar Grade','LiFePO4','2 years warranty',NULL,NULL,NULL,'{\"power\": \"300W\", \"series\": \"Smart Solar Street Light\", \"battery\": \"LiFePO4\", \"application\": \"road, public area, compound\"}',1,'in_stock','2026-06-26 09:23:30','2026-06-26 09:23:30'),(604,7,'Camera Solar Street Light 200W',0.00,'Solar street light with integrated camera option for lighting plus security monitoring applications.','200W','Outdoor Solar Grade','LiFePO4','2 years warranty',NULL,NULL,NULL,'{\"power\": \"200W\", \"series\": \"Camera Solar Street Light\", \"battery\": \"LiFePO4\", \"feature\": \"camera option\"}',0,'in_stock','2026-06-26 09:23:30','2026-06-26 09:23:30'),(605,7,'Camera Solar Street Light 400W',0.00,'High-output camera solar street light for public safety, perimeter lighting, and compounds.','400W','Outdoor Solar Grade','LiFePO4','2 years warranty',NULL,NULL,NULL,'{\"power\": \"400W\", \"series\": \"Camera Solar Street Light\", \"feature\": \"camera option\", \"application\": \"security lighting\"}',0,'in_stock','2026-06-26 09:23:30','2026-06-26 09:23:30'),(606,7,'Nova Solar Street Light 1000W',0.00,'Large-format solar street light for high-brightness outdoor lighting and infrastructure use.','1000W','Outdoor Solar Grade','LiFePO4','2 years warranty',NULL,NULL,NULL,'{\"power\": \"1000W\", \"series\": \"Nova Solar Street Light\", \"application\": \"infrastructure, road, public lighting\"}',0,'in_stock','2026-06-26 09:23:30','2026-06-26 09:23:30'),(701,8,'Aurora Solar Flood Light 100W',0.00,'Compact solar flood light for homes, yards, walkways, entrances, and small outdoor spaces.','100W','Outdoor Solar Grade','Lithium','2 years warranty',NULL,NULL,NULL,'{\"power\": \"100W\", \"series\": \"Aurora Solar Flood Light\", \"application\": \"yard, entrance, small outdoor space\"}',1,'in_stock','2026-06-26 09:23:30','2026-06-26 09:23:30'),(702,8,'Aurora Solar Flood Light 300W',0.00,'Medium solar flood light for compounds, farms, parking, and security lighting.','300W','Outdoor Solar Grade','Lithium','2 years warranty',NULL,NULL,NULL,'{\"power\": \"300W\", \"series\": \"Aurora Solar Flood Light\", \"application\": \"compound, farm, parking\"}',1,'in_stock','2026-06-26 09:23:30','2026-06-26 09:23:30'),(703,8,'Solar Flood Light 600W',0.00,'High-brightness solar flood light for warehouses, open yards, playgrounds, and rural public lighting.','600W','Outdoor Solar Grade','Lithium','2 years warranty',NULL,NULL,NULL,'{\"power\": \"600W\", \"series\": \"Solar Flood Light\", \"application\": \"warehouse, yard, playground\"}',0,'in_stock','2026-06-26 09:23:30','2026-06-26 09:23:30'),(704,8,'Camera Solar Flood Light 800W',0.00,'Camera-enabled solar flood light for security applications requiring both lighting and visual monitoring.','800W','Outdoor Solar Grade','Lithium','2 years warranty',NULL,NULL,NULL,'{\"power\": \"800W\", \"series\": \"Camera Solar Flood Light\", \"feature\": \"camera option\", \"application\": \"security lighting\"}',0,'in_stock','2026-06-26 09:23:30','2026-06-26 09:23:30'),(801,9,'Solar Lawn Light 200W',0.00,'Decorative solar lawn light for gardens, pathways, villa landscapes, and public parks.','200W','Outdoor Solar Grade','Lithium','1 year warranty',NULL,NULL,NULL,'{\"type\": \"solar lawn light\", \"power\": \"200W\", \"application\": \"garden, pathway, landscape\"}',0,'in_stock','2026-06-26 09:23:30','2026-06-26 09:23:30'),(802,9,'Solar Garden Light 1000W',0.00,'Large solar garden light for landscape lighting, parks, pathways, and outdoor decorative illumination.','1000W','Outdoor Solar Grade','Lithium','1 year warranty',NULL,NULL,NULL,'{\"type\": \"solar garden light\", \"power\": \"1000W\", \"application\": \"park, pathway, landscape\"}',0,'in_stock','2026-06-26 09:23:30','2026-06-26 09:23:30'),(901,10,'Single Color Solar Strip Light 50W',0.00,'Flexible single-color solar strip light for decorative outdoor lighting and low-voltage solar applications.','50W','Outdoor Solar Grade','Lithium','1 year warranty',NULL,NULL,NULL,'{\"type\": \"solar strip light\", \"color\": \"single color\", \"power\": \"50W\", \"application\": \"decoration, signage, pathway\"}',0,'in_stock','2026-06-26 09:23:30','2026-06-26 09:23:30'),(902,10,'Single Color Solar Strip Light 100W',0.00,'Higher-output solar strip light for longer decorative or pathway lighting runs.','100W','Outdoor Solar Grade','Lithium','1 year warranty',NULL,NULL,NULL,'{\"type\": \"solar strip light\", \"color\": \"single color\", \"power\": \"100W\", \"application\": \"decoration, pathway\"}',0,'in_stock','2026-06-26 09:23:30','2026-06-26 09:23:30'),(1001,11,'Solar Batten Light 100W',0.00,'Solar-powered batten tube light for shops, corridors, homes, small offices, and off-grid interiors.','100W','Indoor/Outdoor Utility','Lithium','1 year warranty',NULL,NULL,NULL,'{\"type\": \"solar batten light\", \"power\": \"100W\", \"application\": \"room, shop, corridor\"}',0,'in_stock','2026-06-26 09:23:30','2026-06-26 09:23:30'),(1002,11,'Solar Batten Light 200W',0.00,'Higher-output solar batten light for larger rooms, classrooms, clinics, and workspaces.','200W','Indoor/Outdoor Utility','Lithium','1 year warranty',NULL,NULL,NULL,'{\"type\": \"solar batten light\", \"power\": \"200W\", \"application\": \"classroom, clinic, workspace\"}',0,'in_stock','2026-06-26 09:23:30','2026-06-26 09:23:30'),(1101,12,'Solar Air Circulation Fan Small',0.00,'Portable rechargeable solar fan for home, dormitory, clinic, shop, and small room cooling.','Small DC Fan','Portable Rechargeable','Lithium','1 year warranty',NULL,NULL,NULL,'{\"type\": \"solar fan\", \"feature\": \"portable rechargeable\", \"charging\": \"solar and DC charging\", \"application\": \"home, shop, clinic\"}',1,'in_stock','2026-06-26 09:23:30','2026-06-26 09:23:30'),(1102,12,'Solar Air Circulation Fan Medium',0.00,'Medium solar fan with rechargeable battery for improved airflow in off-grid rooms and small businesses.','Medium DC Fan','Portable Rechargeable','Lithium','1 year warranty',NULL,NULL,NULL,'{\"type\": \"solar fan\", \"charging\": \"solar and DC charging\", \"application\": \"room, shop, classroom\"}',1,'in_stock','2026-06-26 09:23:30','2026-06-26 09:23:30'),(1103,12,'Solar Air Circulation Fan Large',0.00,'Large rechargeable solar fan for larger rooms, clinics, shops, and field use.','Large DC Fan','Portable Rechargeable','Lithium','1 year warranty',NULL,NULL,NULL,'{\"type\": \"solar fan\", \"charging\": \"solar and DC charging\", \"application\": \"large room, clinic, field use\"}',0,'in_stock','2026-06-26 09:23:30','2026-06-26 09:23:30'),(1201,13,'Solar Light and Fan Home Kit Basic',0.00,'Integrated solar light and fan package for basic household lighting, fan cooling, and mobile charging.','Basic Kit','Portable Kit','Lithium','1 year warranty',NULL,NULL,NULL,'{\"includes\": \"solar panel, lamps, fan, battery, phone charging\", \"kit_type\": \"light and fan package\", \"application\": \"home, shop, room\"}',1,'in_stock','2026-06-26 09:23:30','2026-06-26 09:23:30'),(1202,13,'Solar Light and Fan Home Kit Pro',0.00,'Expanded solar light and fan kit with larger battery capacity and additional lighting points for daily household use.','Pro Kit','Portable Kit','Lithium','1 year warranty',NULL,NULL,NULL,'{\"includes\": \"solar panel, multiple lamps, fan, battery, USB output\", \"kit_type\": \"light and fan package\", \"application\": \"home, classroom, clinic\"}',1,'in_stock','2026-06-26 09:23:30','2026-06-26 09:23:30'),(1203,13,'Solar Light and Fan Community Kit',0.00,'Larger light and fan package for clinics, classrooms, remote shops, and community spaces.','Community Kit','Portable Kit','Lithium','1 year warranty',NULL,NULL,NULL,'{\"includes\": \"larger panel, multiple lamps, fan, battery, charging outputs\", \"kit_type\": \"light and fan package\", \"application\": \"clinic, classroom, community\"}',0,'in_stock','2026-06-26 09:23:30','2026-06-26 09:23:30'),(1301,14,'Single-Phase All-in-One ESS 6kW / 5.12kWh',0.00,'Residential all-in-one energy storage system combining inverter and LiFePO4 storage in a compact platform.','6kW / 5.12kWh','All-in-One ESS','LiFePO4','5 years warranty',NULL,NULL,NULL,'{\"type\": \"all-in-one ESS\", \"phase\": \"single phase\", \"power\": \"6kW\", \"energy\": \"5.12kWh\", \"application\": \"residential\"}',1,'in_stock','2026-06-26 09:23:30','2026-06-26 09:23:30'),(1302,14,'Single-Phase All-in-One ESS 6kW / 10.24kWh',0.00,'Larger residential all-in-one energy storage system for longer backup runtime and higher daily energy coverage.','6kW / 10.24kWh','All-in-One ESS','LiFePO4','5 years warranty',NULL,NULL,NULL,'{\"type\": \"all-in-one ESS\", \"phase\": \"single phase\", \"power\": \"6kW\", \"energy\": \"10.24kWh\", \"application\": \"residential\"}',1,'in_stock','2026-06-26 09:23:30','2026-06-26 09:23:30'),(1303,14,'Three-Phase High Voltage ESS 10kW / 19.2kWh',0.00,'Three-phase high-voltage integrated ESS for villas, offices, and small commercial facilities.','10kW / 19.2kWh','High Voltage ESS','LiFePO4','5 years warranty',NULL,NULL,NULL,'{\"type\": \"integrated ESS\", \"phase\": \"three phase\", \"power\": \"10kW\", \"energy\": \"19.2kWh\", \"application\": \"commercial, villa\"}',0,'in_stock','2026-06-26 09:23:30','2026-06-26 09:23:30'),(1304,14,'Air-Cooled ESS Cabinet 215kWh / 100kW',0.00,'Commercial energy storage cabinet for peak shaving, backup, PV self-consumption, and charging station support.','215kWh / 100kW','Commercial ESS Cabinet','LiFePO4','Project warranty by configuration',NULL,NULL,NULL,'{\"type\": \"air-cooled ESS cabinet\", \"power\": \"100kW\", \"energy\": \"215kWh\", \"application\": \"commercial, industrial\"}',1,'in_stock','2026-06-26 09:23:30','2026-06-26 09:23:30'),(1305,14,'Liquid-Cooled ESS Cabinet 261kWh / 125kW',0.00,'Liquid-cooled commercial and industrial ESS cabinet for higher energy density and stable thermal control.','261kWh / 125kW','Liquid-Cooled ESS Cabinet','LiFePO4','Project warranty by configuration',NULL,NULL,NULL,'{\"type\": \"liquid-cooled ESS cabinet\", \"power\": \"125kW\", \"energy\": \"261kWh\", \"application\": \"commercial, industrial\", \"thermal_management\": \"liquid cooled\"}',1,'in_stock','2026-06-26 09:23:30','2026-06-26 09:23:30'),(1306,14,'PV ESS EVSE Containerized System 522kWh / 250kW / 240kW Charging',0.00,'Containerized PV plus ESS plus EV charging solution for charging depots, industrial parks, and microgrid projects.','522kWh / 250kW / 240kW','Containerized ESS','LiFePO4','Project warranty by configuration',NULL,NULL,NULL,'{\"type\": \"containerized PV ESS EVSE\", \"energy\": \"522kWh\", \"pcs_power\": \"250kW\", \"application\": \"EV station, industrial park, microgrid\", \"charging_power\": \"240kW\"}',1,'in_stock','2026-06-26 09:23:30','2026-06-26 09:23:30'),(1401,15,'Commercial EVSE Charging System 60kW',0.00,'DC EV charging system for commercial parking, fleet charging, hotels, shopping centers, and solar EV station projects.','60kW','DC Fast Charger',NULL,'Project warranty by configuration',NULL,NULL,NULL,'{\"type\": \"DC EV charger\", \"power\": \"60kW\", \"application\": \"commercial parking, fleet, hotel\"}',1,'in_stock','2026-06-26 09:23:30','2026-06-26 09:23:30'),(1402,15,'Commercial EVSE Charging System 120kW',0.00,'High-power DC charging system for faster fleet and public charging operations.','120kW','DC Fast Charger',NULL,'Project warranty by configuration',NULL,NULL,NULL,'{\"type\": \"DC EV charger\", \"power\": \"120kW\", \"application\": \"public charging, fleet\"}',1,'in_stock','2026-06-26 09:23:30','2026-06-26 09:23:30'),(1403,15,'Commercial EVSE Charging System 360kW / 720kW',0.00,'High-capacity EV charging platform for large charging depots and PV plus ESS plus EVSE projects.','360kW / 720kW','High-Power Charging System',NULL,'Project warranty by configuration',NULL,NULL,NULL,'{\"type\": \"high-power EVSE\", \"power\": \"360kW to 720kW\", \"application\": \"charging depot, fleet yard, PV ESS EVSE\"}',1,'in_stock','2026-06-26 09:23:30','2026-06-26 09:23:30'),(1501,16,'Industrial Digital UPS 10kVA / 10kW',0.00,'Three-phase digital UPS with pure sine wave output for critical loads and backup power protection.','10kVA / 10kW','Industrial UPS',NULL,'Project warranty by configuration',NULL,NULL,NULL,'{\"type\": \"industrial UPS\", \"phase\": \"three phase\", \"capacity\": \"10kVA / 10kW\", \"waveform\": \"pure sine wave\"}',0,'in_stock','2026-06-26 09:23:30','2026-06-26 09:23:30'),(1502,16,'Industrial Digital UPS 30kVA / 30kW',0.00,'Industrial UPS system for commercial, medical, telecom, and critical facility backup power.','30kVA / 30kW','Industrial UPS',NULL,'Project warranty by configuration',NULL,NULL,NULL,'{\"type\": \"industrial UPS\", \"phase\": \"three phase\", \"capacity\": \"30kVA / 30kW\", \"waveform\": \"pure sine wave\"}',0,'in_stock','2026-06-26 09:23:30','2026-06-26 09:23:30'),(1503,16,'Industrial Digital UPS 60kVA / 60kW',0.00,'High-capacity three-phase UPS for industrial and critical infrastructure backup applications.','60kVA / 60kW','Industrial UPS',NULL,'Project warranty by configuration',NULL,NULL,NULL,'{\"type\": \"industrial UPS\", \"phase\": \"three phase\", \"capacity\": \"60kVA / 60kW\", \"waveform\": \"pure sine wave\"}',0,'in_stock','2026-06-26 09:23:30','2026-06-26 09:23:30'),(1504,16,'Industrial Digital UPS 100kVA / 100kW',0.00,'Large industrial digital UPS for high-availability power systems and mission-critical loads.','100kVA / 100kW','Industrial UPS',NULL,'Project warranty by configuration',NULL,NULL,NULL,'{\"type\": \"industrial UPS\", \"phase\": \"three phase\", \"capacity\": \"100kVA / 100kW\", \"waveform\": \"pure sine wave\"}',0,'in_stock','2026-06-26 09:23:30','2026-06-26 09:23:30'),(1601,17,'BIPV Solar Carport Commercial Single-Post Structure',0.00,'BIPV carport structure combining vehicle shelter, PV generation, and optional EV charging station integration.','Project Based','BIPV Structure',NULL,'Project warranty by configuration',NULL,NULL,NULL,'{\"type\": \"BIPV solar carport\", \"structure\": \"commercial single-post\", \"application\": \"parking, EV charging, PV generation\"}',1,'in_stock','2026-06-26 09:23:30','2026-06-26 09:23:30'),(1701,18,'Energy Management System Platform',0.00,'EMS platform for monitoring and dispatching PV, ESS, grid, load, and EV charging assets.','Software / Controller','EMS Platform',NULL,'Project warranty by configuration',NULL,NULL,NULL,'{\"type\": \"energy management system\", \"monitors\": \"PV, ESS, grid, load, EV charging\", \"application\": \"microgrid, commercial ESS, EV station\"}',1,'in_stock','2026-06-26 09:23:30','2026-06-26 09:23:30'),(1801,19,'PV Combiner Box 1-In 1-Out 1000V',0.00,'PV combiner box for one solar input string and one output with DC fuse, surge protection, and isolation support.',NULL,'IP65 Outdoor Rated',NULL,NULL,NULL,NULL,NULL,'{\"type\": \"PV combiner box\", \"protection\": \"fuse, SPD, isolation switch\", \"input_strings\": \"1\", \"output_strings\": \"1\", \"system_voltage\": \"1000V DC\"}',0,'in_stock','2026-06-26 09:23:30','2026-06-26 09:23:30'),(1802,19,'PV Combiner Box 2-In 1-Out 1000V',0.00,'PV combiner box for two solar input strings and one output channel in residential and commercial arrays.',NULL,'IP65 Outdoor Rated',NULL,NULL,NULL,NULL,NULL,'{\"type\": \"PV combiner box\", \"protection\": \"fuse, SPD, isolation switch\", \"input_strings\": \"2\", \"output_strings\": \"1\", \"system_voltage\": \"1000V DC\"}',0,'in_stock','2026-06-26 09:23:30','2026-06-26 09:23:30'),(1803,19,'PV Combiner Box 4-In 1-Out 1000V',0.00,'PV combiner box for four solar input strings with surge protection and DC output switching.',NULL,'IP65 Outdoor Rated',NULL,NULL,NULL,NULL,NULL,'{\"type\": \"PV combiner box\", \"protection\": \"fuse, SPD, isolation switch\", \"input_strings\": \"4\", \"output_strings\": \"1\", \"system_voltage\": \"1000V DC\"}',0,'in_stock','2026-06-26 09:23:30','2026-06-26 09:23:30'),(1804,19,'PV Combiner Box 8-In 1-Out 1000V',0.00,'PV combiner box for larger PV arrays requiring eight DC string inputs and protected output wiring.',NULL,'IP65 Outdoor Rated',NULL,NULL,NULL,NULL,NULL,'{\"type\": \"PV combiner box\", \"protection\": \"fuse, SPD, isolation switch\", \"input_strings\": \"8\", \"output_strings\": \"1\", \"system_voltage\": \"1000V DC\"}',0,'in_stock','2026-06-26 09:23:30','2026-06-26 09:23:30'),(1805,19,'PV Combiner Box 16-In 1-Out 1000V',0.00,'High-capacity PV combiner box for industrial and utility-scale DC solar array management.',NULL,'IP65 Outdoor Rated',NULL,NULL,NULL,NULL,NULL,'{\"type\": \"PV combiner box\", \"protection\": \"fuse, SPD, isolation switch\", \"input_strings\": \"16\", \"output_strings\": \"1\", \"system_voltage\": \"1000V DC\"}',0,'in_stock','2026-06-26 09:23:30','2026-06-26 09:23:30'),(1901,20,'Solar Water Pump 0.75kW',0.00,'Solar water pump for small irrigation, livestock watering, garden supply, and rural water transfer.','0.75kW','Solar Pump',NULL,'1 year warranty',NULL,NULL,NULL,'{\"type\": \"solar water pump\", \"power\": \"0.75kW\", \"application\": \"small irrigation, livestock, garden\"}',1,'in_stock','2026-06-26 09:23:30','2026-06-26 09:23:30'),(1902,20,'Solar Water Pump 1.5kW',0.00,'Solar pump for farms, boreholes, irrigation systems, and rural water storage applications.','1.5kW','Solar Pump',NULL,'1 year warranty',NULL,NULL,NULL,'{\"type\": \"solar water pump\", \"power\": \"1.5kW\", \"application\": \"farm, borehole, irrigation\"}',1,'in_stock','2026-06-26 09:23:30','2026-06-26 09:23:30'),(1903,20,'Solar Water Pump 3kW',0.00,'Higher-capacity solar water pump for agricultural irrigation and commercial rural water projects.','3kW','Solar Pump',NULL,'1 year warranty',NULL,NULL,NULL,'{\"type\": \"solar water pump\", \"power\": \"3kW\", \"application\": \"agriculture, irrigation, rural water\"}',1,'in_stock','2026-06-26 09:23:30','2026-06-26 09:23:30'),(2001,21,'Solar Power Generator 1500W',0.00,'Entelechy-style solar power generator for emergency backup, outdoor work, camping, small shops, and mobile power needs.','1500W','Solar Power Generator','LiFePO4','2 years warranty',NULL,NULL,NULL,'{\"type\": \"solar_power_generator\", \"battery\": \"LiFePO4\", \"charging\": \"solar hybrid charging\", \"waveform\": \"pure sine wave\", \"application\": \"backup, outdoor, mobile power\", \"rated_power\": \"1500W\", \"source_alignment\": \"entelechy_style\"}',1,'in_stock','2026-06-26 09:23:30','2026-06-26 09:23:30'),(2002,21,'Solar Power Generator 3000W',0.00,'Larger solar power generator for homes, field teams, small business backup, and equipment charging.','3000W','Solar Power Generator','LiFePO4','2 years warranty',NULL,NULL,NULL,'{\"type\": \"solar_power_generator\", \"battery\": \"LiFePO4\", \"charging\": \"solar hybrid charging\", \"waveform\": \"pure sine wave\", \"application\": \"home backup, field work, small business\", \"rated_power\": \"3000W\", \"source_alignment\": \"entelechy_style\"}',1,'in_stock','2026-06-26 09:23:30','2026-06-26 09:23:30'),(2003,21,'Solar Power Generator 6200W',0.00,'High-output solar power generator for resilient household loads, remote site power, and field operations.','6200W','Solar Power Generator','LiFePO4','2 years warranty',NULL,NULL,NULL,'{\"type\": \"solar_power_generator\", \"battery\": \"LiFePO4\", \"charging\": \"solar hybrid charging\", \"waveform\": \"pure sine wave\", \"application\": \"remote site, home backup, field operations\", \"rated_power\": \"6200W\", \"source_alignment\": \"entelechy_style\"}',0,'in_stock','2026-06-26 09:23:30','2026-06-26 09:23:30');
/*!40000 ALTER TABLE `Products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Product family models and comparison specifications
--

DROP TABLE IF EXISTS `ProductSpecifications`;
DROP TABLE IF EXISTS `ProductModels`;

CREATE TABLE `ProductModels` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL,
  `model_code` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nominal_power` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `stock_status` enum('in_stock','out_of_stock','pre_order') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'in_stock',
  `is_default` tinyint(1) DEFAULT '0',
  `sort_order` int DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_product_model_code` (`product_id`,`model_code`),
  KEY `idx_product_models_product` (`product_id`,`sort_order`),
  CONSTRAINT `ProductModels_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `Products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `ProductSpecifications` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL,
  `section_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'General',
  `spec_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(180) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `unit` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value_mode` enum('shared','custom') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'shared',
  `shared_value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `model_values` json DEFAULT NULL,
  `sort_order` int DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_product_spec_key` (`product_id`,`spec_key`),
  KEY `idx_product_specifications_product` (`product_id`,`sort_order`),
  CONSTRAINT `ProductSpecifications_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `Products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `ProductSpecifications_chk_1` CHECK (((`value_mode` = 'shared' AND `shared_value` IS NOT NULL) OR (`value_mode` = 'custom' AND `model_values` IS NOT NULL)))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

ALTER TABLE `KitProducts`
  ADD COLUMN `product_model_id` int DEFAULT NULL AFTER `product_id`,
  ADD KEY `idx_kit_products_product_model_id` (`product_model_id`),
  ADD CONSTRAINT `KitProducts_ibfk_3` FOREIGN KEY (`product_model_id`) REFERENCES `ProductModels` (`id`) ON DELETE SET NULL;

--
-- Table structure for table `Testimonials`
--

DROP TABLE IF EXISTS `Testimonials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Testimonials` (
  `id` int NOT NULL AUTO_INCREMENT,
  `client_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `video_url` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `before_image_url` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `after_image_url` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_approved` tinyint(1) DEFAULT '0',
  `rating` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_approved` (`is_approved`),
  KEY `idx_country` (`country`),
  KEY `idx_testimonial_approved_country` (`is_approved`,`country`),
  CONSTRAINT `Testimonials_chk_1` CHECK (((`rating` >= 1) and (`rating` <= 5)))
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Testimonials`
--

LOCK TABLES `Testimonials` WRITE;
/*!40000 ALTER TABLE `Testimonials` DISABLE KEYS */;
INSERT INTO `Testimonials` VALUES (1,'John Mwangi','Kenya',NULL,'https://images.unsplash.com/photo-1497440001374-f26997328c1b?w=400','https://images.unsplash.com/photo-1508514177221-188b1cf16e9d?w=400','Sunlink Power transformed my business! We installed a 5kW system and now save over $200 monthly on electricity. The panels work perfectly even during the rainy season. Excellent quality and great customer support!',1,5,'2026-04-21 21:18:28','2026-04-21 21:18:28'),(2,'Amara Okafor','Nigeria',NULL,NULL,NULL,'Best investment I ever made for my home. The 3kW solar kit powers my entire house including AC and refrigerator. Installation was smooth and the team was very professional. Highly recommended!',1,5,'2026-04-21 21:18:28','2026-04-21 21:18:28'),(3,'Tendai Moyo','Zimbabwe','https://www.youtube.com/watch?v=example1','https://images.unsplash.com/photo-1497440001374-f26997328c1b?w=400','https://images.unsplash.com/photo-1509391366360-2e959784a276?w=400','Running my farm on solar power now! The 10kW system handles all our irrigation pumps and cold storage. No more diesel generator costs. Sunlink quality is outstanding!',1,5,'2026-04-21 21:18:28','2026-04-21 21:18:28'),(4,'Grace Uwimana','Rwanda',NULL,NULL,NULL,'Our clinic now has reliable 24/7 power thanks to Sunlink. The battery backup system keeps our medical equipment running even during power outages. Lives are being saved because of this technology!',1,5,'2026-04-21 21:18:28','2026-04-21 21:18:28'),(5,'David Banda','Zambia',NULL,'https://images.unsplash.com/photo-1497440001374-f26997328c1b?w=400','https://images.unsplash.com/photo-1508514177221-188b1cf16e9d?w=400','Installed solar panels on my shop 6 months ago. The return on investment is amazing! My electricity bill went from $150 to almost zero. The panels are still performing excellently.',1,5,'2026-04-21 21:18:28','2026-04-21 21:18:28'),(6,'Fatima Hassan','Tanzania',NULL,NULL,NULL,'Quality products at fair prices. We bought the complete home kit and it was easy to install. Customer service answered all our questions. Very happy with our purchase!',1,4,'2026-04-21 21:18:28','2026-04-21 21:18:28'),(7,'Emmanuel Nkosi','South Africa',NULL,NULL,NULL,'Sunlink inverters are the best! Pure sine wave output, very quiet operation, and the LCD display is very helpful. Been using it for 8 months without any issues.',0,5,'2026-04-21 21:18:28','2026-04-21 21:18:28');
/*!40000 ALTER TABLE `Testimonials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Catalog technical-data normalization (2026-06-27)
--
-- Customer-facing specifications contain only Sunlink product information:
-- electrical, optical, environmental, performance, and mechanical values.
--

-- Consolidate duplicate powerwall listings while preserving kit links and the
-- alternate 10.24kWh product photograph as a gallery image.
INSERT INTO `ProductImages` (`product_id`,`image_url`,`alt_text`,`sort_order`)
SELECT 303, p.`image_url`, '10.24kWh Powerwall alternate view', 10
FROM `Products` p
WHERE p.`id`=307 AND p.`image_url` IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `ProductImages` pi WHERE pi.`product_id`=303 AND pi.`image_url`=p.`image_url`);
UPDATE `KitProducts` SET `product_id`=304 WHERE `product_id`=305;
UPDATE `KitProducts` SET `product_id`=303 WHERE `product_id`=307;
DELETE FROM `Products` WHERE `id` IN (305,307);

UPDATE `Products` SET
  `name`='High-Frequency Hybrid Solar Inverter 1.5kW',
  `description`='Compact pure-sine-wave inverter/charger with integrated MPPT solar charging, automatic mains bypass, configurable source priority, and fast transfer for essential residential and small-business loads.',
  `wattage`='1.5kW', `durability_rating`='Pure Sine Wave MPPT',
  `metadata`=JSON_OBJECT(
    'rated_output_power','1500W','peak_power','4500W','battery_voltage','12V / 24V / 48V DC configuration',
    'ac_input_voltage','85-138V AC or 170-275V AC','ac_input_frequency','45-65Hz automatic recognition',
    'ac_output_voltage','110V or 220V AC +/-2% in battery mode','output_frequency','50/60Hz +/-1%',
    'output_waveform','pure sine wave','total_harmonic_distortion','<=3%','battery_mode_efficiency','>=90%',
    'ac_mode_efficiency','>99%','ac_charging_current','0-30A selectable','charging_method','three-stage CC/CV/float',
    'solar_controller','MPPT','mppt_efficiency','>98%','maximum_pv_voltage','150V DC',
    'pv_operating_range','15-120V / 30-120V / 60-120V according to battery voltage','transfer_time','<=4ms',
    'communication','RS232 / RS485','operating_temperature','-10 to +40C','storage_temperature','-15 to +60C',
    'humidity','0-95% non-condensing','dimensions','490 x 300 x 130mm','net_weight','15.5kg')
WHERE `id`=201;

UPDATE `Products` SET
  `name`='High-Frequency Hybrid Solar Inverter 3kW',
  `description`='Pure-sine-wave inverter/charger for homes, shops, offices, and backup circuits, combining MPPT solar charging, automatic AC bypass, three-stage battery charging, and selectable AC, ECO, or solar priority.',
  `wattage`='3kW', `durability_rating`='Pure Sine Wave MPPT',
  `metadata`=JSON_OBJECT(
    'rated_output_power','3000W','peak_power','9000W','battery_voltage','24V / 48V DC configuration',
    'ac_input_voltage','85-138V AC or 170-275V AC','ac_input_frequency','45-65Hz automatic recognition',
    'ac_output_voltage','110V or 220V AC +/-2% in battery mode','output_frequency','50/60Hz +/-1%',
    'output_waveform','pure sine wave','total_harmonic_distortion','<=3%','battery_mode_efficiency','>=90%',
    'ac_mode_efficiency','>99%','ac_charging_current','0-30A selectable','charging_method','three-stage CC/CV/float',
    'solar_controller','MPPT','mppt_efficiency','>98%','maximum_pv_voltage','150V DC',
    'pv_operating_range','30-120V or 60-120V according to battery voltage','transfer_time','<=4ms',
    'communication','RS232 / RS485','operating_temperature','-10 to +40C','storage_temperature','-15 to +60C',
    'humidity','0-95% non-condensing','dimensions','510 x 320 x 140mm','net_weight','21.5kg')
WHERE `id`=202;

UPDATE `Products` SET
  `name`='Low-Voltage Hybrid Solar Inverter 6kW',
  `description`='Single-phase IP65 hybrid inverter for solar self-consumption, battery backup, AC coupling, generator charging, and off-grid operation with dual MPPT inputs and high-current low-voltage battery support.',
  `wattage`='6kW', `durability_rating`='IP65 Hybrid Inverter',
  `metadata`=JSON_OBJECT(
    'rated_ac_power','6000W','phase','single phase L+N+PE','battery_type','lead-acid or lithium-ion',
    'battery_voltage_range','40-60V DC','maximum_charge_current','135A','maximum_discharge_current','135A',
    'maximum_pv_input_power','9600W','maximum_pv_voltage','500V DC','pv_start_voltage','125V DC',
    'mppt_voltage_range','150-425V DC','rated_pv_voltage','370V DC','mppt_trackers','2',
    'rated_ac_voltage','220/230V AC','grid_frequency_range','45-55Hz or 55-65Hz','peak_off_grid_power','12000W for 10s',
    'maximum_efficiency','97.6%','mppt_efficiency','>99%','total_harmonic_distortion','<3%',
    'communication','RS485 / RS232 / CAN','surge_protection','Type II DC and Type II AC',
    'operating_temperature','-40 to +60C; derating above 45C','protection_rating','IP65',
    'dimensions','366 x 589.5 x 237mm','net_weight','26.8kg')
WHERE `id`=203;

UPDATE `Products` SET
  `name`='Low-Voltage Hybrid Solar Inverter 8kW',
  `description`='Single-phase IP65 hybrid inverter for larger homes and light commercial backup, supporting AC coupling, programmable charge/discharge periods, generator input, parallel operation, and dual MPPT solar control.',
  `wattage`='8kW', `durability_rating`='IP65 Hybrid Inverter',
  `metadata`=JSON_OBJECT(
    'rated_ac_power','8000W','phase','single phase L+N+PE','battery_type','lead-acid or lithium-ion',
    'battery_voltage_range','40-60V DC','maximum_charge_current','190A','maximum_discharge_current','190A',
    'maximum_pv_input_power','12800W','maximum_pv_voltage','500V DC','pv_start_voltage','125V DC',
    'mppt_voltage_range','150-425V DC','rated_pv_voltage','370V DC','mppt_trackers','2',
    'rated_ac_voltage','220/230V AC','rated_ac_output_current','36.4A at 220V / 34.8A at 230V',
    'maximum_ac_output_current','40A at 220V / 38.3A at 230V','peak_off_grid_power','16000W for 10s',
    'maximum_efficiency','97.6%','mppt_efficiency','>99%','total_harmonic_distortion','<3%',
    'communication','RS485 / RS232 / CAN','operating_temperature','-40 to +60C; derating above 45C',
    'protection_rating','IP65','dimensions','420 x 670 x 233mm','net_weight','35.6kg')
WHERE `id`=204;

UPDATE `Products` SET
  `name`='Low-Voltage Hybrid Solar Inverter 10kW',
  `description`='High-current single-phase IP65 hybrid inverter for large residential and small commercial systems with three MPPT inputs, AC coupling, generator charging, time-of-use control, and low-voltage battery storage.',
  `wattage`='10kW', `durability_rating`='IP65 Hybrid Inverter',
  `metadata`=JSON_OBJECT(
    'rated_ac_power','10000W','maximum_apparent_power','11000VA','phase','single phase L+N+PE',
    'battery_type','lead-acid or lithium-ion','battery_voltage_range','40-60V DC',
    'maximum_charge_current','220A','maximum_discharge_current','220A','maximum_pv_access_power','20000W',
    'maximum_pv_input_power','16000W','maximum_pv_voltage','500V DC','pv_start_voltage','125V DC',
    'mppt_voltage_range','150-425V DC','rated_pv_voltage','370V DC','mppt_trackers','3',
    'maximum_pv_operating_current','32A + 32A + 32A','rated_ac_voltage','220/230V AC',
    'rated_ac_output_current','45.5A at 220V / 43.5A at 230V','maximum_ac_output_current','50A at 220V / 47.9A at 230V',
    'peak_off_grid_power','20000W for 10s','maximum_efficiency','97.6%','mppt_efficiency','>99%',
    'communication','Wi-Fi / RS485 / CAN','operating_temperature','-40 to +60C; derating above 45C',
    'protection_rating','IP65','dimensions','420 x 670 x 233mm','net_weight','35.6kg')
WHERE `id`=205;

UPDATE `Products` SET
  `name`='Low-Voltage Hybrid Solar Inverter 12kW',
  `description`='High-output single-phase IP65 hybrid inverter for homes, offices, telecom sites, and remote facilities with three MPPT inputs, generator integration, parallel operation, and a 250A battery interface.',
  `wattage`='12kW', `durability_rating`='IP65 Hybrid Inverter',
  `metadata`=JSON_OBJECT(
    'rated_ac_power','12000W','maximum_apparent_power','13200VA','phase','single phase L+N+PE',
    'battery_type','lead-acid or lithium-ion','battery_voltage_range','40-60V DC',
    'maximum_charge_current','250A','maximum_discharge_current','250A','maximum_pv_access_power','24000W',
    'maximum_pv_input_power','19200W','maximum_pv_voltage','500V DC','pv_start_voltage','125V DC',
    'mppt_voltage_range','150-425V DC','rated_pv_voltage','370V DC','mppt_trackers','3',
    'maximum_pv_operating_current','32A + 32A + 32A','rated_ac_voltage','220/230V AC',
    'rated_ac_output_current','54.6A at 220V / 52.2A at 230V','maximum_ac_output_current','60A at 220V / 57.4A at 230V',
    'peak_off_grid_power','24000W for 10s','maximum_efficiency','97.6%','mppt_efficiency','>99%',
    'communication','Wi-Fi / RS485 / CAN','operating_temperature','-40 to +60C; derating above 45C',
    'protection_rating','IP65','dimensions','420 x 670 x 233mm','net_weight','35.6kg')
WHERE `id`=206;

UPDATE `Products` SET
  `name`='High-Voltage Three-Phase Hybrid Inverter 15kW',
  `description`='Three-phase IP65 hybrid inverter for commercial solar, battery backup, peak management, AC coupling, and generator-assisted operation with high-voltage lithium storage and unbalanced-load support.',
  `wattage`='15kW', `durability_rating`='IP65 Three-Phase Hybrid',
  `metadata`=JSON_OBJECT(
    'rated_ac_power','15000W','maximum_apparent_power','16500VA','phase','three phase 3L+N+PE',
    'battery_type','lithium-ion with BMS','battery_voltage_range','160-700V DC',
    'maximum_charge_current','37A','maximum_discharge_current','37A','maximum_pv_access_power','30000W',
    'maximum_pv_input_power','24000W','maximum_pv_voltage','1000V DC','pv_start_voltage','180V DC',
    'mppt_voltage_range','150-850V DC','rated_pv_voltage','600V DC','mppt_trackers','2',
    'rated_ac_voltage','220/380V or 230/400V AC','rated_ac_output_current','22.8A at 380V / 21.8A at 400V',
    'maximum_ac_output_current','25A at 380V / 24A at 400V','peak_off_grid_power','22500W for 10s',
    'maximum_efficiency','97.6%','euro_efficiency','97.0%','mppt_efficiency','>99%',
    'total_harmonic_distortion','<3%','communication','RS485 / RS232 / CAN',
    'operating_temperature','-40 to +60C; derating above 45C','protection_rating','IP65',
    'dimensions','408 x 638 x 237mm','net_weight','30.5kg')
WHERE `id`=207;

UPDATE `Products` SET
  `name`='High-Voltage Three-Phase Hybrid Inverter 20kW',
  `description`='Three-phase IP65 hybrid inverter for commercial buildings, warehouses, farms, and light industry with high-voltage battery input, dual MPPT tracking, unbalanced output, and protected backup operation.',
  `wattage`='20kW', `durability_rating`='IP65 Three-Phase Hybrid',
  `metadata`=JSON_OBJECT(
    'rated_ac_power','20000W','maximum_apparent_power','22000VA','phase','three phase 3L+N+PE',
    'battery_type','lithium-ion with BMS','battery_voltage_range','160-700V DC',
    'maximum_charge_current','50A','maximum_discharge_current','50A','maximum_pv_access_power','40000W',
    'maximum_pv_input_power','32000W','maximum_pv_voltage','1000V DC','pv_start_voltage','180V DC',
    'mppt_voltage_range','150-850V DC','rated_pv_voltage','700V DC','mppt_trackers','2',
    'rated_ac_voltage','220/380V or 230/400V AC','rated_ac_output_current','30.4A at 380V / 29A at 400V',
    'maximum_ac_output_current','33.4A at 380V / 31.9A at 400V','peak_off_grid_power','30000W for 10s',
    'maximum_efficiency','97.6%','euro_efficiency','97.0%','mppt_efficiency','>99%',
    'total_harmonic_distortion','<3%','communication','RS485 / RS232 / CAN',
    'operating_temperature','-40 to +60C; derating above 45C','protection_rating','IP65',
    'dimensions','408 x 638 x 237mm','net_weight','30.5kg')
WHERE `id`=208;

UPDATE `Products` SET
  `name`='High-Voltage Three-Phase Hybrid Inverter 30kW',
  `description`='Commercial and industrial three-phase IP65 hybrid inverter with a 160-700V battery interface, three MPPT trackers, 48kW maximum PV input, generator support, and 100% unbalanced output capability.',
  `wattage`='30kW', `durability_rating`='IP65 Three-Phase Hybrid',
  `metadata`=JSON_OBJECT(
    'rated_ac_power','30000W','maximum_apparent_power','33000VA','phase','three phase 3L+N+PE',
    'battery_type','lithium-ion with BMS','battery_voltage_range','160-700V DC',
    'maximum_charge_current','75A','maximum_discharge_current','75A','maximum_pv_access_power','60000W',
    'maximum_pv_input_power','48000W','maximum_pv_voltage','1000V DC','pv_start_voltage','180V DC',
    'mppt_voltage_range','150-850V DC','rated_pv_voltage','600V DC','mppt_trackers','3',
    'maximum_pv_operating_current','36A + 36A + 36A','maximum_pv_short_circuit_current','54A + 54A + 54A',
    'rated_ac_voltage','220/380V or 230/400V AC','rated_ac_output_current','45.5A at 380V / 43.5A at 400V',
    'maximum_ac_output_current','50A at 380V / 47.9A at 400V','maximum_ac_passthrough_current','80A',
    'peak_off_grid_power','45000W for 10s','maximum_efficiency','98.5%','euro_efficiency','98.0%',
    'mppt_efficiency','>99%','total_harmonic_distortion','<3%','communication','RS485 / RS232 / CAN',
    'operating_temperature','-40 to +60C; derating above 45C','protection_rating','IP65',
    'dimensions','448 x 688 x 270mm','net_weight','46kg')
WHERE `id`=209;

UPDATE `Products` SET
  `name`='Wall-Mounted LiFePO4 Battery 25.6V 100Ah / 2.56kWh',
  `description`='Compact LiFePO4 battery for essential-load backup and small solar systems with integrated BMS protection, 95% depth of discharge, and wall or floor mounting.',
  `wattage`='2.56kWh', `durability_rating`='6000+ Cycles at 80% DOD', `battery_type`='LiFePO4',
  `metadata`=JSON_OBJECT(
    'nominal_energy','2560Wh','rated_capacity','100Ah','nominal_voltage','25.6V DC','cell_configuration','8S',
    'charge_cutoff_voltage','28.8V','discharge_cutoff_voltage','24V','recommended_charge_discharge_current','<=80A',
    'maximum_charge_discharge_current','100A for 10s','recommended_output_power','<=1920W','maximum_output_power','2400W for 10s',
    'depth_of_discharge','>=95%','cycle_life','>=6000 cycles at 80% DOD and 25C','protection_rating','IP21',
    'operating_temperature','0 to +60C','parallel_support','up to 4 batteries','dimensions','360 x 330 x 160mm',
    'net_weight','23kg','battery_management','integrated BMS')
WHERE `id`=301;

UPDATE `Products` SET
  `name`='Wall-Mounted LiFePO4 Battery 51.2V 100Ah / 5.12kWh',
  `description`='Residential wall-mounted LiFePO4 battery with 100A charge and discharge capability, CAN/RS485 inverter communication, 95% usable depth, and integrated BMS protection.',
  `wattage`='5.12kWh', `durability_rating`='6000+ Cycles at 80% DOD', `battery_type`='LiFePO4',
  `metadata`=JSON_OBJECT(
    'nominal_energy','5120Wh','rated_capacity','100Ah','nominal_voltage','51.2V DC','discharge_voltage_range','43.2-58.4V DC',
    'standard_charge_current','50A','maximum_charge_current','100A','maximum_discharge_current','100A',
    'depth_of_discharge','95%','communication','CAN / RS485','cycle_life','>=6000 cycles at 25 +/-2C, 0.5C, EOL 80%',
    'charge_temperature','0 to +50C','discharge_temperature','-20 to +60C','storage_temperature','-10 to +60C',
    'dimensions','405 x 185 x 580mm','battery_management','integrated BMS',
    'protections','overcharge, over-discharge, overcurrent, short circuit and temperature')
WHERE `id`=302;

UPDATE `Products` SET
  `name`='Wall-Mounted LiFePO4 Battery 51.2V 200Ah / 10.24kWh',
  `description`='High-capacity wall-mounted LiFePO4 battery with 200A BMS, CAN/RS485 communication, 95% usable depth, and high-current charge and discharge capability for whole-home and light-commercial storage.',
  `wattage`='10.24kWh', `durability_rating`='6000+ Cycles at 80% DOD', `battery_type`='LiFePO4',
  `metadata`=JSON_OBJECT(
    'nominal_energy','10240Wh','rated_capacity','200Ah','nominal_voltage','51.2V DC','discharge_voltage_range','43.2-58.4V DC',
    'standard_charge_current','100A','maximum_charge_current','200A','maximum_discharge_current','200A',
    'depth_of_discharge','95%','communication','CAN / RS485','cycle_life','>=6000 cycles at 25 +/-2C, 0.5C, EOL 80%',
    'charge_temperature','0 to +50C','discharge_temperature','-20 to +60C','storage_temperature','-10 to +60C',
    'dimensions','435 x 280 x 630mm','battery_management','200A integrated BMS',
    'protections','overcharge, over-discharge, overcurrent, short circuit and temperature')
WHERE `id`=303;

UPDATE `Products` SET
  `name`='Floor-Mounted LiFePO4 Battery 51.2V 300Ah / 15.36kWh',
  `description`='Large residential and commercial LiFePO4 battery with 200A charge/discharge capability, CAN/RS485 communication, 95% depth of discharge, integrated display, and floor-standing enclosure.',
  `wattage`='15.36kWh', `durability_rating`='8000+ Cycles at 80% DOD', `battery_type`='LiFePO4',
  `metadata`=JSON_OBJECT(
    'nominal_energy','15360Wh','rated_capacity','300Ah','nominal_voltage','51.2V DC','discharge_voltage_range','43.2-58.4V DC',
    'standard_charge_current','100A','maximum_charge_current','200A','maximum_discharge_current','200A',
    'depth_of_discharge','95%','communication','CAN / RS485','cycle_life','>=8000 cycles at 25 +/-2C, 0.5C, EOL 80%',
    'charge_temperature','0 to +50C','discharge_temperature','-20 to +60C','storage_temperature','-10 to +60C',
    'dimensions','485 x 260 x 770mm','battery_management','integrated BMS',
    'protections','overcharge, over-discharge, overcurrent, short circuit and temperature')
WHERE `id`=304;

UPDATE `Products` SET
  `name`='Rack-Mounted LiFePO4 Battery 51.2V 100Ah / 5.12kWh',
  `description`='Rack-mounted LiFePO4 module for telecom, UPS, server rooms, and modular solar storage with CAN/RS485 communication, 100A charge/discharge capability, 95% usable depth, and integrated BMS protection.',
  `wattage`='5.12kWh', `durability_rating`='6000+ Cycles at 80% DOD', `battery_type`='LiFePO4',
  `metadata`=JSON_OBJECT(
    'nominal_energy','5120Wh','rated_capacity','100Ah','nominal_voltage','51.2V DC','discharge_voltage_range','43.2-58.4V DC',
    'standard_charge_current','50A','maximum_charge_current','100A','maximum_discharge_current','100A',
    'depth_of_discharge','95%','communication','CAN / RS485','cycle_life','>=6000 cycles at 25 +/-2C, 0.5C, EOL 80%',
    'charge_temperature','0 to +50C','discharge_temperature','-20 to +60C','storage_temperature','-10 to +60C',
    'dimensions','492 x 450 x 180mm','mounting','rack mounted','battery_management','integrated BMS',
    'protections','overcharge, over-discharge, overcurrent, short circuit and temperature')
WHERE `id`=308;

UPDATE `Products` SET
  `name`='Rack-Mounted LiFePO4 Battery 51.2V 200Ah / 10.24kWh',
  `description`='High-capacity rack-mounted LiFePO4 module for modular commercial storage and long-runtime backup with CAN/RS485 communication, 100A continuous charge/discharge rating, and integrated BMS protection.',
  `wattage`='10.24kWh', `durability_rating`='6000+ Cycles at 80% DOD', `battery_type`='LiFePO4',
  `metadata`=JSON_OBJECT(
    'nominal_energy','10240Wh','rated_capacity','200Ah','nominal_voltage','51.2V DC','discharge_voltage_range','43.2-58.4V DC',
    'standard_charge_current','50A','maximum_charge_current','100A','maximum_discharge_current','100A',
    'depth_of_discharge','95%','communication','CAN / RS485','cycle_life','>=6000 cycles at 25 +/-2C, 0.5C, EOL 80%',
    'charge_temperature','0 to +50C','discharge_temperature','-20 to +60C','storage_temperature','-10 to +60C',
    'dimensions','560 x 480 x 225mm','mounting','rack mounted','battery_management','integrated BMS',
    'protections','overcharge, over-discharge, overcurrent, short circuit and temperature')
WHERE `id`=309;

UPDATE `Products` SET
  `name`='Stackable LiFePO4 Battery 51.2V 400Ah / 20.48kWh',
  `description`='Floor-standing stackable LiFePO4 battery for large residential and light-commercial storage with CAN/RS485 communication, integrated BMS, 95% usable depth, and modular enclosure.',
  `wattage`='20.48kWh', `durability_rating`='6000+ Cycles at 80% DOD', `battery_type`='LiFePO4',
  `metadata`=JSON_OBJECT(
    'nominal_energy','20480Wh','rated_capacity','400Ah','nominal_voltage','51.2V DC','discharge_voltage_range','43.2-58.4V DC',
    'standard_charge_current','120A','maximum_charge_current','120A','maximum_discharge_current','120A',
    'depth_of_discharge','95%','communication','CAN / RS485','cycle_life','>=6000 cycles at 25 +/-2C, 0.5C, EOL 80%',
    'charge_temperature','0 to +50C','discharge_temperature','-20 to +60C','storage_temperature','-10 to +60C',
    'dimensions','600 x 183 x 390mm','mounting','floor-standing stack','battery_management','integrated BMS',
    'protections','overcharge, over-discharge, overcurrent, short circuit and temperature')
WHERE `id`=310;

UPDATE `Products` SET
  `name`='High-Voltage Rack Battery 512V 100Ah / 51.2kWh',
  `description`='High-voltage LiFePO4 rack assembled from ten protected 51.2V battery modules for commercial three-phase storage, with master battery control, inverter communication, rack isolation, and service disconnect.',
  `wattage`='51.2kWh', `durability_rating`='High-Voltage Rack System', `battery_type`='LiFePO4',
  `metadata`=JSON_OBJECT(
    'nominal_energy','51.2kWh','rated_capacity','100Ah','nominal_voltage','512V DC','operating_voltage_range','432-584V DC',
    'module_configuration','10 x 51.2V 100Ah modules in series','standard_charge_current','50A',
    'maximum_charge_current','100A','maximum_discharge_current','100A','depth_of_discharge','95%',
    'communication','CAN / RS485','cycle_life','>=6000 cycles at 25 +/-2C, 0.5C, EOL 80%',
    'charge_temperature','0 to +50C','discharge_temperature','-20 to +60C','storage_temperature','-10 to +60C',
    'battery_management','module BMS plus master high-voltage controller','dc_protection','rack breaker, fuse and service disconnect')
WHERE `id`=311;

UPDATE `Products` SET
  `name`='Commercial High-Voltage Battery System 107.52kWh',
  `description`='Modular high-voltage LiFePO4 battery system for commercial backup, solar self-consumption, and peak management with rack-level isolation, hierarchical BMS, CAN/RS485 communication, and protected DC output.',
  `wattage`='107.52kWh', `durability_rating`='Commercial High-Voltage ESS', `battery_type`='LiFePO4',
  `metadata`=JSON_OBJECT(
    'nominal_energy','107.52kWh','usable_energy_at_95_dod','102.14kWh','nominal_voltage','716.8V DC','rated_capacity','150Ah',
    'operating_voltage_range','604.8-817.6V DC','standard_charge_current','75A','maximum_charge_current','150A',
    'maximum_discharge_current','150A','continuous_power_at_0_5c','53.76kW','depth_of_discharge','95%',
    'communication','CAN / RS485 / Ethernet to EMS','cycle_life','>=6000 cycles at 25 +/-2C, 0.5C, EOL 80%',
    'charge_temperature','0 to +50C','discharge_temperature','-20 to +60C','storage_temperature','-10 to +60C',
    'battery_management','cell, module, rack and system BMS','dc_protection','rack isolation, overcurrent protection and emergency disconnect')
WHERE `id`=312;

UPDATE `Products` SET
  `name`='Commercial High-Voltage Battery System 215.04kWh',
  `description`='Large modular high-voltage LiFePO4 battery system for industrial storage, microgrids, demand management, and resilient facilities with hierarchical BMS, protected DC distribution, and EMS communication.',
  `wattage`='215.04kWh', `durability_rating`='Industrial High-Voltage ESS', `battery_type`='LiFePO4',
  `metadata`=JSON_OBJECT(
    'nominal_energy','215.04kWh','usable_energy_at_95_dod','204.29kWh','nominal_voltage','716.8V DC','rated_capacity','300Ah',
    'operating_voltage_range','604.8-817.6V DC','standard_charge_current','150A','maximum_charge_current','300A',
    'maximum_discharge_current','300A','continuous_power_at_0_5c','107.52kW','depth_of_discharge','95%',
    'communication','CAN / RS485 / Ethernet to EMS','cycle_life','>=6000 cycles at 25 +/-2C, 0.5C, EOL 80%',
    'charge_temperature','0 to +50C','discharge_temperature','-20 to +60C','storage_temperature','-10 to +60C',
    'battery_management','cell, module, rack and system BMS','dc_protection','rack isolation, overcurrent protection and emergency disconnect')
WHERE `id`=313;

-- The legacy 48V wall battery is consolidated into the technically complete
-- 51.2V/100Ah product already used by the same low-voltage inverter class.
UPDATE `KitProducts` SET `product_id`=302 WHERE `product_id`=306;
DELETE FROM `Products` WHERE `id`=306;

UPDATE `Products` SET
  `name`='Smart All-in-One Solar Street Light 4500lm',
  `description`='Integrated aluminum solar street light for local roads, compounds, farms, estates, paths, and parking areas with radar sensing, wide road optics, and automatic dusk-to-dawn operation.',
  `wattage`='60W solar / 4500lm', `durability_rating`='Outdoor Integrated Solar Light', `battery_type`='LiFePO4',
  `metadata`=JSON_OBJECT(
    'luminous_flux','4500lm','solar_panel_power','60W','solar_panel_voltage','4V','solar_panel_type','monocrystalline',
    'battery_capacity','60Ah','battery_chemistry','LiFePO4','color_temperature','6000-6500K',
    'led_chip','SMD5050','led_chip_efficiency','up to 200lm/W','beam_angle','150 x 70 degrees',
    'radar_sensor','included','control','automatic dusk-to-dawn with radar dimming','material','aluminum and Teijin PC lens',
    'dimensions','932 x 365 x 160mm','installation','integrated pole-mounted luminaire')
WHERE `id`=601;

UPDATE `Products` SET
  `name`='Smart All-in-One Solar Street Light 6500lm',
  `description`='Integrated solar street light for roads, estates, compounds, farms, and community areas with a 75W monocrystalline panel, 85Ah LiFePO4 battery, radar sensing, and wide road-distribution optics.',
  `wattage`='75W solar / 6500lm', `durability_rating`='Outdoor Integrated Solar Light', `battery_type`='LiFePO4',
  `metadata`=JSON_OBJECT(
    'luminous_flux','6500lm','solar_panel_power','75W','solar_panel_voltage','4V','solar_panel_type','monocrystalline',
    'battery_capacity','85Ah','battery_chemistry','LiFePO4','color_temperature','6000-6500K',
    'led_chip','SMD5050','led_chip_efficiency','up to 200lm/W','beam_angle','150 x 70 degrees',
    'radar_sensor','included','control','automatic dusk-to-dawn with radar dimming','material','aluminum and Teijin PC lens',
    'dimensions','1122 x 365 x 160mm','installation','integrated pole-mounted luminaire')
WHERE `id`=602;

UPDATE `Products` SET
  `name`='Smart All-in-One Solar Street Light 8500lm',
  `description`='High-output integrated solar street light for wider roads, public areas, and commercial compounds with a 90W panel, 105Ah LiFePO4 battery, radar sensing, and wide road optics.',
  `wattage`='90W solar / 8500lm', `durability_rating`='Outdoor Integrated Solar Light', `battery_type`='LiFePO4',
  `metadata`=JSON_OBJECT(
    'luminous_flux','8500lm','solar_panel_power','90W','solar_panel_voltage','4V','solar_panel_type','monocrystalline',
    'battery_capacity','105Ah','battery_chemistry','LiFePO4','color_temperature','6000-6500K',
    'led_chip','SMD5050','led_chip_efficiency','up to 200lm/W','beam_angle','150 x 70 degrees',
    'radar_sensor','included','control','automatic dusk-to-dawn with radar dimming','material','aluminum and Teijin PC lens',
    'dimensions','1342 x 365 x 160mm','installation','integrated pole-mounted luminaire')
WHERE `id`=603;

UPDATE `Products` SET
  `name`='Camera Solar Street Light 2550lm',
  `description`='Integrated solar street light and 1440P security camera for compounds, farms, paths, yards, and remote sites with radar sensing, 4G/Wi-Fi connectivity, recording, alarm detection, and AI human tracking.',
  `wattage`='30W solar / 2550lm', `durability_rating`='Outdoor Camera Solar Light', `battery_type`='LiFePO4',
  `metadata`=JSON_OBJECT(
    'luminous_flux','2550lm','solar_panel_power','30W','solar_panel_voltage','4V','solar_panel_type','monocrystalline',
    'battery_capacity','36Ah','battery_chemistry','LiFePO4','color_temperature','6500-7500K',
    'radar_sensor','included','camera_resolution','1440P','camera_rotation','up to 350 degrees',
    'network','4G / Wi-Fi','remote_viewing','mobile phone and PC','security_functions','alarm detection, playback, recording, timer and AI human tracking',
    'material','ABS and Teijin PC','dimensions','700 x 300 x 145mm')
WHERE `id`=604;

UPDATE `Products` SET
  `name`='Smart All-in-One Solar Street Light 12000lm',
  `description`='Large integrated road light for highways, public facilities, industrial compounds, and high-coverage outdoor projects with a 110W monocrystalline panel, 170Ah LiFePO4 battery, radar sensing, and automatic control.',
  `wattage`='110W solar / 12000lm', `durability_rating`='Outdoor Integrated Solar Light', `battery_type`='LiFePO4',
  `metadata`=JSON_OBJECT(
    'luminous_flux','12000lm','solar_panel_power','110W','solar_panel_voltage','4V','solar_panel_type','monocrystalline',
    'battery_capacity','170Ah','battery_chemistry','LiFePO4','color_temperature','6000-6500K',
    'led_chip','SMD5050','led_chip_efficiency','up to 200lm/W','beam_angle','150 x 70 degrees',
    'radar_sensor','included','control','automatic dusk-to-dawn with radar dimming','material','aluminum and Teijin PC lens',
    'dimensions','1672 x 365 x 160mm','installation','integrated pole-mounted luminaire')
WHERE `id`=605;

UPDATE `Products` SET
  `name`='Solar Flood Light 624lm',
  `description`='Compact solar flood light for entrances, walkways, yards, signs, and small outdoor areas with selectable warm, neutral, or cool white output and automatic dusk-to-dawn control.',
  `wattage`='12W solar / 624lm', `durability_rating`='Outdoor Solar Flood Light', `battery_type`='LiFePO4',
  `metadata`=JSON_OBJECT(
    'luminous_flux','624lm','solar_panel_power','12W','solar_panel_voltage','5V','solar_panel_type','monocrystalline',
    'battery_capacity','6Ah','battery_chemistry','LiFePO4','color_temperature','warm / neutral / cool white selectable',
    'radar_sensor','not included','control','automatic dusk-to-dawn','material','anti-UV ABS and glass',
    'dimensions','246 x 200 x 60mm','installation','separate panel with adjustable floodlight')
WHERE `id`=701;

UPDATE `Products` SET
  `name`='Solar Flood Light 1248lm',
  `description`='Medium solar flood light for compounds, farms, parking areas, signs, and security illumination with selectable light color, an 18Ah LiFePO4 battery, and separate adjustable panel.',
  `wattage`='25W solar / 1248lm', `durability_rating`='Outdoor Solar Flood Light', `battery_type`='LiFePO4',
  `metadata`=JSON_OBJECT(
    'luminous_flux','1248lm','solar_panel_power','25W','solar_panel_voltage','5V','solar_panel_type','monocrystalline',
    'battery_capacity','18Ah','battery_chemistry','LiFePO4','color_temperature','warm / neutral / cool white selectable',
    'radar_sensor','not included','control','automatic dusk-to-dawn','material','anti-UV ABS and glass',
    'dimensions','346 x 282 x 70mm','installation','separate panel with adjustable floodlight')
WHERE `id`=702;

UPDATE `Products` SET
  `name`='Project Solar Flood Light 3263lm',
  `description`='High-output project flood light for warehouses, yards, playgrounds, farms, courts, and rural public areas with a 50W solar panel, 45Ah LiFePO4 battery, and optional radar sensing.',
  `wattage`='50W solar / 3263lm', `durability_rating`='Outdoor Project Flood Light', `battery_type`='LiFePO4',
  `metadata`=JSON_OBJECT(
    'luminous_flux','3263lm','solar_panel_power','50W','solar_panel_voltage','5V','solar_panel_type','monocrystalline',
    'battery_capacity','45Ah','battery_chemistry','LiFePO4','color_temperature','6500-7500K',
    'led_chip','SMD5054','led_chip_efficiency','up to 160lm/W','radar_sensor','optional',
    'control','automatic dusk-to-dawn with optional motion profile','material','aluminum and Teijin PC',
    'dimensions','405 x 345 x 58mm','installation','separate panel with adjustable floodlight')
WHERE `id`=703;

UPDATE `Products` SET
  `name`='Solar Lawn and Path Light 582lm',
  `description`='Integrated solar landscape light for gardens, villas, walkways, parks, and hospitality areas with floor or pillar mounting and selectable warm, neutral, or cool white output.',
  `wattage`='5.5W solar / 582lm', `durability_rating`='Outdoor Landscape Solar Light', `battery_type`='LiFePO4',
  `metadata`=JSON_OBJECT(
    'luminous_flux','582lm','solar_panel_power','5.5W','solar_panel_voltage','4V','solar_panel_type','monocrystalline',
    'battery_capacity','8.8Ah','battery_chemistry','LiFePO4','color_temperature','warm / neutral / cool white selectable',
    'radar_sensor','not included','control','automatic dusk-to-dawn','material','aluminum and anti-UV PC',
    'dimensions','261mm diameter x 275mm height','mounting','floor or pillar standing')
WHERE `id`=801;

UPDATE `Products` SET
  `name`='Solar Garden and Area Light 2560lm',
  `description`='Large square solar garden and area light for parks, paths, courtyards, farms, roads, and landscape projects with a 40W panel, 36Ah LiFePO4 battery, and automatic smart power management.',
  `wattage`='40W solar / 2560lm', `durability_rating`='Outdoor Garden and Area Light', `battery_type`='LiFePO4',
  `metadata`=JSON_OBJECT(
    'luminous_flux','2560lm','solar_panel_power','40W','solar_panel_voltage','4V','solar_panel_type','monocrystalline',
    'battery_capacity','36Ah','battery_chemistry','LiFePO4','color_temperature','7000-7500K',
    'led_chip','SMD5050','led_chip_efficiency','up to 160lm/W','radar_sensor','not included',
    'control','automatic dusk-to-dawn with smart power management','material','galvanized steel',
    'dimensions','510 x 510 x 80.5mm','installation','pole-mounted area luminaire')
WHERE `id`=802;

-- Remove overlapping or accessory lighting rows that do not have a complete,
-- defensible technical schedule. The home light/fan kit already contains its
-- own lighting products, so its duplicate batten link can be removed safely.
DELETE FROM `KitProducts` WHERE `product_id` IN (606,704,901,902,1001,1002);
DELETE FROM `Products` WHERE `id` IN (606,704,901,902,1001,1002);

-- Remove legacy research labels from all remaining catalog rows.
UPDATE `Products`
SET `metadata`=JSON_REMOVE(`metadata`,'$.source_alignment')
WHERE `metadata` IS NOT NULL AND JSON_CONTAINS_PATH(`metadata`,'one','$.source_alignment');
UPDATE `Products`
SET `description`=TRIM(REPLACE(REPLACE(`description`,'Entelechy-style',''),'Entelechy',''))
WHERE `description` LIKE '%Entelechy%';
UPDATE `Kits`
SET `description`=TRIM(REPLACE(REPLACE(`description`,'Entelechy-style',''),'Entelechy',''))
WHERE `description` LIKE '%Entelechy%';

-- Complete energy storage systems are solutions, not standalone products.
-- Move residential ESS entries into Kits and expand the existing commercial,
-- industrial, container, and EV-station kits with their component products.
INSERT INTO `Kits` (`id`,`name`,`description`,`image_url`,`slug`,`is_featured`,`stock_status`) VALUES
(27,'Residential ESS 6kW / 5.12kWh','Single-phase residential energy storage kit with a 6kW hybrid inverter and 5.12kWh LiFePO4 battery for solar self-consumption, essential-load backup, and time-of-use operation.',NULL,'residential-ess-6kw-5-12kwh',1,'in_stock'),
(28,'Residential ESS 6kW / 10.24kWh','Extended-runtime single-phase residential energy storage kit with a 6kW hybrid inverter and 10.24kWh LiFePO4 battery.',NULL,'residential-ess-6kw-10-24kwh',1,'in_stock'),
(29,'Three-Phase ESS 15kW / 51.2kWh','Commercial three-phase energy storage kit with a 15kW high-voltage hybrid inverter, 51.2kWh battery rack, BMS communication, and energy management.',NULL,'three-phase-ess-15kw-51-2kwh',1,'in_stock');

-- Remove links to the former all-in-one ESS product placeholders.
DELETE FROM `KitProducts` WHERE `product_id` BETWEEN 1301 AND 1306;
DELETE FROM `KitProducts` WHERE `kit_id`=15 AND `product_id`=1403;

INSERT INTO `KitProducts` (`kit_id`,`product_id`,`quantity`,`sort_order`) VALUES
(27,203,1,1),(27,302,1,2),
(28,203,1,1),(28,303,1,2),
(29,207,1,1),(29,311,1,2),(29,1701,1,3),
(8,312,1,2),(8,209,3,3),
(9,313,1,2),(9,209,5,3),
(10,313,2,2),(10,312,1,3),(10,209,8,4),
(11,313,2,2),(11,312,1,3),(11,209,17,4),
(12,313,4,2),(12,312,2,3),(12,209,34,4),
(15,313,2,1),(15,312,1,2),(15,209,8,3),
(23,313,2,2),(23,312,1,3),(23,209,8,4)
ON DUPLICATE KEY UPDATE `quantity`=VALUES(`quantity`), `sort_order`=VALUES(`sort_order`);

UPDATE `KitProducts` SET `sort_order`=5 WHERE `kit_id` IN (8,9,10,11,12,15,23) AND `product_id`=1701;

-- Product IDs 1301-1306 represented complete systems. Their replacements are
-- now Kits, while battery, inverter, charger, and EMS components remain Products.
DELETE FROM `Products` WHERE `id` BETWEEN 1301 AND 1306;
DELETE FROM `Categories` WHERE `id`=14;

UPDATE `Products` SET
  `name`='Online Double-Conversion UPS 10kVA / 10kW',
  `description`='Three-phase online double-conversion UPS for servers, telecommunications, medical equipment, industrial controls, and other critical loads, with zero transfer time, static bypass, pure-sine-wave output, and external-battery support.',
  `wattage`='10kVA / 10kW', `durability_rating`='Online Double Conversion', `warranty_info`='2 years warranty',
  `metadata`=JSON_OBJECT(
    'topology','online double conversion','rated_power','10kVA / 10kW','input_phase','three phase + neutral + PE',
    'rated_input_voltage','360/380/400/415V AC','input_voltage_range','190-520V AC at 50% load; 305-478V AC at 100% load',
    'input_frequency_range','40-70Hz','input_power_factor','>=0.99 at full load','input_current_thd','<4% with linear load',
    'output_phase','three phase + neutral','rated_output_voltage','360/380/400/415V AC','output_voltage_regulation','+/-1%',
    'output_frequency','50/60Hz +/-0.1% in battery mode','output_waveform','pure sine wave','crest_factor','3:1',
    'output_voltage_thd','<=2% linear load; <=5% nonlinear load','transfer_time','0ms mains-to-battery and inverter-to-bypass',
    'overload_capacity','110% for 60min; 125% for 10min; 150% for 1min','online_efficiency','95.5%',
    'eco_efficiency','98.5%','battery_efficiency','94.5%','battery_bus','external battery; +/-136.5V DC charging bus',
    'adjustable_charge_current','1-12A','communication','RS232 / USB; SNMP optional','operating_temperature','0 to +40C',
    'humidity','0-95% non-condensing','noise','<60dB at 1m','dimensions','630 x 250 x 827mm','net_weight','37kg long-run model')
WHERE `id`=1501;

UPDATE `Products` SET
  `name`='Online Double-Conversion UPS 30kVA / 30kW',
  `description`='Three-phase online double-conversion UPS for data rooms, healthcare, telecom, production systems, and critical infrastructure with unity output power factor, static bypass, zero transfer time, and expandable external battery runtime.',
  `wattage`='30kVA / 30kW', `durability_rating`='Online Double Conversion', `warranty_info`='2 years warranty',
  `metadata`=JSON_OBJECT(
    'topology','online double conversion','rated_power','30kVA / 30kW','input_phase','three phase + neutral + PE',
    'rated_input_voltage','360/380/400/415V AC','input_voltage_range','190-520V AC at 50% load; 305-478V AC at 100% load',
    'input_frequency_range','40-70Hz','input_power_factor','>=0.99 at full load','input_current_thd','<4% with linear load',
    'output_phase','three phase + neutral','rated_output_voltage','360/380/400/415V AC','output_voltage_regulation','+/-1%',
    'output_frequency','50/60Hz +/-0.1% in battery mode','output_waveform','pure sine wave','crest_factor','3:1',
    'output_voltage_thd','<=2% linear load; <=5% nonlinear load','transfer_time','0ms mains-to-battery and inverter-to-bypass',
    'overload_capacity','110% for 60min; 125% for 10min; 150% for 1min','online_efficiency','95.5%',
    'eco_efficiency','98.5%','battery_efficiency','94.5%','battery_bus','external battery; +/-218V DC charging bus',
    'adjustable_charge_current','1-18A','communication','RS232 / USB; SNMP optional','operating_temperature','0 to +40C',
    'humidity','0-95% non-condensing','noise','<63dB at 1m','dimensions','815 x 300 x 1000mm','net_weight','55kg long-run model')
WHERE `id`=1502;

UPDATE `Products` SET
  `name`='Online Double-Conversion UPS 60kVA / 60kW',
  `description`='Industrial three-phase online UPS for data centers, healthcare, telecom, manufacturing, and critical infrastructure with unity power factor, static and maintenance bypass, external battery bank, and zero synchronous transfer time.',
  `wattage`='60kVA / 60kW', `durability_rating`='Industrial Online UPS', `warranty_info`='Project warranty by configuration',
  `metadata`=JSON_OBJECT(
    'topology','online double conversion','rated_power','60kVA / 60kW','input_phase','three phase + neutral + PE',
    'rated_input_voltage','380/400/415V AC','full_load_input_range','184-276V AC phase-to-neutral',
    'input_frequency_range','40-70Hz','input_power_factor','0.99 at full load','input_current_thd','<4% at full load',
    'maximum_input_current','110A per phase','output_phase','three phase four wire',
    'rated_output_voltage','380/400/415V AC','rated_output_current','91A / 86A / 83A at 380V / 400V / 415V',
    'output_voltage_regulation','+/-1% balanced load; +/-2% fully unbalanced','output_frequency','50/60Hz auto selectable',
    'output_voltage_thd','<2% linear load; <4% nonlinear load','transfer_time','0ms synchronous mains/battery and inverter/bypass',
    'overload_capacity','110% for 60min; 125% for 10min; 150% for 1min; >150% for 200ms',
    'battery_bank','32-40 external 12V blocks; 36 blocks nominal','nominal_battery_voltage','432V DC',
    'maximum_charge_current','18A adjustable','charging_method','constant-current / constant-voltage',
    'communication','RS232 / RS485 / dry contacts; SNMP optional','operating_temperature','0 to +40C',
    'storage_temperature','-15 to +60C','humidity','0-95% non-condensing','noise','<=75dB at 1m',
    'dimensions','1000 x 320 x 800mm','net_weight','88kg')
WHERE `id`=1503;

UPDATE `Products` SET
  `name`='Online Double-Conversion UPS 100kVA / 100kW',
  `description`='High-capacity three-phase online UPS for data centers, hospitals, industrial plants, and mission-critical facilities with unity power factor, external battery bank, protected bypass paths, and zero synchronous transfer time.',
  `wattage`='100kVA / 100kW', `durability_rating`='Industrial Online UPS', `warranty_info`='Project warranty by configuration',
  `metadata`=JSON_OBJECT(
    'topology','online double conversion','rated_power','100kVA / 100kW','input_phase','three phase + neutral + PE',
    'rated_input_voltage','380/400/415V AC','full_load_input_range','184-276V AC phase-to-neutral',
    'input_frequency_range','40-70Hz','input_power_factor','0.99 at full load','input_current_thd','<4% at full load',
    'maximum_input_current','188A per phase','output_phase','three phase four wire',
    'rated_output_voltage','380/400/415V AC','rated_output_current','151A / 145A / 138A at 380V / 400V / 415V',
    'output_voltage_regulation','+/-1% balanced load; +/-2% fully unbalanced','output_frequency','50/60Hz auto selectable',
    'output_voltage_thd','<2% linear load; <4% nonlinear load','transfer_time','0ms synchronous mains/battery and inverter/bypass',
    'overload_capacity','110% for 60min; 125% for 10min; 150% for 1min; >150% for 200ms',
    'battery_bank','32-40 external 12V blocks; 36 blocks nominal','nominal_battery_voltage','432V DC',
    'maximum_charge_current','36A adjustable','charging_method','constant-current / constant-voltage',
    'communication','RS232 / RS485 / dry contacts; SNMP optional','operating_temperature','0 to +40C',
    'storage_temperature','-15 to +60C','humidity','0-95% non-condensing','noise','<=75dB at 1m',
    'dimensions','1000 x 430 x 1200mm','net_weight','169kg')
WHERE `id`=1504;

--
-- Multi-model inverter families
-- Shared values render once across all model columns; custom values render
-- per model. Product names remain customer-facing Sunlink catalogue names.
--

-- Preserve the matching single-phase product media and consolidate the
-- former 6kW, 8kW and 10kW rows into one verified hardware family.
UPDATE `Products` family
JOIN `Products` model ON model.`id`=205
SET family.`image_url`=COALESCE(family.`image_url`,model.`image_url`)
WHERE family.`id`=203;
UPDATE `ProductImages` SET `product_id`=203 WHERE `product_id`=205;
UPDATE `KitProducts` SET `product_id`=203 WHERE `product_id` IN (204,205);
DELETE FROM `Products` WHERE `id` IN (204,205);

UPDATE `Products` SET
  `name`='Single-Phase Low-Voltage Hybrid Inverter 3.6-10kW',
  `description`='Single-phase low-voltage hybrid inverter family with dual MPPT solar input, IP65 protection, AC coupling, generator charging, programmable charge and discharge periods, and parallel operation for residential and light-commercial energy systems.',
  `wattage`='3.6-10kW', `durability_rating`='IP65 Hybrid Inverter',
  `battery_type`='Lead-acid or Lithium-ion', `warranty_info`='5 years standard; extended coverage available', `metadata`=NULL
WHERE `id`=203;

UPDATE `Products` SET
  `name`='Single-Phase Low-Voltage Hybrid Inverter 12-16kW',
  `description`='High-output single-phase low-voltage hybrid inverter family with three MPPT trackers, dual battery inputs, AC coupling, generator support, time-of-use control, and parallel operation for large residential and light-commercial systems.',
  `wattage`='12-16kW', `durability_rating`='IP65 Hybrid Inverter',
  `battery_type`='Lead-acid or Lithium-ion', `warranty_info`='5 years standard; extended coverage available', `metadata`=NULL
WHERE `id`=206;

UPDATE `KitProducts` SET `product_id`=207 WHERE `product_id`=208;
DELETE FROM `Products` WHERE `id`=208;
UPDATE `Products` SET
  `name`='Three-Phase High-Voltage Hybrid Inverter 5-25kW',
  `description`='Three-phase high-voltage hybrid inverter family for commercial solar and storage, supporting two MPPT trackers, unbalanced loads, AC coupling, generator charging, high-voltage lithium batteries, and parallel operation.',
  `wattage`='5-25kW', `durability_rating`='IP65 Three-Phase Hybrid',
  `battery_type`='Lithium-ion with BMS', `warranty_info`='5 years standard; extended coverage available', `metadata`=NULL
WHERE `id`=207;

UPDATE `Products` SET
  `name`='Three-Phase High-Voltage Hybrid Inverter 29.9-50kW',
  `description`='Commercial and industrial three-phase high-voltage hybrid inverter family with three or four MPPT trackers, dual battery inputs, unbalanced output, AC coupling, generator support, and protected grid and backup operation.',
  `wattage`='29.9-50kW', `durability_rating`='IP65 Three-Phase Hybrid',
  `battery_type`='Lithium-ion with BMS', `warranty_info`='5 years standard; extended coverage available', `metadata`=NULL
WHERE `id`=209;

INSERT INTO `Products`
(`id`,`category_id`,`name`,`price`,`description`,`wattage`,`durability_rating`,`battery_type`,`warranty_info`,`image_url`,`manual_pdf_url`,`video_url`,`metadata`,`is_featured`,`stock_status`)
VALUES
(210,2,'Three-Phase Low-Voltage Hybrid Inverter 3-12kW',0.00,'Three-phase low-voltage hybrid inverter family with dual MPPT tracking, 48V battery support, unbalanced output, AC coupling, generator charging, programmable operating periods, and parallel on-grid or off-grid operation.','3-12kW','IP65 Three-Phase Hybrid','Lead-acid or Lithium-ion','5 years standard; extended coverage available',NULL,NULL,NULL,NULL,1,'in_stock');

INSERT INTO `ProductModels`
(`id`,`product_id`,`model_code`,`display_name`,`nominal_power`,`price`,`stock_status`,`is_default`,`sort_order`) VALUES
(20301,203,'SUN-3.6K-SG05LP1-EU','3.6kW','3.6kW',NULL,'in_stock',0,1),
(20302,203,'SUN-5K-SG05LP1-EU','5kW','5kW',NULL,'in_stock',0,2),
(20303,203,'SUN-6K-SG05LP1-EU','6kW','6kW',NULL,'in_stock',1,3),
(20304,203,'SUN-7K-SG05LP1-EU','7kW','7kW',NULL,'in_stock',0,4),
(20305,203,'SUN-7.6K-SG05LP1-EU','7.6kW','7.6kW',NULL,'in_stock',0,5),
(20306,203,'SUN-8K-SG05LP1-EU','8kW','8kW',NULL,'in_stock',0,6),
(20307,203,'SUN-10K-SG05LP1-EU','10kW','10kW',NULL,'in_stock',0,7),
(20601,206,'SUN-12K-SG01LP1-EU','12kW','12kW',NULL,'in_stock',1,1),
(20602,206,'SUN-14K-SG01LP1-EU','14kW','14kW',NULL,'in_stock',0,2),
(20603,206,'SUN-16K-SG01LP1-EU','16kW','16kW',NULL,'in_stock',0,3),
(20701,207,'SUN-5K-SG01HP3-EU-AM2','5kW','5kW',NULL,'in_stock',0,1),
(20702,207,'SUN-6K-SG01HP3-EU-AM2','6kW','6kW',NULL,'in_stock',0,2),
(20703,207,'SUN-8K-SG01HP3-EU-AM2','8kW','8kW',NULL,'in_stock',0,3),
(20704,207,'SUN-10K-SG01HP3-EU-AM2','10kW','10kW',NULL,'in_stock',0,4),
(20705,207,'SUN-12K-SG01HP3-EU-AM2','12kW','12kW',NULL,'in_stock',0,5),
(20706,207,'SUN-15K-SG01HP3-EU-AM2','15kW','15kW',NULL,'in_stock',1,6),
(20707,207,'SUN-20K-SG01HP3-EU-AM2','20kW','20kW',NULL,'in_stock',0,7),
(20708,207,'SUN-25K-SG01HP3-EU-AM2','25kW','25kW',NULL,'in_stock',0,8),
(20901,209,'SUN-29.9K-SG01HP3-EU-BM3','29.9kW','29.9kW',NULL,'in_stock',0,1),
(20902,209,'SUN-30K-SG01HP3-EU-BM3','30kW','30kW',NULL,'in_stock',1,2),
(20903,209,'SUN-35K-SG01HP3-EU-BM3','35kW','35kW',NULL,'in_stock',0,3),
(20904,209,'SUN-40K-SG01HP3-EU-BM4','40kW','40kW',NULL,'in_stock',0,4),
(20905,209,'SUN-50K-SG01HP3-EU-BM4','50kW','50kW',NULL,'in_stock',0,5),
(21001,210,'SUN-3K-SG05LP3-EU-SM2','3kW','3kW',NULL,'in_stock',0,1),
(21002,210,'SUN-4K-SG05LP3-EU-SM2','4kW','4kW',NULL,'in_stock',0,2),
(21003,210,'SUN-5K-SG05LP3-EU-SM2','5kW','5kW',NULL,'in_stock',0,3),
(21004,210,'SUN-6K-SG05LP3-EU-SM2','6kW','6kW',NULL,'in_stock',1,4),
(21005,210,'SUN-8K-SG05LP3-EU-SM2','8kW','8kW',NULL,'in_stock',0,5),
(21006,210,'SUN-10K-SG05LP3-EU-SM2','10kW','10kW',NULL,'in_stock',0,6),
(21007,210,'SUN-12K-SG05LP3-EU-SM2','12kW','12kW',NULL,'in_stock',0,7);

-- Keep every existing kit tied to the model it previously represented.
UPDATE `KitProducts` SET `product_model_id`=20303 WHERE `product_id`=203 AND `kit_id` IN (3,24,27,28);
UPDATE `KitProducts` SET `product_model_id`=20306 WHERE `product_id`=203 AND `kit_id`=19;
UPDATE `KitProducts` SET `product_model_id`=20307 WHERE `product_id`=203 AND `kit_id`=4;
UPDATE `KitProducts` SET `product_model_id`=20601 WHERE `product_id`=206;
UPDATE `KitProducts` SET `product_model_id`=20706 WHERE `product_id`=207 AND `kit_id` IN (14,20,26,29);
UPDATE `KitProducts` SET `product_model_id`=20707 WHERE `product_id`=207 AND `kit_id` IN (5,25);
UPDATE `KitProducts` SET `product_model_id`=20902 WHERE `product_id`=209;

-- Single-phase low-voltage 3.6-10kW family.
INSERT INTO `ProductSpecifications`
(`product_id`,`section_name`,`spec_key`,`label`,`unit`,`value_mode`,`shared_value`,`model_values`,`sort_order`) VALUES
(203,'Battery Input','battery_type','Battery Type',NULL,'shared','Lead-acid or Lithium-ion',NULL,1),
(203,'Battery Input','battery_voltage_range','Battery Voltage Range','V DC','shared','40-60',NULL,2),
(203,'Battery Input','max_charge_current','Maximum Charging Current','A','custom',NULL,JSON_OBJECT('SUN-3.6K-SG05LP1-EU','90','SUN-5K-SG05LP1-EU','120','SUN-6K-SG05LP1-EU','135','SUN-7K-SG05LP1-EU','175','SUN-7.6K-SG05LP1-EU','190','SUN-8K-SG05LP1-EU','190','SUN-10K-SG05LP1-EU','210'),3),
(203,'Battery Input','max_discharge_current','Maximum Discharging Current','A','custom',NULL,JSON_OBJECT('SUN-3.6K-SG05LP1-EU','90','SUN-5K-SG05LP1-EU','120','SUN-6K-SG05LP1-EU','135','SUN-7K-SG05LP1-EU','175','SUN-7.6K-SG05LP1-EU','190','SUN-8K-SG05LP1-EU','190','SUN-10K-SG05LP1-EU','210'),4),
(203,'PV Input','max_pv_access_power','Maximum PV Access Power','W','custom',NULL,JSON_OBJECT('SUN-3.6K-SG05LP1-EU','7200','SUN-5K-SG05LP1-EU','10000','SUN-6K-SG05LP1-EU','12000','SUN-7K-SG05LP1-EU','14000','SUN-7.6K-SG05LP1-EU','15200','SUN-8K-SG05LP1-EU','16000','SUN-10K-SG05LP1-EU','20000'),5),
(203,'PV Input','max_pv_input_power','Maximum PV Input Power','W','custom',NULL,JSON_OBJECT('SUN-3.6K-SG05LP1-EU','5760','SUN-5K-SG05LP1-EU','8000','SUN-6K-SG05LP1-EU','9600','SUN-7K-SG05LP1-EU','11200','SUN-7.6K-SG05LP1-EU','12160','SUN-8K-SG05LP1-EU','12800','SUN-10K-SG05LP1-EU','16000'),6),
(203,'PV Input','max_pv_voltage','Maximum PV Input Voltage','V DC','shared','500',NULL,7),
(203,'PV Input','mppt_range','MPPT Voltage Range','V DC','shared','150-425',NULL,8),
(203,'PV Input','mppt_trackers','MPPT Trackers',NULL,'shared','2',NULL,9),
(203,'AC Input and Output','rated_ac_power','Rated AC Input/Output Active Power','W','custom',NULL,JSON_OBJECT('SUN-3.6K-SG05LP1-EU','3600','SUN-5K-SG05LP1-EU','5000','SUN-6K-SG05LP1-EU','6000','SUN-7K-SG05LP1-EU','7000','SUN-7.6K-SG05LP1-EU','7600','SUN-8K-SG05LP1-EU','8000','SUN-10K-SG05LP1-EU','10000'),10),
(203,'AC Input and Output','max_apparent_power','Maximum Apparent Power','VA','custom',NULL,JSON_OBJECT('SUN-3.6K-SG05LP1-EU','3960','SUN-5K-SG05LP1-EU','5500','SUN-6K-SG05LP1-EU','6600','SUN-7K-SG05LP1-EU','7700','SUN-7.6K-SG05LP1-EU','8360','SUN-8K-SG05LP1-EU','8800','SUN-10K-SG05LP1-EU','11000'),11),
(203,'AC Input and Output','rated_voltage','Rated Input/Output Voltage',NULL,'shared','220/230V AC, L+N+PE',NULL,12),
(203,'Performance','maximum_efficiency','Maximum Efficiency','%','shared','97.6',NULL,13),
(203,'Performance','mppt_efficiency','MPPT Efficiency','%','shared','>99',NULL,14),
(203,'General','communication','Communication',NULL,'shared','Wi-Fi / RS485 / CAN',NULL,15),
(203,'General','protection_rating','Ingress Protection',NULL,'shared','IP65',NULL,16),
(203,'General','operating_temperature','Operating Temperature','C','shared','-40 to +60; derating above 45',NULL,17),
(203,'General','dimensions','Cabinet Dimensions','mm','shared','330 x 580 x 232',NULL,18),
(203,'General','weight','Weight','kg','shared','24.9',NULL,19);

-- Single-phase low-voltage 12-16kW family.
INSERT INTO `ProductSpecifications`
(`product_id`,`section_name`,`spec_key`,`label`,`unit`,`value_mode`,`shared_value`,`model_values`,`sort_order`) VALUES
(206,'Battery Input','battery_type','Battery Type',NULL,'shared','Lead-acid or Lithium-ion',NULL,1),
(206,'Battery Input','battery_voltage_range','Battery Voltage Range','V DC','shared','40-60',NULL,2),
(206,'Battery Input','max_charge_discharge_current','Maximum Charging/Discharging Current','A','custom',NULL,JSON_OBJECT('SUN-12K-SG01LP1-EU','220','SUN-14K-SG01LP1-EU','250','SUN-16K-SG01LP1-EU','290'),3),
(206,'Battery Input','battery_inputs','Battery Inputs',NULL,'shared','2',NULL,4),
(206,'PV Input','max_pv_access_power','Maximum PV Access Power','W','custom',NULL,JSON_OBJECT('SUN-12K-SG01LP1-EU','24000','SUN-14K-SG01LP1-EU','28000','SUN-16K-SG01LP1-EU','32000'),5),
(206,'PV Input','max_pv_input_power','Maximum PV Input Power','W','custom',NULL,JSON_OBJECT('SUN-12K-SG01LP1-EU','19200','SUN-14K-SG01LP1-EU','22400','SUN-16K-SG01LP1-EU','25600'),6),
(206,'PV Input','max_pv_voltage','Maximum PV Input Voltage','V DC','shared','500',NULL,7),
(206,'PV Input','mppt_range','MPPT Voltage Range','V DC','shared','150-425',NULL,8),
(206,'PV Input','mppt_trackers','MPPT Trackers / Strings',NULL,'shared','3 / 2+2+2',NULL,9),
(206,'AC Input and Output','rated_ac_power','Rated AC Input/Output Active Power','W','custom',NULL,JSON_OBJECT('SUN-12K-SG01LP1-EU','12000','SUN-14K-SG01LP1-EU','14000','SUN-16K-SG01LP1-EU','16000'),10),
(206,'AC Input and Output','max_apparent_power','Maximum Apparent Power','VA','custom',NULL,JSON_OBJECT('SUN-12K-SG01LP1-EU','13200','SUN-14K-SG01LP1-EU','15400','SUN-16K-SG01LP1-EU','17600'),11),
(206,'AC Input and Output','rated_voltage','Rated Input/Output Voltage',NULL,'shared','220/230V AC, L+N+PE',NULL,12),
(206,'Performance','maximum_efficiency','Maximum Efficiency','%','shared','97.6',NULL,13),
(206,'Performance','mppt_efficiency','MPPT Efficiency','%','shared','>99',NULL,14),
(206,'General','communication','Communication',NULL,'shared','Wi-Fi / RS485 / CAN',NULL,15),
(206,'General','protection_rating','Ingress Protection',NULL,'shared','IP65',NULL,16),
(206,'General','dimensions','Cabinet Dimensions','mm','shared','464 x 763 x 282',NULL,17),
(206,'General','weight','Weight','kg','shared','52',NULL,18);

-- Three-phase high-voltage 5-25kW family.
INSERT INTO `ProductSpecifications`
(`product_id`,`section_name`,`spec_key`,`label`,`unit`,`value_mode`,`shared_value`,`model_values`,`sort_order`) VALUES
(207,'Battery Input','battery_type','Battery Type',NULL,'shared','Lithium-ion with BMS',NULL,1),
(207,'Battery Input','battery_voltage_range','Battery Voltage Range','V DC','shared','160-700',NULL,2),
(207,'Battery Input','max_charge_current','Maximum Charging Current','A','custom',NULL,JSON_OBJECT('SUN-5K-SG01HP3-EU-AM2','30','SUN-6K-SG01HP3-EU-AM2','30','SUN-8K-SG01HP3-EU-AM2','30','SUN-10K-SG01HP3-EU-AM2','30','SUN-12K-SG01HP3-EU-AM2','30','SUN-15K-SG01HP3-EU-AM2','37','SUN-20K-SG01HP3-EU-AM2','50','SUN-25K-SG01HP3-EU-AM2','50'),3),
(207,'PV Input','max_pv_access_power','Maximum PV Access Power','W','custom',NULL,JSON_OBJECT('SUN-5K-SG01HP3-EU-AM2','10000','SUN-6K-SG01HP3-EU-AM2','12000','SUN-8K-SG01HP3-EU-AM2','16000','SUN-10K-SG01HP3-EU-AM2','20000','SUN-12K-SG01HP3-EU-AM2','24000','SUN-15K-SG01HP3-EU-AM2','30000','SUN-20K-SG01HP3-EU-AM2','40000','SUN-25K-SG01HP3-EU-AM2','50000'),4),
(207,'PV Input','max_pv_input_power','Maximum PV Input Power','W','custom',NULL,JSON_OBJECT('SUN-5K-SG01HP3-EU-AM2','8000','SUN-6K-SG01HP3-EU-AM2','9600','SUN-8K-SG01HP3-EU-AM2','12800','SUN-10K-SG01HP3-EU-AM2','16000','SUN-12K-SG01HP3-EU-AM2','19200','SUN-15K-SG01HP3-EU-AM2','24000','SUN-20K-SG01HP3-EU-AM2','32000','SUN-25K-SG01HP3-EU-AM2','40000'),5),
(207,'PV Input','max_pv_voltage','Maximum PV Input Voltage','V DC','shared','1000',NULL,6),
(207,'PV Input','mppt_range','MPPT Voltage Range','V DC','shared','150-850',NULL,7),
(207,'PV Input','mppt_trackers','MPPT Trackers',NULL,'shared','2',NULL,8),
(207,'AC Input and Output','rated_ac_power','Rated AC Input/Output Active Power','W','custom',NULL,JSON_OBJECT('SUN-5K-SG01HP3-EU-AM2','5000','SUN-6K-SG01HP3-EU-AM2','6000','SUN-8K-SG01HP3-EU-AM2','8000','SUN-10K-SG01HP3-EU-AM2','10000','SUN-12K-SG01HP3-EU-AM2','12000','SUN-15K-SG01HP3-EU-AM2','15000','SUN-20K-SG01HP3-EU-AM2','20000','SUN-25K-SG01HP3-EU-AM2','25000'),9),
(207,'AC Input and Output','max_apparent_power','Maximum Apparent Power','VA','custom',NULL,JSON_OBJECT('SUN-5K-SG01HP3-EU-AM2','5500','SUN-6K-SG01HP3-EU-AM2','6600','SUN-8K-SG01HP3-EU-AM2','8800','SUN-10K-SG01HP3-EU-AM2','11000','SUN-12K-SG01HP3-EU-AM2','13200','SUN-15K-SG01HP3-EU-AM2','16500','SUN-20K-SG01HP3-EU-AM2','22000','SUN-25K-SG01HP3-EU-AM2','27500'),10),
(207,'AC Input and Output','rated_voltage','Rated Input/Output Voltage',NULL,'shared','220/380V or 230/400V AC, 3L+N+PE',NULL,11),
(207,'Performance','maximum_efficiency','Maximum Efficiency','%','shared','97.6',NULL,12),
(207,'Performance','mppt_efficiency','MPPT Efficiency','%','shared','>99',NULL,13),
(207,'General','communication','Communication',NULL,'shared','RS485 / RS232 / CAN; optional wireless monitoring',NULL,14),
(207,'General','protection_rating','Ingress Protection',NULL,'shared','IP65',NULL,15),
(207,'General','dimensions','Cabinet Dimensions','mm','shared','408 x 638 x 237',NULL,16),
(207,'General','weight','Weight','kg','shared','30.5',NULL,17);

-- Three-phase high-voltage 29.9-50kW family.
INSERT INTO `ProductSpecifications`
(`product_id`,`section_name`,`spec_key`,`label`,`unit`,`value_mode`,`shared_value`,`model_values`,`sort_order`) VALUES
(209,'Battery Input','battery_type','Battery Type',NULL,'shared','Lithium-ion with BMS',NULL,1),
(209,'Battery Input','battery_voltage_range','Battery Voltage Range','V DC','shared','160-800',NULL,2),
(209,'Battery Input','max_charge_current','Maximum Charging Current','A','shared','50+50',NULL,3),
(209,'Battery Input','battery_inputs','Battery Inputs',NULL,'shared','2',NULL,4),
(209,'PV Input','max_pv_access_power','Maximum PV Access Power','W','custom',NULL,JSON_OBJECT('SUN-29.9K-SG01HP3-EU-BM3','59800','SUN-30K-SG01HP3-EU-BM3','60000','SUN-35K-SG01HP3-EU-BM3','70000','SUN-40K-SG01HP3-EU-BM4','80000','SUN-50K-SG01HP3-EU-BM4','100000'),5),
(209,'PV Input','max_pv_input_power','Maximum PV Input Power','W','custom',NULL,JSON_OBJECT('SUN-29.9K-SG01HP3-EU-BM3','47840','SUN-30K-SG01HP3-EU-BM3','48000','SUN-35K-SG01HP3-EU-BM3','56000','SUN-40K-SG01HP3-EU-BM4','64000','SUN-50K-SG01HP3-EU-BM4','80000'),6),
(209,'PV Input','max_pv_voltage','Maximum PV Input Voltage','V DC','shared','1000',NULL,7),
(209,'PV Input','mppt_range','MPPT Voltage Range','V DC','shared','150-850',NULL,8),
(209,'PV Input','mppt_trackers','MPPT Trackers',NULL,'custom',NULL,JSON_OBJECT('SUN-29.9K-SG01HP3-EU-BM3','3','SUN-30K-SG01HP3-EU-BM3','3','SUN-35K-SG01HP3-EU-BM3','3','SUN-40K-SG01HP3-EU-BM4','4','SUN-50K-SG01HP3-EU-BM4','4'),9),
(209,'AC Input and Output','rated_ac_power','Rated AC Input/Output Active Power','W','custom',NULL,JSON_OBJECT('SUN-29.9K-SG01HP3-EU-BM3','29900','SUN-30K-SG01HP3-EU-BM3','30000','SUN-35K-SG01HP3-EU-BM3','35000','SUN-40K-SG01HP3-EU-BM4','40000','SUN-50K-SG01HP3-EU-BM4','50000'),10),
(209,'AC Input and Output','max_apparent_power','Maximum Apparent Power','VA','custom',NULL,JSON_OBJECT('SUN-29.9K-SG01HP3-EU-BM3','29900','SUN-30K-SG01HP3-EU-BM3','33000','SUN-35K-SG01HP3-EU-BM3','38500','SUN-40K-SG01HP3-EU-BM4','44000','SUN-50K-SG01HP3-EU-BM4','55000'),11),
(209,'AC Input and Output','rated_voltage','Rated Input/Output Voltage',NULL,'shared','220/380V or 230/400V AC, 3L+N+PE',NULL,12),
(209,'Performance','maximum_efficiency','Maximum Efficiency','%','shared','97.6',NULL,13),
(209,'Performance','mppt_efficiency','MPPT Efficiency','%','shared','>99',NULL,14),
(209,'General','communication','Communication',NULL,'shared','RS485 / RS232 / CAN; optional wireless monitoring',NULL,15),
(209,'General','protection_rating','Ingress Protection',NULL,'shared','IP65',NULL,16),
(209,'General','dimensions','Cabinet Dimensions','mm','shared','527 x 894 x 294',NULL,17),
(209,'General','weight','Weight','kg','shared','80',NULL,18);

-- Requested three-phase low-voltage 3-12kW family.
INSERT INTO `ProductSpecifications`
(`product_id`,`section_name`,`spec_key`,`label`,`unit`,`value_mode`,`shared_value`,`model_values`,`sort_order`) VALUES
(210,'Battery Input','battery_type','Battery Type',NULL,'shared','Lead-acid or Lithium-ion',NULL,1),
(210,'Battery Input','battery_voltage_range','Battery Voltage Range','V DC','shared','40-60',NULL,2),
(210,'Battery Input','max_charge_discharge_current','Maximum Charging/Discharging Current','A','custom',NULL,JSON_OBJECT('SUN-3K-SG05LP3-EU-SM2','70','SUN-4K-SG05LP3-EU-SM2','95','SUN-5K-SG05LP3-EU-SM2','120','SUN-6K-SG05LP3-EU-SM2','135','SUN-8K-SG05LP3-EU-SM2','190','SUN-10K-SG05LP3-EU-SM2','210','SUN-12K-SG05LP3-EU-SM2','240'),3),
(210,'Battery Input','charging_strategy','Lithium Battery Charging Strategy',NULL,'shared','Automatic BMS adaptation',NULL,4),
(210,'Battery Input','battery_inputs','Battery Inputs',NULL,'shared','1',NULL,5),
(210,'PV Input','max_pv_access_power','Maximum PV Access Power','W','custom',NULL,JSON_OBJECT('SUN-3K-SG05LP3-EU-SM2','6000','SUN-4K-SG05LP3-EU-SM2','8000','SUN-5K-SG05LP3-EU-SM2','10000','SUN-6K-SG05LP3-EU-SM2','12000','SUN-8K-SG05LP3-EU-SM2','16000','SUN-10K-SG05LP3-EU-SM2','20000','SUN-12K-SG05LP3-EU-SM2','24000'),6),
(210,'PV Input','max_pv_input_power','Maximum PV Input Power','W','custom',NULL,JSON_OBJECT('SUN-3K-SG05LP3-EU-SM2','4500','SUN-4K-SG05LP3-EU-SM2','6400','SUN-5K-SG05LP3-EU-SM2','8000','SUN-6K-SG05LP3-EU-SM2','9600','SUN-8K-SG05LP3-EU-SM2','12800','SUN-10K-SG05LP3-EU-SM2','16000','SUN-12K-SG05LP3-EU-SM2','19200'),7),
(210,'PV Input','max_pv_voltage','Maximum PV Input Voltage','V DC','shared','800',NULL,8),
(210,'PV Input','startup_voltage','Start-up Voltage','V DC','shared','160',NULL,9),
(210,'PV Input','mppt_range','MPPT Voltage Range','V DC','shared','200-650',NULL,10),
(210,'PV Input','rated_pv_voltage','Rated PV Input Voltage','V DC','shared','550',NULL,11),
(210,'PV Input','mppt_trackers','MPPT Trackers',NULL,'shared','2',NULL,12),
(210,'AC Input and Output','rated_ac_power','Rated AC Input/Output Active Power','W','custom',NULL,JSON_OBJECT('SUN-3K-SG05LP3-EU-SM2','3000','SUN-4K-SG05LP3-EU-SM2','4000','SUN-5K-SG05LP3-EU-SM2','5000','SUN-6K-SG05LP3-EU-SM2','6000','SUN-8K-SG05LP3-EU-SM2','8000','SUN-10K-SG05LP3-EU-SM2','10000','SUN-12K-SG05LP3-EU-SM2','12000'),13),
(210,'AC Input and Output','max_apparent_power','Maximum Apparent Power','VA','custom',NULL,JSON_OBJECT('SUN-3K-SG05LP3-EU-SM2','3300','SUN-4K-SG05LP3-EU-SM2','4400','SUN-5K-SG05LP3-EU-SM2','5500','SUN-6K-SG05LP3-EU-SM2','6600','SUN-8K-SG05LP3-EU-SM2','8800','SUN-10K-SG05LP3-EU-SM2','11000','SUN-12K-SG05LP3-EU-SM2','13200'),14),
(210,'AC Input and Output','rated_ac_current','Rated AC Input/Output Current','A','custom',NULL,JSON_OBJECT('SUN-3K-SG05LP3-EU-SM2','4.6/4.4','SUN-4K-SG05LP3-EU-SM2','6.1/5.8','SUN-5K-SG05LP3-EU-SM2','7.6/7.3','SUN-6K-SG05LP3-EU-SM2','9.1/8.7','SUN-8K-SG05LP3-EU-SM2','12.2/11.6','SUN-10K-SG05LP3-EU-SM2','15.2/14.5','SUN-12K-SG05LP3-EU-SM2','18.2/17.4'),15),
(210,'AC Input and Output','max_ac_current','Maximum AC Input/Output Current','A','custom',NULL,JSON_OBJECT('SUN-3K-SG05LP3-EU-SM2','5/4.8','SUN-4K-SG05LP3-EU-SM2','6.7/6.4','SUN-5K-SG05LP3-EU-SM2','8.4/8','SUN-6K-SG05LP3-EU-SM2','10/9.6','SUN-8K-SG05LP3-EU-SM2','13.4/12.8','SUN-10K-SG05LP3-EU-SM2','16.7/16','SUN-12K-SG05LP3-EU-SM2','20/19.2'),16),
(210,'AC Input and Output','ac_passthrough','Maximum Continuous AC Passthrough','A','shared','45',NULL,17),
(210,'AC Input and Output','peak_power','Peak Off-grid Power',NULL,'shared','2 times rated power for 10 seconds',NULL,18),
(210,'AC Input and Output','rated_voltage','Rated Input/Output Voltage',NULL,'shared','220/380V or 230/400V AC, 3L+N+PE',NULL,19),
(210,'AC Input and Output','grid_frequency','Grid Frequency Range','Hz','shared','50/45-55 or 60/55-65',NULL,20),
(210,'AC Input and Output','current_thd','Total Current Harmonic Distortion',NULL,'shared','<3% at nominal power',NULL,21),
(210,'Performance','maximum_efficiency','Maximum Efficiency','%','shared','97.6',NULL,22),
(210,'Performance','euro_efficiency','Euro Efficiency','%','shared','97.0',NULL,23),
(210,'Performance','mppt_efficiency','MPPT Efficiency','%','shared','>99',NULL,24),
(210,'Protection','integrated_protection','Integrated Protection',NULL,'shared','DC reverse polarity, AC overcurrent, thermal, overvoltage, short circuit, anti-islanding, insulation and residual-current protection',NULL,25),
(210,'Protection','surge_protection','Surge Protection',NULL,'shared','Type II DC / Type II AC',NULL,26),
(210,'Interface','display','Display',NULL,'shared','LCD',NULL,27),
(210,'Interface','communication','Communication',NULL,'shared','Wi-Fi / RS485 / CAN',NULL,28),
(210,'General','operating_temperature','Operating Temperature','C','shared','-40 to +60; derating above 45',NULL,29),
(210,'General','humidity','Permissible Ambient Humidity','%','shared','0-100',NULL,30),
(210,'General','altitude','Permissible Altitude','m','shared','3000',NULL,31),
(210,'General','noise','Noise','dB','shared','<=55',NULL,32),
(210,'General','protection_rating','Ingress Protection',NULL,'shared','IP65',NULL,33),
(210,'General','dimensions','Cabinet Dimensions','mm','shared','386 x 660 x 250',NULL,34),
(210,'General','weight','Weight','kg','shared','35.2',NULL,35),
(210,'General','cooling','Cooling',NULL,'shared','Intelligent air cooling',NULL,36);

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-06-27 10:11:37
