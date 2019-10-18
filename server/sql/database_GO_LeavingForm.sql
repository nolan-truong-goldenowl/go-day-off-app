-- MySQL dump 10.13  Distrib 8.0.13, for macos10.14 (x86_64)
--
-- Host: localhost    Database: leavingForm
-- ------------------------------------------------------
-- Server version	8.0.15

DROP DATABASE IF EXISTS `leavingForm`;
CREATE DATABASE `leavingForm` CHARACTER SET utf8 COLLATE utf8_unicode_ci;
USE `leavingForm`;

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `absenceTypes`
--

DROP TABLE IF EXISTS `absenceTypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `absenceTypes` (
  `fId` int(11) NOT NULL,
  `fAbsenceTypeName` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`fId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `absenceTypes`
--

LOCK TABLES `absenceTypes` WRITE;
/*!40000 ALTER TABLE `absenceTypes` DISABLE KEYS */;
INSERT INTO `absenceTypes` VALUES (1,'Việc riêng'),(2,'Nghỉ phép năm'),(3,'Nghỉ ốm'),(4,'Nghỉ chế độ');
/*!40000 ALTER TABLE `absenceTypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leaveLetters`
--

DROP TABLE IF EXISTS `leaveLetters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `leaveLetters` (
  `fId` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `fRdt` datetime NOT NULL,
  `fFromDT` datetime NOT NULL,
  `fToDT` datetime NOT NULL,
  `fAbsenceType` int(11) NOT NULL,
  `fSubstituteId` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `fUserId` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `users_fId` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `users_fId1` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `absenceTypes_fId` int(11) DEFAULT NULL,
  `approver_fId` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `fStatus` int(11) NOT NULL DEFAULT '1',
  `fReason` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `fApprover` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `fFromOpt` enum('allday','morning','afternoon') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'allday',
  `fToOpt` enum('allday','morning') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'allday',
  PRIMARY KEY (`fId`),
  UNIQUE KEY `fId_UNIQUE` (`fId`),
  KEY `fk_leaveLetters_absenceTypes_idx` (`absenceTypes_fId`) USING BTREE,
  KEY `fk_leaveLetters_users1_idx` (`users_fId1`) USING BTREE,
  KEY `fk_leaveLetters_users2` (`approver_fId`) USING BTREE,
  KEY `fk_leaveLetters_users_idx` (`users_fId`) USING BTREE,
  CONSTRAINT `fk_leaveLetters_absenceTypes` FOREIGN KEY (`absenceTypes_fId`) REFERENCES `absenceTypes` (`fId`),
  CONSTRAINT `fk_leaveLetters_users` FOREIGN KEY (`users_fId`) REFERENCES `users` (`fId`),
  CONSTRAINT `fk_leaveLetters_users1` FOREIGN KEY (`users_fId1`) REFERENCES `users` (`fId`),
  CONSTRAINT `fk_leaveLetters_users2` FOREIGN KEY (`approver_fId`) REFERENCES `users` (`fId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leaveLetters`
--

LOCK TABLES `leaveLetters` WRITE;
/*!40000 ALTER TABLE `leaveLetters` DISABLE KEYS */;
INSERT INTO `leaveLetters` VALUES ('mOpjmZ3ANs','2019-03-15 02:44:27','2019-03-10 16:29:56','2019-03-17 16:29:56',1,'i53FItHeMK','eKmuZqYzzm','eKmuZqYzzm','eKmuZqYzzm',1,'H8UIAdsy7T',2,NULL,'H8UIAdsy7T','allday','allday'),('NSX1R13Me3','2019-03-15 02:44:02','2019-03-10 16:29:56','2019-03-17 16:29:56',1,'i53FItHeMK','eKmuZqYzzm','eKmuZqYzzm','eKmuZqYzzm',1,'H8UIAdsy7T',2,NULL,'H8UIAdsy7T','allday','allday'),('QH7h4SQDXn','2019-03-15 02:44:31','2019-03-10 16:29:56','2019-03-17 16:29:56',1,'i53FItHeMK','eKmuZqYzzm','eKmuZqYzzm','eKmuZqYzzm',1,'H8UIAdsy7T',2,NULL,'H8UIAdsy7T','allday','allday'),('zaeiFTica8','2019-03-15 02:44:17','2019-03-10 16:29:56','2019-03-17 16:29:56',1,'i53FItHeMK','eKmuZqYzzm','eKmuZqYzzm','eKmuZqYzzm',1,'H8UIAdsy7T',2,NULL,'H8UIAdsy7T','allday','allday');
/*!40000 ALTER TABLE `leaveLetters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `positions`
--

DROP TABLE IF EXISTS `positions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `positions` (
  `fId` varchar(5) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `fPosName` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`fId`),
  UNIQUE KEY `fId_UNIQUE` (`fId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `positions`
--

LOCK TABLES `positions` WRITE;
/*!40000 ALTER TABLE `positions` DISABLE KEYS */;
INSERT INTO `positions` VALUES ('1qRly','Accountant'),('8mCqq','CTO'),('B4QIq','Tech Lead'),('cpvd7','Intern/Fresher'),('hGKx5','COO'),('ir0gE','Team Leader'),('JVh4R','Business Analyst (BA)'),('Kebva','Digital Marketer'),('mXLNt','Project Assistant (PA)'),('MYPyH','Software Tester'),('psS14','Human Resouces (HR)'),('s8l4h','Designer'),('Sz0d1','CEO'),('U4d4k','Software Engineer (SE)'),('wHK7p','Project Manager (PM)');
/*!40000 ALTER TABLE `positions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rejectedLetterDetail`
--

DROP TABLE IF EXISTS `rejectedLetterDetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `rejectedLetterDetail` (
  `fLetterId` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `fReason` varchar(250) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `fRejectType` int(11) NOT NULL,
  `leaveLetters_fId` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`fLetterId`),
  KEY `fk_rejectedLetterDetail_leaveLetters1_idx` (`leaveLetters_fId`) USING BTREE,
  CONSTRAINT `fk_rejectedLetterDetail_leaveLetters1` FOREIGN KEY (`leaveLetters_fId`) REFERENCES `leaveLetters` (`fId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rejectedLetterDetail`
--

LOCK TABLES `rejectedLetterDetail` WRITE;
/*!40000 ALTER TABLE `rejectedLetterDetail` DISABLE KEYS */;
INSERT INTO `rejectedLetterDetail` VALUES ('mLLrBQpcwZ','Đi ăn hỏi',0,NULL);
/*!40000 ALTER TABLE `rejectedLetterDetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `settings` (
  `fName` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fValue` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`fName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES ('email','golden_owl@gmail.com'),('maxDayOff','15'),('password','password');
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teams`
--

DROP TABLE IF EXISTS `teams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `teams` (
  `fId` varchar(5) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `fTeamName` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `fTeamLead` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `users_fId` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`fId`),
  UNIQUE KEY `fId_UNIQUE` (`fId`),
  KEY `fk_teams_users1_idx` (`users_fId`) USING BTREE,
  CONSTRAINT `fk_teams_users1` FOREIGN KEY (`users_fId`) REFERENCES `users` (`fId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teams`
--

LOCK TABLES `teams` WRITE;
/*!40000 ALTER TABLE `teams` DISABLE KEYS */;
INSERT INTO `teams` VALUES ('1LwZq','PHP','MNeCqLCc4y','MNeCqLCc4y'),('4TCgb','Ruby/Ruby on Rails','6kl9baxAUv','6kI9baxAUv'),('5eMvD','Design','pJa4TkFAz8','pJa4TkFAz8'),('A91fa','Khác','wYC0nl3LqV','wYC0nI3LqV'),('FfI2V','Javascript','Pq2UWS3gJm','Pq2UWS3gJm'),('G81cf','Leaders','wYC0nI3LqV','wYC0nI3LqV'),('Gg6sG','QA','Ucb07m5zgI','Ucb07m5zgI'),('kTW7B','PA','LzPq90f8bZ','LzPq90f8bZ');
/*!40000 ALTER TABLE `teams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userPermission`
--

DROP TABLE IF EXISTS `userPermission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `userPermission` (
  `fId` varchar(5) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `fUserType` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`fId`),
  UNIQUE KEY `fId_UNIQUE` (`fId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userPermission`
--

LOCK TABLES `userPermission` WRITE;
/*!40000 ALTER TABLE `userPermission` DISABLE KEYS */;
INSERT INTO `userPermission` VALUES ('3sVfP','Personnel'),('NH6Bs','HR');
/*!40000 ALTER TABLE `userPermission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userRefToken`
--

DROP TABLE IF EXISTS `userRefToken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `userRefToken` (
  `fUserId` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `fRefToken` varchar(80) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `fRdt` datetime NOT NULL,
  `users_fId` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`fUserId`),
  UNIQUE KEY `fUserId_UNIQUE` (`fUserId`),
  KEY `fk_userRefToken_users1_idx` (`users_fId`) USING BTREE,
  CONSTRAINT `fk_userRefToken_users1` FOREIGN KEY (`users_fId`) REFERENCES `users` (`fId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userRefToken`
--

LOCK TABLES `userRefToken` WRITE;
/*!40000 ALTER TABLE `userRefToken` DISABLE KEYS */;
INSERT INTO `userRefToken` VALUES ('H8UIAdsy7T','xK2Pww9chNnebSEEsQCLQzqqVu6h6kriXL7GX558ierXJKJYM8VKnd6G77ltBKYvgJSZ8BOoQ7LQYFxu','2019-03-19 08:20:34',NULL);
/*!40000 ALTER TABLE `userRefToken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `users` (
  `fId` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `fFirstName` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `fLastName` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `fPosition` varchar(5) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `fPhone` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `fTeamId` varchar(5) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `fTypeId` varchar(5) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `fEmail` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `fGender` int(11) NOT NULL DEFAULT '3',
  `fPassword` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `fUsername` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `positions_fId` varchar(5) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `userPermission_fId` varchar(5) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `teams_fId` varchar(5) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`fId`),
  UNIQUE KEY `fEmail` (`fEmail`),
  UNIQUE KEY `fId_UNIQUE` (`fId`),
  UNIQUE KEY `fUsername` (`fUsername`),
  KEY `fk_users_positions1_idx` (`positions_fId`) USING BTREE,
  KEY `fk_users_teams1_idx` (`teams_fId`) USING BTREE,
  KEY `fk_users_userPermission1_idx` (`userPermission_fId`) USING BTREE,
  CONSTRAINT `fk_users_positions1` FOREIGN KEY (`positions_fId`) REFERENCES `positions` (`fId`),
  CONSTRAINT `fk_users_teams1` FOREIGN KEY (`teams_fId`) REFERENCES `teams` (`fId`),
  CONSTRAINT `fk_users_userPermission1` FOREIGN KEY (`userPermission_fId`) REFERENCES `userPermission` (`fId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('5g3bqeTgu6','Nhan su','HR1','psS14','0123456789','A91fa','NH6Bs','nhansuHR1@go.com',2,'5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8','nhansu1','psS14','NH6Bs','A91fa'),('6kI9baxAUv','Truong nhom','Ruby','ir0gE','0123456789','4TCgb','3sVfP','rubyLead@go.com',2,'5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8','rubylead','ir0gE','3sVfP','4TCgb'),('eKmuZqYzzm','Nolan','Christopher','B4QIq','0123456789','A91fa','NH6Bs','abc@gojs.com',3,'5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8','hr1','B4QIq','3sVfP','A91fa'),('H8UIAdsy7T','Adena','Justin','mXLNt','0778329121','1LwZq','NH6Bs','nulla.Integer@Aliquam.net',3,'5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8','hr',NULL,NULL,NULL),('LzPq90f8bZ','Truong nhom','PA','ir0gE','0123456789','kTW7B','3sVfP','paLead@go.com',2,'5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8','palead','ir0gE','3sVfP','kTW7B'),('MNeCqLCc4y','Truong nhom','PHP','ir0gE','0123456789','1LwZq','3sVfP','phpLead@go.com',2,'5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8','phplead','ir0gE','3sVfP','1LwZq'),('pJa4TkFAz8','Truong nhom','Design','ir0gE','0123456789','5eMvD','3sVfP','designLead@go.com',2,'5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8','designlead','ir0gE','3sVfP','5eMvD'),('Pq2UWS3gJm','Truong nhom','Javascript','ir0gE','0123456789','FfI2V','3sVfP','jsLead@go.com',2,'5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8','jslead','ir0gE','3sVfP','FfI2V'),('rY5f9xkqZJ','Nhan su','HR2','psS14','0123456789','A91fa','NH6Bs','nhansuHR2@go.com',1,'5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8','nhansu2','psS14','NH6Bs','A91fa'),('Ucb07m5zgI','Truong nhom','QA','ir0gE','0123456789','Gg6sG','3sVfP','qaLead@go.com',2,'5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8','qalead','ir0gE','3sVfP','Gg6sG'),('wYC0nI3LqV','Giam doc','X','Sz0d1','0123456789','A91fa','NH6Bs','giamdoc@go.com',1,'5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8','giamdoc','Sz0d1','NH6Bs','A91fa');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-04-09 15:56:27