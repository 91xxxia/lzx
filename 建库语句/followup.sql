-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: localhost    Database: followup_db
-- ------------------------------------------------------
-- Server version	8.0.40

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
-- Table structure for table `drug_catalog`
--

DROP TABLE IF EXISTS `drug_catalog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `drug_catalog` (
  `drug_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `brand` varchar(100) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `is_steroid` tinyint(1) DEFAULT '0',
  `is_antihistamine` tinyint(1) DEFAULT '0',
  `is_ltra` tinyint(1) DEFAULT '0',
  `is_bronchodilator` tinyint(1) DEFAULT '0',
  `is_antibiotic` tinyint(1) DEFAULT '0',
  `is_topical` tinyint(1) DEFAULT '0',
  `is_nasal` tinyint(1) DEFAULT '0',
  `is_expectorant` tinyint(1) DEFAULT '0',
  `is_immunotherapy` tinyint(1) DEFAULT '0',
  `is_anti_IgE` tinyint(1) DEFAULT '0',
  `is_targeted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`drug_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `followup_adverse_reactions`
--

DROP TABLE IF EXISTS `followup_adverse_reactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `followup_adverse_reactions` (
  `reaction_id` int NOT NULL AUTO_INCREMENT,
  `patient_id` varchar(20) NOT NULL,
  `medication_name` varchar(100) DEFAULT NULL,
  `reaction_onset_date` date DEFAULT NULL,
  `usage_method` text,
  `duration_days` int DEFAULT NULL,
  `rash` tinyint(1) DEFAULT NULL,
  `itching` tinyint(1) DEFAULT NULL,
  `abdominal_pain` tinyint(1) DEFAULT NULL,
  `nausea` tinyint(1) DEFAULT NULL,
  `vomiting` tinyint(1) DEFAULT NULL,
  `chest_tightness` tinyint(1) DEFAULT NULL,
  `palpitations` tinyint(1) DEFAULT NULL,
  `dyspnea` tinyint(1) DEFAULT NULL,
  `other_reaction` text,
  `severity_level` enum('轻度','中度','重度') DEFAULT NULL,
  PRIMARY KEY (`reaction_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `followup_audiology_tests`
--

DROP TABLE IF EXISTS `followup_audiology_tests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `followup_audiology_tests` (
  `audio_id` int NOT NULL AUTO_INCREMENT,
  `followup_id` int NOT NULL,
  `test_name` varchar(100) DEFAULT NULL,
  `test_date` date DEFAULT NULL,
  `tympanometry` tinyint(1) DEFAULT NULL,
  `pure_tone_audiometry` tinyint(1) DEFAULT NULL,
  `result` text,
  PRIMARY KEY (`audio_id`),
  KEY `followup_id` (`followup_id`),
  CONSTRAINT `followup_audiology_tests_ibfk_1` FOREIGN KEY (`followup_id`) REFERENCES `followup_info` (`followup_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `followup_diagnoses`
--

DROP TABLE IF EXISTS `followup_diagnoses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `followup_diagnoses` (
  `diagnosis_id` int NOT NULL AUTO_INCREMENT,
  `followup_id` int NOT NULL,
  `diagnosis_date` date DEFAULT NULL,
  `asthma_phase` enum('无','急性发作期','临床缓解期','慢性持续期') DEFAULT NULL,
  `asthma_severity` enum('无','轻度','中度','重度','极重度') DEFAULT NULL,
  `rhinitis_severity` enum('无','轻度','中-重度') DEFAULT NULL,
  `rhinitis_type` enum('无','季节性','常年性') DEFAULT NULL,
  `rhinitis_duration` enum('无','间歇性','持续性') DEFAULT NULL,
  `dermatitis_present` tinyint(1) DEFAULT NULL,
  `dermatitis_severity` enum('无','轻度','中重度') DEFAULT NULL,
  `sinusitis_phase` enum('无','急性','慢性') DEFAULT NULL,
  `adenoid_hypertrophy` tinyint(1) DEFAULT NULL,
  `tonsil_hypertrophy` tinyint(1) DEFAULT NULL,
  `snoring` tinyint(1) DEFAULT NULL,
  `osa_hypopnea_syndrome` tinyint(1) DEFAULT NULL,
  `allergic_conjunctivitis` tinyint(1) DEFAULT NULL,
  `other_diagnoses` text,
  PRIMARY KEY (`diagnosis_id`),
  KEY `followup_id` (`followup_id`),
  CONSTRAINT `followup_diagnoses_ibfk_1` FOREIGN KEY (`followup_id`) REFERENCES `followup_info` (`followup_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `followup_endoscopy`
