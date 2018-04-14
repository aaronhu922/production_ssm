-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: localhost    Database: production_ssm
-- ------------------------------------------------------
-- Server version	5.7.9-log

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
-- Table structure for table `c_order`
--

DROP TABLE IF EXISTS `c_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_order` (
  `order_id` varchar(40) NOT NULL,
  `custom_id` varchar(40) DEFAULT NULL,
  `order_date` datetime DEFAULT NULL,
  `request_date` datetime DEFAULT NULL,
  `note` varchar(5000) DEFAULT NULL,
  `total_money` decimal(10,2) DEFAULT NULL,
  `image` varchar(200) DEFAULT NULL,
  `file` varchar(200) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `payment_type` tinyint(4) DEFAULT NULL,
  `delivery` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `FK_Reference_5` (`custom_id`),
  CONSTRAINT `FK_Reference_5` FOREIGN KEY (`custom_id`) REFERENCES `custom` (`custom_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_order`
--

LOCK TABLES `c_order` WRITE;
/*!40000 ALTER TABLE `c_order` DISABLE KEYS */;
INSERT INTO `c_order` VALUES ('00001','1','2018-04-12 12:54:55','2018-04-12 12:54:55',NULL,2000.00,NULL,NULL,NULL,NULL,NULL),('201802102997','12','2018-02-09 16:00:00','2018-02-09 16:00:00',NULL,0.00,NULL,NULL,1,NULL,NULL),('201802103548','12','2018-02-09 16:00:00','2018-02-09 16:00:00',NULL,100.00,NULL,NULL,1,NULL,NULL),('201802103549','12','2018-02-09 16:00:00','2018-02-09 16:00:00',NULL,0.00,NULL,NULL,1,NULL,NULL),('20180228127','12','2018-02-28 12:26:54','2018-02-28 16:00:00','订单电话15895901300\r\n地址：淄博市第一人民医院',100.00,NULL,NULL,1,NULL,NULL),('201802287325','3','2018-02-28 12:48:05','2018-02-28 16:00:00','明天配送',1000.00,NULL,NULL,1,NULL,NULL),('201802287326','3','2018-02-27 16:00:00','2018-02-27 16:00:00',NULL,1500.00,NULL,NULL,1,NULL,NULL),('201803052282','ABC','2018-03-04 16:00:00','2018-03-04 16:00:00',NULL,69.00,NULL,NULL,1,NULL,NULL),('20180305342','ABC','2018-03-04 16:00:00','2018-03-04 16:00:00','撒旦法',60.00,NULL,NULL,1,NULL,NULL),('20180305343','33','2018-03-04 16:00:00','2018-03-04 16:00:00','test',90.00,NULL,NULL,1,NULL,NULL),('20180305344','33','2018-03-04 16:00:00','2018-03-04 16:00:00','test',90.00,NULL,NULL,1,NULL,NULL),('201803055123','33','2018-03-04 16:00:00','2018-03-04 16:00:00',NULL,69.00,NULL,NULL,1,NULL,NULL),('201803057443','33','2018-03-04 16:00:00','2018-03-04 16:00:00','3-10',200.00,NULL,NULL,1,NULL,NULL),('201803059175','33','2018-03-04 16:00:00','2018-03-04 16:00:00','111111',90.00,NULL,NULL,1,NULL,NULL),('201803059176','ABC','2018-03-04 16:00:00','2018-03-04 16:00:00',NULL,NULL,NULL,NULL,3,1,NULL),('201804134491','1','2018-04-12 16:00:00','2018-04-12 16:00:00',NULL,10000.00,NULL,NULL,2,2,1),('201804143461','1','2018-04-13 16:00:00','2018-04-13 16:00:00',NULL,144.00,NULL,NULL,2,2,1),('201804144257','1','2018-04-13 16:00:00','2018-04-13 16:00:00',NULL,144.00,NULL,NULL,1,0,1),('201804146373','1','2018-04-13 16:00:00','2018-04-14 16:00:00','午饭晚饭',300.00,NULL,NULL,1,0,1),('201804146374','1','2018-04-13 16:00:00','2018-04-13 16:00:00',NULL,0.00,NULL,NULL,1,0,1),('201804147319','1','2018-04-13 16:00:00','2018-04-13 16:00:00',NULL,1220.00,NULL,NULL,2,2,1);
/*!40000 ALTER TABLE `c_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom`
--

DROP TABLE IF EXISTS `custom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `custom` (
  `custom_id` varchar(40) NOT NULL,
  `custom_name` varchar(20) DEFAULT NULL,
  `balance` decimal(10,2) DEFAULT NULL,
  `due_bottle` int(11) DEFAULT NULL,
  `full_name` varchar(100) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `fax` varchar(20) DEFAULT NULL,
  `email` varchar(20) DEFAULT NULL,
  `owner_name` varchar(20) DEFAULT NULL,
  `owner_tel` varchar(20) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `note` varchar(2000) DEFAULT NULL,
  `custom_type` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`custom_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom`
--

LOCK TABLES `custom` WRITE;
/*!40000 ALTER TABLE `custom` DISABLE KEYS */;
INSERT INTO `custom` VALUES ('0000','testType',0.00,0,'asdfdasf','eewewww','11111','asdfads@gdfagad','sdfds','1111',1,'test',2),('1','胡永',-6364.00,-124,'sldkfj','d',NULL,'huyong@14.com',NULL,'12354548',NULL,NULL,1),('12','张三',-642.00,41,'不知道是谁公司','哈哈哈','02555','huyong@gmai.com','huyong','15555555555',1,'大款',NULL),('2','托尔斯泰',0.00,0,'test','test',NULL,NULL,'sun','11111111111',1,NULL,1),('3','淄博机械',-2500.00,25,'淄博市第一机械制造','人民路1号',NULL,'huyong@test.com','胡永','15895901300',1,'好好学习 天天向上。',NULL),('33','阿斯蒂芬',-359.00,-20,'高考','阿斯蒂芬',NULL,NULL,'阿斯蒂芬',NULL,1,'撒旦法',NULL),('ABC','ABCD',-159.00,3,'快点撒飞机扩大','额外费',NULL,NULL,'陈杰','19951810122',1,'阿萨德发送',3);
/*!40000 ALTER TABLE `custom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `department` (
  `department_id` varchar(40) NOT NULL,
  `department_name` varchar(100) DEFAULT NULL,
  `note` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`department_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES ('001','项目部','负责接洽项目，并负责项目进度控制、人员配置调度与风险管控'),('002','生产部','负责制定生产计划，并组织生产。'),('003','物料部','负责物料收支与调配。'),('004','财务部','负责公司财务运作。'),('005','人力部','负责公司人事。'),('006','物流部','<span style=\"font-size:14px;\">负责公司物流调配。</span>'),('007','礼仪部','负责前台接待及会务礼仪。');
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `device`
--

DROP TABLE IF EXISTS `device`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `device` (
  `device_id` varchar(40) NOT NULL,
  `device_name` varchar(100) DEFAULT NULL,
  `device_type_id` varchar(40) DEFAULT NULL,
  `device_status_id` varchar(40) DEFAULT NULL,
  `device_status` varchar(100) DEFAULT NULL,
  `device_purchase_date` datetime DEFAULT NULL,
  `device_purchase_price` decimal(10,2) DEFAULT NULL,
  `device_manufacture_date` datetime DEFAULT NULL,
  `device_service_life` datetime DEFAULT NULL,
  `device_keeper_id` varchar(40) DEFAULT NULL,
  `note` varchar(5000) DEFAULT NULL,
  PRIMARY KEY (`device_id`),
  KEY `FK_Reference_18` (`device_type_id`),
  CONSTRAINT `FK_Reference_18` FOREIGN KEY (`device_type_id`) REFERENCES `device_type` (`device_type_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `device`
--

LOCK TABLES `device` WRITE;
/*!40000 ALTER TABLE `device` DISABLE KEYS */;
INSERT INTO `device` VALUES ('001','焊接设备','01','1','良好','2016-08-09 08:08:01',99.99,'2016-09-09 09:09:01','2021-09-09 09:09:01','002','<span style=\"font-size:14px;\">状态良好.</span>'),('002','冲压设备','01','2','良好','2016-08-08 08:08:01',99.99,'2016-09-09 09:09:02','2021-09-09 09:09:02','001','<p>\r\n	This is good.\r\n</p>'),('003','空调','02','2','故障','2016-08-08 08:08:03',99.97,'2016-09-09 09:09:03','2021-09-09 09:09:03','001','This is good.'),('004','冷风机','02','2','故障','2016-08-08 08:08:03',99.97,'2016-09-09 09:09:04','2021-09-09 09:09:04','001','This is good.'),('005','叉车','03','3','维修','2016-08-08 08:08:05',99.95,'2016-09-09 09:09:05','2021-09-09 09:09:05','001','This is good.'),('006','机械臂','03','3','维修','2016-08-08 08:08:05',99.95,'2016-09-09 09:09:06','2021-09-09 09:09:06','002','This is good.');
/*!40000 ALTER TABLE `device` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `device_check`
--

DROP TABLE IF EXISTS `device_check`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `device_check` (
  `device_check_id` varchar(40) NOT NULL,
  `device_id` varchar(40) DEFAULT NULL,
  `device_check_emp_id` varchar(40) DEFAULT NULL,
  `device_check_date` datetime DEFAULT NULL,
  `device_check_result` varchar(5000) DEFAULT NULL,
  `device_check_fault_id` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`device_check_id`),
  KEY `FK_Reference_20` (`device_id`),
  CONSTRAINT `FK_Reference_20` FOREIGN KEY (`device_id`) REFERENCES `device` (`device_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `device_check`
--

LOCK TABLES `device_check` WRITE;
/*!40000 ALTER TABLE `device_check` DISABLE KEYS */;
INSERT INTO `device_check` VALUES ('001','001','002','2016-07-20 08:08:08','Ok。','无'),('002','002','001','2018-08-08 08:08:08','Ok','002'),('003','003','001','2018-08-08 08:08:08','Ok','003'),('004','004','001','2018-08-08 08:08:08','Ok','004'),('005','005','001','2018-08-08 08:08:08','Ok','006'),('006','006','','2018-08-08 08:08:08','Ok','005'),('321','001','001','2016-12-21 11:05:20','状态良好','321'),('424','001','002','2016-12-22 00:00:00','4325435gdg','4324');
/*!40000 ALTER TABLE `device_check` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `device_fault`
--

DROP TABLE IF EXISTS `device_fault`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `device_fault` (
  `device_fault_id` varchar(40) NOT NULL,
  `device_id` varchar(40) DEFAULT NULL,
  `device_fault_cause` varchar(100) DEFAULT NULL,
  `device_fault_detail` varchar(5000) DEFAULT NULL,
  `device_fault_date` datetime DEFAULT NULL,
  `device_fault_maintenance` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`device_fault_id`),
  KEY `FK_Reference_21` (`device_id`),
  CONSTRAINT `FK_Reference_21` FOREIGN KEY (`device_id`) REFERENCES `device` (`device_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `device_fault`
--

LOCK TABLES `device_fault` WRITE;
/*!40000 ALTER TABLE `device_fault` DISABLE KEYS */;
INSERT INTO `device_fault` VALUES ('001','001','台风','哼哼哈嘿.','2016-10-01 08:08:08','人工'),('002','002','台风','哼哼哈嘿','2016-10-06 08:08:08','人工'),('003','003','台风','哼哼哈嘿','2016-10-01 08:08:08','人工'),('004','004','台风','哼哼哈嘿','2016-10-01 08:08:08','人工'),('005','005','台风','哼哼哈嘿','2016-10-01 08:08:08','人工'),('006','006','台风','哼哼哈嘿','2016-10-01 08:08:08','人工');
/*!40000 ALTER TABLE `device_fault` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `device_maintain`
--

DROP TABLE IF EXISTS `device_maintain`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `device_maintain` (
  `device_maintain_id` varchar(40) NOT NULL,
  `device_fault_id` varchar(40) DEFAULT NULL,
  `device_maintain_emp_id` varchar(10) DEFAULT NULL,
  `device_maintain_date` datetime DEFAULT NULL,
  `device_maintain_result` varchar(100) DEFAULT NULL,
  `device_maintain_cost` decimal(10,2) DEFAULT NULL,
  `note` varchar(5000) DEFAULT NULL,
  PRIMARY KEY (`device_maintain_id`),
  KEY `FK_Reference_22` (`device_fault_id`),
  CONSTRAINT `FK_Reference_22` FOREIGN KEY (`device_fault_id`) REFERENCES `device_fault` (`device_fault_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `device_maintain`
--

LOCK TABLES `device_maintain` WRITE;
/*!40000 ALTER TABLE `device_maintain` DISABLE KEYS */;
INSERT INTO `device_maintain` VALUES ('001','001','001','2016-10-07 08:08:08','维修成功',88.88,'费用已结清。'),('002','002','001','2016-10-07 08:08:08','维修成功',88.88,'K.O.'),('003','003','002','2016-10-07 08:08:08','维修成功',88.88,'K.O.'),('004','004','001','2016-10-07 08:08:08','维修成功',88.88,'K.O.'),('005','005','002','2016-10-07 08:08:08','维修成功',88.88,'K.O.');
/*!40000 ALTER TABLE `device_maintain` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `device_type`
--

DROP TABLE IF EXISTS `device_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `device_type` (
  `device_type_id` varchar(40) NOT NULL,
  `device_type_name` varchar(100) DEFAULT NULL,
  `device_type_model` varchar(200) DEFAULT NULL,
  `device_type_spec` varchar(200) DEFAULT NULL,
  `device_type_supplier` varchar(100) DEFAULT NULL,
  `device_type_producer` varchar(100) DEFAULT NULL,
  `device_type_quantity` int(11) DEFAULT NULL,
  `device_type_warranty` datetime DEFAULT NULL,
  PRIMARY KEY (`device_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `device_type`
--

LOCK TABLES `device_type` WRITE;
/*!40000 ALTER TABLE `device_type` DISABLE KEYS */;
INSERT INTO `device_type` VALUES ('01','加工设备','中','A','福建百斯特贸易有限公司','福建永辉机械有限公司',11,'2018-08-08 08:08:08'),('02','冷暖设备','中','B','珠海格力有限公司','珠海格力有限公司',12,'2018-08-08 08:08:08'),('03','传送设备','小','C','福建永辉机械有限公司','福建永辉机械有限公司',13,'2018-08-08 08:08:08'),('04','清洗设备','大','D','福建百斯特贸易有限公司','福建永辉机械有限公司',14,'2018-08-08 08:08:08'),('05','打磨设备','中','E','厦门天德设备有限公司','厦门海科设备有限公司',15,'2018-08-08 08:08:08'),('06','冲压设备','大','A','厦门天德设备公司','湖南三一重工',20,'2016-12-24 11:58:46');
/*!40000 ALTER TABLE `device_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `due_bottle`
--

DROP TABLE IF EXISTS `due_bottle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `due_bottle` (
  `uid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `custom_id` varchar(40) NOT NULL COMMENT 'Customer ID',
  `product_id` varchar(40) NOT NULL,
  `quantity` int(11) NOT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `due_bottle`
--

LOCK TABLES `due_bottle` WRITE;
/*!40000 ALTER TABLE `due_bottle` DISABLE KEYS */;
INSERT INTO `due_bottle` VALUES (44,'1','空气瓶',-110),(45,'1','氧气瓶',-14),(49,'00001','氧气瓶',10),(50,'00001','氧气瓶',10),(51,'00001','氧气瓶',10);
/*!40000 ALTER TABLE `due_bottle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee` (
  `emp_id` varchar(40) NOT NULL,
  `emp_name` varchar(40) DEFAULT NULL,
  `sex` char(1) DEFAULT NULL,
  `id_code` varchar(20) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `join_date` date DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `education` varchar(20) DEFAULT NULL,
  `degree` varchar(20) DEFAULT NULL,
  `major` varchar(40) DEFAULT NULL,
  `graduate_school` varchar(40) DEFAULT NULL,
  `education_form` varchar(40) DEFAULT NULL,
  `department_id` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`emp_id`),
  KEY `FK_Reference_30` (`department_id`),
  CONSTRAINT `FK_Reference_30` FOREIGN KEY (`department_id`) REFERENCES `department` (`department_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES ('001','王武','1','350321xxxxxxxxxxxx',NULL,NULL,'在职','本科','学士','计算机',NULL,'全日制','002'),('002','张三','2','152346842123458618','1970-01-01','1970-01-01','在职','大专','无','软件工程',NULL,'全日制','005'),('003','刘高升','1','156423547861546872',NULL,NULL,'在职','大专','无','人力资源',NULL,'全日制','001'),('005','刘亦菲','2','156432486625615156',NULL,NULL,'在职','本科','学士','形体礼仪',NULL,'在职','007');
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `final_count_check`
--

DROP TABLE IF EXISTS `final_count_check`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `final_count_check` (
  `f_count_check_id` varchar(40) NOT NULL,
  `order_id` varchar(40) DEFAULT NULL,
  `check_item` varchar(40) DEFAULT NULL,
  `sample` int(11) DEFAULT NULL,
  `check_number` int(11) DEFAULT NULL,
  `unqualify` int(11) DEFAULT NULL,
  `qualify` decimal(3,2) DEFAULT NULL,
  `cdate` datetime DEFAULT NULL,
  `measure_data` varchar(2000) DEFAULT NULL,
  `emp_id` varchar(40) DEFAULT NULL,
  `result` varchar(2000) DEFAULT NULL,
  `note` varchar(5000) DEFAULT NULL,
  PRIMARY KEY (`f_count_check_id`),
  KEY `FK_Reference_25` (`order_id`),
  CONSTRAINT `FK_Reference_25` FOREIGN KEY (`order_id`) REFERENCES `c_order` (`order_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `final_count_check`
--

LOCK TABLES `final_count_check` WRITE;
/*!40000 ALTER TABLE `final_count_check` DISABLE KEYS */;
INSERT INTO `final_count_check` VALUES ('20156','000006','平整度',3,3,6,0.89,'2015-05-13 00:00:00','6','001','良','问题较多，需要重审1'),('33398','000003','透光度',3,3,6,0.89,'2015-05-13 00:00:00','6','001','良','问题较多，需要重审'),('33521','000006','重量',3,3,6,0.89,'2015-05-13 00:00:00','6','001','良','问题较多，需要重审'),('33789','000003','色差',3,3,6,0.89,'2015-05-13 00:00:00','6','001','良','问题较多，需要重审'),('89658','000006','大小',3,3,6,0.89,'2015-05-13 00:00:00','6','001','良','问题较多，需要重审');
/*!40000 ALTER TABLE `final_count_check` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `final_measuret_check`
--

DROP TABLE IF EXISTS `final_measuret_check`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `final_measuret_check` (
  `f_measure_check_id` varchar(40) NOT NULL,
  `order_id` varchar(40) DEFAULT NULL,
  `check_item` varchar(40) DEFAULT NULL,
  `cdate` datetime DEFAULT NULL,
  `measure_data` varchar(2000) DEFAULT NULL,
  `emp_id` varchar(40) DEFAULT NULL,
  `result` varchar(2000) DEFAULT NULL,
  `note` varchar(5000) DEFAULT NULL,
  PRIMARY KEY (`f_measure_check_id`),
  KEY `FK_Reference_27` (`order_id`),
  CONSTRAINT `FK_Reference_27` FOREIGN KEY (`order_id`) REFERENCES `c_order` (`order_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `final_measuret_check`
--

LOCK TABLES `final_measuret_check` WRITE;
/*!40000 ALTER TABLE `final_measuret_check` DISABLE KEYS */;
INSERT INTO `final_measuret_check` VALUES ('11022','000006','材料','2015-05-13 00:00:00','36m','001','优','合格率高，做工精致a'),('11069','000009','工具','2015-05-13 00:00:00','36m','001','优','合格率高，做工精致'),('11079','000006','工具','2015-05-13 00:00:00','36m','001','优','合格率高，做工精致'),('11749','000015','资料','2015-05-13 00:00:00','36m','001','优','合格率高，做工精致'),('18969','000013','文具','2015-05-13 00:00:00','36m','001','优','合格率高，做工精致'),('19519','000002','工具','2015-05-13 00:00:00','36m','001','优','合格率高，做工精致');
/*!40000 ALTER TABLE `final_measuret_check` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manufacture`
--

DROP TABLE IF EXISTS `manufacture`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `manufacture` (
  `manufacture_sn` varchar(40) NOT NULL,
  `order_id` varchar(40) DEFAULT NULL,
  `technology_id` varchar(40) DEFAULT NULL,
  `launch_quantity` int(11) DEFAULT NULL,
  `begin_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  PRIMARY KEY (`manufacture_sn`),
  KEY `FK_Reference_26` (`order_id`),
  KEY `FK_Reference_9` (`technology_id`),
  CONSTRAINT `FK_Reference_26` FOREIGN KEY (`order_id`) REFERENCES `c_order` (`order_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_Reference_9` FOREIGN KEY (`technology_id`) REFERENCES `technology` (`technology_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manufacture`
--

LOCK TABLES `manufacture` WRITE;
/*!40000 ALTER TABLE `manufacture` DISABLE KEYS */;
INSERT INTO `manufacture` VALUES ('0001','000002','001',15,'2016-10-27 09:23:01','2016-10-28 09:23:05'),('0002','000003','002',213,'2016-12-17 00:00:00','2016-12-17 00:00:00'),('0003','000002','002',31,'2016-12-17 00:00:00','2016-12-17 00:00:00'),('0004','000001','001',213,NULL,NULL),('0007','000003','002',143,'2016-12-21 00:00:00','2016-12-21 00:00:00');
/*!40000 ALTER TABLE `manufacture` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `material`
--

DROP TABLE IF EXISTS `material`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `material` (
  `material_id` varchar(40) NOT NULL,
  `material_type` varchar(100) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `remaining` int(11) DEFAULT NULL,
  `note` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`material_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `material`
--

LOCK TABLES `material` WRITE;
/*!40000 ALTER TABLE `material` DISABLE KEYS */;
INSERT INTO `material` VALUES ('BZ3004985112','包装类','正常',50,'用于保护<em></em>和指导产品使用的物品。'),('FJ9810053211','附件类','充足',35,'起到附属作用并具有独立使用功能的元件'),('FM3003745734','辅料类','正常',2,'用于生产及周转的低值辅助材料'),('GM3587100823','过滤件','正常',5,'起到过滤作用的零部件'),('RJ10033214-80','软胶件','短缺',-12,'用于组装主机及附件的且用软质材料'),('SJ0011212178','塑胶件','充足',41,'用于组装主机和附件及后续加工用的注塑件'),('WJ3002123490','五金件','正常',3,'用于组装主机和附件及后序加工用的单个金属件'),('ZJ1006435620','杂件类','短缺',-10,'用于组装主机及附件的用混杂材料加工成的元件');
/*!40000 ALTER TABLE `material` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `material_consume`
--

DROP TABLE IF EXISTS `material_consume`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `material_consume` (
  `consume_id` varchar(40) NOT NULL,
  `work_id` varchar(40) DEFAULT NULL,
  `material_id` varchar(40) DEFAULT NULL,
  `consume_amount` int(11) DEFAULT NULL,
  `consume_date` datetime DEFAULT NULL,
  `sender` varchar(40) DEFAULT NULL,
  `receiver` varchar(40) DEFAULT NULL,
  `note` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`consume_id`),
  KEY `FK_Reference_16` (`material_id`),
  KEY `FK_Reference_33` (`work_id`),
  CONSTRAINT `FK_Reference_16` FOREIGN KEY (`material_id`) REFERENCES `material` (`material_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_Reference_33` FOREIGN KEY (`work_id`) REFERENCES `work` (`work_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `material_consume`
--

LOCK TABLES `material_consume` WRITE;
/*!40000 ALTER TABLE `material_consume` DISABLE KEYS */;
INSERT INTO `material_consume` VALUES ('A1187899','001','WJ3002123490',312,'2016-12-03 00:00:00','齐鲁钢铁公司','朝阳钢铁公司','进口原料。'),('A1561810','001','GM3587100823',450,'2016-11-13 00:00:00','齐鲁钢铁公司','朝阳钢铁公司','进口矿石'),('A1562771','001','FM3003745734',25,'2016-09-13 00:00:00','齐鲁钢铁公司','朝阳钢铁公司','进口矿石'),('A1620202','001','WJ3002123490',31,'2016-09-12 00:00:00','齐鲁钢铁公司','朝阳钢铁公司','煤炭焦炭'),('A1880923','001','ZJ1006435620',45,'2016-08-15 00:00:00','齐鲁钢铁公司','朝阳钢铁公司','不锈钢原料');
/*!40000 ALTER TABLE `material_consume` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `material_receive`
--

DROP TABLE IF EXISTS `material_receive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `material_receive` (
  `receive_id` varchar(40) NOT NULL,
  `material_id` varchar(40) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `receive_date` datetime DEFAULT NULL,
  `sender` varchar(100) DEFAULT NULL,
  `receiver` varchar(40) DEFAULT NULL,
  `note` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`receive_id`),
  KEY `FK_Reference_15` (`material_id`),
  CONSTRAINT `FK_Reference_15` FOREIGN KEY (`material_id`) REFERENCES `material` (`material_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `material_receive`
--

LOCK TABLES `material_receive` WRITE;
/*!40000 ALTER TABLE `material_receive` DISABLE KEYS */;
INSERT INTO `material_receive` VALUES ('B1087893','RJ10033214-80',21,'2016-12-20 00:00:00','齐鲁钢铁公司','朝阳钢铁公司','粉矿3.67。'),('B108897','RJ10033214-80',12,'2016-12-03 00:00:00','齐鲁钢铁公司','朝阳钢铁公司','进口原料4.12'),('B12979001','FM3003745734',51,'2016-12-03 00:00:00','齐鲁钢铁公司','朝阳钢铁公司','纯净废铜5.12'),('B13048855','SJ0011212178',71,'2016-12-03 00:00:00','齐鲁钢铁公司','朝阳钢铁公司','进口原料1.34'),('B13409145','RJ10033214-80',12,'2016-12-03 00:00:00','齐鲁钢铁公司','朝阳钢铁公司','进口原料2.12');
/*!40000 ALTER TABLE `material_receive` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_item`
--

DROP TABLE IF EXISTS `order_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_item` (
  `uid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `order_id` varchar(40) NOT NULL COMMENT 'Order ID',
  `product_id` varchar(40) DEFAULT NULL,
  `unit` varchar(10) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `unit_price` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`uid`),
  KEY `FK_Reference_38` (`order_id`),
  CONSTRAINT `FK_Reference_38` FOREIGN KEY (`order_id`) REFERENCES `c_order` (`order_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=122 DEFAULT CHARSET=utf8 COMMENT='Order Items table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_item`
--

LOCK TABLES `order_item` WRITE;
/*!40000 ALTER TABLE `order_item` DISABLE KEYS */;
INSERT INTO `order_item` VALUES (39,'201802103548','空气','10.0',10,100.00),(40,'201802103548','氧气瓶','0.0',11,0.00),(41,'201802103548','空气瓶','0.0',22,0.00),(42,'201802103549','氧气瓶','0.0',-11,0.00),(43,'201802103549','空气瓶','0.0',-2,0.00),(46,'201802102997','空气瓶','0.0',11,0.00),(57,'20180228127','空气瓶','0.0',10,0.00),(58,'20180228127','空气','10.0',10,100.00),(62,'201802287325','空气瓶','0.0',10,0.00),(63,'201802287325','空气','100.0',10,1000.00),(64,'201802287326','空气瓶','0.0',15,0.00),(65,'201802287326','空气','100.0',15,1500.00),(67,'20180305342','空气','20.0',3,60.00),(68,'20180305343','空气','30.0',3,90.00),(69,'20180305344','空气','30.0',3,90.00),(70,'201803059175','空气','30.0',3,90.00),(71,'201803059176','空气','30.0',3,90.00),(72,'201803052282','空气瓶','0.0',3,0.00),(73,'201803052282','空气','23.0',3,69.00),(74,'201803055123','空气瓶','0.0',3,0.00),(75,'201803055123','空气','23.0',3,69.00),(81,'201803057443','空气瓶','0.0',10,0.00),(82,'201803057443','空气','20.0',10,200.00),(107,'00001','00005','瓶',22,10.00),(108,'201804134491','空气瓶','0.0',100,0.00),(109,'201804134491','空气','100.0',100,10000.00),(110,'201804147319','空气瓶','0.0',10,0.00),(111,'201804147319','空气','122.0',10,1220.00),(112,'201804143461','氧气瓶','0.0',-6,0.00),(113,'201804143461','空气瓶','0.0',12,0.00),(114,'201804143461','空气','12.0',12,144.00),(115,'201804146373','氧气瓶','0.0',10,0.00),(116,'201804146373','氧气','30.0',10,300.00),(117,'201804146373','空气瓶','0.0',-6,0.00),(118,'201804146374','氧气瓶','0.0',10,0.00),(119,'201804146374','氧气','0.0',10,0.00),(120,'201804146374','空气瓶','0.0',-6,0.00),(121,'201804144257','空气','12.0',12,144.00);
/*!40000 ALTER TABLE `order_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `process`
--

DROP TABLE IF EXISTS `process`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `process` (
  `process_id` varchar(40) NOT NULL,
  `technology_plan_id` varchar(40) DEFAULT NULL,
  `sequence` int(11) DEFAULT NULL,
  `quota` int(11) DEFAULT NULL,
  PRIMARY KEY (`process_id`),
  KEY `FK_Reference_32` (`technology_plan_id`),
  CONSTRAINT `FK_Reference_32` FOREIGN KEY (`technology_plan_id`) REFERENCES `technology_plan` (`technology_plan_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `process`
--

LOCK TABLES `process` WRITE;
/*!40000 ALTER TABLE `process` DISABLE KEYS */;
INSERT INTO `process` VALUES ('01','001',5,3232),('02','001',2,2),('03','002',4,8);
/*!40000 ALTER TABLE `process` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `process_count_check`
--

DROP TABLE IF EXISTS `process_count_check`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `process_count_check` (
  `p_count_check_id` varchar(40) NOT NULL,
  `process_id` varchar(40) DEFAULT NULL,
  `check_item` varchar(40) DEFAULT NULL,
  `sample` int(11) DEFAULT NULL,
  `check_number` int(11) DEFAULT NULL,
  `unqualify` int(11) DEFAULT NULL,
  `qualify` decimal(3,2) DEFAULT NULL,
  `cdate` datetime DEFAULT NULL,
  `measure_data` varchar(2000) DEFAULT NULL,
  `emp_id` varchar(40) DEFAULT NULL,
  `result` varchar(2000) DEFAULT NULL,
  `note` varchar(5000) DEFAULT NULL,
  PRIMARY KEY (`p_count_check_id`),
  KEY `FK_Reference_24` (`process_id`),
  CONSTRAINT `FK_Reference_24` FOREIGN KEY (`process_id`) REFERENCES `process` (`process_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `process_count_check`
--

LOCK TABLES `process_count_check` WRITE;
/*!40000 ALTER TABLE `process_count_check` DISABLE KEYS */;
INSERT INTO `process_count_check` VALUES ('33124','03','电灯',6,4,8,0.88,'2015-05-13 00:00:00','12','001','优秀','产品质量过关，外表美观'),('36124','03','电话机',6,4,8,0.88,'2015-05-13 00:00:00','12','003','优秀','产品质量过关，外表美观'),('36174','03','包装',6,4,8,0.88,'2015-05-13 00:00:00','12','001','优秀','产品质量过关，外表美观'),('36744','03','电话机',6,4,8,0.88,'2015-05-13 00:00:00','12','001','优秀','产品质量过关，外表美观'),('36784','03','电话机',6,4,8,0.88,'2015-05-13 00:00:00','12','001','优秀','产品质量过关，外表美观');
/*!40000 ALTER TABLE `process_count_check` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `process_measure_check`
--

DROP TABLE IF EXISTS `process_measure_check`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `process_measure_check` (
  `p_measure_check_id` varchar(40) NOT NULL,
  `process_id` varchar(40) DEFAULT NULL,
  `check_item` varchar(40) DEFAULT NULL,
  `cdate` datetime DEFAULT NULL,
  `measure_data` varchar(2000) DEFAULT NULL,
  `emp_id` varchar(40) DEFAULT NULL,
  `result` varchar(2000) DEFAULT NULL,
  `note` varchar(5000) DEFAULT NULL,
  PRIMARY KEY (`p_measure_check_id`),
  KEY `FK_Reference_23` (`process_id`),
  CONSTRAINT `FK_Reference_23` FOREIGN KEY (`process_id`) REFERENCES `process` (`process_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `process_measure_check`
--

LOCK TABLES `process_measure_check` WRITE;
/*!40000 ALTER TABLE `process_measure_check` DISABLE KEYS */;
INSERT INTO `process_measure_check` VALUES ('025','02','耗时','2016-12-24 00:00:00','15h','002','良','耗时良好。'),('73689','03','耗时','2015-05-13 00:00:00','37件','002','延时','工序复杂，耗时1'),('79619','03','产品合格率','2015-05-13 00:00:00','37件','001','延时','工序复杂，耗时'),('79689','03','工人工时','2015-05-13 00:00:00','37件','003','延时','工序复杂，耗时');
/*!40000 ALTER TABLE `process_measure_check` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `product_id` varchar(40) NOT NULL,
  `product_name` varchar(100) DEFAULT NULL,
  `product_type` varchar(100) DEFAULT NULL,
  `unit_price` decimal(10,2) DEFAULT NULL,
  `unit` varchar(10) DEFAULT NULL,
  `image` varchar(200) DEFAULT NULL,
  `note` varchar(5000) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES ('1','空气','1',122.00,'瓶',NULL,NULL,1),('2','空气瓶','3',0.00,'个',NULL,'啊是短发岁的',1),('3','氧气瓶','3',0.00,'个',NULL,NULL,1),('4','氧气','1',16.00,'瓶',NULL,NULL,1),('5','二氧化碳瓶','3',0.00,'个',NULL,NULL,1);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_permission`
--

DROP TABLE IF EXISTS `sys_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_permission` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `name` varchar(128) NOT NULL COMMENT '资源名称',
  `type` varchar(32) NOT NULL COMMENT '资源类型：menu,button,',
  `url` varchar(128) DEFAULT NULL COMMENT '访问url地址',
  `percode` varchar(128) DEFAULT NULL COMMENT '权限代码字符串',
  `parentid` bigint(20) DEFAULT NULL COMMENT '父结点id',
  `parentids` varchar(128) DEFAULT NULL COMMENT '父结点id列表串',
  `sortstring` varchar(128) DEFAULT NULL COMMENT '排序号',
  `available` char(1) DEFAULT NULL COMMENT '是否可用,1：可用，0不可用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_permission`
--

LOCK TABLES `sys_permission` WRITE;
/*!40000 ALTER TABLE `sys_permission` DISABLE KEYS */;
INSERT INTO `sys_permission` VALUES (1,'权限','permission','','order:edit',0,'0/','0','1'),(10,'订单管理','menu','',NULL,1,'0/1/','1.','1'),(11,'订单新增','permission','order/add_judge','order:add',11,'0/1/11/','','1'),(12,'订单修改','permission','order/edit_judge','order:edit',11,'0/1/11/','','1'),(13,'订单删除','permission','order/delete_judge','order:delete',11,'0/1/11/','','1'),(20,'客户管理','menu','','',1,'0/1/','2.','1'),(21,'客户新增','permission','','custom:add',21,'0/1/21/','','1'),(22,'客户修改','permission','','custom:edit',21,'0/1/21/','','1'),(23,'客户删除','permission','','custom:delete',21,'0/1/21/','','1'),(30,'产品管理','menu',NULL,NULL,NULL,NULL,NULL,'1'),(31,'产品新增','permission',NULL,'product:add',NULL,NULL,NULL,'1'),(32,'产品修改','permission',NULL,'product:edit',NULL,NULL,NULL,'1'),(33,'产品删除','permission',NULL,'product:delete',NULL,NULL,NULL,'1'),(40,'部门管理','menu',NULL,NULL,NULL,NULL,NULL,'1'),(41,'部门新增','permission',NULL,'department:add',NULL,NULL,NULL,'1'),(42,'部门修改','permission',NULL,'department:edit',NULL,NULL,NULL,'1'),(43,'部门删除','permission',NULL,'department:delete',NULL,NULL,NULL,'1'),(50,'员工管理','menu',NULL,NULL,NULL,NULL,NULL,NULL),(51,'员工新增','permission',NULL,'employee:add',NULL,NULL,NULL,NULL),(52,'员工修改','permission',NULL,'employee:edit',NULL,NULL,NULL,NULL),(53,'员工删除','permission',NULL,'employee:delete',NULL,NULL,NULL,NULL),(60,'作业管理','menu',NULL,NULL,NULL,NULL,NULL,NULL),(61,'作业新增','permission',NULL,'work:add',NULL,NULL,NULL,NULL),(62,'作业修改','permission',NULL,'work:edit',NULL,NULL,NULL,NULL),(63,'作业删除','permission',NULL,'work:delete',NULL,NULL,NULL,NULL),(70,'生产计划管理','menu',NULL,NULL,NULL,NULL,NULL,NULL),(71,'生产计划新增','permission',NULL,'manufacture:add',NULL,NULL,NULL,NULL),(72,'生产计划修改','permission',NULL,'manufacture:edit',NULL,NULL,NULL,NULL),(73,'生产计划删除','permission',NULL,'manufacture:delete',NULL,NULL,NULL,NULL),(80,'生产派工管理','menu',NULL,NULL,NULL,NULL,NULL,NULL),(81,'生产派工新增','permission',NULL,'task:add',NULL,NULL,NULL,NULL),(82,'生产派工修改','permission',NULL,'task:edit',NULL,NULL,NULL,NULL),(83,'生产派工删除','permission',NULL,'task:delete',NULL,NULL,NULL,NULL),(90,'工艺管理','menu',NULL,'',NULL,NULL,NULL,NULL),(91,'工艺新增','permission',NULL,'technology:add',NULL,NULL,NULL,NULL),(92,'工艺修改','permission',NULL,'technology:edit',NULL,NULL,NULL,NULL),(93,'工艺删除','permission',NULL,'technology:delete',NULL,NULL,NULL,NULL),(100,'财务管理','menu',NULL,NULL,NULL,NULL,NULL,NULL),(101,'工序新增','permission',NULL,'process:add',NULL,NULL,NULL,NULL),(102,'工序修改','permission',NULL,'process:edit',NULL,NULL,NULL,NULL),(103,'工序删除','permission',NULL,'process:delete',NULL,NULL,NULL,NULL),(110,'工艺计划管理','menu',NULL,NULL,NULL,NULL,NULL,NULL),(111,'工艺计划新增','permission',NULL,'technologyPlan:add',NULL,NULL,NULL,NULL),(112,'工艺计划修改','permission',NULL,'technologyPlan:edit',NULL,NULL,NULL,NULL),(113,'工艺计划删除','permission',NULL,'technologyPlan:delete',NULL,NULL,NULL,NULL),(120,'工艺要求管理','menu',NULL,NULL,NULL,NULL,NULL,NULL),(121,'工艺要求新增','permission',NULL,'technologyRequirement:add',NULL,NULL,NULL,NULL),(122,'工艺要求修改','permission',NULL,'technologyRequirement:edit',NULL,NULL,NULL,NULL),(123,'工艺要求删除','permission',NULL,'technologyRequirement:delete',NULL,NULL,NULL,NULL),(130,'成品计数质检','menu',NULL,NULL,NULL,NULL,NULL,NULL),(131,'成品计数质检新增','permission',NULL,'fCountCheck:add',NULL,NULL,NULL,NULL),(132,'成品计数质检修改','permission',NULL,'fCountCheck:edit',NULL,NULL,NULL,NULL),(133,'成品计数质检删除','permission',NULL,'fCountCheck:delete',NULL,NULL,NULL,NULL),(140,'成品计量质检','menu',NULL,NULL,NULL,NULL,NULL,NULL),(141,'成品计量质检新增','permission',NULL,'fMeasureCheck:add',NULL,NULL,NULL,NULL),(142,'成品计量质检修改','permission',NULL,'fMeasureCheck:edit',NULL,NULL,NULL,NULL),(143,'成品计量质检删除','permission',NULL,'fMeasureCheck:delete',NULL,NULL,NULL,NULL),(150,'工序计数质检','menu',NULL,NULL,NULL,NULL,NULL,NULL),(151,'工序计数质检新增','permission',NULL,'pCountCheck:add',NULL,NULL,NULL,NULL),(152,'工序计数质检修改','permission',NULL,'pCountCheck:edit',NULL,NULL,NULL,NULL),(153,'工序计数质检删除','permission',NULL,'pCountCheck:delete',NULL,NULL,NULL,NULL),(160,'工序计量质检','menu',NULL,NULL,NULL,NULL,NULL,NULL),(161,'工序计量质检新增','permission',NULL,'pMeasureCheck:add',NULL,NULL,NULL,NULL),(162,'工序计量质检修改','permission',NULL,'pMeasureCheck:edit',NULL,NULL,NULL,NULL),(163,'工序计量质检删除','permission',NULL,'pMeasureCheck:delete',NULL,NULL,NULL,NULL),(170,'不合格品申请','menu',NULL,NULL,NULL,NULL,NULL,NULL),(171,'不合格品申请新增','permission',NULL,'unqualify:add',NULL,NULL,NULL,NULL),(172,'不合格品申请修改','permission',NULL,'unqualify:edit',NULL,NULL,NULL,NULL),(173,'不合格品申请删除','permission',NULL,'unqualify:delete',NULL,NULL,NULL,NULL),(180,'物料管理','menu',NULL,NULL,NULL,NULL,NULL,NULL),(181,'物料新增','permission',NULL,'material:add',NULL,NULL,NULL,NULL),(182,'物料修改','permission',NULL,'material:edit',NULL,NULL,NULL,NULL),(183,'物料删除','permission',NULL,'material:delete',NULL,NULL,NULL,NULL),(190,'物料收入','menu',NULL,NULL,NULL,NULL,NULL,NULL),(191,'物料收入新增','permission',NULL,'materialReceive:add',NULL,NULL,NULL,NULL),(192,'物料收入修改','permission',NULL,'materialReceive:edit',NULL,NULL,NULL,NULL),(193,'物料收入删除','permission',NULL,'materialReceive:delete',NULL,NULL,NULL,NULL),(200,'用户管理','menu',NULL,NULL,NULL,NULL,NULL,NULL),(201,'用户新增','permission',NULL,'user:add',NULL,NULL,NULL,NULL),(202,'用户修改','permission',NULL,'user:edit',NULL,NULL,NULL,NULL),(203,'用户删除','permission',NULL,'user:delete',NULL,NULL,NULL,NULL),(210,'角色管理','menu',NULL,NULL,NULL,NULL,NULL,NULL),(211,'角色新增','permission',NULL,'role:add',NULL,NULL,NULL,NULL),(212,'角色修改','permission',NULL,'role:edit',NULL,NULL,NULL,NULL),(213,'角色删除','permission',NULL,'role:delete',NULL,NULL,NULL,NULL),(220,'物料消耗','menu',NULL,NULL,NULL,NULL,NULL,NULL),(221,'物料消耗新增','permission',NULL,'materialConsume:add',NULL,NULL,NULL,NULL),(222,'物料消耗修改','permission',NULL,'materialConsume:edit',NULL,NULL,NULL,NULL),(223,'物料消耗删除','permission',NULL,'materialConsume:delete',NULL,NULL,NULL,NULL),(230,'设备管理','menu',NULL,NULL,NULL,NULL,NULL,NULL),(231,'设备新增','permission',NULL,'device:add',NULL,NULL,NULL,NULL),(232,'设备修改','permission',NULL,'device:edit',NULL,NULL,NULL,NULL),(233,'设备删除','permission',NULL,'device:delete',NULL,NULL,NULL,NULL),(240,'设备例检管理','menu',NULL,NULL,NULL,NULL,NULL,NULL),(241,'设备例检新增','permission',NULL,'deviceCheck:add',NULL,NULL,NULL,NULL),(242,'设备例检修改','permission',NULL,'deviceCheck:edit',NULL,NULL,NULL,NULL),(243,'设备例检删除','permission',NULL,'deviceCheck:delete',NULL,NULL,NULL,NULL),(250,'设备故障管理','menu',NULL,NULL,NULL,NULL,NULL,NULL),(251,'设备故障新增','permission',NULL,'deviceFault:add',NULL,NULL,NULL,NULL),(252,'设备故障修改','permission',NULL,'deviceFault:edit',NULL,NULL,NULL,NULL),(253,'设备故障删除','permission',NULL,'deviceFault:delete',NULL,NULL,NULL,NULL),(260,'设备维修管理','menu',NULL,NULL,NULL,NULL,NULL,NULL),(261,'设备维修新增','permission',NULL,'deviceMaintain:add',NULL,NULL,NULL,NULL),(262,'设备维修修改','permission',NULL,'deviceMaintain:edit',NULL,NULL,NULL,NULL),(263,'设备维修删除','permission',NULL,'deviceMaintain:delete',NULL,NULL,NULL,NULL),(270,'设备种类管理','menu',NULL,NULL,NULL,NULL,NULL,NULL),(271,'设备种类新增','permission',NULL,'deviceType:add',NULL,NULL,NULL,NULL),(272,'设备种类修改','permission',NULL,'deviceType:edit',NULL,NULL,NULL,NULL),(273,'设备种类删除','permission',NULL,'deviceType:delete',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `sys_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role`
--

DROP TABLE IF EXISTS `sys_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_role` (
  `role_id` varchar(36) NOT NULL,
  `role_name` varchar(128) NOT NULL,
  `available` char(1) DEFAULT NULL COMMENT '是否可用,1：可用，0不可用',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role`
--

LOCK TABLES `sys_role` WRITE;
/*!40000 ALTER TABLE `sys_role` DISABLE KEYS */;
INSERT INTO `sys_role` VALUES ('001','超级管理员','1'),('002','订单管理员','1'),('005','普通用户','1');
/*!40000 ALTER TABLE `sys_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role_permission`
--

DROP TABLE IF EXISTS `sys_role_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_role_permission` (
  `id` varchar(50) NOT NULL,
  `sys_role_id` varchar(50) NOT NULL COMMENT '角色id',
  `sys_permission_id` varchar(300) DEFAULT NULL COMMENT '权限id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role_permission`
--

LOCK TABLES `sys_role_permission` WRITE;
/*!40000 ALTER TABLE `sys_role_permission` DISABLE KEYS */;
INSERT INTO `sys_role_permission` VALUES ('1456115611515','002','11,12,13,'),('147729449886163','15615615151','11,12,13,231,232,233,271,273,'),('147737863632731','005','11,'),('148007157091762','004','181,182,183,191,192,193,221,222,223,'),('148255367614063','007',NULL),('149122370655248','31931',NULL),('149122382565714','424',NULL),('149122469890916','3213',NULL),('149122510431476','3214321',NULL),('149122513769244','213213213','11,12,13,'),('ebc8a441-c6f9-11e4-b137-0adc305c3f21','001','11,12,13,21,22,23,31,32,33,61,62,63,71,72,73,81,82,83,91,92,93,101,102,103,111,112,113,121,122,123,181,182,183,191,192,193,221,222,223,131,132,133,141,142,143,151,152,153,161,162,163,171,172,173,231,232,233,271,272,273,241,242,243,251,252,253,261,262,263,41,42,43,51,52,53,201,202,203,211,212,213,');
/*!40000 ALTER TABLE `sys_role_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user`
--

DROP TABLE IF EXISTS `sys_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_user` (
  `id` varchar(36) NOT NULL COMMENT '主键',
  `username` varchar(64) DEFAULT NULL COMMENT '姓名',
  `password` varchar(32) DEFAULT NULL COMMENT '密码',
  `locked` char(1) DEFAULT NULL COMMENT '账号是否锁定，1：锁定，0未锁定',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user`
--

LOCK TABLES `sys_user` WRITE;
/*!40000 ALTER TABLE `sys_user` DISABLE KEYS */;
INSERT INTO `sys_user` VALUES ('001','王经理','11','1'),('002','22','22','1'),('003','张三','aaa','1'),('004','aa','aa','1'),('005','11','11','1'),('006','王二','12345','2'),('007','李大山','11','1'),('3213','ga','22','1'),('321321','55','55','1');
/*!40000 ALTER TABLE `sys_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user_role`
--

DROP TABLE IF EXISTS `sys_user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_user_role` (
  `id` varchar(36) NOT NULL,
  `sys_user_id` varchar(32) NOT NULL,
  `sys_role_id` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_role`
--

LOCK TABLES `sys_user_role` WRITE;
/*!40000 ALTER TABLE `sys_user_role` DISABLE KEYS */;
INSERT INTO `sys_user_role` VALUES ('001','001','001'),('147705484492576','003','002'),('148228593447685','004','005'),('148232608456017','002','001'),('148232650257115','005','002'),('148237251058254','321321','004'),('148237503507696','3213','005'),('148249856407793','006','002'),('148255363744945','007','004');
/*!40000 ALTER TABLE `sys_user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task`
--

DROP TABLE IF EXISTS `task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task` (
  `task_id` varchar(40) NOT NULL,
  `manufacture_sn` varchar(40) DEFAULT NULL,
  `work_id` varchar(40) DEFAULT NULL,
  `task_quantity` int(11) DEFAULT NULL,
  `working_hours` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`task_id`),
  KEY `FK_Reference_34` (`manufacture_sn`),
  KEY `FK_Reference_6` (`work_id`),
  CONSTRAINT `FK_Reference_34` FOREIGN KEY (`manufacture_sn`) REFERENCES `manufacture` (`manufacture_sn`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_Reference_6` FOREIGN KEY (`work_id`) REFERENCES `work` (`work_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task`
--

LOCK TABLES `task` WRITE;
/*!40000 ALTER TABLE `task` DISABLE KEYS */;
INSERT INTO `task` VALUES ('001','0002','001',112,700),('002','0001','001',213,221),('003','0003','003',150,15),('004','0004','004',154,851);
/*!40000 ALTER TABLE `task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `technology`
--

DROP TABLE IF EXISTS `technology`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `technology` (
  `technology_id` varchar(40) NOT NULL,
  `technology_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `vital_process_period` varchar(50) DEFAULT NULL,
  `standard_capacity` int(11) DEFAULT NULL,
  `overtime_standard_capacity` int(11) DEFAULT NULL,
  `overtime_overfulfil_capacity` int(11) DEFAULT NULL,
  `double_capacity` int(11) DEFAULT NULL,
  `overfulfil_capacity` int(11) DEFAULT NULL,
  PRIMARY KEY (`technology_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `technology`
--

LOCK TABLES `technology` WRITE;
/*!40000 ALTER TABLE `technology` DISABLE KEYS */;
INSERT INTO `technology` VALUES ('001','打磨精加工',33.00,'12',333,333,666,1200,1400),('002','打磨粗加工',8.00,'3',20,25,30,40,50),('004','抛光',156.00,'1',8,2,5,5,5),('005','打蜡',7.00,'7',7,7,7,7,7),('006','一体成型',6.00,'6',6,6,6,66,666);
/*!40000 ALTER TABLE `technology` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `technology_plan`
--

DROP TABLE IF EXISTS `technology_plan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `technology_plan` (
  `technology_plan_id` varchar(40) NOT NULL,
  `technology_id` varchar(40) DEFAULT NULL,
  `batch_amount` int(11) DEFAULT NULL,
  `start_plan` datetime DEFAULT NULL,
  `end_plan` datetime DEFAULT NULL,
  `commit_plan` datetime DEFAULT NULL,
  `technology_plan_start` datetime DEFAULT NULL,
  `technology_plan_end` datetime DEFAULT NULL,
  PRIMARY KEY (`technology_plan_id`),
  KEY `FK_Reference_31` (`technology_id`),
  CONSTRAINT `FK_Reference_31` FOREIGN KEY (`technology_id`) REFERENCES `technology` (`technology_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `technology_plan`
--

LOCK TABLES `technology_plan` WRITE;
/*!40000 ALTER TABLE `technology_plan` DISABLE KEYS */;
INSERT INTO `technology_plan` VALUES ('0008','002',30,'2016-12-29 00:00:00','2016-12-24 00:00:00','2017-01-10 00:00:00',NULL,NULL),('001','002',202,'2016-11-16 11:29:11','2016-11-16 11:29:14','2016-11-16 11:29:16',NULL,NULL),('002','001',56,'1970-01-01 08:00:00','1970-01-01 08:00:00','1970-01-01 08:00:00',NULL,NULL),('003','002',30,'2016-11-16 20:51:09','2016-11-16 20:51:11','2016-11-16 20:51:13',NULL,NULL),('004','004',321,'2016-12-21 00:00:00','2016-12-21 00:00:00','2016-12-21 00:00:00',NULL,NULL);
/*!40000 ALTER TABLE `technology_plan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `technology_requirement`
--

DROP TABLE IF EXISTS `technology_requirement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `technology_requirement` (
  `technology_requirement_id` varchar(40) NOT NULL,
  `technology_id` varchar(40) DEFAULT NULL,
  `requirement` varchar(2000) DEFAULT NULL,
  `add_time` datetime DEFAULT NULL,
  `revise_time` datetime DEFAULT NULL,
  PRIMARY KEY (`technology_requirement_id`),
  KEY `FK_Reference_10` (`technology_id`),
  CONSTRAINT `FK_Reference_10` FOREIGN KEY (`technology_id`) REFERENCES `technology` (`technology_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `technology_requirement`
--

LOCK TABLES `technology_requirement` WRITE;
/*!40000 ALTER TABLE `technology_requirement` DISABLE KEYS */;
INSERT INTO `technology_requirement` VALUES ('01','001','<strong><em>dgfghfhgjf</em></strong>','2016-11-30 16:07:08','2016-11-30 16:07:10'),('02','002','hijklmn','2016-11-16 16:07:30','2016-11-16 16:07:34'),('03','005','1321231','2016-11-16 16:28:04','2016-11-16 16:28:06'),('04','002','<strong>fdsfdsfdsafdsfcvvvvvcvffffwudali</strong>','1970-01-01 08:00:00','1970-01-01 08:00:00'),('05','001','<strong>dsafsffdsfafvvvv</strong>','2016-11-16 19:51:50','2016-11-16 19:51:51'),('06','004','抛光需仔细，反射面要达到要求','2016-12-21 00:00:00','2016-12-21 00:00:00'),('07','002','321321321','2016-12-07 11:10:12','2016-12-22 11:10:15');
/*!40000 ALTER TABLE `technology_requirement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unqualify_apply`
--

DROP TABLE IF EXISTS `unqualify_apply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unqualify_apply` (
  `unqualify_apply_id` varchar(40) NOT NULL,
  `product_id` varchar(40) DEFAULT NULL,
  `unqualify_item` varchar(200) DEFAULT NULL,
  `unqualify_count` int(11) DEFAULT NULL,
  `assembly_date` datetime DEFAULT NULL,
  `emp_id` varchar(40) DEFAULT NULL,
  `apply_date` datetime DEFAULT NULL,
  `note` varchar(5000) DEFAULT NULL,
  PRIMARY KEY (`unqualify_apply_id`),
  KEY `FK_Reference_29` (`product_id`),
  CONSTRAINT `FK_Reference_29` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unqualify_apply`
--

LOCK TABLES `unqualify_apply` WRITE;
/*!40000 ALTER TABLE `unqualify_apply` DISABLE KEYS */;
INSERT INTO `unqualify_apply` VALUES ('0001','00001','成像质量',2,'2015-05-13 00:00:00','001','2015-05-13 00:00:00','需要返厂'),('0002','00005','平整度',5,'2015-05-13 00:00:00','002','2015-05-13 00:00:00','需要返厂'),('0003','00002','音量',15,'2016-12-21 00:00:00','002','2016-12-21 00:00:00','需要返厂'),('01231','00003','电池',50,'2016-12-21 00:00:00','003','2016-12-24 12:15:16','<span style=\"font-family:SimHei;font-size:16px;\">电池效率不达标，且电池耐久度不合格，<strong><span style=\"color:#E53333;\">存在一定的安全隐患</span></strong>。</span>');
/*!40000 ALTER TABLE `unqualify_apply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `work`
--

DROP TABLE IF EXISTS `work`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `work` (
  `work_id` varchar(40) NOT NULL,
  `process_number` varchar(40) DEFAULT NULL,
  `product_id` varchar(40) DEFAULT NULL,
  `process_id` varchar(40) DEFAULT NULL,
  `device_id` varchar(40) DEFAULT NULL,
  `rating` int(11) DEFAULT NULL,
  PRIMARY KEY (`work_id`),
  KEY `FK_Reference_12` (`process_id`),
  KEY `FK_Reference_17` (`device_id`),
  KEY `FK_Reference_7` (`product_id`),
  CONSTRAINT `FK_Reference_12` FOREIGN KEY (`process_id`) REFERENCES `process` (`process_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_Reference_17` FOREIGN KEY (`device_id`) REFERENCES `device` (`device_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_Reference_7` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `work`
--

LOCK TABLES `work` WRITE;
/*!40000 ALTER TABLE `work` DISABLE KEYS */;
INSERT INTO `work` VALUES ('001','1','00004','01','001',50),('002','5','00003','02','003',32),('003','1','00002','02','002',13),('004','2','00003','03','003',15),('005','3','00002','02','005',16);
/*!40000 ALTER TABLE `work` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-04-14 17:41:01
