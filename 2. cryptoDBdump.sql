-- MySQL dump 10.13  Distrib 8.0.25, for Win64 (x86_64)
--
-- Host: localhost    Database: cryptodb
-- ------------------------------------------------------
-- Server version	8.0.25

DROP SCHEMA IF EXISTS `cryptodb`;
CREATE SCHEMA `cryptodb`;
USE `cryptodb`;

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
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `idCategory` char(5) NOT NULL,
  `categoryName` varchar(45) NOT NULL,
  `description` varchar(200) DEFAULT NULL,
  `performance24h` float DEFAULT NULL,
  PRIMARY KEY (`idCategory`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES ('C1','Smart Contract Platform','All coins that support smart contracts',-9.3),('C2','Meme Tokens','All coins that have no reason of existence.',-13.2),('C3','Gaming','All coins which are related to gaming industry',-6.9),('C4','Sports','All coins which are related to sport industry',-11.5),('C5','Music','All coins which are related to music industry',-10.9),('C6','Solana Ecosystem','All coins that work within solana ecosystem',-12);
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `community`
--

DROP TABLE IF EXISTS `community`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `community` (
  `idCommunity` char(5) NOT NULL,
  `communityName` varchar(45) NOT NULL,
  `url` varchar(45) NOT NULL,
  `followers` int DEFAULT NULL,
  `cryptocurrency_code` char(5) NOT NULL,
  PRIMARY KEY (`idCommunity`,`cryptocurrency_code`),
  KEY `fk_Community_Cryptocurrency1_idx` (`cryptocurrency_code`),
  CONSTRAINT `fk_Community_Cryptocurrency1` FOREIGN KEY (`cryptocurrency_code`) REFERENCES `cryptocurrency` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `community`
--

LOCK TABLES `community` WRITE;
/*!40000 ALTER TABLE `community` DISABLE KEYS */;
INSERT INTO `community` VALUES ('CM1','Twitter','twitter.com/solana',1008721,'SOL'),('CM2','Reddit','reddit.com/r/solana',98681,'SOL'),('CM3','Twitter','twitter.com/bitcoin',5408721,'BTC'),('CM4','Github','github.com/bitcoin',2008721,'BTC'),('CM5','Twitter','twitter.com/ethereum',7208721,'ETH'),('CM6','Reddit','reddit.com/ethereum',208721,'ETH');
/*!40000 ALTER TABLE `community` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cryptocurrency`
--

DROP TABLE IF EXISTS `cryptocurrency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cryptocurrency` (
  `code` char(5) NOT NULL,
  `cryptoName` varchar(45) NOT NULL,
  `price` decimal(10,5) NOT NULL,
  `marketCap` float NOT NULL,
  `releasedDate` date DEFAULT NULL,
  `performance24h` float DEFAULT NULL,
  `webpage` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cryptocurrency`
--

LOCK TABLES `cryptocurrency` WRITE;
/*!40000 ALTER TABLE `cryptocurrency` DISABLE KEYS */;
INSERT INTO `cryptocurrency` VALUES ('ADA','Cardano',1.27000,40773300000,NULL,0.7,'cardano.org'),('AXS','Axie Infinity',96.69000,6558000000,NULL,-1,'axieinfinity.com'),('BTC','Bitcoin',54626.22000,1080800000000,'2009-01-00',-5.8,'bitcoin.org'),('DOGE','Dogecoin',0.20050,29872900000,'2013-12-00',-8.3,'dogecoin.com'),('ETH','Ethereum',4072.70000,509352000000,'2015-07-00',-6.9,'ethereum.org'),('SAND','The Sandbox',5.17000,4727170000,NULL,2.4,'discover.sandbox.game'),('SOL','Solana',187.65000,67255200000,'2020-03-00',-8.1,'solana.com'),('test','test',0.15000,64545,'2020-00-00',5.1,'test.org'),('XLM','Stellar',0.31470,7655770000,'2014-07-00',-6.9,'stellar.org');
/*!40000 ALTER TABLE `cryptocurrency` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `cryptocurrency_BEFORE_INSERT` BEFORE INSERT ON `cryptocurrency` FOR EACH ROW BEGIN
	IF (NEW.price < 0) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid Data';
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `cryptocurrency_BEFORE_UPDATE` BEFORE UPDATE ON `cryptocurrency` FOR EACH ROW BEGIN
	IF (NEW.price < 0) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid Data';
	END IF;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `cryptocurrency_has_category`
--

DROP TABLE IF EXISTS `cryptocurrency_has_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cryptocurrency_has_category` (
  `cryptocurrency_code` char(5) NOT NULL,
  `category_idCategory` char(5) NOT NULL,
  PRIMARY KEY (`cryptocurrency_code`,`category_idCategory`),
  KEY `fk_cryptocurrency_has_category_category1_idx` (`category_idCategory`),
  KEY `fk_cryptocurrency_has_category_cryptocurrency1_idx` (`cryptocurrency_code`),
  CONSTRAINT `fk_cryptocurrency_has_category_category1` FOREIGN KEY (`category_idCategory`) REFERENCES `category` (`idCategory`),
  CONSTRAINT `fk_cryptocurrency_has_category_cryptocurrency1` FOREIGN KEY (`cryptocurrency_code`) REFERENCES `cryptocurrency` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cryptocurrency_has_category`
--

LOCK TABLES `cryptocurrency_has_category` WRITE;
/*!40000 ALTER TABLE `cryptocurrency_has_category` DISABLE KEYS */;
INSERT INTO `cryptocurrency_has_category` VALUES ('SOL','C1'),('XLM','C1'),('DOGE','C2'),('AXS','C3'),('SAND','C3'),('SOL','C6');
/*!40000 ALTER TABLE `cryptocurrency_has_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cryptocurrency_has_tradingpage`
--

DROP TABLE IF EXISTS `cryptocurrency_has_tradingpage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cryptocurrency_has_tradingpage` (
  `cryptocurrency_code` char(5) NOT NULL,
  `tradingpage_idTradingPage` char(5) NOT NULL,
  PRIMARY KEY (`cryptocurrency_code`,`tradingpage_idTradingPage`),
  KEY `fk_cryptocurrency_has_tradingpage_tradingpage1_idx` (`tradingpage_idTradingPage`),
  KEY `fk_cryptocurrency_has_tradingpage_cryptocurrency1_idx` (`cryptocurrency_code`),
  CONSTRAINT `fk_cryptocurrency_has_tradingpage_cryptocurrency1` FOREIGN KEY (`cryptocurrency_code`) REFERENCES `cryptocurrency` (`code`),
  CONSTRAINT `fk_cryptocurrency_has_tradingpage_tradingpage1` FOREIGN KEY (`tradingpage_idTradingPage`) REFERENCES `tradingpage` (`idTradingPage`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cryptocurrency_has_tradingpage`
--

LOCK TABLES `cryptocurrency_has_tradingpage` WRITE;
/*!40000 ALTER TABLE `cryptocurrency_has_tradingpage` DISABLE KEYS */;
INSERT INTO `cryptocurrency_has_tradingpage` VALUES ('BTC','TD1'),('ETH','TD1'),('BTC','TD2'),('ETH','TD2');
/*!40000 ALTER TABLE `cryptocurrency_has_tradingpage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cryptocurrency_has_wallet`
--

DROP TABLE IF EXISTS `cryptocurrency_has_wallet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cryptocurrency_has_wallet` (
  `cryptocurrency_code` char(5) NOT NULL,
  `wallet_idWallet` char(5) NOT NULL,
  PRIMARY KEY (`cryptocurrency_code`,`wallet_idWallet`),
  KEY `fk_cryptocurrency_has_wallet_wallet1_idx` (`wallet_idWallet`),
  KEY `fk_cryptocurrency_has_wallet_cryptocurrency1_idx` (`cryptocurrency_code`),
  CONSTRAINT `fk_cryptocurrency_has_wallet_cryptocurrency1` FOREIGN KEY (`cryptocurrency_code`) REFERENCES `cryptocurrency` (`code`),
  CONSTRAINT `fk_cryptocurrency_has_wallet_wallet1` FOREIGN KEY (`wallet_idWallet`) REFERENCES `wallet` (`idWallet`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cryptocurrency_has_wallet`
--

LOCK TABLES `cryptocurrency_has_wallet` WRITE;
/*!40000 ALTER TABLE `cryptocurrency_has_wallet` DISABLE KEYS */;
INSERT INTO `cryptocurrency_has_wallet` VALUES ('BTC','W1'),('ETH','W1'),('SOL','W1'),('ETH','W2'),('ETH','W3'),('ETH','W4');
/*!40000 ALTER TABLE `cryptocurrency_has_wallet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favorites`
--

DROP TABLE IF EXISTS `favorites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `favorites` (
  `user_username` varchar(45) NOT NULL,
  `cryptocurrency_code` char(5) NOT NULL,
  PRIMARY KEY (`user_username`,`cryptocurrency_code`),
  KEY `fk_user_has_cryptocurrency_cryptocurrency1_idx` (`cryptocurrency_code`),
  KEY `fk_user_has_cryptocurrency_user1_idx` (`user_username`),
  CONSTRAINT `fk_user_has_cryptocurrency_cryptocurrency1` FOREIGN KEY (`cryptocurrency_code`) REFERENCES `cryptocurrency` (`code`),
  CONSTRAINT `fk_user_has_cryptocurrency_user1` FOREIGN KEY (`user_username`) REFERENCES `user` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favorites`
--

LOCK TABLES `favorites` WRITE;
/*!40000 ALTER TABLE `favorites` DISABLE KEYS */;
INSERT INTO `favorites` VALUES ('George19','BTC'),('John54','ETH');
/*!40000 ALTER TABLE `favorites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `founder`
--

DROP TABLE IF EXISTS `founder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `founder` (
  `founderName` varchar(45) NOT NULL,
  `cryptocurrency_code` char(5) NOT NULL,
  PRIMARY KEY (`cryptocurrency_code`,`founderName`),
  CONSTRAINT `fk_founder_cryptocurrency1` FOREIGN KEY (`cryptocurrency_code`) REFERENCES `cryptocurrency` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `founder`
--

LOCK TABLES `founder` WRITE;
/*!40000 ALTER TABLE `founder` DISABLE KEYS */;
INSERT INTO `founder` VALUES ('Satoshi Nakamoto','BTC'),('Billy Markus','DOGE'),('Jackson Palmer','DOGE'),('Vitalik Buterin','ETH'),('Anatoly Yakovenko','SOL');
/*!40000 ALTER TABLE `founder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project`
--

DROP TABLE IF EXISTS `project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `project` (
  `idProject` char(5) NOT NULL,
  `currentPhase` varchar(200) NOT NULL,
  `nextPhase` varchar(200) DEFAULT NULL,
  `dateNextPhase` date DEFAULT NULL,
  `cryptocurrency_code` char(5) NOT NULL,
  PRIMARY KEY (`idProject`),
  KEY `fk_project_cryptocurrency1_idx` (`cryptocurrency_code`),
  CONSTRAINT `fk_project_cryptocurrency1` FOREIGN KEY (`cryptocurrency_code`) REFERENCES `cryptocurrency` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project`
--

LOCK TABLES `project` WRITE;
/*!40000 ALTER TABLE `project` DISABLE KEYS */;
INSERT INTO `project` VALUES ('P1','Mainnet Beta','Full Mainnet Release','2021-08-00','BTC'),('P2','Proof of work','Proof of stake','2022-00-00','ETH'),('P3','Smart Contracts','Scaling',NULL,'ADA');
/*!40000 ALTER TABLE `project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `quantity_category`
--

DROP TABLE IF EXISTS `quantity_category`;
/*!50001 DROP VIEW IF EXISTS `quantity_category`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `quantity_category` AS SELECT 
 1 AS `categoryName`,
 1 AS `Quantity`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `trading_page_review`
--

DROP TABLE IF EXISTS `trading_page_review`;
/*!50001 DROP VIEW IF EXISTS `trading_page_review`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `trading_page_review` AS SELECT 
 1 AS `idTradingPage`,
 1 AS `pName`,
 1 AS `username`,
 1 AS `comment`,
 1 AS `rating`,
 1 AS `date_time`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `tradingpage`
--

DROP TABLE IF EXISTS `tradingpage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tradingpage` (
  `idTradingPage` char(5) NOT NULL,
  `pName` varchar(45) NOT NULL,
  `url` varchar(45) NOT NULL,
  `fees` float DEFAULT NULL,
  PRIMARY KEY (`idTradingPage`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tradingpage`
--

LOCK TABLES `tradingpage` WRITE;
/*!40000 ALTER TABLE `tradingpage` DISABLE KEYS */;
INSERT INTO `tradingpage` VALUES ('TD1','Coinbase','coinbase.com',0.5),('TD2','Binance','binance.com',0.1),('TD3','eToro','etoro.com',NULL);
/*!40000 ALTER TABLE `tradingpage` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tradingpage_BEFORE_INSERT` BEFORE INSERT ON `tradingpage` FOR EACH ROW BEGIN
	IF (NEW.fees < 0) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid Data';
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tradingpage_BEFORE_UPDATE` BEFORE UPDATE ON `tradingpage` FOR EACH ROW BEGIN
	IF (NEW.fees < 0) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid Data';
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('cryptogod','1234'),('George19','1234'),('jason93','1234'),('John54','1234');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_rate_tradingpage`
--

DROP TABLE IF EXISTS `user_rate_tradingpage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_rate_tradingpage` (
  `user_username` varchar(45) NOT NULL,
  `tradingpage_idTradingPage` char(5) NOT NULL,
  `rating` enum('1','2','3','4','5') DEFAULT NULL,
  `comment` varchar(45) DEFAULT NULL,
  `date_time` datetime NOT NULL,
  PRIMARY KEY (`user_username`,`tradingpage_idTradingPage`),
  KEY `fk_user_has_tradingpage_tradingpage1_idx` (`tradingpage_idTradingPage`),
  KEY `fk_user_has_tradingpage_user1_idx` (`user_username`),
  CONSTRAINT `fk_user_has_tradingpage_tradingpage1` FOREIGN KEY (`tradingpage_idTradingPage`) REFERENCES `tradingpage` (`idTradingPage`),
  CONSTRAINT `fk_user_has_tradingpage_user1` FOREIGN KEY (`user_username`) REFERENCES `user` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_rate_tradingpage`
--

LOCK TABLES `user_rate_tradingpage` WRITE;
/*!40000 ALTER TABLE `user_rate_tradingpage` DISABLE KEYS */;
INSERT INTO `user_rate_tradingpage` VALUES ('cryptogod','TD1','4','Good Site','2019-01-05 15:20:15'),('cryptogod','TD2','3','Its okay','2021-09-13 16:34:23'),('cryptogod','TD3','5','Excelent','2020-06-07 17:20:51'),('George19','TD2','5','Low fees','2020-04-15 17:35:25'),('jason93','TD1','1','badddd','2020-08-27 18:14:34'),('John54','TD3','3',NULL,'2019-06-03 10:20:42');
/*!40000 ALTER TABLE `user_rate_tradingpage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_rate_wallet`
--

DROP TABLE IF EXISTS `user_rate_wallet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_rate_wallet` (
  `User_username` varchar(45) NOT NULL,
  `Wallet_idWallet` char(5) NOT NULL,
  `comment` varchar(45) DEFAULT NULL,
  `rating` enum('1','2','3','4','5') DEFAULT NULL,
  `date_time` datetime DEFAULT NULL,
  PRIMARY KEY (`User_username`,`Wallet_idWallet`),
  KEY `fk_User_has_Wallet_Wallet1_idx` (`Wallet_idWallet`),
  KEY `fk_User_has_Wallet_User1_idx` (`User_username`),
  CONSTRAINT `fk_User_has_Wallet_User1` FOREIGN KEY (`User_username`) REFERENCES `user` (`username`),
  CONSTRAINT `fk_User_has_Wallet_Wallet1` FOREIGN KEY (`Wallet_idWallet`) REFERENCES `wallet` (`idWallet`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_rate_wallet`
--

LOCK TABLES `user_rate_wallet` WRITE;
/*!40000 ALTER TABLE `user_rate_wallet` DISABLE KEYS */;
INSERT INTO `user_rate_wallet` VALUES ('cryptogod','W1','Good wallet','4','0000-00-00 00:00:00'),('cryptogod','W2','Its okay','3','2020-06-07 17:20:51'),('cryptogod','W3','Excelent','5','2021-09-13 16:34:23'),('George19','W2','User Friendly\'','5','2020-04-15 11:33:54'),('jason93','W1','badddd','3','2020-04-15 17:35:25'),('john54','W1','best','5','2019-06-03 10:20:42'),('John54','W2',NULL,'3','2019-06-03 18:05:47'),('john54','W3','!!!!','5','2019-01-05 15:20:15');
/*!40000 ALTER TABLE `user_rate_wallet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wallet`
--

DROP TABLE IF EXISTS `wallet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wallet` (
  `idWallet` char(5) NOT NULL,
  `walletName` varchar(45) NOT NULL,
  `url` varchar(45) NOT NULL,
  PRIMARY KEY (`idWallet`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wallet`
--

LOCK TABLES `wallet` WRITE;
/*!40000 ALTER TABLE `wallet` DISABLE KEYS */;
INSERT INTO `wallet` VALUES ('W1','Ledger','ledger.com'),('W2','Metamask','metamask.io'),('W3','MyCrypto','mycrypto.com'),('W4','Coinbase','walle.coinbase.com');
/*!40000 ALTER TABLE `wallet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `wallet_review`
--

DROP TABLE IF EXISTS `wallet_review`;
/*!50001 DROP VIEW IF EXISTS `wallet_review`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `wallet_review` AS SELECT 
 1 AS `idWallet`,
 1 AS `walletName`,
 1 AS `username`,
 1 AS `comment`,
 1 AS `rating`,
 1 AS `date_time`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `quantity_category`
--

/*!50001 DROP VIEW IF EXISTS `quantity_category`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `quantity_category` AS select `category`.`categoryName` AS `categoryName`,count(0) AS `Quantity` from (`cryptocurrency_has_category` join `category` on((`cryptocurrency_has_category`.`category_idCategory` = `category`.`idCategory`))) group by `cryptocurrency_has_category`.`category_idCategory` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `trading_page_review`
--

/*!50001 DROP VIEW IF EXISTS `trading_page_review`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `trading_page_review` AS select `tradingpage`.`idTradingPage` AS `idTradingPage`,`tradingpage`.`pName` AS `pName`,`user`.`username` AS `username`,`user_rate_tradingpage`.`comment` AS `comment`,`user_rate_tradingpage`.`rating` AS `rating`,`user_rate_tradingpage`.`date_time` AS `date_time` from ((`user` join `user_rate_tradingpage` on((`user`.`username` = `user_rate_tradingpage`.`user_username`))) join `tradingpage` on((`tradingpage`.`idTradingPage` = `user_rate_tradingpage`.`tradingpage_idTradingPage`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `wallet_review`
--

/*!50001 DROP VIEW IF EXISTS `wallet_review`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `wallet_review` AS select `wallet`.`idWallet` AS `idWallet`,`wallet`.`walletName` AS `walletName`,`user`.`username` AS `username`,`user_rate_wallet`.`comment` AS `comment`,`user_rate_wallet`.`rating` AS `rating`,`user_rate_wallet`.`date_time` AS `date_time` from ((`user` join `user_rate_wallet` on((`user`.`username` = `user_rate_wallet`.`User_username`))) join `wallet` on((`wallet`.`idWallet` = `user_rate_wallet`.`Wallet_idWallet`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-12-20 16:22:05