--

DROP TABLE IF EXISTS `followup_endoscopy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `followup_endoscopy` (
  `endoscopy_id` int NOT NULL AUTO_INCREMENT,
  `followup_id` int NOT NULL,
  `test_name` varchar(100) DEFAULT NULL,
  `test_date` date DEFAULT NULL,
  `result` text,
  `conclusion` text,
  PRIMARY KEY (`endoscopy_id`),
  KEY `followup_id` (`followup_id`),
  CONSTRAINT `followup_endoscopy_ibfk_1` FOREIGN KEY (`followup_id`) REFERENCES `followup_info` (`followup_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `followup_expenses`
--

DROP TABLE IF EXISTS `followup_expenses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `followup_expenses` (
  `expense_id` int NOT NULL AUTO_INCREMENT,
  `patient_id` varchar(20) NOT NULL,
  `expense_type` varchar(100) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`expense_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `followup_feno_tests`
--

DROP TABLE IF EXISTS `followup_feno_tests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `followup_feno_tests` (
  `feno_id` int NOT NULL AUTO_INCREMENT,
  `followup_id` int NOT NULL,
  `test_date` date DEFAULT NULL,
  `feno50` float DEFAULT NULL,
  `feno200` float DEFAULT NULL,
  `cano` float DEFAULT NULL,
  PRIMARY KEY (`feno_id`),
  KEY `followup_id` (`followup_id`),
  CONSTRAINT `followup_feno_tests_ibfk_1` FOREIGN KEY (`followup_id`) REFERENCES `followup_info` (`followup_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `followup_imaging`
--

