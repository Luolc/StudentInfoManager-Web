-- MySQL dump 10.13  Distrib 5.7.12, for osx10.11 (x86_64)
--
-- Host: localhost    Database: course_database_1
-- ------------------------------------------------------
-- Server version	5.7.12

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
-- Table structure for table `学生`
--

DROP TABLE IF EXISTS `学生`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `学生` (
  `学号` varchar(15) NOT NULL,
  `姓名` varchar(45) NOT NULL,
  `性别` char(5) DEFAULT NULL,
  `年龄` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`学号`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `学生`
--

LOCK TABLES `学生` WRITE;
/*!40000 ALTER TABLE `学生` DISABLE KEYS */;
INSERT INTO `学生` VALUES ('1200015983','王同学','男',21),('1300012139','吴同学','女',20),('1500012843','张同学','男',18);
/*!40000 ALTER TABLE `学生` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `课程`
--

DROP TABLE IF EXISTS `课程`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `课程` (
  `课程号` char(15) NOT NULL,
  `课程名称` varchar(45) DEFAULT NULL,
  `任课老师` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`课程号`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `课程`
--

LOCK TABLES `课程` WRITE;
/*!40000 ALTER TABLE `课程` DISABLE KEYS */;
INSERT INTO `课程` VALUES ('00102888','几何群论','刘老师'),('00110040','微分拓扑','丁老师'),('00113470','有限域','刘老师');
/*!40000 ALTER TABLE `课程` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `选课`
--

DROP TABLE IF EXISTS `选课`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `选课` (
  `学号` varchar(15) NOT NULL,
  `课程号` char(15) NOT NULL,
  `成绩` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`学号`,`课程号`),
  KEY `课程号` (`课程号`),
  CONSTRAINT `选课_ibfk_1` FOREIGN KEY (`课程号`) REFERENCES `课程` (`课程号`),
  CONSTRAINT `选课_ibfk_2` FOREIGN KEY (`学号`) REFERENCES `学生` (`学号`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `选课`
--

LOCK TABLES `选课` WRITE;
/*!40000 ALTER TABLE `选课` DISABLE KEYS */;
INSERT INTO `选课` VALUES ('1200015983','00102888',65),('1200015983','00113470',60),('1300012139','00102888',95),('1300012139','00110040',92),('1500012843','00102888',85);
/*!40000 ALTER TABLE `选课` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-04-27 20:25:48
