-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: online_shop
-- ------------------------------------------------------
-- Server version	8.0.35

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
-- Table structure for table `brand`
--

DROP TABLE IF EXISTS `brand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `brand` (
  `brand_id` int NOT NULL AUTO_INCREMENT,
  `brand_name` varchar(45) NOT NULL,
  `image` varchar(45) DEFAULT NULL,
  `is_active` bit(1) DEFAULT b'1',
  PRIMARY KEY (`brand_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brand`
--

LOCK TABLES `brand` WRITE;
/*!40000 ALTER TABLE `brand` DISABLE KEYS */;
INSERT INTO `brand` VALUES (1,'Apple','',_binary ''),(2,'SamSung','',_binary ''),(3,'Nokia',NULL,_binary ''),(4,'Sony',NULL,_binary ''),(5,'DareU',NULL,_binary ''),(6,'LogiTech',NULL,_binary ''),(7,'Huawei',NULL,_binary ''),(8,'Vsmart',NULL,_binary ''),(9,'Dell',NULL,_binary ''),(10,'LG',NULL,_binary ''),(11,'Acer',NULL,_binary '\0');
/*!40000 ALTER TABLE `brand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `cart_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  PRIMARY KEY (`cart_id`),
  KEY `cart_ibfk_1` (`user_id`),
  CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (10,7),(50,39),(54,40);
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_item`
--

