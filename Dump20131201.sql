CREATE DATABASE  IF NOT EXISTS `car_review_system` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `car_review_system`;
-- MySQL dump 10.13  Distrib 5.5.34, for debian-linux-gnu (i686)
--
-- Host: localhost    Database: car_review_system
-- ------------------------------------------------------
-- Server version	5.5.34-0ubuntu0.13.10.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Car`
--

DROP TABLE IF EXISTS `Car`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Car` (
  `manufacture` varchar(45) DEFAULT NULL,
  `model` varchar(45) NOT NULL DEFAULT '',
  `make` varchar(45) NOT NULL DEFAULT '',
  `year` year(4) NOT NULL DEFAULT '0000',
  PRIMARY KEY (`model`,`make`,`year`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Car`
--

INSERT INTO `Car` VALUES ('Audi AG','5000 Wagon','Audi',1988),('Chrysler Corporation','600','Dodge',1988),(NULL,'8-Series','BMW',1991),(NULL,'8-Series','BMW',1997),('Mitsubishi Motors','Colt','Dodge',1993),('Mitsubishi Motors','Colt','Mitsubishi',1995),(NULL,'Quattro','Audi',1991),('Audi AG','V8','Audi',1994),('General Motors','XLR','Cadillac',2009),(NULL,'Z3','BMW',1997);

--
-- Table structure for table `Car_has_Features`
--

DROP TABLE IF EXISTS `Car_has_Features`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Car_has_Features` (
  `model` varchar(45) NOT NULL DEFAULT '',
  `make` varchar(45) NOT NULL DEFAULT '',
  `year` year(4) NOT NULL DEFAULT '0000',
  `featureID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`model`,`make`,`year`,`featureID`),
  KEY `fk_Car_has_Feature_Feature1_idx` (`featureID`),
  KEY `fk_Car_has_Feature_Car_idx` (`model`,`make`,`year`),
  CONSTRAINT `fk_Car_has_Feature_Car` FOREIGN KEY (`model`, `make`, `year`) REFERENCES `Car` (`model`, `make`, `year`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Car_has_Feature_Feature1` FOREIGN KEY (`featureID`) REFERENCES `Feature` (`featureID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Car_has_Features`
--

INSERT INTO `Car_has_Features` VALUES ('Colt','Dodge',1993,1),('Z3','BMW',1997,1),('8-Series','BMW',1991,2),('Z3','BMW',1997,2),('XLR','Cadillac',2009,3),('Z3','BMW',1997,3),('XLR','Cadillac',2009,4),('Colt','Dodge',1993,5),('8-Series','BMW',1991,6),('XLR','Cadillac',2009,7),('XLR','Cadillac',2009,8),('8-Series','BMW',1991,9),('Colt','Dodge',1993,10);

--
-- Table structure for table `Car_has_Reviews`
--

DROP TABLE IF EXISTS `Car_has_Reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Car_has_Reviews` (
  `model` varchar(45) NOT NULL DEFAULT '',
  `make` varchar(45) NOT NULL DEFAULT '',
  `year` year(4) NOT NULL DEFAULT '0000',
  `reviewID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`model`,`make`,`year`,`reviewID`),
  UNIQUE KEY `Review_reviewID_UNIQUE` (`reviewID`),
  KEY `fk_Car_has_Review_Review1_idx` (`reviewID`),
  KEY `fk_Car_has_Review_Car1_idx` (`model`,`make`,`year`),
  CONSTRAINT `fk_Car_has_Review_Review1` FOREIGN KEY (`reviewID`) REFERENCES `Review` (`reviewID`) ON DELETE CASCADE,
  CONSTRAINT `fk_Car_has_Review_Car1` FOREIGN KEY (`model`, `make`, `year`) REFERENCES `Car` (`model`, `make`, `year`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Car_has_Reviews`
--

INSERT INTO `Car_has_Reviews` VALUES ('5000 Wagon','Audi',1988,1),('5000 Wagon','Audi',1988,2),('5000 Wagon','Audi',1988,3),('5000 Wagon','Audi',1988,4),('600','Dodge',1988,5),('600','Dodge',1988,6),('600','Dodge',1988,7),('600','Dodge',1988,8),('600','Dodge',1988,9),('600','Dodge',1988,10),('Z3','BMW',1997,20);

--
-- Table structure for table `Feature`
--

DROP TABLE IF EXISTS `Feature`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Feature` (
  `featureID` int(11) NOT NULL AUTO_INCREMENT,
  `featureName` varchar(45) NOT NULL,
  `featureDescription` varchar(500) NOT NULL,
  PRIMARY KEY (`featureID`),
  UNIQUE KEY `featureName_UNIQUE` (`featureName`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Feature`
--

INSERT INTO `Feature` VALUES (1,'Price','The price of the car.'),(2,'Comfort','The Comfort & Convenience of the car.'),(3,'Engine','The Standard Engine of the car.'),(4,'Transmission','The Transmissions(Gears)[Auto/Manual] of the car.'),(5,'Economy','The Fuel Economy(mpg)[City/Highway] of the car.'),(6,'Suspension','The suspension in the car.'),(7,'Entertainment','The Entertainment (Stereo / Navigation system) in the car.'),(8,'Safety','Airbags, Brakes & Stability control in the car.'),(9,'Colors','The various colors the car is available in.'),(10,'Wheels','Car\'s wheels.');

--
-- Table structure for table `Member`
--

DROP TABLE IF EXISTS `Member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Member` (
  `username` varchar(45) NOT NULL DEFAULT '',
  `email` varchar(45) NOT NULL,
  `age` smallint(6) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `state` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`username`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Member`
--

INSERT INTO `Member` VALUES ('asad','asad@wayne.edu',25,'Detoit','5','2013-11-01'),('bill','gates@microsoft.com',43,'San Jose','10','2013-11-01'),('chris','chris@outlook.com',78,'Male',NULL,NULL),('clifford','cliff@hotmail.com',NULL,NULL,NULL,NULL),('David','david@yahoo.com',32,'Chicago','6','2013-11-01'),('Donald','donald@outlook.com',43,'San Jose','7','2013-11-01'),('jobs','steve@apple.com',43,'San Jose','9','2013-11-01'),('mir','ikram@wayne.edu',23,'San Franci','2','2013-09-02'),('mitchel','mitchel@asdf.com',31,'Detroit','4','2013-09-02'),('narendra','naren@wayne.edu',43,'San Jose','8','2013-11-01'),('sohrab','sohrab@gmail.com',22,'Chicago','3','2013-09-02'),('sunil','sunil@wayne.edu',23,'Detroit','1','2013-09-02');

--
-- Table structure for table `Member_gives_rating_to_Review`
--

DROP TABLE IF EXISTS `Member_gives_rating_to_Review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Member_gives_rating_to_Review` (
  `username` varchar(45) NOT NULL DEFAULT '',
  `reviewID` int(11) NOT NULL DEFAULT '0',
  `rating` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`username`,`reviewID`),
  KEY `fk_Member_has_Review_Review1_idx` (`reviewID`),
  KEY `fk_Member_has_Review_Member1_idx` (`username`),
  CONSTRAINT `fk_Member_has_Review_Review1` FOREIGN KEY (`reviewID`) REFERENCES `Review` (`reviewID`) ON DELETE CASCADE,
  CONSTRAINT `fk_Member_has_Review_Member1` FOREIGN KEY (`username`) REFERENCES `Member` (`username`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Member_gives_rating_to_Review`
--

INSERT INTO `Member_gives_rating_to_Review` VALUES ('asad',7,1),('asad',20,6),('bill',1,6),('bill',2,6),('bill',3,6),('chris',13,1),('clifford',12,1),('David',7,2),('Donald',7,2),('jobs',7,1),('mir',1,6),('mir',7,1),('mir',8,2),('mir',9,3),('mir',10,4),('sunil',2,2),('sunil',3,3),('sunil',4,4),('sunil',5,5),('sunil',6,1);
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `rating` BEFORE INSERT ON Member_gives_rating_to_Review FOR EACH ROW
-- Edit trigger body code below this line. Do not edit lines above this one
BEGIN
	IF NEW.rating < 0 OR NEW.rating > 6 THEN	-- Range of Rating
		SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = `Wrong value for rating. Should be between 0 and 6.`;
	END IF;
	IF EXISTS (SELECT username, reviewID	-- Deny self rating
				from Member_writes_Reviews
				where username=NEW.username and reviewID=NEW.reviewID) THEN
		SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = `Members cannot rate their own review`;
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `Member_writes_Reviews`
--

DROP TABLE IF EXISTS `Member_writes_Reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Member_writes_Reviews` (
  `username` varchar(45) NOT NULL DEFAULT '',
  `reviewID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`username`,`reviewID`),
  UNIQUE KEY `Review_reviewID_UNIQUE` (`reviewID`),
  KEY `fk_Member_has_Review_Review2_idx` (`reviewID`),
  KEY `fk_Member_has_Review_Member2_idx` (`username`),
  CONSTRAINT `fk_Member_has_Review_Review2` FOREIGN KEY (`reviewID`) REFERENCES `Review` (`reviewID`) ON DELETE CASCADE,
  CONSTRAINT `fk_Member_has_Review_Member2` FOREIGN KEY (`username`) REFERENCES `Member` (`username`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Member_writes_Reviews`
--

INSERT INTO `Member_writes_Reviews` VALUES ('sunil',1),('sohrab',2),('narendra',3),('mir',4),('mitchel',5),('jobs',6),('bill',7),('asad',8),('david',9),('donald',10),('chris',12),('clifford',13),('jobs',20);

--
-- Table structure for table `Review`
--

DROP TABLE IF EXISTS `Review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Review` (
  `reviewID` int(11) NOT NULL DEFAULT '0',
  `reviewDescription` varchar(500) DEFAULT NULL,
  `insert_time` datetime DEFAULT NULL,
  PRIMARY KEY (`reviewID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Review`
--

INSERT INTO `Review` VALUES (1,'Nice car','2013-11-01 03:12:00'),(2,'Stupid car','2013-10-02 03:12:15'),(3,'Useless','2012-12-01 03:12:24'),(4,'Duh','2013-12-01 03:12:41'),(5,'Awesome Car. Love it.','2013-12-01 03:11:44'),(6,'Love this car.','2013-12-01 02:13:47'),(7,'Waste car. Don\'t waste your money on it.','2013-10-01 03:12:57'),(8,'This car is great','2013-12-01 03:10:06'),(9,'This car sucks','2013-12-01 03:03:13'),(10,'Thumbs up','2013-12-01 02:57:18'),(11,'Good one. Go get it.','2013-12-01 03:46:40'),(12,'asdf','2013-12-01 15:16:55'),(13,'lkj','2013-12-01 15:17:12'),(20,'asdf','2013-12-01 17:57:37'),(50,'no commit','2013-12-01 18:15:58'),(51,'no commit','2013-12-01 18:16:50');

--
-- Table structure for table `Review_lists_Features`
--

DROP TABLE IF EXISTS `Review_lists_Features`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Review_lists_Features` (
  `reviewID` int(11) NOT NULL DEFAULT '0',
  `featureID` int(11) NOT NULL DEFAULT '0',
  `order_of_importance` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`reviewID`,`featureID`),
  KEY `fk_Review_has_Feature_Feature1_idx` (`featureID`),
  KEY `fk_Review_has_Feature_Review1_idx` (`reviewID`),
  CONSTRAINT `fk_Review_has_Feature_Review1` FOREIGN KEY (`reviewID`) REFERENCES `Review` (`reviewID`) ON DELETE CASCADE,
  CONSTRAINT `fk_Review_has_Feature_Feature1` FOREIGN KEY (`featureID`) REFERENCES `Feature` (`featureID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Review_lists_Features`
--

INSERT INTO `Review_lists_Features` VALUES (1,1,1),(1,2,2),(1,3,3),(1,4,4),(1,5,5),(2,2,1),(3,3,1),(4,4,1),(5,5,1),(6,5,2),(6,6,1),(7,7,1),(8,8,1),(9,9,1),(10,10,1),(20,1,2);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed
