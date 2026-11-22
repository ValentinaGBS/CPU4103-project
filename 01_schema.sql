-- MySQL dump 10.13  Distrib 8.0.46, for macos15 (arm64)
--
-- Host: 127.0.0.1    Database: valentina_assig_mod3
-- ------------------------------------------------------
-- Server version	8.0.46

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
-- Table structure for table `Appointment`
--

DROP TABLE IF EXISTS `Appointment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Appointment` (
  `appointment_ID` int NOT NULL AUTO_INCREMENT,
  `patient_ID` varchar(10) NOT NULL,
  `clinician_ID` int NOT NULL,
  `clinic_ID` int NOT NULL,
  `appointment_date` date NOT NULL,
  `appointment_time` time NOT NULL,
  `appointment_notes` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`appointment_ID`),
  KEY `FK_Appointment_Patient` (`patient_ID`),
  KEY `FK_Appointment_Clinician` (`clinician_ID`),
  KEY `FK_Appointment_Clinic` (`clinic_ID`),
  CONSTRAINT `FK_Appointment_Clinic` FOREIGN KEY (`clinic_ID`) REFERENCES `Clinic` (`clinic_ID`),
  CONSTRAINT `FK_Appointment_Clinician` FOREIGN KEY (`clinician_ID`) REFERENCES `Clinician` (`clinician_ID`),
  CONSTRAINT `FK_Appointment_Patient` FOREIGN KEY (`patient_ID`) REFERENCES `Patient` (`patient_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Appointment`
--

LOCK TABLES `Appointment` WRITE;
/*!40000 ALTER TABLE `Appointment` DISABLE KEYS */;
INSERT INTO `Appointment` VALUES (1,'OP001',1,1,'2026-10-05','09:00:00','Review IOP - updated'),(2,'OP002',2,1,'2026-10-05','09:30:00','OCT before review'),
(3,'OP003',1,1,'2026-10-06','11:00:00','Monitor'),(4,'OP004',3,3,'2026-10-07','14:00:00','Corneal topography'),
(5,'OP001',1,2,'2026-11-16','10:15:00','Visual field test'),(6,'OP005',4,4,'2026-11-18','09:00:00','Cataract assessment'),
(7,'OP006',5,6,'2026-11-19','10:00:00','Retinal examination'),(8,'OP007',6,7,'2026-11-20','11:00:00','Corneal review'),
(9,'OP008',7,8,'2026-11-21','14:00:00','Glaucoma follow-up'),(10,'OP009',8,9,'2026-11-23','15:00:00','Retinal screening');
/*!40000 ALTER TABLE `Appointment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Clinic`
--

DROP TABLE IF EXISTS `Clinic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Clinic` (
  `clinic_ID` int NOT NULL AUTO_INCREMENT,
  `clinic_name` varchar(50) NOT NULL,
  PRIMARY KEY (`clinic_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Clinic`
--

LOCK TABLES `Clinic` WRITE;
/*!40000 ALTER TABLE `Clinic` DISABLE KEYS */;
INSERT INTO `Clinic` VALUES (1,'City Road'),(2,'Bedford'),(3,'Croydon'),(4,'Milan'),(5,'Rome'),(6,'Bologna'),(7,'Florence'),
(8,'Turin'),(9,'Naples'),(10,'Venice');
/*!40000 ALTER TABLE `Clinic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Clinician`
--

DROP TABLE IF EXISTS `Clinician`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Clinician` (
  `clinician_ID` int NOT NULL AUTO_INCREMENT,
  `clinician_name` varchar(50) NOT NULL,
  `specialty_ID` int DEFAULT NULL,
  PRIMARY KEY (`clinician_ID`),
  KEY `FK_Clinician_Specialty` (`specialty_ID`),
  CONSTRAINT `FK_Clinician_Specialty` FOREIGN KEY (`specialty_ID`) REFERENCES `Specialty` (`specialty_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Clinician`
--

LOCK TABLES `Clinician` WRITE;
/*!40000 ALTER TABLE `Clinician` DISABLE KEYS */;
INSERT INTO `Clinician` VALUES (1,'Dr Maya Shah',1),(2,'Dr Leo Grant',2),(3,'Dr Priya Nair',3),(4,'Dr Emma Collins',1),(5,'Dr Oliver James',2),
(6,'Dr Sophie Clark',3),(7,'Dr Henry Walker',1),(8,'Dr Amelia Scott',2),(9,'Dr George Lewis',3),(10,'Dr Charlotte Evans',NULL);
/*!40000 ALTER TABLE `Clinician` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Diagnosis`
--

DROP TABLE IF EXISTS `Diagnosis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Diagnosis` (
  `diagnosis_ID` int NOT NULL AUTO_INCREMENT,
  `diagnosis_name` varchar(100) NOT NULL,
  `appointment_ID` int NOT NULL,
  PRIMARY KEY (`diagnosis_ID`),
  KEY `FK_Diagnosis_Appointment` (`appointment_ID`),
  CONSTRAINT `FK_Diagnosis_Appointment` FOREIGN KEY (`appointment_ID`) REFERENCES `Appointment` (`appointment_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Diagnosis`
--

LOCK TABLES `Diagnosis` WRITE;
/*!40000 ALTER TABLE `Diagnosis` DISABLE KEYS */;
INSERT INTO `Diagnosis` VALUES (1,'Ocular hypertension',1),(2,'Diabetic macular oedema',2),(3,'Glaucoma suspect',3),(4,'Keratoconus',4),
(5,'Ocular hypertension',5),(6,'Trigger test diagnosis',1),(7,'Cataract',6),(8,'Retinal vein occlusion',7),(9,'Corneal dystrophy',8),
(10,'Primary open-angle glaucoma',9);
/*!40000 ALTER TABLE `Diagnosis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Diagnosis_Audit`
--

DROP TABLE IF EXISTS `Diagnosis_Audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Diagnosis_Audit` (
  `audit_ID` int NOT NULL AUTO_INCREMENT,
  `diagnosis_ID` int DEFAULT NULL,
  `diagnosis_name` varchar(100) DEFAULT NULL,
  `appointment_ID` int DEFAULT NULL,
  `recorded_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`audit_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Diagnosis_Audit`
--

LOCK TABLES `Diagnosis_Audit` WRITE;
/*!40000 ALTER TABLE `Diagnosis_Audit` DISABLE KEYS */;
INSERT INTO `Diagnosis_Audit` VALUES (1,6,'Trigger test diagnosis',1,'2026-11-07 19:48:41'),(2,7,'Cataract',6,'2026-11-21 14:20:07'),
(3,8,'Retinal vein occlusion',7,'2026-11-21 14:20:07'),(4,9,'Corneal dystrophy',8,'2026-11-21 14:20:07'),
(5,10,'Primary open-angle glaucoma',9,'2026-11-21 14:20:07'),(6,11,'Temporary test diagnosis',10,'2026-11-21 15:57:10');
/*!40000 ALTER TABLE `Diagnosis_Audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FollowUpPlan`
--

DROP TABLE IF EXISTS `FollowUpPlan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FollowUpPlan` (
  `followup_ID` int NOT NULL AUTO_INCREMENT,
  `appointment_ID` int NOT NULL,
  `priority` varchar(20) NOT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'Pending',
  `notes` varchar(255) DEFAULT NULL,
  `followup_interval` varchar(50) NOT NULL,
  `followup_duedate` date NOT NULL,
  PRIMARY KEY (`followup_ID`),
  UNIQUE KEY `appointment_ID` (`appointment_ID`),
  CONSTRAINT `FK_FollowUpPlan_Appointment` FOREIGN KEY (`appointment_ID`) REFERENCES `Appointment` (`appointment_ID`),
  CONSTRAINT `chk_followup_priority` CHECK ((`priority` in (_utf8mb4'Routine',_utf8mb4'High',_utf8mb4'Urgent'))),
  CONSTRAINT `chk_followup_status` CHECK ((`status` in (_utf8mb4'Pending',_utf8mb4'Completed',_utf8mb4'Cancelled')))
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FollowUpPlan`
--

LOCK TABLES `FollowUpPlan` WRITE;
/*!40000 ALTER TABLE `FollowUpPlan` DISABLE KEYS */;
INSERT INTO `FollowUpPlan` VALUES (1,1,'High','Pending',NULL,'6 weeks','2026-11-16'),(2,2,'Urgent','Pending',NULL,'4 weeks','2026-11-02'),
(3,3,'Routine','Pending',NULL,'26 weeks','2027-04-06'),(4,4,'Routine','Pending',NULL,'8 weeks','2026-12-02'),
(5,5,'Routine','Pending',NULL,'12 weeks','2027-02-08'),(6,6,'High','Pending','Synthetic test record 1','4 weeks','2026-12-16'),
(7,7,'Routine','Pending','Synthetic test record 2','6 weeks','2026-12-31'),(8,8,'Urgent','Pending','Synthetic test record 3','2 weeks','2026-12-04'),
(9,9,'Routine','Pending','Synthetic test record 4','8 weeks','2027-01-16'),(10,10,'High','Pending','Synthetic test record 5','12 weeks','2027-02-15');
/*!40000 ALTER TABLE `FollowUpPlan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Medicine`
--

DROP TABLE IF EXISTS `Medicine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Medicine` (
  `medicine_ID` int NOT NULL AUTO_INCREMENT,
  `medicine_name` varchar(50) NOT NULL,
  PRIMARY KEY (`medicine_ID`),
  UNIQUE KEY `medicine_name` (`medicine_name`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Medicine`
--

LOCK TABLES `Medicine` WRITE;
/*!40000 ALTER TABLE `Medicine` DISABLE KEYS */;
INSERT INTO `Medicine` VALUES (3,'Aflibercept'),(5,'Brimonidine'),(10,'Cyclopentolate'),(6,'Dorzolamide'),(1,'Latanoprost'),
(9,'Moxifloxacin eye drops'),(8,'Prednisolone eye drops'),(4,'Sodium chloride drops'),(2,'Timolol'),(7,'Travoprost');
/*!40000 ALTER TABLE `Medicine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Patient`
--

DROP TABLE IF EXISTS `Patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Patient` (
  `patient_ID` varchar(10) NOT NULL,
  `patient_name` varchar(50) NOT NULL,
  `postcode` varchar(10) NOT NULL,
  PRIMARY KEY (`patient_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Patient`
--

LOCK TABLES `Patient` WRITE;
/*!40000 ALTER TABLE `Patient` DISABLE KEYS */;
INSERT INTO `Patient` VALUES ('OP001','Amina Yusuf','NE1 4AB'),('OP002','Daniel Reed','N16 7QP'),('OP003','Sofia Bennett','E8 2LD'),
('OP004','Michael Okoro','SE6 3RT'),('OP005','Emily Carter','M1 2AB'),('OP006','James Wilson','L1 8JQ'),('OP007','Olivia Martin','E1 6AN'),
('OP008','Thomas Brown','B1 1AA'),('OP009','Grace Taylor','LS1 4AP'),('OP010','William Harris','S1 2HE');
/*!40000 ALTER TABLE `Patient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Prescription`
--

DROP TABLE IF EXISTS `Prescription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Prescription` (
  `prescription_ID` int NOT NULL AUTO_INCREMENT,
  `appointment_ID` int NOT NULL,
  `prescription_date` date NOT NULL,
  PRIMARY KEY (`prescription_ID`),
  KEY `FK_Prescription_Appointment` (`appointment_ID`),
  CONSTRAINT `FK_Prescription_Appointment` FOREIGN KEY (`appointment_ID`) REFERENCES `Appointment` (`appointment_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=112 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Prescription`
--

LOCK TABLES `Prescription` WRITE;
/*!40000 ALTER TABLE `Prescription` DISABLE KEYS */;
INSERT INTO `Prescription` VALUES (1,1,'2026-10-05'),(2,2,'2026-10-05'),(3,4,'2026-10-07'),(4,5,'2026-11-16'),(5,6,'2026-11-18'),(6,6,'2026-11-18'),
(7,7,'2026-11-19'),(8,8,'2026-11-20'),(9,9,'2026-11-21'),(10,10,'2026-11-23');
/*!40000 ALTER TABLE `Prescription` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Prescription_Item`
--

DROP TABLE IF EXISTS `Prescription_Item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Prescription_Item` (
  `prescription_item_ID` int NOT NULL AUTO_INCREMENT,
  `prescription_ID` int NOT NULL,
  `medicine_ID` int NOT NULL,
  `dose` varchar(10) NOT NULL,
  `route` varchar(50) NOT NULL,
  `frequency` varchar(50) NOT NULL,
  `duration` varchar(30) NOT NULL,
  PRIMARY KEY (`prescription_item_ID`),
  KEY `FK_Prescription_Item_Prescription` (`prescription_ID`),
  KEY `FK_Prescription_Item_Medicine` (`medicine_ID`),
  CONSTRAINT `FK_Prescription_Item_Medicine` FOREIGN KEY (`medicine_ID`) REFERENCES `Medicine` (`medicine_ID`),
  CONSTRAINT `FK_Prescription_Item_Prescription` FOREIGN KEY (`prescription_ID`) REFERENCES `Prescription` (`prescription_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Prescription_Item`
--

LOCK TABLES `Prescription_Item` WRITE;
/*!40000 ALTER TABLE `Prescription_Item` DISABLE KEYS */;
INSERT INTO `Prescription_Item` VALUES (1,1,1,'1mg','Ophthalmic','Not stated','Not stated'),(2,1,2,'10mg','Ophthalmic','Not stated','Not stated'),
(3,2,3,'2mg','Intravitreal','Not stated','Not stated'),(4,3,4,'3mg','Ophthalmic','Not stated','Not stated'),(5,4,1,'4mg','Ophthalmic','Not stated','Not stated'),
(6,5,5,'Not stated','Ophthalmic','Not stated','Not stated'),(7,6,6,'Not stated','Ophthalmic','Not stated','Not stated'),
(8,7,7,'Not stated','Ophthalmic','Not stated','Not stated'),(9,8,8,'Not stated','Ophthalmic','Not stated','Not stated'),
(10,9,9,'Not stated','Ophthalmic','Not stated','Not stated');
/*!40000 ALTER TABLE `Prescription_Item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Specialty`
--

DROP TABLE IF EXISTS `Specialty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Specialty` (
  `specialty_ID` int NOT NULL AUTO_INCREMENT,
  `specialty_name` varchar(50) NOT NULL,
  PRIMARY KEY (`specialty_ID`),
  UNIQUE KEY `specialty_name` (`specialty_name`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Specialty`
--

LOCK TABLES `Specialty` WRITE;
/*!40000 ALTER TABLE `Specialty` DISABLE KEYS */;
INSERT INTO `Specialty` VALUES (4,'Cataract'),(3,'Cornea'),(1,'Glaucoma'),(10,'Low Vision'),(7,'Neuro-Ophthalmology'),(9,'Ocular Oncology'),
(5,'Oculoplastics'),(6,'Paediatric Ophthalmology'),(2,'Retina'),(8,'Uveitis');
/*!40000 ALTER TABLE `Specialty` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-11-22 12:13:05