DROP TABLE IF EXISTS `cart_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart_item` (
  `cart_id` int NOT NULL,
  `product_id` int NOT NULL,
  `quantity` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`cart_id`,`product_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `cart_item_ibfk_1` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`cart_id`),
  CONSTRAINT `cart_item_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_item`
--

LOCK TABLES `cart_item` WRITE;
/*!40000 ALTER TABLE `cart_item` DISABLE KEYS */;
INSERT INTO `cart_item` VALUES (10,2,1),(50,4,2);
/*!40000 ALTER TABLE `cart_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `category_id` int NOT NULL AUTO_INCREMENT,
  `category_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `description` text,
  `image` varchar(255) DEFAULT NULL,
  `parent_id` int DEFAULT NULL,
  `is_active` bit(1) DEFAULT b'1',
  PRIMARY KEY (`category_id`),
  KEY `idx_parent_id` (`parent_id`),
  CONSTRAINT `parent_id` FOREIGN KEY (`parent_id`) REFERENCES `category` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Điện thoại di động','Mobiphone, Smart Phone',NULL,NULL,_binary '\0'),(2,'Máy tính','Computer',NULL,NULL,_binary ''),(3,'PC','Máy tính bàn, desktop',NULL,2,_binary ''),(4,'Laptop','Máy tính xách tay',NULL,2,_binary ''),(5,'Đồng hồ thông minh','Smart Watch',NULL,NULL,_binary ''),(6,'Máy tính bảng','Tablet',NULL,2,_binary ''),(7,'Ti Vi','TV',NULL,NULL,_binary ''),(11,'Phụ kiện điện thoại',NULL,NULL,NULL,_binary '');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment` (
  `comment_id` int NOT NULL AUTO_INCREMENT,
  `content` text NOT NULL,
  `post_id` int NOT NULL,
  `user_id` int NOT NULL,
  `updated_date` datetime NOT NULL,
  `reply_of` int DEFAULT NULL,
  PRIMARY KEY (`comment_id`),
  KEY `post_id_idx` (`post_id`),
  KEY `user_id_idx` (`user_id`),
  KEY `reply_of_idx` (`reply_of`),
  CONSTRAINT `post_id` FOREIGN KEY (`post_id`) REFERENCES `post` (`post_id`),
  CONSTRAINT `reply_of` FOREIGN KEY (`reply_of`) REFERENCES `comment` (`comment_id`),
  CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (1,'Quả là một công nghệ tuyệt vời.',1,7,'2023-11-26 00:00:00',NULL),(2,'Đúng vậy, tôi thấy rất hào hứng.',1,8,'2023-11-27 00:00:00',1),(3,'Liệu năm sau iphone 16 có ra mắt không nhỉ?',1,9,'2023-11-27 00:00:00',NULL),(4,'Tôi nghĩ là có đấy.',1,10,'2023-12-01 00:00:00',3),(5,'Công nghệ thật tuyệt vời.',1,11,'2023-12-03 00:00:00',NULL),(6,'Sản phẩm nhìn đẹp quá.',2,13,'2023-11-06 00:00:00',NULL),(7,'Đẹp quá, mình cũng muốn mua.',1,14,'2024-02-21 00:00:00',NULL),(8,'Sản phẩm này thật thú vị.',2,14,'2024-02-21 00:00:00',NULL),(9,'Tôi cũng rất thích sản phẩm này.',1,13,'2024-02-21 00:00:00',1),(10,'abc',1,1,'2024-02-29 00:00:00',NULL),(11,'abcd',1,1,'2024-02-29 00:00:00',7),(12,'Điện thoại rất đẹp',5,2,'2024-03-10 00:00:00',NULL);
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delivery`
--

DROP TABLE IF EXISTS `delivery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `delivery` (
  `delivery_id` int NOT NULL AUTO_INCREMENT,
  `company_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`delivery_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery`
--

LOCK TABLES `delivery` WRITE;
/*!40000 ALTER TABLE `delivery` DISABLE KEYS */;
INSERT INTO `delivery` VALUES (1,'Giao hàng nhanh'),(2,'Giao hàng tiết kiệm'),(3,'Viettel Post'),(4,'J&T Express'),(5,'Ninja Van');
/*!40000 ALTER TABLE `delivery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `feedback` (
  `feedback_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `product_id` int NOT NULL,
  `content` text,
  `rated_star` smallint NOT NULL DEFAULT '5',
  `updated_date` datetime NOT NULL,
  `status` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`feedback_id`),
  KEY `user_id` (`user_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `feedback_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `product_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedback`
--

LOCK TABLES `feedback` WRITE;
/*!40000 ALTER TABLE `feedback` DISABLE KEYS */;
INSERT INTO `feedback` VALUES (1,1,1,'Sản phẩm tốt',5,'2023-02-19 00:00:00',_binary ''),(2,7,2,'Sản phẩm lỗi nhỏ',4,'2023-03-07 00:00:00',_binary ''),(3,7,1,'Sản phẩm tốt, chất lượng cao',5,'2023-03-16 00:00:00',_binary '\0'),(4,1,5,'Rất tuyệt vời, nên mua',5,'2023-03-25 00:00:00',_binary ''),(5,4,7,'Hơi thất vọng',3,'2023-04-09 00:00:00',_binary ''),(6,9,4,'Nên mua, sẽ ủng hộ tiếp',5,'2023-04-17 00:00:00',_binary ''),(7,1,5,'Dùng tốt',5,'2023-04-15 00:00:00',_binary ''),(8,1,6,'Dùng tốt',5,'2023-04-15 00:00:00',_binary ''),(9,10,8,'Sản phẩm chất lượng',5,'2023-07-25 00:00:00',_binary ''),(10,11,6,'Hơi thất vọng ',4,'2024-01-20 00:00:00',_binary ''),(11,12,8,'Sản phẩm rất tốt, nên mua',5,'2024-01-18 00:00:00',_binary ''),(12,40,9,'ok',5,'2024-03-09 23:00:24',_binary ''),(13,8,1,'hay',5,'2024-03-10 01:00:13',_binary '');
/*!40000 ALTER TABLE `feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `order_date` datetime NOT NULL,
  `delivery_id` int NOT NULL,
  `user_id` int NOT NULL,
  `state` int NOT NULL,
  `sale_id` int DEFAULT '1',
  `sale_note` text,
  PRIMARY KEY (`order_id`),
  KEY `delivery_id` (`delivery_id`),
  KEY `user_id` (`user_id`),
  KEY `order_ibfk_3_idx` (`sale_id`),
  CONSTRAINT `order_ibfk_1` FOREIGN KEY (`delivery_id`) REFERENCES `delivery` (`delivery_id`),
  CONSTRAINT `order_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `order_ibfk_3` FOREIGN KEY (`sale_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES (1,'2023-02-16 00:00:00',1,10,1,1,'Giao khẩn cấp'),(2,'2023-03-03 00:00:00',1,7,1,3,'Khách đang cần gấp'),(3,'2023-03-12 00:00:00',1,7,1,3,NULL),(4,'2023-03-22 00:00:00',2,9,1,1,NULL),(5,'2023-04-05 00:00:00',3,8,1,3,'Khách hàng quen'),(6,'2023-04-11 00:00:00',4,9,1,1,NULL),(7,'2023-04-12 00:00:00',2,8,1,3,NULL),(8,'2023-05-13 00:00:00',1,10,2,30,'Đơn cần được sử lí nhanh'),(9,'2023-05-12 00:00:00',2,8,1,31,NULL),(10,'2023-06-18 00:00:00',3,9,1,1,NULL),(11,'2023-07-22 00:00:00',2,10,1,30,'Cẩn thận khi giao'),(12,'2024-01-17 00:00:00',1,11,1,3,'Đã xử lý xong'),(13,'2024-01-13 00:00:00',4,12,1,3,NULL),(14,'2024-01-14 00:00:00',2,13,2,3,' Giao hàng cho khách trước tết'),(15,'2024-01-20 00:00:00',2,14,1,30,''),(16,'2024-02-25 00:00:00',1,15,1,3,'Khách đang cần gấp đơn hàng'),(17,'2024-02-25 00:00:00',1,15,1,1,'Để ý cẩn thận đơn này'),(18,'2024-02-25 00:00:00',1,18,3,1,''),(19,'2024-03-06 00:00:00',1,1,1,3,'Đơn này làm rất tốt'),(20,'2024-03-06 00:00:00',1,1,1,1,'Đơn hàng này cần xử lý gấp'),(21,'2024-03-06 00:00:00',1,7,1,3,NULL),(22,'2024-03-06 00:00:00',3,7,1,3,NULL),(23,'2024-03-06 00:00:00',1,7,1,3,NULL),(24,'2024-03-07 00:00:00',1,7,1,30,NULL),(42,'2024-03-08 00:00:00',1,31,1,1,NULL),(43,'2024-03-08 00:00:00',1,31,1,1,'Để ý cẩn thận đơn này'),(44,'2024-03-08 00:00:00',1,31,1,30,NULL),(45,'2024-03-08 00:00:00',1,31,1,1,NULL),(46,'2024-03-08 00:00:00',1,31,1,30,NULL),(47,'2024-03-08 00:00:00',1,31,1,3,NULL),(48,'2024-03-08 00:00:00',1,31,1,1,''),(49,'2024-03-08 00:00:00',1,31,1,3,NULL),(50,'2024-03-08 00:00:00',1,31,1,1,NULL),(51,'2024-03-08 00:00:00',1,31,1,30,NULL),(52,'2024-03-08 00:00:00',1,31,1,1,NULL),(53,'2024-03-08 00:00:00',1,31,1,3,NULL),(54,'2024-03-08 00:00:00',1,31,1,1,NULL),(55,'2024-03-09 00:00:00',1,31,1,30,NULL),(56,'2024-03-09 00:00:00',1,31,1,1,NULL),(57,'2024-03-09 00:00:00',1,31,1,1,NULL),(58,'2024-03-09 00:00:00',1,31,1,1,NULL),(59,'2024-03-09 00:00:00',1,31,1,1,NULL),(60,'2024-03-09 00:00:00',1,31,1,1,NULL),(61,'2024-03-09 00:00:00',1,31,1,1,NULL),(62,'2024-03-09 00:00:00',1,31,1,1,NULL),(63,'2024-03-09 00:00:00',1,31,1,1,NULL),(64,'2024-03-09 00:00:00',1,31,1,1,NULL),(65,'2024-03-09 00:00:00',1,31,1,1,NULL),(66,'2024-03-09 00:00:00',1,31,1,1,NULL),(67,'2024-03-09 00:00:00',1,31,1,1,NULL),(68,'2024-03-09 00:00:00',1,31,1,30,NULL),(69,'2024-03-09 00:00:00',1,31,1,1,NULL),(70,'2024-03-09 00:00:00',1,31,1,3,NULL),(71,'2024-03-09 00:00:00',1,31,1,1,NULL),(72,'2024-03-09 00:00:00',1,31,1,1,NULL),(73,'2024-03-09 00:00:00',1,31,1,3,NULL),(74,'2024-03-09 00:00:00',1,31,1,1,NULL),(75,'2024-03-09 00:00:00',1,31,1,1,NULL),(76,'2024-03-09 00:00:00',1,31,1,30,NULL),(77,'2024-03-09 00:00:00',1,31,1,1,NULL),(78,'2024-03-09 00:00:00',1,31,1,3,NULL),(79,'2024-03-09 00:00:00',1,31,1,1,NULL),(80,'2024-03-09 00:00:00',1,40,1,1,NULL),(81,'2024-03-10 00:00:00',1,8,1,1,'Hiển phụ trách giúp anh mảng này'),(82,'2024-03-10 00:00:00',3,8,3,1,NULL),(83,'2024-03-10 00:00:00',1,36,1,1,NULL),(84,'2024-03-10 00:00:00',1,36,1,1,NULL),(85,'2024-03-10 00:00:00',1,36,1,1,NULL),(86,'2024-03-10 00:00:00',1,36,1,1,NULL),(87,'2024-03-10 00:00:00',1,36,1,1,NULL),(88,'2024-03-10 00:00:00',1,36,2,1,NULL);
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_detail`
--

DROP TABLE IF EXISTS `order_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_detail` (
  `order_id` int NOT NULL,
  `product_id` int NOT NULL,
  `quantity` smallint NOT NULL,
  PRIMARY KEY (`order_id`,`product_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `order_detail_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_detail`
--

LOCK TABLES `order_detail` WRITE;
/*!40000 ALTER TABLE `order_detail` DISABLE KEYS */;
INSERT INTO `order_detail` VALUES (1,1,1),(2,2,1),(3,1,1),(4,5,1),(4,7,1),(5,3,1),(6,4,1),(7,5,1),(7,6,1),(8,8,1),(9,3,1),(10,5,1),(11,8,1),(12,4,1),(12,6,1),(13,8,1),(14,9,1),(15,7,1),(16,1,1),(17,1,3),(17,2,2),(18,2,1),(18,3,1),(19,2,1),(19,3,1),(19,4,1),(19,6,1),(20,2,1),(20,3,1),(21,2,1),(21,3,1),(22,2,1),(23,2,1),(24,2,1),(24,3,1),(42,2,9),(42,3,3),(43,3,1),(44,2,2),(44,3,1),(45,3,1),(45,4,1),(46,4,1),(47,4,1),(48,2,1),(49,2,1),(49,3,2),(49,4,2),(50,2,1),(50,3,1),(51,2,1),(51,3,1),(52,2,1),(52,3,1),(53,4,1),(54,4,1),(55,2,1),(55,3,2),(55,4,3),(56,2,3),(56,3,1),(56,4,1),(57,9,1),(58,4,1),(59,4,1),(60,2,1),(61,6,1),(62,1,1),(63,1,1),(64,1,1),(65,1,1),(66,2,1),(67,1,1),(68,1,1),(69,1,1),(70,1,1),(71,1,1),(72,4,1),(73,7,1),(74,4,1),(75,6,1),(76,7,1),(77,10,1),(78,4,1),(79,6,1),(80,9,2),(81,1,1),(82,1,1),(82,6,2),(83,4,1),(84,5,1),(85,5,1),(86,7,1),(87,19,1),(88,19,1);
/*!40000 ALTER TABLE `order_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post`
--

DROP TABLE IF EXISTS `post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post` (
  `post_id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `brief_info` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `updated_date` datetime NOT NULL,
  `status` bit(1) NOT NULL DEFAULT b'1',
  `user_id` int NOT NULL,
  `product_id` int NOT NULL,
  PRIMARY KEY (`post_id`),
  KEY `blog_ibfk_1` (`user_id`),
  KEY `product_id_idx` (`product_id`),
  CONSTRAINT `post_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `product_idfk` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post`
--

LOCK TABLES `post` WRITE;
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
INSERT INTO `post` VALUES (1,'iPhone 15 - Sự Kết Hợp Đỉnh Cao Của Thiết Kế và Công Nghệ','iPhone 15 mang đến sự kết hợp hoàn hảo giữa thiết kế tinh tế và công nghệ tiên tiến. Với màn hình đẹp, hiệu năng mạnh mẽ và tính năng nổi bật, đây là một chiếc điện thoại thông minh không thể bỏ qua.','iPhone 15 đã chính thức ra mắt và đã tạo nên cơn sốt trong ngành công nghệ di động. Với thiết kế đột phá và công nghệ tiên tiến, nó mang đến những trải nghiệm tuyệt vời cho người dùng.\r\nMàn hình Super Retina XDR trên iPhone 15 là một tác phẩm nghệ thuật. Với độ phân giải cao và màu sắc chân thực, màn hình này mang lại hình ảnh sống động và chi tiết. Xem phim, chơi game hay duyệt web trên màn hình này là một trải nghiệm tuyệt vời.\r\nSức mạnh của iPhone 15 đến từ bộ vi xử lý A15 Bionic, cung cấp hiệu năng vượt trội và khả năng xử lý đa nhiệm mượt mà. Bạn có thể dễ dàng chạy các ứng dụng nặng, chơi game 3D đỉnh cao và thậm chí chỉnh sửa video chuyên nghiệp.\r\nHệ thống camera trên iPhone 15 đã được nâng cấp với nhiều tính năng mới. Camera chính với độ phân giải cao và công nghệ chụp ảnh tiên tiến cho phép bạn chụp những bức ảnh tuyệt đẹp. Bạn cũng có thể quay video 4K với độ phân giải cao và khả năng chụp ảnh trong điều kiện ánh sáng yếu.\r\nNgoài ra, iPhone 15 hỗ trợ công nghệ 5G, cho phép bạn tận hưởng tốc độ internet siêu nhanh và trải nghiệm các dịch vụ trực tuyến mượt mà hơn bao giờ hết.\r\nVới thiết kế thời thượng và chất liệu cao cấp, iPhone 15 là một tác phẩm nghệ thuật. Chiếc điện thoại này thể hiện sự sang trọng và đẳng cấp. Đặc biệt, nó có nhiều màu sắc đẹp mắt để bạn lựa chọn.\r\niPhone 15 - Sự kết hợp đỉnh cao của thiết kế và công nghệ. Điện thoại thông minh với màn hình đẹp, hiệu năng mạnh mẽ và tính năng vượt trội. Hãy sở hữu ngay chiếc iPhone 15 và trải nghiệm cảm giác khác biệt.','2023-11-22 00:00:00',_binary '\0',2,1),(2,'iPad 6 - Khám phá thế giới công nghệ tuyệt vời','iPad 6 mang đến hiệu năng mạnh mẽ và sự đa dạng với hàng ngàn ứng dụng hấp dẫn. Với màn hình lớn, tính năng tiện ích và khả năng sáng tạo, đây là một thiết bị không thể thiếu cho công việc và giải trí.','iPad 6 là một trong những sản phẩm đáng chú ý nhất của Apple. Với hiệu năng mạnh mẽ, nó mang đến khả năng xử lý đa nhiệm mượt mà và trải nghiệm thú vị cho người dùng.\nMàn hình Retina lớn trên iPad 6 cho phép bạn tận hưởng hình ảnh sắc nét và sống động. Xem phim, chơi game hay chỉ đơn giản là lướt web đều trở nên tuyệt vời trên màn hình rộng này.\nSức mạnh của iPad 6 đến từ vi xử lý A12 Bionic, cung cấp hiệu năng vượt trội và khả năng xử lý đa nhiệm nhanh chóng. Bạn có thể chạy các ứng dụng phức tạp, chỉnh sửa video chuyên nghiệp và thậm chí trải nghiệm thực tế ảo mượt mà.\niPad 6 cung cấp hàng ngàn ứng dụng hấp dẫn trên App Store. Từ các ứng dụng sáng tạo cho đến công cụ hữu ích và trò chơi thú vị, bạn luôn tìm thấy ứng dụng phù hợp cho mọi nhu cầu của mình.\nVới tính năng Apple Pencil, bạn có thể sáng tạo và ghi chú trực tiếp trên iPad 6. Viết, vẽ hoặc chú thích trên màn hình sẽ trở nên dễ dàng và tự nhiên như viết trên giấy.\niPad 6 cũng hỗ trợ kết nối Wi-Fi và 4G LTE, cho phép bạn truy cập internet mọi lúc mọi nơi. Bạn có thể lướt web, xem video và gửi email với tốc độ nhanh chóng và ổn định.\nVới thiết kế nhẹ và mỏng, iPad 6 dễ dàng mang theo bất cứ nơi nào bạn muốn. Pin lâu và khả năng lưu trữ lớn giúp bạn sử dụng thiết bị suốt cả ngày mà không cần lo lắng về sạc.\niPad 6 - Sự kết hợp hoàn hảo giữa hiệu năng mạnh mẽ và đa dạng ứng dụng. Đây là một công cụ cần thiết cho công việc và giải trí. Hãy sở hữu ngay chiếc iPad 6 và khám phá thế giới tuyệt vời của nó!','2023-11-05 00:00:00',_binary '',2,2),(3,'Dell XPS 15 - Sức Mạnh Vượt Trội Trong Thiết Kế Mỏng Nhẹ','Dell XPS 15 kết hợp sức mạnh vượt trội và thiết kế mỏng nhẹ. Với màn hình đẹp, hiệu năng ấn tượng và tính di động cao, đây là một lựa chọn tuyệt vời cho những người đam mê công việc sáng tạo và giải trí.','Dell XPS 15 là một trong những dòng laptop đáng chú ý nhất của Dell. Với thiết kế mỏng nhẹ và sức mạnh vượt trội, nó đáp ứng được mọi nhu cầu từ công việc đến giải trí.\nMàn hình InfinityEdge trên Dell XPS 15 là một tác phẩm nghệ thuật. Với tỷ lệ khung hình siêu mỏng, màn hình này mang đến trải nghiệm xem hình ảnh hoàn hảo và sống động. Độ phân giải cao và độ tương phản tuyệt vời giúp bạn tận hưởng màu sắc chân thực và chi tiết sắc nét.\nSức mạnh của Dell XPS 15 đến từ vi xử lý Intel Core i7 hoặc i9, cùng với card đồ họa NVIDIA GeForce. Với hiệu năng mạnh mẽ này, bạn có thể xử lý các tác vụ đa nhiệm nặng, chỉnh sửa video 4K và chơi game đòi hỏi đồ họa cao một cách mượt mà.\nDell XPS 15 cũng được trang bị các tính năng tiện ích như bảo mật vân tay và đèn nền bàn phím, tạo ra một trải nghiệm sử dụng tuyệt vời. Bạn có thể làm việc hiệu quả và an toàn trên máy tính này.\nKhả năng di động của Dell XPS 15 cũng rất ấn tượng. Với trọng lượng nhẹ và thời lượng pin lâu, bạn có thể mang theo máy tính này trong suốt cả ngày mà không cần lo lắng về sạc.\nKhông chỉ về hiệu năng và thiết kế, Dell XPS 15 còn có khả năng kết nối đa dạng như cổng USB-C, Thunderbolt và cổng HDMI, giúp bạn kết nối với các thiết bị ngoại vi và màn hình một cách dễ dàng.\nDell XPS 15 - Sức mạnh vượt trội trong thiết kế mỏng nhẹ. Đây là một chiếc laptop đáng chú ý cho những người đam mê công việc sáng tạo và giải trí. Hãy sở hữu ngay Dell XPS 15 và trải nghiệm công nghệ tuyệt vời trong lòng bàn tay bạn!','2024-01-03 00:00:00',_binary '',2,3),(4,'Samsung Galaxy S23 Ultra - Sự hoàn hảo trong tầm tay','Samsung Galaxy S23 Ultra là một chiếc điện thoại thông minh đẳng cấp với công nghệ tiên tiến và thiết kế đẹp mắt. Với màn hình lớn, hiệu năng mạnh mẽ và tính năng camera đột phá, đây là một lựa chọn tuyệt vời cho những người đam mê công nghệ di động.','Samsung Galaxy S23 Ultra là một trong những phiên bản cao cấp nhất của dòng Galaxy S từ Samsung. Với sự kết hợp hoàn hảo giữa công nghệ và thiết kế, nó mang đến trải nghiệm tuyệt vời cho người dùng.\nMàn hình trên Samsung Galaxy S23 Ultra là một điểm nhấn đáng chú ý. Với kích thước lớn và công nghệ Dynamic AMOLED, màn hình này hiển thị hình ảnh sắc nét và sống động. Độ phân giải cao và tỷ lệ khung hình cao cùng với HDR10+ tạo ra trải nghiệm xem phim và chơi game tuyệt vời.\nHiệu năng của Samsung Galaxy S23 Ultra được đảm bảo bởi vi xử lý mạnh mẽ và RAM dung lượng lớn. Bạn có thể chạy các ứng dụng phức tạp, chơi game đòi hỏi đồ họa cao và thậm chí thực hiện các tác vụ đa nhiệm mượt mà.\nTính năng camera là điểm mạnh của Samsung Galaxy S23 Ultra. Với hệ thống camera đa cảm biến và công nghệ tiên tiến, bạn có thể chụp ảnh chất lượng cao và quay video ấn tượng. Khả năng zoom quang học và zoom số lớn cho phép bạn chụp ảnh từ xa mà vẫn giữ được chi tiết sắc nét.\nSamsung Galaxy S23 Ultra cũng được trang bị các tính năng tiện ích như bảo mật vân tay dưới màn hình, công nghệ sạc nhanh và khả năng chống nước và bụi theo tiêu chuẩn IP68.\nThiết kế của Samsung Galaxy S23 Ultra rất sang trọng và tinh tế. Với viền kim loại và mặt kính cong 3D, nó đem lại cảm giác cao cấp và thoải mái khi cầm nắm.\nSamsung Galaxy S23 Ultra - Sự kết hợp hoàn hảo giữa công nghệ và thiết kế đẳng cấp. Đây là một chiếc điện thoại thông minh đáng chú ý cho những người đam mê công nghệ di động. Hãy sở hữu ngay Samsung Galaxy S23 Ultra và khám phá những tính năng tuyệt vời mà nó mang lại!','2023-03-03 00:00:00',_binary '',2,5),(5,'Samsung Galaxy Z Flip4','Samsung Galaxy Z Flip4 - Thiết kế độc đáo, màn hình phong cách, camera chất lượng cao và tính di động tuyệt vời.','Samsung Galaxy Z Flip4 là sự kết hợp hoàn hảo giữa công nghệ và sự sáng tạo, mang đến một trải nghiệm di động độc đáo và tuyệt vời. Với thiết kế gập độc đáo, chiếc điện thoại này sẽ chinh phục bạn ngay từ cái nhìn đầu tiên.','2023-03-02 00:00:00',_binary '',2,6),(6,'Iphone123','123213','          123123','2024-03-09 00:00:00',_binary '',2,10),(7,'Iphone 123','123123','                                            1231231','2024-03-09 00:00:00',_binary '',2,1),(8,'Iphone 15','Hat','Tốt                                            ','2024-03-10 00:00:00',_binary '',2,5);
/*!40000 ALTER TABLE `post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_image`
--

DROP TABLE IF EXISTS `post_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post_image` (
  `image_id` int NOT NULL AUTO_INCREMENT,
  `image_url` varchar(255) NOT NULL,
  `post_id` int NOT NULL,
  PRIMARY KEY (`image_id`),
  KEY `post_id_idx` (`post_id`),
  CONSTRAINT `post_id_fk` FOREIGN KEY (`post_id`) REFERENCES `post` (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_image`
--

LOCK TABLES `post_image` WRITE;
/*!40000 ALTER TABLE `post_image` DISABLE KEYS */;
INSERT INTO `post_image` VALUES (3,'post2-1.jpg',2),(4,'post2-2.jpg',2),(5,'post3-1.jpg',3),(6,'post3-2.jpg',3),(7,'post4-1.jpg',4),(8,'post4-2.jpg',4),(9,'post5-1.jpg',5),(10,'post5-2.jpg',5),(11,'23-730x408-1.jpg',6),(12,'894_asus_laptop_gaming_rog_min.png',6),(13,'894_asus_laptop_gaming_rog_min.png',7),(15,'14.jpg',1),(16,'23-730x408-1.jpg',8),(17,'894_asus_laptop_gaming_rog_min.png',8);
/*!40000 ALTER TABLE `post_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `product_id` int NOT NULL AUTO_INCREMENT,
  `product_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `category_id` int NOT NULL,
  `brand_id` int DEFAULT NULL,
  `quantity_in_stock` int NOT NULL,
  `price` double NOT NULL,
  `discount` double NOT NULL DEFAULT '0',
  `description` text,
  `status` bit(1) NOT NULL DEFAULT b'1',
  `updated_date` datetime NOT NULL,
  PRIMARY KEY (`product_id`),
  KEY `category_id` (`category_id`),
  KEY `product_ibfk_2_idx` (`brand_id`),
  CONSTRAINT `product_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`),
  CONSTRAINT `product_ibfk_3` FOREIGN KEY (`brand_id`) REFERENCES `brand` (`brand_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'Iphone 17',1,1,0,160,20,'Khám phá sự lộng lẫy của công nghệ với iPhone 16! Với màn hình Super Retina XDR OLED 6.7 inch, sản phẩm này sẽ mang đến cho bạn trải nghiệm hình ảnh tuyệt vời với độ phân giải cao và màu sắc sống động. Bên trong, bộ vi xử lý A16 Bionic đảm bảo hiệu suất vượt trội, giúp bạn thực hiện các tác vụ mượt mà và chơi game mà không gặp trở ngại. Với hệ điều hành iOS 16 tiên tiến nhất, iPhone 15 cung cấp tính năng mới và cải thiện hiệu suất toàn diện. Hãy khám phá khả năng chụp ảnh chuyên nghiệp của cụm camera nâng cấp, cho phép bạn nắm bắt những khoảnh khắc đáng nhớ với độ phân giải cao và các tính năng chụp độc đáo. Với bộ nhớ lên đến 512GB, bạn có đủ không gian để lưu trữ tất cả ảnh, video và ứng dụng yêu thích của mình. iPhone 15 cũng hỗ trợ kết nối 5G, mang đến tốc độ truy cập internet nhanh chóng và mượt mà. Với pin dung lượng lớn, bạn có thể sử dụng điện thoại suốt cả ngày mà không cần lo lắng về việc sạc lại. Hãy đón nhận cuộc cách mạng công nghệ với iPhone 15 - sự kết hợp hoàn hảo giữa thiết kế tinh tế và hiệu suất vượt trội.',_binary '','2023-11-01 00:00:00'),(2,'Máy tính bảng Ipad 6',6,1,0,12200000,0,NULL,_binary '','2023-11-02 00:00:00'),(3,'Laptop Dell XPS 15',4,9,5,26700000,0,'',_binary '\0','2024-01-02 00:00:00'),(4,'IMac M3',3,1,2,34490000,0,NULL,_binary '','2023-08-22 00:00:00'),(5,'Samsung Galaxy S23 Ultra',1,2,12,31999000,0,NULL,_binary '','2023-03-01 00:00:00'),(6,'Samsung Galaxy Z Flip4',1,2,7,14990000,0,NULL,_binary '','2023-03-02 00:00:00'),(7,'Huawei Nova 10z',1,7,2,3890000,10,NULL,_binary '','2023-03-12 00:00:00'),(8,'Huawei P60 Pro',1,7,6,6740000,10,NULL,_binary '','2023-03-12 00:00:00'),(9,'Tivi Sony 4K 55 inch KD-55X77L',7,4,0,14340000,0,'',_binary '','2023-06-08 00:00:00'),(10,'Iphone 14',1,1,5,233200000,10,'',_binary '\0','2022-08-09 00:00:00'),(19,'LogiTech 7',4,6,22,23000000,23,'Sản phẩm mới',_binary '','2024-03-04 00:00:00'),(20,'LogiTech 7',3,9,11,37648990000,10,'Hàng mới về                             ',_binary '','2024-03-10 00:00:00'),(21,'LogiTech 8',2,6,11,324200000,13,' Sản phẩm công nghệ mới nhất từ nhà LogiTech                                           ',_binary '','2024-03-10 00:00:00');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_image`
--

DROP TABLE IF EXISTS `product_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_image` (
  `image_id` int NOT NULL AUTO_INCREMENT,
  `image_url` varchar(255) NOT NULL,
  `product_id` int NOT NULL,
  PRIMARY KEY (`image_id`),
  KEY `product_id_idx` (`product_id`),
  CONSTRAINT `product_id` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_image`
--

LOCK TABLES `product_image` WRITE;
/*!40000 ALTER TABLE `product_image` DISABLE KEYS */;
INSERT INTO `product_image` VALUES (1,'894_asus_laptop_gaming_rog_min.png',1),(2,'product1-3.jpg',1),(3,'14.jpg',1),(4,'product2-1.jpg',2),(5,'product2-2.jpg',2),(6,'product2-3.jpg',2),(7,'product2-4.jpg',2),(8,'product3-2.jpg',3),(9,'product3-1.jpg',3),(10,'product3-3.jpg',3),(11,'product4-1.jpg',4),(12,'product4-2.png',4),(13,'product4-3.jpg',4),(14,'product5-1.png',5),(15,'product5-2.jpg',5),(16,'product5-3.jpg',5),(17,'product6-1.jpg',6),(18,'product6-2.jpg',6),(19,'product7-1.png',7),(20,'product7-2.jpg',7),(21,'product8-1.jpg',8),(22,'product8-2.jpg',8),(23,'product9-2.jpg',9),(24,'product9-1.jpg',9),(25,'product10-2.jpg',10),(26,'product10-1.jpg',10),(27,'14.jpg',19),(28,'product1-1.jpg',19),(29,'hdbajda',1),(30,'product1-1.jpg',1),(31,'275242768_661291495140484_5137145110289415368_n.jpg',1),(32,'23-730x408-1.jpg',19),(33,'iStock_000006818137Medium-e1617647838968-360x352.jpg',19),(34,'product1-2.jpg',1),(35,'23-730x408-1.jpg',20),(36,'894_asus_laptop_gaming_rog_min.png',20),(37,'894_asus_laptop_gaming_rog_min.png',21),(38,'23-730x408-1.jpg',21),(39,'23-730x408-1.jpg',1);
/*!40000 ALTER TABLE `product_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `role_id` int NOT NULL AUTO_INCREMENT,
  `role_name` varchar(40) NOT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'Khách hàng'),(2,'Tiếp thị'),(3,'Nhân viên bán hàng'),(4,'Quản lý bán hàng'),(5,'Quản trị');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `setting`
--

DROP TABLE IF EXISTS `setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `setting` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `value` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `isActive` tinyint NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `setting`
--

LOCK TABLES `setting` WRITE;
/*!40000 ALTER TABLE `setting` DISABLE KEYS */;
INSERT INTO `setting` VALUES (1,'Apple','Apple Brand','1','Brand',1),(2,'SamSung','Samsung Brand','2','Brand',1),(3,'Nokia','Nokia brand','3','Brand',1),(4,'Sony','Sony brand','4','Brand',1),(5,'DareU','DareU brand','5','Brand',1),(6,'LogiTech','LogiTech brand','6','Brand',1),(7,'Huawei','Huawei brand','7','Brand',1),(8,'Vsmart','Vsmart brand','8','Brand',1),(9,'Dell','Dell brand','9','Brand',1),(10,'LG','LG brand','10','Brand',1),(11,'Điện thoại di động','Nhãn hàng điện thoại di động','1','Category',0),(12,'Máy tính','Nhãn hàng computer','2','Category',1),(13,'PC','Nhãn hàng máy tính bàn, desktop','3','Category',1),(14,'Laptop','Nhãn hàng máy tính xách tay','4','Category',1),(15,'Đồng hồ thông minh','Nhãn hàng smartwatch','5','Category',1),(16,'Máy tính bảng','Nhãn hàng tablet','6','Category',1),(17,'TV','Nhãn hàng TV','7','Category',1),(18,'Phụ kiện điện thoại',NULL,'11','Category',1),(19,'Acer',NULL,'11','Brand',0);
/*!40000 ALTER TABLE `setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `slider`
--

DROP TABLE IF EXISTS `slider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `slider` (
  `slider_id` int NOT NULL,
  `title` varchar(100) NOT NULL,
  `image` varchar(255) NOT NULL,
  `status` bit(1) NOT NULL,
  `notes` text NOT NULL,
  `user_id` int NOT NULL,
  `product_id` int NOT NULL,
  PRIMARY KEY (`slider_id`),
  KEY `marketing_id` (`user_id`),
  KEY `product_id_idx` (`product_id`),
  CONSTRAINT `fk_slider_product_id` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`),
  CONSTRAINT `slider_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `slider`
--

LOCK TABLES `slider` WRITE;
/*!40000 ALTER TABLE `slider` DISABLE KEYS */;
INSERT INTO `slider` VALUES (1,'iPhone 15','23-730x408-1.jpg',_binary '\0','Ngon',2,1),(2,'iPad 6','sliderIpad.jpg',_binary '','Sự hoàn hảo của sự đơn giản và mạnh mẽ. Màn hình Retina rực rỡ, hiệu năng nhanh chóng và khả năng đa nhiệm tuyệt vời.',2,2),(3,'Dell XPS 15','sliderLaptop.jpg',_binary '','Mạnh mẽ và tinh tế. Màn hình InfinityEdge siêu mỏng, hiệu năng đỉnh cao và âm thanh chất lượng. Lựa chọn lý tưởng cho công việc sáng tạo và giải trí.',2,3);
/*!40000 ALTER TABLE `slider` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `role_id` int NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `status` bit(1) NOT NULL DEFAULT b'1',
  `email` varchar(255) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `gender` bit(1) NOT NULL,
  `mobile` varchar(20) NOT NULL,
  `address` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `updated_date` datetime NOT NULL,
  `code` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  UNIQUE KEY `user_name_UNIQUE` (`user_name`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,3,'duytx','12345678',_binary '','duyduyduy26082003@gmail.com','Trần Xuân Duy',_binary '','0242423534','Quỳnh Côi, Thái Bình','user1.jpg','2022-09-16 00:00:00','552775'),(2,2,'minhnh','12345678',_binary '','minhnh@gmail.com','Nguyễn Hữu Minh',_binary '','0834275927','Phúc Thọ, Hà Nội','user2.jpg','2022-11-06 00:00:00','275307'),(3,3,'duongnt','12345678',_binary '','duongnt@gmail.com','Nguyễn Tùng Dương',_binary '','0325737763','Phú Xuyên, Hà Nội','user3.jpg','2022-10-13 00:00:00','753123'),(4,4,'khanhpn','12345678',_binary '','huepk32@gmail.com','Phạm Ngọc Khánh',_binary '','0453626432','Quỳnh Côi,Thái Bình','user4.jpg','2022-11-12 00:00:00','277405'),(5,5,'tunt','12345678',_binary '','tunt@gmail.com','Nguyễn Trọng Tú',_binary '','0495355578','Hoa Lư,Hòa Bình','user5.jpg','2022-08-16 00:00:00','450545'),(7,4,'lienhk','12345678',_binary '\0','lienhk@gmail.com','Hoàng Kim Liên',_binary '','0123123','Vĩnh Yên, Bắc Giang','user1.jpg','2022-09-22 00:00:00','457248'),(8,1,'hangnt','12345678',_binary '','hangnt@gmail.com','Nguyễn Thúy Hằng',_binary '\0','0567273263','Quế Võ, Bắc Ninh','user.jpg','2022-09-26 00:00:00','542053'),(9,1,'thuylt','12345678',_binary '','thuylt@gmail.com','Lê Thu Thủy',_binary '\0','0745438995','Sơn Tây, Hà Nội','user9.png','2022-10-03 00:00:00','249537'),(10,1,'tiennt','12345678',_binary '','tiennt@gmail.com','Nguyễn Tiên Tiến',_binary '','0856732643','Việt Yên, Nam Định','user.jpg','2022-11-02 00:00:00','495357'),(11,1,'tuanbq','12345678',_binary '','tuanbq@gmail.com','Bùi Quang Tuấn',_binary '','0563577236','Đồ Sơn, Hải Phòng','user.jpg','2024-01-14 00:00:00','425424'),(12,1,'nguyendq','12345678',_binary '','nguyendq@gmail.com','Đào Quang Nguyên',_binary '','0738472628','Trường Chinh, Bắc Kạn','user.jpg','2022-11-06 00:00:00','453793'),(13,1,'dungpa','12345678',_binary '','dungpa@gmail.com','Phạm Anh Dũng',_binary '','0862872342','Bắc Từ Liêm, Hà Nội','user.jpg','2022-12-14 00:00:00','638788'),(14,1,'hoangva','12345678',_binary '','hoangva@gmail.com','Võ Anh Hoàng',_binary '','0963827423','Phúc Thọ, Việt Nam','user.jpg','2024-01-14 00:00:00','783685'),(15,1,'tienntt','12345678',_binary '','tienntt@gmail.com','Nguyễn Thúc Thùy Tiên',_binary '\0','0567846232','Móng Cái, Quảng Ninh','user.jpg','2024-01-16 00:00:00','538678'),(16,1,'huu','12345678',_binary '','huumi05@gmail.com','Nguyễn Hữu Minh',_binary '','0935334269','Phúc Thọ, Hà Nội','user.jpg','2024-01-24 00:00:00','329700'),(18,1,'Duin','12345678',_binary '','123e@gmail.com','Du Uyên',_binary '','0964267232','Berlin','user.jpg','2023-11-01 00:00:00','096163'),(19,1,'minh123','12345678',_binary '','minh123@gmail.com','Hoàng Thiên Minh',_binary '','0937536238','Phúc Thọ, Hà Nội','user.jpg','2024-01-24 00:00:00','236185'),(20,1,'hminh','12345678',_binary '','huuminh0@gmail.com','Nguyễn Hữu Minh',_binary '','0936284723','Phúc Thọ, Hà Nội','user.jpg','2024-01-24 00:00:00','571128'),(21,1,'txdduy','12345678',_binary '','txd2vxv608@gmail.com','Duy Tay Phải',_binary '','0935334269','Phúc Thọ,','user.jpg','2024-01-25 00:00:00','496311'),(26,1,'duong45','12345678',_binary '','duong45@gmail.com','Nguyễn Tùng Dương',_binary '','0964899003','Hoa Lư,Hòa Bình','user.jpg','2024-01-25 00:00:00','586030'),(27,1,'duong98','12345678',_binary '','duong98@gmail.com','Nguyễn Tùng Dương',_binary '','0964899003','Hoa Lư,Hòa Bình','user.jpg','2024-01-25 00:00:00','409771'),(28,1,'duong890','12345678',_binary '','duong980@gmail.com','Nguyễn Tùng Dương',_binary '','0964899003','Hoa Lư,Hòa Bình','user.jpg','2024-01-25 00:00:00','253583'),(29,1,'minh1234','12345678',_binary '','minh@gmail.com','Quang Minh',_binary '','0747284924','Phúc Thọ, Hà Nội','user.jpg','2024-02-26 00:00:00','904305'),(30,3,'hiennm23','12345678',_binary '','hiennm23@gmail.com','Nguyễn Mạnh Hiển',_binary '','0937473823','Hòa Lạc, Hà Nội','user.jpg','2023-02-23 00:00:00','876433'),(31,1,'trangbk','12345678',_binary '','angryxious2003@gmail.com','Bùi Khánh Trang',_binary '','0975121180','Hòa Lạc, Hà Nội','user31.jpg','2023-09-12 00:00:00','232425'),(32,1,'minhnh122','123456788',_binary '','minhnh123@gmail.com','Nguyễn Hữu Minh',_binary '\0','0834275922','Phúc Thọ, Hà Nội',NULL,'2024-03-09 00:00:00','868631'),(33,1,'minhnh2','123451231',_binary '','minhn123h@gmail.com','Nguyễn Hữu Minh',_binary '','0834275923','Phúc Thọ, Hà Nội',NULL,'2024-03-09 00:00:00','694574'),(34,1,'Duong123','123123',_binary '','123123@gmail.com','Nguyễn Tùng Dương',_binary '','123123','Hoa Lac, Viet Nam',NULL,'2024-03-09 00:00:00','636463'),(36,1,'minhcart','12345678',_binary '','huuminh0511@gmail.com','Nguyễn Tùng Dương',_binary '','0343429526','Phúc Thọ, Hà Nội',NULL,'2024-03-09 00:00:00','869272'),(39,1,'hungnm','duyngat123',_binary '','txd1608@gmail.com','Nguyen Manh Hungftyfutfcu',_binary '','03636058988','Phúc Thọ, Hà Nộiiii',NULL,'2024-03-09 00:00:00','364377'),(40,1,'lannt','duy',_binary '','txd2608@gmail.com','Nguyen Thanh Lan',_binary '\0','0363605699','Phúc Thọ, Hà Nội',NULL,'2024-03-09 00:00:00','735197'),(41,3,'minhnh23456','1234567890',_binary '','nguyentungduong290403@gmail.com','Nguyễn Tùng Dương',_binary '','0333429526','Phúc Thọ, Hà Nội',NULL,'2024-03-10 00:00:00','737290');
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

-- Dump completed on 2024-03-10 20:21:21