DROP TABLE IF EXISTS `followup_imaging`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `followup_imaging` (
  `imaging_id` int NOT NULL AUTO_INCREMENT,
  `followup_id` int NOT NULL,
  `test_name` varchar(100) DEFAULT NULL,
  `test_date` date DEFAULT NULL,
  `image_path` text,
  `conclusion` text,
  PRIMARY KEY (`imaging_id`),
  KEY `followup_id` (`followup_id`),
  CONSTRAINT `followup_imaging_ibfk_1` FOREIGN KEY (`followup_id`) REFERENCES `followup_info` (`followup_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `followup_info`
--

DROP TABLE IF EXISTS `followup_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `followup_info` (
  `followup_id` int NOT NULL AUTO_INCREMENT,
  `patient_id` varchar(20) NOT NULL,
  `visit_number` varchar(50) DEFAULT NULL,
  `visit_date` datetime DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `gender` char(1) DEFAULT NULL,
  `age` int DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `height` float DEFAULT NULL,
  `weight` float DEFAULT NULL,
  `visit_type` enum('初诊','复诊') DEFAULT NULL,
  PRIMARY KEY (`followup_id`),
  KEY `patient_id` (`patient_id`),
  CONSTRAINT `followup_info_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `clinical_db`.`patients` (`patient_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `followup_lab_tests`
--

DROP TABLE IF EXISTS `followup_lab_tests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `followup_lab_tests` (
  `labtest_id` int NOT NULL AUTO_INCREMENT,
  `followup_id` int NOT NULL,
  `blood_test_date` date DEFAULT NULL,
  `wbc_count` float DEFAULT NULL,
  `neutrophil_count` float DEFAULT NULL,
  `lymphocyte_count` float DEFAULT NULL,
  `eosinophil_count` float DEFAULT NULL,
  `neutrophil_percent` float DEFAULT NULL,
  `lymphocyte_percent` float DEFAULT NULL,
  `eosinophil_percent` float DEFAULT NULL,
  `hemoglobin` float DEFAULT NULL,
  `rbc_count` float DEFAULT NULL,
  `platelet_count` float DEFAULT NULL,
  `c_reactive_protein` float DEFAULT NULL,
  `allergen_combo_test_date` date DEFAULT NULL,
  `total_IgE` float DEFAULT NULL,
  `dust_mite_combo` tinyint(1) DEFAULT NULL,
  `mold_combo` tinyint(1) DEFAULT NULL,
  `pet_dander_combo` tinyint(1) DEFAULT NULL,
  `food_combo` tinyint(1) DEFAULT NULL,
  `nut_combo` tinyint(1) DEFAULT NULL,
  `single_allergen_test_date` date DEFAULT NULL,
  `house_dust_mite` tinyint(1) DEFAULT NULL,
  `dust_mite` tinyint(1) DEFAULT NULL,
  `pollen` tinyint(1) DEFAULT NULL,
  `weed` tinyint(1) DEFAULT NULL,
  `aspergillus` tinyint(1) DEFAULT NULL,
  `alternaria` tinyint(1) DEFAULT NULL,
  `cockroach` tinyint(1) DEFAULT NULL,
  `cat_dander` tinyint(1) DEFAULT NULL,
  `dog_dander` tinyint(1) DEFAULT NULL,
  `egg_white` tinyint(1) DEFAULT NULL,
  `milk` tinyint(1) DEFAULT NULL,
  `shrimp` tinyint(1) DEFAULT NULL,
  `crab` tinyint(1) DEFAULT NULL,
  `soybean` tinyint(1) DEFAULT NULL,
  `sesame` tinyint(1) DEFAULT NULL,
  `wheat` tinyint(1) DEFAULT NULL,
  `nuts` tinyint(1) DEFAULT NULL,
  `allergen_other` text,
  `skin_prick_test_date` date DEFAULT NULL,
  `prick_house_dust_mite` tinyint(1) DEFAULT NULL,
  `prick_dust_mite` tinyint(1) DEFAULT NULL,
  `sputum_eosinophil_test_date` date DEFAULT NULL,
  `sputum_eosinophil_count` float DEFAULT NULL,
  `total_IgE_repeat_test_date` date DEFAULT NULL,
  `total_IgE_repeat_value` float DEFAULT NULL,
  PRIMARY KEY (`labtest_id`),
  KEY `followup_id` (`followup_id`),
  CONSTRAINT `followup_lab_tests_ibfk_1` FOREIGN KEY (`followup_id`) REFERENCES `followup_info` (`followup_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `followup_medication_history`
--

DROP TABLE IF EXISTS `followup_medication_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `followup_medication_history` (
  `med_hist_id` int NOT NULL AUTO_INCREMENT,
  `patient_id` varchar(20) NOT NULL,
  `cephalosporins_days` int DEFAULT NULL,
  `macrolides_days` int DEFAULT NULL,
  `corticosteroids_days` int DEFAULT NULL,
  `antihistamines_days` int DEFAULT NULL,
  `ltra_days` int DEFAULT NULL,
  `expectorants_days` int DEFAULT NULL,
  `cyclosporine_days` int DEFAULT NULL,
  `abrocitinib_days` int DEFAULT NULL,
  `upadacitinib_days` int DEFAULT NULL,
  PRIMARY KEY (`med_hist_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `followup_medications`
--

DROP TABLE IF EXISTS `followup_medications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `followup_medications` (
  `med_id` int NOT NULL AUTO_INCREMENT,
  `followup_id` int NOT NULL,
  `drug_id` int NOT NULL,
  `dose` varchar(50) DEFAULT NULL,
  `frequency` varchar(50) DEFAULT NULL,
  `route` varchar(50) DEFAULT NULL,
  `site` varchar(100) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `guidance` text,
  `precautions` text,
  PRIMARY KEY (`med_id`),
  KEY `followup_id` (`followup_id`),
  KEY `drug_id` (`drug_id`),
  CONSTRAINT `followup_medications_ibfk_1` FOREIGN KEY (`followup_id`) REFERENCES `followup_info` (`followup_id`),
  CONSTRAINT `followup_medications_ibfk_2` FOREIGN KEY (`drug_id`) REFERENCES `drug_catalog` (`drug_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `followup_nasal_resistance_tests`
--

DROP TABLE IF EXISTS `followup_nasal_resistance_tests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `followup_nasal_resistance_tests` (
  `nasal_id` int NOT NULL AUTO_INCREMENT,
  `followup_id` int NOT NULL,
  `test_name` varchar(100) DEFAULT NULL,
  `test_date` date DEFAULT NULL,
  `result` text,
  `conclusion` text,
  PRIMARY KEY (`nasal_id`),
  KEY `followup_id` (`followup_id`),
  CONSTRAINT `followup_nasal_resistance_tests_ibfk_1` FOREIGN KEY (`followup_id`) REFERENCES `followup_info` (`followup_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `followup_other_treatments`
--

DROP TABLE IF EXISTS `followup_other_treatments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `followup_other_treatments` (
  `treatment_id` int NOT NULL AUTO_INCREMENT,
  `patient_id` varchar(20) NOT NULL,
  `treatment_method` varchar(100) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `notes` text,
  `bronchoscopy_date` date DEFAULT NULL,
  `bronchoscopy_conclusion` text,
  `bronchoscopy_image_path` varchar(255) DEFAULT NULL,
  `oxygen_nasal_catheter` tinyint(1) DEFAULT '0',
  `oxygen_mask` tinyint(1) DEFAULT '0',
  `oxygen_high_flow` tinyint(1) DEFAULT '0',
  `mechanical_ventilation` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`treatment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `followup_physical_exam`
--

DROP TABLE IF EXISTS `followup_physical_exam`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `followup_physical_exam` (
  `exam_id` int NOT NULL AUTO_INCREMENT,
  `followup_id` int NOT NULL,
  `temperature_c` float DEFAULT NULL,
  `pulse_bpm` int DEFAULT NULL,
  `spo2_percent` int DEFAULT NULL,
  `oxygen_used` tinyint(1) DEFAULT NULL,
  `consciousness` enum('清醒','谵妄','昏睡','昏迷') DEFAULT NULL,
  `mental_state` enum('良好','倦怠') DEFAULT NULL,
  `breathing_pattern` enum('匀称','急促','不规则') DEFAULT NULL,
  `appearance` enum('消瘦','正常','肥胖') DEFAULT NULL,
  `nasal_mucosa_pale` tinyint(1) DEFAULT NULL,
  `nasal_mucosa_edema` tinyint(1) DEFAULT NULL,
  `nasal_mucosa_swelling` tinyint(1) DEFAULT NULL,
  `nasal_mucosa_clear_discharge` tinyint(1) DEFAULT NULL,
  `nasal_score` int DEFAULT NULL,
  `three_depression_sign` tinyint(1) DEFAULT NULL,
  `left_lung_sound` enum('清','粗') DEFAULT NULL,
  `left_dry_rales_present` tinyint(1) DEFAULT NULL,
  `left_dry_rales_distribution` enum('无','散在','满布') DEFAULT NULL,
  `left_wet_rales_present` tinyint(1) DEFAULT NULL,
  `left_wet_rales_distribution` enum('无','散在','满布') DEFAULT NULL,
  `right_lung_sound` enum('清','粗') DEFAULT NULL,
  `right_dry_rales_present` tinyint(1) DEFAULT NULL,
  `right_dry_rales_distribution` enum('无','散在','满布') DEFAULT NULL,
  `right_wet_rales_present` tinyint(1) DEFAULT NULL,
  `right_wet_rales_distribution` enum('无','散在','满布') DEFAULT NULL,
  `heart_rate` int DEFAULT NULL,
  `heart_rhythm` enum('整齐','不齐') DEFAULT NULL,
  `heart_murmur_present` tinyint(1) DEFAULT NULL,
  `heart_murmur_type` enum('无','收缩期','舒张期') DEFAULT NULL,
  `abdomen_shape` enum('平坦','隆起','凹陷') DEFAULT NULL,
  `abdomen_tenderness` tinyint(1) DEFAULT NULL,
  `rebound_tenderness` tinyint(1) DEFAULT NULL,
  `head_neck_erythema` tinyint(1) DEFAULT NULL,
  `head_neck_papule` tinyint(1) DEFAULT NULL,
  `head_neck_exudation` tinyint(1) DEFAULT NULL,
  `head_neck_desquamation` tinyint(1) DEFAULT NULL,
  `head_neck_lichenification` tinyint(1) DEFAULT NULL,
  `head_neck_dryness` tinyint(1) DEFAULT NULL,
  `head_neck_other` text,
  `upper_limb_erythema` tinyint(1) DEFAULT NULL,
  `upper_limb_papule` tinyint(1) DEFAULT NULL,
  `upper_limb_exudation` tinyint(1) DEFAULT NULL,
  `upper_limb_desquamation` tinyint(1) DEFAULT NULL,
  `upper_limb_lichenification` tinyint(1) DEFAULT NULL,
  `upper_limb_dryness` tinyint(1) DEFAULT NULL,
  `upper_limb_other` text,
  `trunk_erythema` tinyint(1) DEFAULT NULL,
  `trunk_papule` tinyint(1) DEFAULT NULL,
  `trunk_exudation` tinyint(1) DEFAULT NULL,
  `trunk_desquamation` tinyint(1) DEFAULT NULL,
  `trunk_lichenification` tinyint(1) DEFAULT NULL,
  `trunk_dryness` tinyint(1) DEFAULT NULL,
  `trunk_other` text,
  `lower_limb_erythema` tinyint(1) DEFAULT NULL,
  `lower_limb_papule` tinyint(1) DEFAULT NULL,
  `lower_limb_exudation` tinyint(1) DEFAULT NULL,
  `lower_limb_desquamation` tinyint(1) DEFAULT NULL,
  `lower_limb_lichenification` tinyint(1) DEFAULT NULL,
  `lower_limb_dryness` tinyint(1) DEFAULT NULL,
  `lower_limb_other` text,
  `genital_erythema` tinyint(1) DEFAULT NULL,
  `genital_papule` tinyint(1) DEFAULT NULL,
  `genital_exudation` tinyint(1) DEFAULT NULL,
  `genital_desquamation` tinyint(1) DEFAULT NULL,
  `genital_lichenification` tinyint(1) DEFAULT NULL,
  `genital_dryness` tinyint(1) DEFAULT NULL,
  `genital_other` text,
  `electronic_breath_sound_path` text,
  PRIMARY KEY (`exam_id`),
  KEY `followup_id` (`followup_id`),
  CONSTRAINT `followup_physical_exam_ibfk_1` FOREIGN KEY (`followup_id`) REFERENCES `followup_info` (`followup_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `followup_providers`
--

DROP TABLE IF EXISTS `followup_providers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `followup_providers` (
  `provider_id` int NOT NULL AUTO_INCREMENT,
  `followup_id` int NOT NULL,
  `provider_name` varchar(50) DEFAULT NULL,
  `title` enum('住院医师','主治医师','副主任医师','主任医师') DEFAULT NULL,
  PRIMARY KEY (`provider_id`),
  KEY `followup_id` (`followup_id`),
  CONSTRAINT `followup_providers_ibfk_1` FOREIGN KEY (`followup_id`) REFERENCES `followup_info` (`followup_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `followup_pulmonary_tests`
--

DROP TABLE IF EXISTS `followup_pulmonary_tests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `followup_pulmonary_tests` (
  `test_id` int NOT NULL AUTO_INCREMENT,
  `followup_id` int NOT NULL,
  `lung_test_date` date DEFAULT NULL,
  `ic` float DEFAULT NULL,
  `mef50` float DEFAULT NULL,
  `fev1` float DEFAULT NULL,
  `fvc` float DEFAULT NULL,
  `mmef75_25` float DEFAULT NULL,
  `fev1_fvc_ratio` float DEFAULT NULL,
  `mef25` float DEFAULT NULL,
  `mef75` float DEFAULT NULL,
  `mvv` float DEFAULT NULL,
  `fev1_vcmax_ratio` float DEFAULT NULL,
  `vcmax` float DEFAULT NULL,
  `lung_function_conclusion` text,
  `bronchodilation_test_date` date DEFAULT NULL,
  `bronchodilation_result` enum('阳性','阴性') DEFAULT NULL,
  `bronchial_challenge_test_date` date DEFAULT NULL,
  `bronchial_challenge_result` enum('阳性','阴性') DEFAULT NULL,
  `tidal_test_date` date DEFAULT NULL,
  `wt_per_kg` float DEFAULT NULL,
  `rr` int DEFAULT NULL,
  `ti` float DEFAULT NULL,
  `te` float DEFAULT NULL,
  `ti_te_ratio` float DEFAULT NULL,
  `tptef` float DEFAULT NULL,
  `vptef` float DEFAULT NULL,
  `tptef_te_ratio` float DEFAULT NULL,
  `vpef_ve_ratio` float DEFAULT NULL,
  `ptef` float DEFAULT NULL,
  `tef50_tif50_ratio` float DEFAULT NULL,
  `tef50` float DEFAULT NULL,
  `tef25` float DEFAULT NULL,
  `tef25_75` float DEFAULT NULL,
  PRIMARY KEY (`test_id`),
  KEY `followup_id` (`followup_id`),
  CONSTRAINT `followup_pulmonary_tests_ibfk_1` FOREIGN KEY (`followup_id`) REFERENCES `followup_info` (`followup_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `followup_questionnaire_scores`
--

DROP TABLE IF EXISTS `followup_questionnaire_scores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `followup_questionnaire_scores` (
  `questionnaire_id` int NOT NULL AUTO_INCREMENT,
  `patient_id` varchar(20) NOT NULL,
  `score_date` date DEFAULT NULL,
  `act_score` int DEFAULT NULL,
  `c_act_score` int DEFAULT NULL,
  `track_score` int DEFAULT NULL,
  `symptom_medication_score` int DEFAULT NULL,
  `cdlqi_score` int DEFAULT NULL,
  `scoard_score` int DEFAULT NULL,
  `idqol_score` int DEFAULT NULL,
  `rhinitis_vas_score` int DEFAULT NULL,
  PRIMARY KEY (`questionnaire_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `followup_summary`
--

DROP TABLE IF EXISTS `followup_summary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `followup_summary` (
  `summary_id` int NOT NULL AUTO_INCREMENT,
  `patient_id` varchar(20) NOT NULL,
  `symptom_improvement` text,
  `physical_development` text,
  `adverse_reaction` text,
  `reaction_management` text,
  PRIMARY KEY (`summary_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `followup_symptoms`
--

DROP TABLE IF EXISTS `followup_symptoms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `followup_symptoms` (
  `symptom_id` int NOT NULL AUTO_INCREMENT,
  `followup_id` int NOT NULL,
  `itchy_nose` tinyint(1) DEFAULT NULL,
  `sneezing` tinyint(1) DEFAULT NULL,
  `clear_discharge` tinyint(1) DEFAULT NULL,
  `nasal_congestion` tinyint(1) DEFAULT NULL,
  `itchy_eyes` tinyint(1) DEFAULT NULL,
  `tearing` tinyint(1) DEFAULT NULL,
  `red_eyes` tinyint(1) DEFAULT NULL,
  `eye_burning` tinyint(1) DEFAULT NULL,
  `itchy_throat` tinyint(1) DEFAULT NULL,
  `fever` tinyint(1) DEFAULT NULL,
  `mouth_breathing` tinyint(1) DEFAULT NULL,
  `snoring` tinyint(1) DEFAULT NULL,
  `cough` tinyint(1) DEFAULT NULL,
  `wheezing` tinyint(1) DEFAULT NULL,
  `dyspnea` tinyint(1) DEFAULT NULL,
  `chest_tightness` tinyint(1) DEFAULT NULL,
  `sighing` tinyint(1) DEFAULT NULL,
  `activity_limitation` tinyint(1) DEFAULT NULL,
  `nighttime_awake` tinyint(1) DEFAULT NULL,
  `morning_night_worse` tinyint(1) DEFAULT NULL,
  `rash` tinyint(1) DEFAULT NULL,
  `itching` tinyint(1) DEFAULT NULL,
  `pain` tinyint(1) DEFAULT NULL,
  `sleep_disorder` tinyint(1) DEFAULT NULL,
  `severity` enum('轻度','中度','重度','极重度') DEFAULT NULL,
  `frequency_pattern` text,
  `start_date` date DEFAULT NULL,
  `trigger_smoke` tinyint(1) DEFAULT NULL,
  `trigger_dust_mite` tinyint(1) DEFAULT NULL,
  `trigger_pollen` tinyint(1) DEFAULT NULL,
  `trigger_virus` tinyint(1) DEFAULT NULL,
  `trigger_mold` tinyint(1) DEFAULT NULL,
  `trigger_cold_air` tinyint(1) DEFAULT NULL,
  `trigger_weather_change` tinyint(1) DEFAULT NULL,
  `trigger_exercise` tinyint(1) DEFAULT NULL,
  `trigger_crying` tinyint(1) DEFAULT NULL,
  `trigger_food` tinyint(1) DEFAULT NULL,
  `trigger_medication` tinyint(1) DEFAULT NULL,
  `trigger_other` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`symptom_id`),
  KEY `followup_id` (`followup_id`),
  CONSTRAINT `followup_symptoms_ibfk_1` FOREIGN KEY (`followup_id`) REFERENCES `followup_info` (`followup_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `followup_visits`
--

DROP TABLE IF EXISTS `followup_visits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `followup_visits` (
  `followup_id` int NOT NULL AUTO_INCREMENT,
  `patient_id` varchar(20) NOT NULL,
  `visit_date` date DEFAULT NULL,
  `visit_type` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`followup_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-06-05 17:44:58
