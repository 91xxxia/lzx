/*
 Navicat Premium Dump SQL

 Source Server         : MySQL
 Source Server Type    : MySQL
 Source Server Version : 80037 (8.0.37)
 Source Host           : localhost:3306
 Source Schema         : ry-vue

 Target Server Type    : MySQL
 Target Server Version : 80037 (8.0.37)
 File Encoding         : 65001

 Date: 28/06/2025 16:05:12
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for clinical_other_treatments
-- ----------------------------
DROP TABLE IF EXISTS `clinical_other_treatments`;
CREATE TABLE `clinical_other_treatments`  (
  `treatment_id` int NOT NULL AUTO_INCREMENT,
  `patient_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `treatment_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `start_time` date NULL DEFAULT NULL,
  `end_time` date NULL DEFAULT NULL,
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  PRIMARY KEY (`treatment_id`) USING BTREE,
  INDEX `patient_id`(`patient_id` ASC) USING BTREE,
  CONSTRAINT `fk_patient_other_treatments` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`patient_id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of clinical_other_treatments
-- ----------------------------

-- ----------------------------
-- Table structure for contacts
-- ----------------------------
DROP TABLE IF EXISTS `contacts`;
CREATE TABLE `contacts`  (
  `contact_id` int NOT NULL AUTO_INCREMENT,
  `patient_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `phone` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `emergency_contact` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `relationship` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`contact_id`) USING BTREE,
  INDEX `patient_id`(`patient_id` ASC) USING BTREE,
  CONSTRAINT `fk_patient_contacts` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`patient_id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of contacts
-- ----------------------------

-- ----------------------------
-- Table structure for diagnoses
-- ----------------------------
DROP TABLE IF EXISTS `diagnoses`;
CREATE TABLE `diagnoses`  (
  `diagnosis_id` int NOT NULL AUTO_INCREMENT,
  `patient_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `disease_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `severity` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `diagnosis_time` date NULL DEFAULT NULL,
  PRIMARY KEY (`diagnosis_id`) USING BTREE,
  INDEX `patient_id`(`patient_id` ASC) USING BTREE,
  CONSTRAINT `fk_patient_diagnoses` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`patient_id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of diagnoses
-- ----------------------------

-- ----------------------------
-- Table structure for drug_catalog
-- ----------------------------
DROP TABLE IF EXISTS `drug_catalog`;
CREATE TABLE `drug_catalog`  (
  `drug_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `brand` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `is_steroid` tinyint(1) NULL DEFAULT 0,
  `is_antihistamine` tinyint(1) NULL DEFAULT 0,
  `is_ltra` tinyint(1) NULL DEFAULT 0,
  `is_bronchodilator` tinyint(1) NULL DEFAULT 0,
  `is_antibiotic` tinyint(1) NULL DEFAULT 0,
  `is_topical` tinyint(1) NULL DEFAULT 0,
  `is_nasal` tinyint(1) NULL DEFAULT 0,
  `is_expectorant` tinyint(1) NULL DEFAULT 0,
  `is_immunotherapy` tinyint(1) NULL DEFAULT 0,
  `is_anti_IgE` tinyint(1) NULL DEFAULT 0,
  `is_targeted` tinyint(1) NULL DEFAULT 0,
  PRIMARY KEY (`drug_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of drug_catalog
-- ----------------------------

-- ----------------------------
-- Table structure for expenses
-- ----------------------------
DROP TABLE IF EXISTS `expenses`;
CREATE TABLE `expenses`  (
  `expense_id` int NOT NULL AUTO_INCREMENT,
  `patient_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `expense_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `amount` decimal(10, 2) NULL DEFAULT NULL,
  PRIMARY KEY (`expense_id`) USING BTREE,
  INDEX `patient_id`(`patient_id` ASC) USING BTREE,
  CONSTRAINT `fk_patient_expenses` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`patient_id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of expenses
-- ----------------------------

-- ----------------------------
-- Table structure for family_history
-- ----------------------------
DROP TABLE IF EXISTS `family_history`;
CREATE TABLE `family_history`  (
  `fam_id` int NOT NULL AUTO_INCREMENT,
  `patient_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `relative_relation` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `allergy_disease` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  PRIMARY KEY (`fam_id`) USING BTREE,
  INDEX `patient_id`(`patient_id` ASC) USING BTREE,
  CONSTRAINT `fk_patient_family_history` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`patient_id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of family_history
-- ----------------------------

-- ----------------------------
-- Table structure for family_history_primary
-- ----------------------------
DROP TABLE IF EXISTS `family_history_primary`;
CREATE TABLE `family_history_primary`  (
  `prim_id` int NOT NULL AUTO_INCREMENT,
  `survey_id` int NOT NULL,
  `relation` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `diseases` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  PRIMARY KEY (`prim_id`) USING BTREE,
  INDEX `survey_id`(`survey_id` ASC) USING BTREE,
  CONSTRAINT `family_history_primary_ibfk_1` FOREIGN KEY (`survey_id`) REFERENCES `survey_basic_info` (`survey_id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of family_history_primary
-- ----------------------------

-- ----------------------------
-- Table structure for family_history_secondary
-- ----------------------------
DROP TABLE IF EXISTS `family_history_secondary`;
CREATE TABLE `family_history_secondary`  (
  `sec_id` int NOT NULL AUTO_INCREMENT,
  `survey_id` int NOT NULL,
  `relation` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `diseases` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  PRIMARY KEY (`sec_id`) USING BTREE,
  INDEX `survey_id`(`survey_id` ASC) USING BTREE,
  CONSTRAINT `family_history_secondary_ibfk_1` FOREIGN KEY (`survey_id`) REFERENCES `survey_basic_info` (`survey_id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of family_history_secondary
-- ----------------------------

-- ----------------------------
-- Table structure for feno_tests
-- ----------------------------
DROP TABLE IF EXISTS `feno_tests`;
CREATE TABLE `feno_tests`  (
  `feno_id` int NOT NULL AUTO_INCREMENT,
  `patient_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `test_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `test_date` date NULL DEFAULT NULL,
  `test_result` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  PRIMARY KEY (`feno_id`) USING BTREE,
  INDEX `patient_id`(`patient_id` ASC) USING BTREE,
  CONSTRAINT `fk_patient_feno_tests` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`patient_id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of feno_tests
-- ----------------------------

-- ----------------------------
-- Table structure for followup_adverse_reactions
-- ----------------------------
DROP TABLE IF EXISTS `followup_adverse_reactions`;
CREATE TABLE `followup_adverse_reactions`  (
  `reaction_id` int NOT NULL AUTO_INCREMENT,
  `patient_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `medication_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `reaction_onset_date` date NULL DEFAULT NULL,
  `usage_method` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `duration_days` int NULL DEFAULT NULL,
  `rash` tinyint(1) NULL DEFAULT NULL,
  `itching` tinyint(1) NULL DEFAULT NULL,
  `abdominal_pain` tinyint(1) NULL DEFAULT NULL,
  `nausea` tinyint(1) NULL DEFAULT NULL,
  `vomiting` tinyint(1) NULL DEFAULT NULL,
  `chest_tightness` tinyint(1) NULL DEFAULT NULL,
  `palpitations` tinyint(1) NULL DEFAULT NULL,
  `dyspnea` tinyint(1) NULL DEFAULT NULL,
  `other_reaction` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `severity_level` enum('轻度','中度','重度') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`reaction_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of followup_adverse_reactions
-- ----------------------------

-- ----------------------------
-- Table structure for followup_audiology_tests
-- ----------------------------
DROP TABLE IF EXISTS `followup_audiology_tests`;
CREATE TABLE `followup_audiology_tests`  (
  `audio_id` int NOT NULL AUTO_INCREMENT,
  `followup_id` int NOT NULL,
  `test_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `test_date` date NULL DEFAULT NULL,
  `tympanometry` tinyint(1) NULL DEFAULT NULL,
  `pure_tone_audiometry` tinyint(1) NULL DEFAULT NULL,
  `result` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  PRIMARY KEY (`audio_id`) USING BTREE,
  INDEX `followup_id`(`followup_id` ASC) USING BTREE,
  CONSTRAINT `followup_audiology_tests_ibfk_1` FOREIGN KEY (`followup_id`) REFERENCES `followup_info` (`followup_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of followup_audiology_tests
-- ----------------------------

-- ----------------------------
-- Table structure for followup_diagnoses
-- ----------------------------
DROP TABLE IF EXISTS `followup_diagnoses`;
CREATE TABLE `followup_diagnoses`  (
  `diagnosis_id` int NOT NULL AUTO_INCREMENT,
  `followup_id` int NOT NULL,
  `diagnosis_date` date NULL DEFAULT NULL,
  `asthma_phase` enum('无','急性发作期','临床缓解期','慢性持续期') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `asthma_severity` enum('无','轻度','中度','重度','极重度') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `rhinitis_severity` enum('无','轻度','中-重度') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `rhinitis_type` enum('无','季节性','常年性') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `rhinitis_duration` enum('无','间歇性','持续性') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `dermatitis_present` tinyint(1) NULL DEFAULT NULL,
  `dermatitis_severity` enum('无','轻度','中重度') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `sinusitis_phase` enum('无','急性','慢性') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `adenoid_hypertrophy` tinyint(1) NULL DEFAULT NULL,
  `tonsil_hypertrophy` tinyint(1) NULL DEFAULT NULL,
  `snoring` tinyint(1) NULL DEFAULT NULL,
  `osa_hypopnea_syndrome` tinyint(1) NULL DEFAULT NULL,
  `allergic_conjunctivitis` tinyint(1) NULL DEFAULT NULL,
  `other_diagnoses` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  PRIMARY KEY (`diagnosis_id`) USING BTREE,
  INDEX `followup_id`(`followup_id` ASC) USING BTREE,
  CONSTRAINT `followup_diagnoses_ibfk_1` FOREIGN KEY (`followup_id`) REFERENCES `followup_info` (`followup_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of followup_diagnoses
-- ----------------------------

-- ----------------------------
-- Table structure for followup_endoscopy
-- ----------------------------
DROP TABLE IF EXISTS `followup_endoscopy`;
CREATE TABLE `followup_endoscopy`  (
  `endoscopy_id` int NOT NULL AUTO_INCREMENT,
  `followup_id` int NOT NULL,
  `test_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `test_date` date NULL DEFAULT NULL,
  `result` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `conclusion` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  PRIMARY KEY (`endoscopy_id`) USING BTREE,
  INDEX `followup_id`(`followup_id` ASC) USING BTREE,
  CONSTRAINT `followup_endoscopy_ibfk_1` FOREIGN KEY (`followup_id`) REFERENCES `followup_info` (`followup_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of followup_endoscopy
-- ----------------------------

-- ----------------------------
-- Table structure for followup_expenses
-- ----------------------------
DROP TABLE IF EXISTS `followup_expenses`;
CREATE TABLE `followup_expenses`  (
  `expense_id` int NOT NULL AUTO_INCREMENT,
  `patient_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `expense_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `amount` decimal(10, 2) NULL DEFAULT NULL,
  PRIMARY KEY (`expense_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of followup_expenses
-- ----------------------------

-- ----------------------------
-- Table structure for followup_feno_tests
-- ----------------------------
DROP TABLE IF EXISTS `followup_feno_tests`;
CREATE TABLE `followup_feno_tests`  (
  `feno_id` int NOT NULL AUTO_INCREMENT,
  `followup_id` int NOT NULL,
  `test_date` date NULL DEFAULT NULL,
  `feno50` float NULL DEFAULT NULL,
  `feno200` float NULL DEFAULT NULL,
  `cano` float NULL DEFAULT NULL,
  PRIMARY KEY (`feno_id`) USING BTREE,
  INDEX `followup_id`(`followup_id` ASC) USING BTREE,
  CONSTRAINT `followup_feno_tests_ibfk_1` FOREIGN KEY (`followup_id`) REFERENCES `followup_info` (`followup_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of followup_feno_tests
-- ----------------------------

-- ----------------------------
-- Table structure for followup_imaging
-- ----------------------------
DROP TABLE IF EXISTS `followup_imaging`;
CREATE TABLE `followup_imaging`  (
  `imaging_id` int NOT NULL AUTO_INCREMENT,
  `followup_id` int NOT NULL,
  `test_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `test_date` date NULL DEFAULT NULL,
  `image_path` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `conclusion` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  PRIMARY KEY (`imaging_id`) USING BTREE,
  INDEX `followup_id`(`followup_id` ASC) USING BTREE,
  CONSTRAINT `followup_imaging_ibfk_1` FOREIGN KEY (`followup_id`) REFERENCES `followup_info` (`followup_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of followup_imaging
-- ----------------------------

-- ----------------------------
-- Table structure for followup_info
-- ----------------------------
DROP TABLE IF EXISTS `followup_info`;
CREATE TABLE `followup_info`  (
  `followup_id` int NOT NULL AUTO_INCREMENT,
  `patient_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `visit_number` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `visit_date` datetime NULL DEFAULT NULL,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `gender` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `age` int NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `height` float NULL DEFAULT NULL,
  `weight` float NULL DEFAULT NULL,
  `visit_type` enum('初诊','复诊') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`followup_id`) USING BTREE,
  INDEX `patient_id`(`patient_id` ASC) USING BTREE,
  CONSTRAINT `followup_info_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `clinical_db`.`patients` (`patient_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of followup_info
-- ----------------------------

-- ----------------------------
-- Table structure for followup_lab_tests
-- ----------------------------
DROP TABLE IF EXISTS `followup_lab_tests`;
CREATE TABLE `followup_lab_tests`  (
  `labtest_id` int NOT NULL AUTO_INCREMENT,
  `followup_id` int NOT NULL,
  `blood_test_date` date NULL DEFAULT NULL,
  `wbc_count` float NULL DEFAULT NULL,
  `neutrophil_count` float NULL DEFAULT NULL,
  `lymphocyte_count` float NULL DEFAULT NULL,
  `eosinophil_count` float NULL DEFAULT NULL,
  `neutrophil_percent` float NULL DEFAULT NULL,
  `lymphocyte_percent` float NULL DEFAULT NULL,
  `eosinophil_percent` float NULL DEFAULT NULL,
  `hemoglobin` float NULL DEFAULT NULL,
  `rbc_count` float NULL DEFAULT NULL,
  `platelet_count` float NULL DEFAULT NULL,
  `c_reactive_protein` float NULL DEFAULT NULL,
  `allergen_combo_test_date` date NULL DEFAULT NULL,
  `total_IgE` float NULL DEFAULT NULL,
  `dust_mite_combo` tinyint(1) NULL DEFAULT NULL,
  `mold_combo` tinyint(1) NULL DEFAULT NULL,
  `pet_dander_combo` tinyint(1) NULL DEFAULT NULL,
  `food_combo` tinyint(1) NULL DEFAULT NULL,
  `nut_combo` tinyint(1) NULL DEFAULT NULL,
  `single_allergen_test_date` date NULL DEFAULT NULL,
  `house_dust_mite` tinyint(1) NULL DEFAULT NULL,
  `dust_mite` tinyint(1) NULL DEFAULT NULL,
  `pollen` tinyint(1) NULL DEFAULT NULL,
  `weed` tinyint(1) NULL DEFAULT NULL,
  `aspergillus` tinyint(1) NULL DEFAULT NULL,
  `alternaria` tinyint(1) NULL DEFAULT NULL,
  `cockroach` tinyint(1) NULL DEFAULT NULL,
  `cat_dander` tinyint(1) NULL DEFAULT NULL,
  `dog_dander` tinyint(1) NULL DEFAULT NULL,
  `egg_white` tinyint(1) NULL DEFAULT NULL,
  `milk` tinyint(1) NULL DEFAULT NULL,
  `shrimp` tinyint(1) NULL DEFAULT NULL,
  `crab` tinyint(1) NULL DEFAULT NULL,
  `soybean` tinyint(1) NULL DEFAULT NULL,
  `sesame` tinyint(1) NULL DEFAULT NULL,
  `wheat` tinyint(1) NULL DEFAULT NULL,
  `nuts` tinyint(1) NULL DEFAULT NULL,
  `allergen_other` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `skin_prick_test_date` date NULL DEFAULT NULL,
  `prick_house_dust_mite` tinyint(1) NULL DEFAULT NULL,
  `prick_dust_mite` tinyint(1) NULL DEFAULT NULL,
  `sputum_eosinophil_test_date` date NULL DEFAULT NULL,
  `sputum_eosinophil_count` float NULL DEFAULT NULL,
  `total_IgE_repeat_test_date` date NULL DEFAULT NULL,
  `total_IgE_repeat_value` float NULL DEFAULT NULL,
  PRIMARY KEY (`labtest_id`) USING BTREE,
  INDEX `followup_id`(`followup_id` ASC) USING BTREE,
  CONSTRAINT `followup_lab_tests_ibfk_1` FOREIGN KEY (`followup_id`) REFERENCES `followup_info` (`followup_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of followup_lab_tests
-- ----------------------------

-- ----------------------------
-- Table structure for followup_medication_history
-- ----------------------------
DROP TABLE IF EXISTS `followup_medication_history`;
CREATE TABLE `followup_medication_history`  (
  `med_hist_id` int NOT NULL AUTO_INCREMENT,
  `patient_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `cephalosporins_days` int NULL DEFAULT NULL,
  `macrolides_days` int NULL DEFAULT NULL,
  `corticosteroids_days` int NULL DEFAULT NULL,
  `antihistamines_days` int NULL DEFAULT NULL,
  `ltra_days` int NULL DEFAULT NULL,
  `expectorants_days` int NULL DEFAULT NULL,
  `cyclosporine_days` int NULL DEFAULT NULL,
  `abrocitinib_days` int NULL DEFAULT NULL,
  `upadacitinib_days` int NULL DEFAULT NULL,
  PRIMARY KEY (`med_hist_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of followup_medication_history
-- ----------------------------

-- ----------------------------
-- Table structure for followup_medications
-- ----------------------------
DROP TABLE IF EXISTS `followup_medications`;
CREATE TABLE `followup_medications`  (
  `med_id` int NOT NULL AUTO_INCREMENT,
  `followup_id` int NOT NULL,
  `drug_id` int NOT NULL,
  `dose` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `frequency` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `route` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `site` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `start_date` date NULL DEFAULT NULL,
  `end_date` date NULL DEFAULT NULL,
  `guidance` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `precautions` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  PRIMARY KEY (`med_id`) USING BTREE,
  INDEX `followup_id`(`followup_id` ASC) USING BTREE,
  INDEX `drug_id`(`drug_id` ASC) USING BTREE,
  CONSTRAINT `followup_medications_ibfk_1` FOREIGN KEY (`followup_id`) REFERENCES `followup_info` (`followup_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `followup_medications_ibfk_2` FOREIGN KEY (`drug_id`) REFERENCES `drug_catalog` (`drug_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of followup_medications
-- ----------------------------

-- ----------------------------
-- Table structure for followup_nasal_resistance_tests
-- ----------------------------
DROP TABLE IF EXISTS `followup_nasal_resistance_tests`;
CREATE TABLE `followup_nasal_resistance_tests`  (
  `nasal_id` int NOT NULL AUTO_INCREMENT,
  `followup_id` int NOT NULL,
  `test_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `test_date` date NULL DEFAULT NULL,
  `result` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `conclusion` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  PRIMARY KEY (`nasal_id`) USING BTREE,
  INDEX `followup_id`(`followup_id` ASC) USING BTREE,
  CONSTRAINT `followup_nasal_resistance_tests_ibfk_1` FOREIGN KEY (`followup_id`) REFERENCES `followup_info` (`followup_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of followup_nasal_resistance_tests
-- ----------------------------

-- ----------------------------
-- Table structure for followup_notes
-- ----------------------------
DROP TABLE IF EXISTS `followup_notes`;
CREATE TABLE `followup_notes`  (
  `followup_id` int NOT NULL AUTO_INCREMENT,
  `patient_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `symptom_improvement` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `physical_development` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `adverse_reactions` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `reaction_management` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  PRIMARY KEY (`followup_id`) USING BTREE,
  INDEX `patient_id`(`patient_id` ASC) USING BTREE,
  CONSTRAINT `fk_patient_followup_notes` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`patient_id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of followup_notes
-- ----------------------------

-- ----------------------------
-- Table structure for followup_other_treatments
-- ----------------------------
DROP TABLE IF EXISTS `followup_other_treatments`;
CREATE TABLE `followup_other_treatments`  (
  `treatment_id` int NOT NULL AUTO_INCREMENT,
  `patient_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `treatment_method` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `start_date` date NULL DEFAULT NULL,
  `end_date` date NULL DEFAULT NULL,
  `notes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `bronchoscopy_date` date NULL DEFAULT NULL,
  `bronchoscopy_conclusion` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `bronchoscopy_image_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `oxygen_nasal_catheter` tinyint(1) NULL DEFAULT 0,
  `oxygen_mask` tinyint(1) NULL DEFAULT 0,
  `oxygen_high_flow` tinyint(1) NULL DEFAULT 0,
  `mechanical_ventilation` tinyint(1) NULL DEFAULT 0,
  PRIMARY KEY (`treatment_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of followup_other_treatments
-- ----------------------------

-- ----------------------------
-- Table structure for followup_physical_exam
-- ----------------------------
DROP TABLE IF EXISTS `followup_physical_exam`;
CREATE TABLE `followup_physical_exam`  (
  `exam_id` int NOT NULL AUTO_INCREMENT,
  `followup_id` int NOT NULL,
  `temperature_c` float NULL DEFAULT NULL,
  `pulse_bpm` int NULL DEFAULT NULL,
  `spo2_percent` int NULL DEFAULT NULL,
  `oxygen_used` tinyint(1) NULL DEFAULT NULL,
  `consciousness` enum('清醒','谵妄','昏睡','昏迷') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `mental_state` enum('良好','倦怠') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `breathing_pattern` enum('匀称','急促','不规则') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `appearance` enum('消瘦','正常','肥胖') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `nasal_mucosa_pale` tinyint(1) NULL DEFAULT NULL,
  `nasal_mucosa_edema` tinyint(1) NULL DEFAULT NULL,
  `nasal_mucosa_swelling` tinyint(1) NULL DEFAULT NULL,
  `nasal_mucosa_clear_discharge` tinyint(1) NULL DEFAULT NULL,
  `nasal_score` int NULL DEFAULT NULL,
  `three_depression_sign` tinyint(1) NULL DEFAULT NULL,
  `left_lung_sound` enum('清','粗') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `left_dry_rales_present` tinyint(1) NULL DEFAULT NULL,
  `left_dry_rales_distribution` enum('无','散在','满布') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `left_wet_rales_present` tinyint(1) NULL DEFAULT NULL,
  `left_wet_rales_distribution` enum('无','散在','满布') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `right_lung_sound` enum('清','粗') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `right_dry_rales_present` tinyint(1) NULL DEFAULT NULL,
  `right_dry_rales_distribution` enum('无','散在','满布') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `right_wet_rales_present` tinyint(1) NULL DEFAULT NULL,
  `right_wet_rales_distribution` enum('无','散在','满布') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `heart_rate` int NULL DEFAULT NULL,
  `heart_rhythm` enum('整齐','不齐') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `heart_murmur_present` tinyint(1) NULL DEFAULT NULL,
  `heart_murmur_type` enum('无','收缩期','舒张期') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `abdomen_shape` enum('平坦','隆起','凹陷') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `abdomen_tenderness` tinyint(1) NULL DEFAULT NULL,
  `rebound_tenderness` tinyint(1) NULL DEFAULT NULL,
  `head_neck_erythema` tinyint(1) NULL DEFAULT NULL,
  `head_neck_papule` tinyint(1) NULL DEFAULT NULL,
  `head_neck_exudation` tinyint(1) NULL DEFAULT NULL,
  `head_neck_desquamation` tinyint(1) NULL DEFAULT NULL,
  `head_neck_lichenification` tinyint(1) NULL DEFAULT NULL,
  `head_neck_dryness` tinyint(1) NULL DEFAULT NULL,
  `head_neck_other` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `upper_limb_erythema` tinyint(1) NULL DEFAULT NULL,
  `upper_limb_papule` tinyint(1) NULL DEFAULT NULL,
  `upper_limb_exudation` tinyint(1) NULL DEFAULT NULL,
  `upper_limb_desquamation` tinyint(1) NULL DEFAULT NULL,
  `upper_limb_lichenification` tinyint(1) NULL DEFAULT NULL,
  `upper_limb_dryness` tinyint(1) NULL DEFAULT NULL,
  `upper_limb_other` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `trunk_erythema` tinyint(1) NULL DEFAULT NULL,
  `trunk_papule` tinyint(1) NULL DEFAULT NULL,
  `trunk_exudation` tinyint(1) NULL DEFAULT NULL,
  `trunk_desquamation` tinyint(1) NULL DEFAULT NULL,
  `trunk_lichenification` tinyint(1) NULL DEFAULT NULL,
  `trunk_dryness` tinyint(1) NULL DEFAULT NULL,
  `trunk_other` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `lower_limb_erythema` tinyint(1) NULL DEFAULT NULL,
  `lower_limb_papule` tinyint(1) NULL DEFAULT NULL,
  `lower_limb_exudation` tinyint(1) NULL DEFAULT NULL,
  `lower_limb_desquamation` tinyint(1) NULL DEFAULT NULL,
  `lower_limb_lichenification` tinyint(1) NULL DEFAULT NULL,
  `lower_limb_dryness` tinyint(1) NULL DEFAULT NULL,
  `lower_limb_other` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `genital_erythema` tinyint(1) NULL DEFAULT NULL,
  `genital_papule` tinyint(1) NULL DEFAULT NULL,
  `genital_exudation` tinyint(1) NULL DEFAULT NULL,
  `genital_desquamation` tinyint(1) NULL DEFAULT NULL,
  `genital_lichenification` tinyint(1) NULL DEFAULT NULL,
  `genital_dryness` tinyint(1) NULL DEFAULT NULL,
  `genital_other` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `electronic_breath_sound_path` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  PRIMARY KEY (`exam_id`) USING BTREE,
  INDEX `followup_id`(`followup_id` ASC) USING BTREE,
  CONSTRAINT `followup_physical_exam_ibfk_1` FOREIGN KEY (`followup_id`) REFERENCES `followup_info` (`followup_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of followup_physical_exam
-- ----------------------------

-- ----------------------------
-- Table structure for followup_providers
-- ----------------------------
DROP TABLE IF EXISTS `followup_providers`;
CREATE TABLE `followup_providers`  (
  `provider_id` int NOT NULL AUTO_INCREMENT,
  `followup_id` int NOT NULL,
  `provider_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `title` enum('住院医师','主治医师','副主任医师','主任医师') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`provider_id`) USING BTREE,
  INDEX `followup_id`(`followup_id` ASC) USING BTREE,
  CONSTRAINT `followup_providers_ibfk_1` FOREIGN KEY (`followup_id`) REFERENCES `followup_info` (`followup_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of followup_providers
-- ----------------------------

-- ----------------------------
-- Table structure for followup_pulmonary_tests
-- ----------------------------
DROP TABLE IF EXISTS `followup_pulmonary_tests`;
CREATE TABLE `followup_pulmonary_tests`  (
  `test_id` int NOT NULL AUTO_INCREMENT,
  `followup_id` int NOT NULL,
  `lung_test_date` date NULL DEFAULT NULL,
  `ic` float NULL DEFAULT NULL,
  `mef50` float NULL DEFAULT NULL,
  `fev1` float NULL DEFAULT NULL,
  `fvc` float NULL DEFAULT NULL,
  `mmef75_25` float NULL DEFAULT NULL,
  `fev1_fvc_ratio` float NULL DEFAULT NULL,
  `mef25` float NULL DEFAULT NULL,
  `mef75` float NULL DEFAULT NULL,
  `mvv` float NULL DEFAULT NULL,
  `fev1_vcmax_ratio` float NULL DEFAULT NULL,
  `vcmax` float NULL DEFAULT NULL,
  `lung_function_conclusion` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `bronchodilation_test_date` date NULL DEFAULT NULL,
  `bronchodilation_result` enum('阳性','阴性') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `bronchial_challenge_test_date` date NULL DEFAULT NULL,
  `bronchial_challenge_result` enum('阳性','阴性') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `tidal_test_date` date NULL DEFAULT NULL,
  `wt_per_kg` float NULL DEFAULT NULL,
  `rr` int NULL DEFAULT NULL,
  `ti` float NULL DEFAULT NULL,
  `te` float NULL DEFAULT NULL,
  `ti_te_ratio` float NULL DEFAULT NULL,
  `tptef` float NULL DEFAULT NULL,
  `vptef` float NULL DEFAULT NULL,
  `tptef_te_ratio` float NULL DEFAULT NULL,
  `vpef_ve_ratio` float NULL DEFAULT NULL,
  `ptef` float NULL DEFAULT NULL,
  `tef50_tif50_ratio` float NULL DEFAULT NULL,
  `tef50` float NULL DEFAULT NULL,
  `tef25` float NULL DEFAULT NULL,
  `tef25_75` float NULL DEFAULT NULL,
  PRIMARY KEY (`test_id`) USING BTREE,
  INDEX `followup_id`(`followup_id` ASC) USING BTREE,
  CONSTRAINT `followup_pulmonary_tests_ibfk_1` FOREIGN KEY (`followup_id`) REFERENCES `followup_info` (`followup_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of followup_pulmonary_tests
-- ----------------------------

-- ----------------------------
-- Table structure for followup_questionnaire_scores
-- ----------------------------
DROP TABLE IF EXISTS `followup_questionnaire_scores`;
CREATE TABLE `followup_questionnaire_scores`  (
  `questionnaire_id` int NOT NULL AUTO_INCREMENT,
  `patient_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `score_date` date NULL DEFAULT NULL,
  `act_score` int NULL DEFAULT NULL,
  `c_act_score` int NULL DEFAULT NULL,
  `track_score` int NULL DEFAULT NULL,
  `symptom_medication_score` int NULL DEFAULT NULL,
  `cdlqi_score` int NULL DEFAULT NULL,
  `scoard_score` int NULL DEFAULT NULL,
  `idqol_score` int NULL DEFAULT NULL,
  `rhinitis_vas_score` int NULL DEFAULT NULL,
  PRIMARY KEY (`questionnaire_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of followup_questionnaire_scores
-- ----------------------------

-- ----------------------------
-- Table structure for followup_summary
-- ----------------------------
DROP TABLE IF EXISTS `followup_summary`;
CREATE TABLE `followup_summary`  (
  `summary_id` int NOT NULL AUTO_INCREMENT,
  `patient_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `symptom_improvement` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `physical_development` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `adverse_reaction` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `reaction_management` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  PRIMARY KEY (`summary_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of followup_summary
-- ----------------------------

-- ----------------------------
-- Table structure for followup_symptoms
-- ----------------------------
DROP TABLE IF EXISTS `followup_symptoms`;
CREATE TABLE `followup_symptoms`  (
  `symptom_id` int NOT NULL AUTO_INCREMENT,
  `followup_id` int NOT NULL,
  `itchy_nose` tinyint(1) NULL DEFAULT NULL,
  `sneezing` tinyint(1) NULL DEFAULT NULL,
  `clear_discharge` tinyint(1) NULL DEFAULT NULL,
  `nasal_congestion` tinyint(1) NULL DEFAULT NULL,
  `itchy_eyes` tinyint(1) NULL DEFAULT NULL,
  `tearing` tinyint(1) NULL DEFAULT NULL,
  `red_eyes` tinyint(1) NULL DEFAULT NULL,
  `eye_burning` tinyint(1) NULL DEFAULT NULL,
  `itchy_throat` tinyint(1) NULL DEFAULT NULL,
  `fever` tinyint(1) NULL DEFAULT NULL,
  `mouth_breathing` tinyint(1) NULL DEFAULT NULL,
  `snoring` tinyint(1) NULL DEFAULT NULL,
  `cough` tinyint(1) NULL DEFAULT NULL,
  `wheezing` tinyint(1) NULL DEFAULT NULL,
  `dyspnea` tinyint(1) NULL DEFAULT NULL,
  `chest_tightness` tinyint(1) NULL DEFAULT NULL,
  `sighing` tinyint(1) NULL DEFAULT NULL,
  `activity_limitation` tinyint(1) NULL DEFAULT NULL,
  `nighttime_awake` tinyint(1) NULL DEFAULT NULL,
  `morning_night_worse` tinyint(1) NULL DEFAULT NULL,
  `rash` tinyint(1) NULL DEFAULT NULL,
  `itching` tinyint(1) NULL DEFAULT NULL,
  `pain` tinyint(1) NULL DEFAULT NULL,
  `sleep_disorder` tinyint(1) NULL DEFAULT NULL,
  `severity` enum('轻度','中度','重度','极重度') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `frequency_pattern` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `start_date` date NULL DEFAULT NULL,
  `trigger_smoke` tinyint(1) NULL DEFAULT NULL,
  `trigger_dust_mite` tinyint(1) NULL DEFAULT NULL,
  `trigger_pollen` tinyint(1) NULL DEFAULT NULL,
  `trigger_virus` tinyint(1) NULL DEFAULT NULL,
  `trigger_mold` tinyint(1) NULL DEFAULT NULL,
  `trigger_cold_air` tinyint(1) NULL DEFAULT NULL,
  `trigger_weather_change` tinyint(1) NULL DEFAULT NULL,
  `trigger_exercise` tinyint(1) NULL DEFAULT NULL,
  `trigger_crying` tinyint(1) NULL DEFAULT NULL,
  `trigger_food` tinyint(1) NULL DEFAULT NULL,
  `trigger_medication` tinyint(1) NULL DEFAULT NULL,
  `trigger_other` tinyint(1) NULL DEFAULT NULL,
  PRIMARY KEY (`symptom_id`) USING BTREE,
  INDEX `followup_id`(`followup_id` ASC) USING BTREE,
  CONSTRAINT `followup_symptoms_ibfk_1` FOREIGN KEY (`followup_id`) REFERENCES `followup_info` (`followup_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of followup_symptoms
-- ----------------------------

-- ----------------------------
-- Table structure for followup_visits
-- ----------------------------
DROP TABLE IF EXISTS `followup_visits`;
CREATE TABLE `followup_visits`  (
  `followup_id` int NOT NULL AUTO_INCREMENT,
  `patient_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `visit_date` date NULL DEFAULT NULL,
  `visit_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`followup_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of followup_visits
-- ----------------------------

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
  `table_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `tpl_web_type` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '前端模板类型（element-ui模版 element-plus模版）',
  `package_name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 60 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '代码生成业务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES (29, 'drug_catalog', '', NULL, NULL, 'DrugCatalog', 'crud', '', 'com.ruoyi.system', 'system', 'catalog', NULL, 'ruoyi', '0', '/', NULL, 'admin', '2025-06-27 21:31:50', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (30, 'followup_adverse_reactions', '', NULL, NULL, 'FollowupAdverseReactions', 'crud', '', 'com.ruoyi.system', 'system', 'reactions', NULL, 'ruoyi', '0', '/', NULL, 'admin', '2025-06-27 21:31:50', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (31, 'followup_audiology_tests', '', NULL, NULL, 'FollowupAudiologyTests', 'crud', '', 'com.ruoyi.system', 'system', 'tests', NULL, 'ruoyi', '0', '/', NULL, 'admin', '2025-06-27 21:31:50', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (32, 'followup_diagnoses', '', NULL, NULL, 'FollowupDiagnoses', 'crud', '', 'com.ruoyi.system', 'system', 'diagnoses', NULL, 'ruoyi', '0', '/', NULL, 'admin', '2025-06-27 21:31:50', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (33, 'followup_endoscopy', '', NULL, NULL, 'FollowupEndoscopy', 'crud', '', 'com.ruoyi.system', 'system', 'endoscopy', NULL, 'ruoyi', '0', '/', NULL, 'admin', '2025-06-27 21:31:50', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (34, 'followup_expenses', '', NULL, NULL, 'FollowupExpenses', 'crud', '', 'com.ruoyi.system', 'system', 'expenses', NULL, 'ruoyi', '0', '/', NULL, 'admin', '2025-06-27 21:31:50', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (35, 'followup_feno_tests', '', NULL, NULL, 'FollowupFenoTests', 'crud', '', 'com.ruoyi.system', 'system', 'tests', NULL, 'ruoyi', '0', '/', NULL, 'admin', '2025-06-27 21:31:50', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (36, 'followup_imaging', '', NULL, NULL, 'FollowupImaging', 'crud', '', 'com.ruoyi.system', 'system', 'imaging', NULL, 'ruoyi', '0', '/', NULL, 'admin', '2025-06-27 21:31:50', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (37, 'followup_info', '', NULL, NULL, 'FollowupInfo', 'crud', '', 'com.ruoyi.system', 'system', 'info', NULL, 'ruoyi', '0', '/', NULL, 'admin', '2025-06-27 21:31:50', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (38, 'followup_lab_tests', '', NULL, NULL, 'FollowupLabTests', 'crud', '', 'com.ruoyi.system', 'system', 'tests', NULL, 'ruoyi', '0', '/', NULL, 'admin', '2025-06-27 21:31:50', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (39, 'followup_medication_history', '', NULL, NULL, 'FollowupMedicationHistory', 'crud', '', 'com.ruoyi.system', 'system', 'history', NULL, 'ruoyi', '0', '/', NULL, 'admin', '2025-06-27 21:31:50', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (40, 'followup_medications', '', NULL, NULL, 'FollowupMedications', 'crud', '', 'com.ruoyi.system', 'system', 'medications', NULL, 'ruoyi', '0', '/', NULL, 'admin', '2025-06-27 21:31:50', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (41, 'followup_nasal_resistance_tests', '', NULL, NULL, 'FollowupNasalResistanceTests', 'crud', '', 'com.ruoyi.system', 'system', 'tests', NULL, 'ruoyi', '0', '/', NULL, 'admin', '2025-06-27 21:31:50', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (42, 'followup_other_treatments', '', NULL, NULL, 'FollowupOtherTreatments', 'crud', '', 'com.ruoyi.system', 'system', 'treatments', NULL, 'ruoyi', '0', '/', NULL, 'admin', '2025-06-27 21:31:50', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (43, 'followup_physical_exam', '', NULL, NULL, 'FollowupPhysicalExam', 'crud', '', 'com.ruoyi.system', 'system', 'exam', NULL, 'ruoyi', '0', '/', NULL, 'admin', '2025-06-27 21:31:50', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (44, 'followup_providers', '', NULL, NULL, 'FollowupProviders', 'crud', '', 'com.ruoyi.system', 'system', 'providers', NULL, 'ruoyi', '0', '/', NULL, 'admin', '2025-06-27 21:31:50', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (45, 'followup_pulmonary_tests', '', NULL, NULL, 'FollowupPulmonaryTests', 'crud', '', 'com.ruoyi.system', 'system', 'tests', NULL, 'ruoyi', '0', '/', NULL, 'admin', '2025-06-27 21:31:50', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (46, 'followup_questionnaire_scores', '', NULL, NULL, 'FollowupQuestionnaireScores', 'crud', '', 'com.ruoyi.system', 'system', 'scores', NULL, 'ruoyi', '0', '/', NULL, 'admin', '2025-06-27 21:31:50', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (47, 'followup_summary', '', NULL, NULL, 'FollowupSummary', 'crud', '', 'com.ruoyi.system', 'system', 'summary', NULL, 'ruoyi', '0', '/', NULL, 'admin', '2025-06-27 21:31:50', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (48, 'followup_symptoms', '症状', NULL, NULL, 'FollowupSymptoms', 'crud', 'element-ui', 'com.ruoyi.FollowSys', 'FollowSys', 'symptoms', '症状', 'ruoyi', '0', '/', '{\"parentMenuId\":2386}', 'admin', '2025-06-27 21:31:51', '', '2025-06-27 21:44:38', NULL);
INSERT INTO `gen_table` VALUES (49, 'followup_visits', '', NULL, NULL, 'FollowupVisits', 'crud', '', 'com.ruoyi.system', 'system', 'visits', NULL, 'ruoyi', '0', '/', NULL, 'admin', '2025-06-27 21:31:51', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (50, 'family_history_primary', '一级亲属过敏史', NULL, NULL, 'FamilyHistoryPrimary', 'crud', 'element-ui', 'com.ruoyi.EpidemSys', 'EpidemSys', 'primary', '一级亲属过敏史', 'ruoyi', '0', '/', '{\"parentMenuId\":2000}', 'admin', '2025-06-28 11:38:12', '', '2025-06-28 14:44:42', NULL);
INSERT INTO `gen_table` VALUES (51, 'family_history_secondary', '二级亲属过敏史', NULL, NULL, 'FamilyHistorySecondary', 'crud', 'element-ui', 'com.ruoyi.EpidemSys', 'EpidemSys', 'secondary', '二级亲属过敏史', 'ruoyi', '0', '/', '{\"parentMenuId\":2000}', 'admin', '2025-06-28 11:38:12', '', '2025-06-28 14:20:44', NULL);
INSERT INTO `gen_table` VALUES (52, 'survey_area_environment', '城乡环境监测数据', NULL, NULL, 'SurveyAreaEnvironment', 'crud', 'element-ui', 'com.ruoyi.EpidemSys', 'EpidemSys', 'SAenvironment', '城乡环境监测数据', 'ruoyi', '0', '/', '{\"parentMenuId\":2000}', 'admin', '2025-06-28 11:38:12', '', '2025-06-28 14:40:11', NULL);
INSERT INTO `gen_table` VALUES (53, 'survey_basic_info', '患儿基本信息', NULL, NULL, 'SurveyBasicInfo', 'crud', 'element-ui', 'com.ruoyi.EpidemSys', 'EpidemSys', 'info', '患儿基本信息', 'ruoyi', '0', '/', '{\"parentMenuId\":2000}', 'admin', '2025-06-28 11:38:12', '', '2025-06-28 14:56:18', NULL);
INSERT INTO `gen_table` VALUES (54, 'survey_confounding_factors', '其他潜在混杂因素', NULL, NULL, 'SurveyConfoundingFactors', 'crud', 'element-ui', 'com.ruoyi.EpidemSys', 'EpidemSys', 'factors', '其他潜在混杂因素', 'ruoyi', '0', '/', '{\"parentMenuId\":2000}', 'admin', '2025-06-28 11:38:12', '', '2025-06-28 14:58:04', NULL);
INSERT INTO `gen_table` VALUES (55, 'survey_environment_exposure', '家庭环境暴露信息', NULL, NULL, 'SurveyEnvironmentExposure', 'crud', 'element-ui', 'com.ruoyi.EpidemSys', 'EpidemSys', 'exposure', '家庭环境暴露信息', 'ruoyi', '0', '/', '{\"parentMenuId\":2000}', 'admin', '2025-06-28 11:38:12', '', '2025-06-28 14:52:33', NULL);
INSERT INTO `gen_table` VALUES (56, 'survey_family_env', '家族环境居住相似性', NULL, NULL, 'SurveyFamilyEnv', 'crud', 'element-ui', 'com.ruoyi.EpidemSys', 'EpidemSys', 'SFenv', '家族环境居住相似性', 'ruoyi', '0', '/', '{\"parentMenuId\":2000}', 'admin', '2025-06-28 11:38:12', '', '2025-06-28 14:58:44', NULL);
INSERT INTO `gen_table` VALUES (57, 'survey_learning_work_env', '学习/工作环境信息', NULL, NULL, 'SurveyLearningWorkEnv', 'crud', 'element-ui', 'com.ruoyi.EpidemSys', 'EpidemSys', 'StudyLearnenv', '学习/工作环境信息', 'ruoyi', '0', '/', '{\"parentMenuId\":2000}', 'admin', '2025-06-28 11:38:12', '', '2025-06-28 14:30:45', NULL);
INSERT INTO `gen_table` VALUES (58, 'survey_monitoring_methods', '环境监测方法', NULL, NULL, 'SurveyMonitoringMethods', 'crud', 'element-ui', 'com.ruoyi.EpidemSys', 'EpidemSys', 'methods', '环境监测方法', 'ruoyi', '0', '/', '{\"parentMenuId\":2000}', 'admin', '2025-06-28 11:38:12', '', '2025-06-28 14:42:40', NULL);
INSERT INTO `gen_table` VALUES (59, 'survey_providers', '医疗调查服务者标识信息', NULL, NULL, 'SurveyProviders', 'crud', 'element-ui', 'com.ruoyi.EpidemSys', 'EpidemSys', 'providers', '医疗调查服务者标识信息', 'ruoyi', '0', '/', '{\"parentMenuId\":2000}', 'admin', '2025-06-28 11:38:12', '', '2025-06-28 14:59:51', NULL);

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `column_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` bigint NULL DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `sort` int NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 705 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES (232, 29, 'drug_id', NULL, 'int', 'Long', 'drugId', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (233, 29, 'name', NULL, 'varchar(100)', 'String', 'name', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (234, 29, 'brand', NULL, 'varchar(100)', 'String', 'brand', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (235, 29, 'type', NULL, 'varchar(50)', 'String', 'type', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'select', '', 4, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (236, 29, 'is_steroid', NULL, 'tinyint(1)', 'Integer', 'isSteroid', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (237, 29, 'is_antihistamine', NULL, 'tinyint(1)', 'Integer', 'isAntihistamine', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (238, 29, 'is_ltra', NULL, 'tinyint(1)', 'Integer', 'isLtra', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (239, 29, 'is_bronchodilator', NULL, 'tinyint(1)', 'Integer', 'isBronchodilator', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (240, 29, 'is_antibiotic', NULL, 'tinyint(1)', 'Integer', 'isAntibiotic', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 9, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (241, 29, 'is_topical', NULL, 'tinyint(1)', 'Integer', 'isTopical', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 10, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (242, 29, 'is_nasal', NULL, 'tinyint(1)', 'Integer', 'isNasal', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 11, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (243, 29, 'is_expectorant', NULL, 'tinyint(1)', 'Integer', 'isExpectorant', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 12, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (244, 29, 'is_immunotherapy', NULL, 'tinyint(1)', 'Integer', 'isImmunotherapy', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 13, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (245, 29, 'is_anti_IgE', NULL, 'tinyint(1)', 'Integer', 'isAntiIge', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 14, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (246, 29, 'is_targeted', NULL, 'tinyint(1)', 'Integer', 'isTargeted', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 15, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (247, 30, 'reaction_id', NULL, 'int', 'Long', 'reactionId', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (248, 30, 'patient_id', NULL, 'varchar(20)', 'String', 'patientId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (249, 30, 'medication_name', NULL, 'varchar(100)', 'String', 'medicationName', '0', '0', '0', '1', '1', '1', '1', 'LIKE', 'input', '', 3, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (250, 30, 'reaction_onset_date', NULL, 'date', 'Date', 'reactionOnsetDate', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'datetime', '', 4, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (251, 30, 'usage_method', NULL, 'text', 'String', 'usageMethod', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'textarea', '', 5, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (252, 30, 'duration_days', NULL, 'int', 'Long', 'durationDays', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (253, 30, 'rash', NULL, 'tinyint(1)', 'Integer', 'rash', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (254, 30, 'itching', NULL, 'tinyint(1)', 'Integer', 'itching', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (255, 30, 'abdominal_pain', NULL, 'tinyint(1)', 'Integer', 'abdominalPain', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 9, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (256, 30, 'nausea', NULL, 'tinyint(1)', 'Integer', 'nausea', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 10, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (257, 30, 'vomiting', NULL, 'tinyint(1)', 'Integer', 'vomiting', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 11, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (258, 30, 'chest_tightness', NULL, 'tinyint(1)', 'Integer', 'chestTightness', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 12, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (259, 30, 'palpitations', NULL, 'tinyint(1)', 'Integer', 'palpitations', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 13, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (260, 30, 'dyspnea', NULL, 'tinyint(1)', 'Integer', 'dyspnea', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 14, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (261, 30, 'other_reaction', NULL, 'text', 'String', 'otherReaction', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'textarea', '', 15, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (262, 30, 'severity_level', NULL, 'enum(\'轻度\',\'中度\',\'重度\')', 'String', 'severityLevel', '0', '0', '0', '1', '1', '1', '1', 'EQ', NULL, '', 16, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (263, 31, 'audio_id', NULL, 'int', 'Long', 'audioId', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (264, 31, 'followup_id', NULL, 'int', 'Long', 'followupId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (265, 31, 'test_name', NULL, 'varchar(100)', 'String', 'testName', '0', '0', '0', '1', '1', '1', '1', 'LIKE', 'input', '', 3, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (266, 31, 'test_date', NULL, 'date', 'Date', 'testDate', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'datetime', '', 4, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (267, 31, 'tympanometry', NULL, 'tinyint(1)', 'Integer', 'tympanometry', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (268, 31, 'pure_tone_audiometry', NULL, 'tinyint(1)', 'Integer', 'pureToneAudiometry', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (269, 31, 'result', NULL, 'text', 'String', 'result', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'textarea', '', 7, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (270, 32, 'diagnosis_id', NULL, 'int', 'Long', 'diagnosisId', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (271, 32, 'followup_id', NULL, 'int', 'Long', 'followupId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (272, 32, 'diagnosis_date', NULL, 'date', 'Date', 'diagnosisDate', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'datetime', '', 3, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (273, 32, 'asthma_phase', NULL, 'enum(\'无\',\'急性发作期\',\'临床缓解期\',\'慢性持续期\')', 'String', 'asthmaPhase', '0', '0', '0', '1', '1', '1', '1', 'EQ', NULL, '', 4, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (274, 32, 'asthma_severity', NULL, 'enum(\'无\',\'轻度\',\'中度\',\'重度\',\'极重度\')', 'String', 'asthmaSeverity', '0', '0', '0', '1', '1', '1', '1', 'EQ', NULL, '', 5, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (275, 32, 'rhinitis_severity', NULL, 'enum(\'无\',\'轻度\',\'中-重度\')', 'String', 'rhinitisSeverity', '0', '0', '0', '1', '1', '1', '1', 'EQ', NULL, '', 6, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (276, 32, 'rhinitis_type', NULL, 'enum(\'无\',\'季节性\',\'常年性\')', 'String', 'rhinitisType', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'select', '', 7, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (277, 32, 'rhinitis_duration', NULL, 'enum(\'无\',\'间歇性\',\'持续性\')', 'String', 'rhinitisDuration', '0', '0', '0', '1', '1', '1', '1', 'EQ', NULL, '', 8, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (278, 32, 'dermatitis_present', NULL, 'tinyint(1)', 'Integer', 'dermatitisPresent', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 9, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (279, 32, 'dermatitis_severity', NULL, 'enum(\'无\',\'轻度\',\'中重度\')', 'String', 'dermatitisSeverity', '0', '0', '0', '1', '1', '1', '1', 'EQ', NULL, '', 10, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (280, 32, 'sinusitis_phase', NULL, 'enum(\'无\',\'急性\',\'慢性\')', 'String', 'sinusitisPhase', '0', '0', '0', '1', '1', '1', '1', 'EQ', NULL, '', 11, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (281, 32, 'adenoid_hypertrophy', NULL, 'tinyint(1)', 'Integer', 'adenoidHypertrophy', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 12, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (282, 32, 'tonsil_hypertrophy', NULL, 'tinyint(1)', 'Integer', 'tonsilHypertrophy', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 13, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (283, 32, 'snoring', NULL, 'tinyint(1)', 'Integer', 'snoring', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 14, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (284, 32, 'osa_hypopnea_syndrome', NULL, 'tinyint(1)', 'Integer', 'osaHypopneaSyndrome', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 15, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (285, 32, 'allergic_conjunctivitis', NULL, 'tinyint(1)', 'Integer', 'allergicConjunctivitis', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 16, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (286, 32, 'other_diagnoses', NULL, 'text', 'String', 'otherDiagnoses', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'textarea', '', 17, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (287, 33, 'endoscopy_id', NULL, 'int', 'Long', 'endoscopyId', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (288, 33, 'followup_id', NULL, 'int', 'Long', 'followupId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (289, 33, 'test_name', NULL, 'varchar(100)', 'String', 'testName', '0', '0', '0', '1', '1', '1', '1', 'LIKE', 'input', '', 3, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (290, 33, 'test_date', NULL, 'date', 'Date', 'testDate', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'datetime', '', 4, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (291, 33, 'result', NULL, 'text', 'String', 'result', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'textarea', '', 5, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (292, 33, 'conclusion', NULL, 'text', 'String', 'conclusion', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'textarea', '', 6, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (293, 34, 'expense_id', NULL, 'int', 'Long', 'expenseId', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (294, 34, 'patient_id', NULL, 'varchar(20)', 'String', 'patientId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (295, 34, 'expense_type', NULL, 'varchar(100)', 'String', 'expenseType', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'select', '', 3, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (296, 34, 'amount', NULL, 'decimal(10,2)', 'BigDecimal', 'amount', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (297, 35, 'feno_id', NULL, 'int', 'Long', 'fenoId', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (298, 35, 'followup_id', NULL, 'int', 'Long', 'followupId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (299, 35, 'test_date', NULL, 'date', 'Date', 'testDate', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'datetime', '', 3, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (300, 35, 'feno50', NULL, 'float', 'Long', 'feno50', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (301, 35, 'feno200', NULL, 'float', 'Long', 'feno200', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (302, 35, 'cano', NULL, 'float', 'Long', 'cano', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (303, 36, 'imaging_id', NULL, 'int', 'Long', 'imagingId', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (304, 36, 'followup_id', NULL, 'int', 'Long', 'followupId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (305, 36, 'test_name', NULL, 'varchar(100)', 'String', 'testName', '0', '0', '0', '1', '1', '1', '1', 'LIKE', 'input', '', 3, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (306, 36, 'test_date', NULL, 'date', 'Date', 'testDate', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'datetime', '', 4, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (307, 36, 'image_path', NULL, 'text', 'String', 'imagePath', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'textarea', '', 5, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (308, 36, 'conclusion', NULL, 'text', 'String', 'conclusion', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'textarea', '', 6, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (309, 37, 'followup_id', NULL, 'int', 'Long', 'followupId', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (310, 37, 'patient_id', NULL, 'varchar(20)', 'String', 'patientId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (311, 37, 'visit_number', NULL, 'varchar(50)', 'String', 'visitNumber', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (312, 37, 'visit_date', NULL, 'datetime', 'Date', 'visitDate', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'datetime', '', 4, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (313, 37, 'name', NULL, 'varchar(50)', 'String', 'name', '0', '0', '0', '1', '1', '1', '1', 'LIKE', 'input', '', 5, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (314, 37, 'gender', NULL, 'char(1)', 'String', 'gender', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (315, 37, 'age', NULL, 'int', 'Long', 'age', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (316, 37, 'address', NULL, 'varchar(255)', 'String', 'address', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (317, 37, 'height', NULL, 'float', 'Long', 'height', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 9, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (318, 37, 'weight', NULL, 'float', 'Long', 'weight', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 10, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (319, 37, 'visit_type', NULL, 'enum(\'初诊\',\'复诊\')', 'String', 'visitType', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'select', '', 11, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (320, 38, 'labtest_id', NULL, 'int', 'Long', 'labtestId', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (321, 38, 'followup_id', NULL, 'int', 'Long', 'followupId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (322, 38, 'blood_test_date', NULL, 'date', 'Date', 'bloodTestDate', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'datetime', '', 3, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (323, 38, 'wbc_count', NULL, 'float', 'Long', 'wbcCount', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (324, 38, 'neutrophil_count', NULL, 'float', 'Long', 'neutrophilCount', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (325, 38, 'lymphocyte_count', NULL, 'float', 'Long', 'lymphocyteCount', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (326, 38, 'eosinophil_count', NULL, 'float', 'Long', 'eosinophilCount', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (327, 38, 'neutrophil_percent', NULL, 'float', 'Long', 'neutrophilPercent', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (328, 38, 'lymphocyte_percent', NULL, 'float', 'Long', 'lymphocytePercent', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 9, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (329, 38, 'eosinophil_percent', NULL, 'float', 'Long', 'eosinophilPercent', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 10, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (330, 38, 'hemoglobin', NULL, 'float', 'Long', 'hemoglobin', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 11, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (331, 38, 'rbc_count', NULL, 'float', 'Long', 'rbcCount', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 12, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (332, 38, 'platelet_count', NULL, 'float', 'Long', 'plateletCount', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 13, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (333, 38, 'c_reactive_protein', NULL, 'float', 'Long', 'cReactiveProtein', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 14, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (334, 38, 'allergen_combo_test_date', NULL, 'date', 'Date', 'allergenComboTestDate', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'datetime', '', 15, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (335, 38, 'total_IgE', NULL, 'float', 'Long', 'totalIge', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 16, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (336, 38, 'dust_mite_combo', NULL, 'tinyint(1)', 'Integer', 'dustMiteCombo', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 17, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (337, 38, 'mold_combo', NULL, 'tinyint(1)', 'Integer', 'moldCombo', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 18, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (338, 38, 'pet_dander_combo', NULL, 'tinyint(1)', 'Integer', 'petDanderCombo', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 19, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (339, 38, 'food_combo', NULL, 'tinyint(1)', 'Integer', 'foodCombo', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 20, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (340, 38, 'nut_combo', NULL, 'tinyint(1)', 'Integer', 'nutCombo', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 21, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (341, 38, 'single_allergen_test_date', NULL, 'date', 'Date', 'singleAllergenTestDate', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'datetime', '', 22, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (342, 38, 'house_dust_mite', NULL, 'tinyint(1)', 'Integer', 'houseDustMite', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 23, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (343, 38, 'dust_mite', NULL, 'tinyint(1)', 'Integer', 'dustMite', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 24, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (344, 38, 'pollen', NULL, 'tinyint(1)', 'Integer', 'pollen', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 25, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (345, 38, 'weed', NULL, 'tinyint(1)', 'Integer', 'weed', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 26, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (346, 38, 'aspergillus', NULL, 'tinyint(1)', 'Integer', 'aspergillus', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 27, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (347, 38, 'alternaria', NULL, 'tinyint(1)', 'Integer', 'alternaria', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 28, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (348, 38, 'cockroach', NULL, 'tinyint(1)', 'Integer', 'cockroach', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 29, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (349, 38, 'cat_dander', NULL, 'tinyint(1)', 'Integer', 'catDander', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 30, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (350, 38, 'dog_dander', NULL, 'tinyint(1)', 'Integer', 'dogDander', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 31, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (351, 38, 'egg_white', NULL, 'tinyint(1)', 'Integer', 'eggWhite', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 32, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (352, 38, 'milk', NULL, 'tinyint(1)', 'Integer', 'milk', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 33, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (353, 38, 'shrimp', NULL, 'tinyint(1)', 'Integer', 'shrimp', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 34, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (354, 38, 'crab', NULL, 'tinyint(1)', 'Integer', 'crab', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 35, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (355, 38, 'soybean', NULL, 'tinyint(1)', 'Integer', 'soybean', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 36, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (356, 38, 'sesame', NULL, 'tinyint(1)', 'Integer', 'sesame', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 37, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (357, 38, 'wheat', NULL, 'tinyint(1)', 'Integer', 'wheat', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 38, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (358, 38, 'nuts', NULL, 'tinyint(1)', 'Integer', 'nuts', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 39, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (359, 38, 'allergen_other', NULL, 'text', 'String', 'allergenOther', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'textarea', '', 40, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (360, 38, 'skin_prick_test_date', NULL, 'date', 'Date', 'skinPrickTestDate', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'datetime', '', 41, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (361, 38, 'prick_house_dust_mite', NULL, 'tinyint(1)', 'Integer', 'prickHouseDustMite', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 42, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (362, 38, 'prick_dust_mite', NULL, 'tinyint(1)', 'Integer', 'prickDustMite', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 43, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (363, 38, 'sputum_eosinophil_test_date', NULL, 'date', 'Date', 'sputumEosinophilTestDate', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'datetime', '', 44, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (364, 38, 'sputum_eosinophil_count', NULL, 'float', 'Long', 'sputumEosinophilCount', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 45, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (365, 38, 'total_IgE_repeat_test_date', NULL, 'date', 'Date', 'totalIgeRepeatTestDate', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'datetime', '', 46, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (366, 38, 'total_IgE_repeat_value', NULL, 'float', 'Long', 'totalIgeRepeatValue', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 47, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (367, 39, 'med_hist_id', NULL, 'int', 'Long', 'medHistId', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (368, 39, 'patient_id', NULL, 'varchar(20)', 'String', 'patientId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (369, 39, 'cephalosporins_days', NULL, 'int', 'Long', 'cephalosporinsDays', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (370, 39, 'macrolides_days', NULL, 'int', 'Long', 'macrolidesDays', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (371, 39, 'corticosteroids_days', NULL, 'int', 'Long', 'corticosteroidsDays', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (372, 39, 'antihistamines_days', NULL, 'int', 'Long', 'antihistaminesDays', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (373, 39, 'ltra_days', NULL, 'int', 'Long', 'ltraDays', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (374, 39, 'expectorants_days', NULL, 'int', 'Long', 'expectorantsDays', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (375, 39, 'cyclosporine_days', NULL, 'int', 'Long', 'cyclosporineDays', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 9, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (376, 39, 'abrocitinib_days', NULL, 'int', 'Long', 'abrocitinibDays', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 10, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (377, 39, 'upadacitinib_days', NULL, 'int', 'Long', 'upadacitinibDays', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 11, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (378, 40, 'med_id', NULL, 'int', 'Long', 'medId', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (379, 40, 'followup_id', NULL, 'int', 'Long', 'followupId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (380, 40, 'drug_id', NULL, 'int', 'Long', 'drugId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (381, 40, 'dose', NULL, 'varchar(50)', 'String', 'dose', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (382, 40, 'frequency', NULL, 'varchar(50)', 'String', 'frequency', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (383, 40, 'route', NULL, 'varchar(50)', 'String', 'route', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (384, 40, 'site', NULL, 'varchar(100)', 'String', 'site', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (385, 40, 'start_date', NULL, 'date', 'Date', 'startDate', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'datetime', '', 8, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (386, 40, 'end_date', NULL, 'date', 'Date', 'endDate', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'datetime', '', 9, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (387, 40, 'guidance', NULL, 'text', 'String', 'guidance', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'textarea', '', 10, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (388, 40, 'precautions', NULL, 'text', 'String', 'precautions', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'textarea', '', 11, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (389, 41, 'nasal_id', NULL, 'int', 'Long', 'nasalId', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (390, 41, 'followup_id', NULL, 'int', 'Long', 'followupId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (391, 41, 'test_name', NULL, 'varchar(100)', 'String', 'testName', '0', '0', '0', '1', '1', '1', '1', 'LIKE', 'input', '', 3, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (392, 41, 'test_date', NULL, 'date', 'Date', 'testDate', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'datetime', '', 4, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (393, 41, 'result', NULL, 'text', 'String', 'result', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'textarea', '', 5, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (394, 41, 'conclusion', NULL, 'text', 'String', 'conclusion', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'textarea', '', 6, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (395, 42, 'treatment_id', NULL, 'int', 'Long', 'treatmentId', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (396, 42, 'patient_id', NULL, 'varchar(20)', 'String', 'patientId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (397, 42, 'treatment_method', NULL, 'varchar(100)', 'String', 'treatmentMethod', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (398, 42, 'start_date', NULL, 'date', 'Date', 'startDate', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'datetime', '', 4, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (399, 42, 'end_date', NULL, 'date', 'Date', 'endDate', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'datetime', '', 5, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (400, 42, 'notes', NULL, 'text', 'String', 'notes', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'textarea', '', 6, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (401, 42, 'bronchoscopy_date', NULL, 'date', 'Date', 'bronchoscopyDate', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'datetime', '', 7, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (402, 42, 'bronchoscopy_conclusion', NULL, 'text', 'String', 'bronchoscopyConclusion', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'textarea', '', 8, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (403, 42, 'bronchoscopy_image_path', NULL, 'varchar(255)', 'String', 'bronchoscopyImagePath', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 9, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (404, 42, 'oxygen_nasal_catheter', NULL, 'tinyint(1)', 'Integer', 'oxygenNasalCatheter', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 10, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (405, 42, 'oxygen_mask', NULL, 'tinyint(1)', 'Integer', 'oxygenMask', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 11, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (406, 42, 'oxygen_high_flow', NULL, 'tinyint(1)', 'Integer', 'oxygenHighFlow', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 12, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (407, 42, 'mechanical_ventilation', NULL, 'tinyint(1)', 'Integer', 'mechanicalVentilation', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 13, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (408, 43, 'exam_id', NULL, 'int', 'Long', 'examId', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (409, 43, 'followup_id', NULL, 'int', 'Long', 'followupId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (410, 43, 'temperature_c', NULL, 'float', 'Long', 'temperatureC', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (411, 43, 'pulse_bpm', NULL, 'int', 'Long', 'pulseBpm', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (412, 43, 'spo2_percent', NULL, 'int', 'Long', 'spo2Percent', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (413, 43, 'oxygen_used', NULL, 'tinyint(1)', 'Integer', 'oxygenUsed', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (414, 43, 'consciousness', NULL, 'enum(\'清醒\',\'谵妄\',\'昏睡\',\'昏迷\')', 'String', 'consciousness', '0', '0', '0', '1', '1', '1', '1', 'EQ', NULL, '', 7, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (415, 43, 'mental_state', NULL, 'enum(\'良好\',\'倦怠\')', 'String', 'mentalState', '0', '0', '0', '1', '1', '1', '1', 'EQ', NULL, '', 8, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (416, 43, 'breathing_pattern', NULL, 'enum(\'匀称\',\'急促\',\'不规则\')', 'String', 'breathingPattern', '0', '0', '0', '1', '1', '1', '1', 'EQ', NULL, '', 9, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (417, 43, 'appearance', NULL, 'enum(\'消瘦\',\'正常\',\'肥胖\')', 'String', 'appearance', '0', '0', '0', '1', '1', '1', '1', 'EQ', NULL, '', 10, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (418, 43, 'nasal_mucosa_pale', NULL, 'tinyint(1)', 'Integer', 'nasalMucosaPale', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 11, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (419, 43, 'nasal_mucosa_edema', NULL, 'tinyint(1)', 'Integer', 'nasalMucosaEdema', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 12, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (420, 43, 'nasal_mucosa_swelling', NULL, 'tinyint(1)', 'Integer', 'nasalMucosaSwelling', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 13, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (421, 43, 'nasal_mucosa_clear_discharge', NULL, 'tinyint(1)', 'Integer', 'nasalMucosaClearDischarge', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 14, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (422, 43, 'nasal_score', NULL, 'int', 'Long', 'nasalScore', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 15, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (423, 43, 'three_depression_sign', NULL, 'tinyint(1)', 'Integer', 'threeDepressionSign', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 16, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (424, 43, 'left_lung_sound', NULL, 'enum(\'清\',\'粗\')', 'String', 'leftLungSound', '0', '0', '0', '1', '1', '1', '1', 'EQ', NULL, '', 17, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (425, 43, 'left_dry_rales_present', NULL, 'tinyint(1)', 'Integer', 'leftDryRalesPresent', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 18, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (426, 43, 'left_dry_rales_distribution', NULL, 'enum(\'无\',\'散在\',\'满布\')', 'String', 'leftDryRalesDistribution', '0', '0', '0', '1', '1', '1', '1', 'EQ', NULL, '', 19, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (427, 43, 'left_wet_rales_present', NULL, 'tinyint(1)', 'Integer', 'leftWetRalesPresent', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 20, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (428, 43, 'left_wet_rales_distribution', NULL, 'enum(\'无\',\'散在\',\'满布\')', 'String', 'leftWetRalesDistribution', '0', '0', '0', '1', '1', '1', '1', 'EQ', NULL, '', 21, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (429, 43, 'right_lung_sound', NULL, 'enum(\'清\',\'粗\')', 'String', 'rightLungSound', '0', '0', '0', '1', '1', '1', '1', 'EQ', NULL, '', 22, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (430, 43, 'right_dry_rales_present', NULL, 'tinyint(1)', 'Integer', 'rightDryRalesPresent', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 23, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (431, 43, 'right_dry_rales_distribution', NULL, 'enum(\'无\',\'散在\',\'满布\')', 'String', 'rightDryRalesDistribution', '0', '0', '0', '1', '1', '1', '1', 'EQ', NULL, '', 24, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (432, 43, 'right_wet_rales_present', NULL, 'tinyint(1)', 'Integer', 'rightWetRalesPresent', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 25, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (433, 43, 'right_wet_rales_distribution', NULL, 'enum(\'无\',\'散在\',\'满布\')', 'String', 'rightWetRalesDistribution', '0', '0', '0', '1', '1', '1', '1', 'EQ', NULL, '', 26, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (434, 43, 'heart_rate', NULL, 'int', 'Long', 'heartRate', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 27, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (435, 43, 'heart_rhythm', NULL, 'enum(\'整齐\',\'不齐\')', 'String', 'heartRhythm', '0', '0', '0', '1', '1', '1', '1', 'EQ', NULL, '', 28, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (436, 43, 'heart_murmur_present', NULL, 'tinyint(1)', 'Integer', 'heartMurmurPresent', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 29, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (437, 43, 'heart_murmur_type', NULL, 'enum(\'无\',\'收缩期\',\'舒张期\')', 'String', 'heartMurmurType', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'select', '', 30, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (438, 43, 'abdomen_shape', NULL, 'enum(\'平坦\',\'隆起\',\'凹陷\')', 'String', 'abdomenShape', '0', '0', '0', '1', '1', '1', '1', 'EQ', NULL, '', 31, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (439, 43, 'abdomen_tenderness', NULL, 'tinyint(1)', 'Integer', 'abdomenTenderness', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 32, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (440, 43, 'rebound_tenderness', NULL, 'tinyint(1)', 'Integer', 'reboundTenderness', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 33, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (441, 43, 'head_neck_erythema', NULL, 'tinyint(1)', 'Integer', 'headNeckErythema', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 34, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (442, 43, 'head_neck_papule', NULL, 'tinyint(1)', 'Integer', 'headNeckPapule', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 35, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (443, 43, 'head_neck_exudation', NULL, 'tinyint(1)', 'Integer', 'headNeckExudation', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 36, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (444, 43, 'head_neck_desquamation', NULL, 'tinyint(1)', 'Integer', 'headNeckDesquamation', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 37, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (445, 43, 'head_neck_lichenification', NULL, 'tinyint(1)', 'Integer', 'headNeckLichenification', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 38, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (446, 43, 'head_neck_dryness', NULL, 'tinyint(1)', 'Integer', 'headNeckDryness', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 39, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (447, 43, 'head_neck_other', NULL, 'text', 'String', 'headNeckOther', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'textarea', '', 40, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (448, 43, 'upper_limb_erythema', NULL, 'tinyint(1)', 'Integer', 'upperLimbErythema', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 41, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (449, 43, 'upper_limb_papule', NULL, 'tinyint(1)', 'Integer', 'upperLimbPapule', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 42, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (450, 43, 'upper_limb_exudation', NULL, 'tinyint(1)', 'Integer', 'upperLimbExudation', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 43, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (451, 43, 'upper_limb_desquamation', NULL, 'tinyint(1)', 'Integer', 'upperLimbDesquamation', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 44, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (452, 43, 'upper_limb_lichenification', NULL, 'tinyint(1)', 'Integer', 'upperLimbLichenification', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 45, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (453, 43, 'upper_limb_dryness', NULL, 'tinyint(1)', 'Integer', 'upperLimbDryness', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 46, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (454, 43, 'upper_limb_other', NULL, 'text', 'String', 'upperLimbOther', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'textarea', '', 47, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (455, 43, 'trunk_erythema', NULL, 'tinyint(1)', 'Integer', 'trunkErythema', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 48, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (456, 43, 'trunk_papule', NULL, 'tinyint(1)', 'Integer', 'trunkPapule', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 49, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (457, 43, 'trunk_exudation', NULL, 'tinyint(1)', 'Integer', 'trunkExudation', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 50, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (458, 43, 'trunk_desquamation', NULL, 'tinyint(1)', 'Integer', 'trunkDesquamation', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 51, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (459, 43, 'trunk_lichenification', NULL, 'tinyint(1)', 'Integer', 'trunkLichenification', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 52, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (460, 43, 'trunk_dryness', NULL, 'tinyint(1)', 'Integer', 'trunkDryness', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 53, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (461, 43, 'trunk_other', NULL, 'text', 'String', 'trunkOther', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'textarea', '', 54, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (462, 43, 'lower_limb_erythema', NULL, 'tinyint(1)', 'Integer', 'lowerLimbErythema', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 55, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (463, 43, 'lower_limb_papule', NULL, 'tinyint(1)', 'Integer', 'lowerLimbPapule', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 56, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (464, 43, 'lower_limb_exudation', NULL, 'tinyint(1)', 'Integer', 'lowerLimbExudation', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 57, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (465, 43, 'lower_limb_desquamation', NULL, 'tinyint(1)', 'Integer', 'lowerLimbDesquamation', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 58, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (466, 43, 'lower_limb_lichenification', NULL, 'tinyint(1)', 'Integer', 'lowerLimbLichenification', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 59, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (467, 43, 'lower_limb_dryness', NULL, 'tinyint(1)', 'Integer', 'lowerLimbDryness', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 60, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (468, 43, 'lower_limb_other', NULL, 'text', 'String', 'lowerLimbOther', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'textarea', '', 61, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (469, 43, 'genital_erythema', NULL, 'tinyint(1)', 'Integer', 'genitalErythema', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 62, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (470, 43, 'genital_papule', NULL, 'tinyint(1)', 'Integer', 'genitalPapule', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 63, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (471, 43, 'genital_exudation', NULL, 'tinyint(1)', 'Integer', 'genitalExudation', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 64, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (472, 43, 'genital_desquamation', NULL, 'tinyint(1)', 'Integer', 'genitalDesquamation', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 65, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (473, 43, 'genital_lichenification', NULL, 'tinyint(1)', 'Integer', 'genitalLichenification', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 66, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (474, 43, 'genital_dryness', NULL, 'tinyint(1)', 'Integer', 'genitalDryness', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 67, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (475, 43, 'genital_other', NULL, 'text', 'String', 'genitalOther', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'textarea', '', 68, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (476, 43, 'electronic_breath_sound_path', NULL, 'text', 'String', 'electronicBreathSoundPath', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'textarea', '', 69, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (477, 44, 'provider_id', NULL, 'int', 'Long', 'providerId', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (478, 44, 'followup_id', NULL, 'int', 'Long', 'followupId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (479, 44, 'provider_name', NULL, 'varchar(50)', 'String', 'providerName', '0', '0', '0', '1', '1', '1', '1', 'LIKE', 'input', '', 3, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (480, 44, 'title', NULL, 'enum(\'住院医师\',\'主治医师\',\'副主任医师\',\'主任医师\')', 'String', 'title', '0', '0', '0', '1', '1', '1', '1', 'EQ', NULL, '', 4, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (481, 45, 'test_id', NULL, 'int', 'Long', 'testId', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (482, 45, 'followup_id', NULL, 'int', 'Long', 'followupId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (483, 45, 'lung_test_date', NULL, 'date', 'Date', 'lungTestDate', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'datetime', '', 3, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (484, 45, 'ic', NULL, 'float', 'Long', 'ic', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (485, 45, 'mef50', NULL, 'float', 'Long', 'mef50', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (486, 45, 'fev1', NULL, 'float', 'Long', 'fev1', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (487, 45, 'fvc', NULL, 'float', 'Long', 'fvc', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (488, 45, 'mmef75_25', NULL, 'float', 'Long', 'mmef7525', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (489, 45, 'fev1_fvc_ratio', NULL, 'float', 'Long', 'fev1FvcRatio', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 9, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (490, 45, 'mef25', NULL, 'float', 'Long', 'mef25', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 10, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (491, 45, 'mef75', NULL, 'float', 'Long', 'mef75', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 11, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (492, 45, 'mvv', NULL, 'float', 'Long', 'mvv', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 12, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (493, 45, 'fev1_vcmax_ratio', NULL, 'float', 'Long', 'fev1VcmaxRatio', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 13, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (494, 45, 'vcmax', NULL, 'float', 'Long', 'vcmax', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 14, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (495, 45, 'lung_function_conclusion', NULL, 'text', 'String', 'lungFunctionConclusion', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'textarea', '', 15, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (496, 45, 'bronchodilation_test_date', NULL, 'date', 'Date', 'bronchodilationTestDate', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'datetime', '', 16, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (497, 45, 'bronchodilation_result', NULL, 'enum(\'阳性\',\'阴性\')', 'String', 'bronchodilationResult', '0', '0', '0', '1', '1', '1', '1', 'EQ', NULL, '', 17, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (498, 45, 'bronchial_challenge_test_date', NULL, 'date', 'Date', 'bronchialChallengeTestDate', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'datetime', '', 18, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (499, 45, 'bronchial_challenge_result', NULL, 'enum(\'阳性\',\'阴性\')', 'String', 'bronchialChallengeResult', '0', '0', '0', '1', '1', '1', '1', 'EQ', NULL, '', 19, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (500, 45, 'tidal_test_date', NULL, 'date', 'Date', 'tidalTestDate', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'datetime', '', 20, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (501, 45, 'wt_per_kg', NULL, 'float', 'Long', 'wtPerKg', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 21, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (502, 45, 'rr', NULL, 'int', 'Long', 'rr', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 22, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (503, 45, 'ti', NULL, 'float', 'Long', 'ti', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 23, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (504, 45, 'te', NULL, 'float', 'Long', 'te', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 24, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (505, 45, 'ti_te_ratio', NULL, 'float', 'Long', 'tiTeRatio', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 25, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (506, 45, 'tptef', NULL, 'float', 'Long', 'tptef', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 26, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (507, 45, 'vptef', NULL, 'float', 'Long', 'vptef', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 27, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (508, 45, 'tptef_te_ratio', NULL, 'float', 'Long', 'tptefTeRatio', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 28, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (509, 45, 'vpef_ve_ratio', NULL, 'float', 'Long', 'vpefVeRatio', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 29, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (510, 45, 'ptef', NULL, 'float', 'Long', 'ptef', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 30, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (511, 45, 'tef50_tif50_ratio', NULL, 'float', 'Long', 'tef50Tif50Ratio', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 31, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (512, 45, 'tef50', NULL, 'float', 'Long', 'tef50', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 32, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (513, 45, 'tef25', NULL, 'float', 'Long', 'tef25', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 33, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (514, 45, 'tef25_75', NULL, 'float', 'Long', 'tef2575', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 34, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (515, 46, 'questionnaire_id', NULL, 'int', 'Long', 'questionnaireId', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (516, 46, 'patient_id', NULL, 'varchar(20)', 'String', 'patientId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (517, 46, 'score_date', NULL, 'date', 'Date', 'scoreDate', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'datetime', '', 3, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (518, 46, 'act_score', NULL, 'int', 'Long', 'actScore', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (519, 46, 'c_act_score', NULL, 'int', 'Long', 'cActScore', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (520, 46, 'track_score', NULL, 'int', 'Long', 'trackScore', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (521, 46, 'symptom_medication_score', NULL, 'int', 'Long', 'symptomMedicationScore', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (522, 46, 'cdlqi_score', NULL, 'int', 'Long', 'cdlqiScore', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (523, 46, 'scoard_score', NULL, 'int', 'Long', 'scoardScore', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 9, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (524, 46, 'idqol_score', NULL, 'int', 'Long', 'idqolScore', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 10, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (525, 46, 'rhinitis_vas_score', NULL, 'int', 'Long', 'rhinitisVasScore', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 11, 'admin', '2025-06-27 21:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (526, 47, 'summary_id', NULL, 'int', 'Long', 'summaryId', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2025-06-27 21:31:51', '', NULL);
INSERT INTO `gen_table_column` VALUES (527, 47, 'patient_id', NULL, 'varchar(20)', 'String', 'patientId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2025-06-27 21:31:51', '', NULL);
INSERT INTO `gen_table_column` VALUES (528, 47, 'symptom_improvement', NULL, 'text', 'String', 'symptomImprovement', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'textarea', '', 3, 'admin', '2025-06-27 21:31:51', '', NULL);
INSERT INTO `gen_table_column` VALUES (529, 47, 'physical_development', NULL, 'text', 'String', 'physicalDevelopment', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'textarea', '', 4, 'admin', '2025-06-27 21:31:51', '', NULL);
INSERT INTO `gen_table_column` VALUES (530, 47, 'adverse_reaction', NULL, 'text', 'String', 'adverseReaction', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'textarea', '', 5, 'admin', '2025-06-27 21:31:51', '', NULL);
INSERT INTO `gen_table_column` VALUES (531, 47, 'reaction_management', NULL, 'text', 'String', 'reactionManagement', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'textarea', '', 6, 'admin', '2025-06-27 21:31:51', '', NULL);
INSERT INTO `gen_table_column` VALUES (532, 48, 'symptom_id', '症状号', 'int', 'Long', 'symptomId', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2025-06-27 21:31:51', '', '2025-06-27 21:44:38');
INSERT INTO `gen_table_column` VALUES (533, 48, 'followup_id', '随访者号', 'int', 'Long', 'followupId', '0', '0', '1', '1', '1', '1', '0', 'EQ', 'input', '', 2, 'admin', '2025-06-27 21:31:51', '', '2025-06-27 21:44:38');
INSERT INTO `gen_table_column` VALUES (534, 48, 'itchy_nose', '鼻痒', 'tinyint(1)', 'Integer', 'itchyNose', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 3, 'admin', '2025-06-27 21:31:51', '', '2025-06-27 21:44:38');
INSERT INTO `gen_table_column` VALUES (535, 48, 'sneezing', '喷嚏', 'tinyint(1)', 'Integer', 'sneezing', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 4, 'admin', '2025-06-27 21:31:51', '', '2025-06-27 21:44:38');
INSERT INTO `gen_table_column` VALUES (536, 48, 'clear_discharge', '流清涕', 'tinyint(1)', 'Integer', 'clearDischarge', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 5, 'admin', '2025-06-27 21:31:51', '', '2025-06-27 21:44:38');
INSERT INTO `gen_table_column` VALUES (537, 48, 'nasal_congestion', '鼻塞', 'tinyint(1)', 'Integer', 'nasalCongestion', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 6, 'admin', '2025-06-27 21:31:51', '', '2025-06-27 21:44:38');
INSERT INTO `gen_table_column` VALUES (538, 48, 'itchy_eyes', '眼痒', 'tinyint(1)', 'Integer', 'itchyEyes', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 7, 'admin', '2025-06-27 21:31:51', '', '2025-06-27 21:44:38');
INSERT INTO `gen_table_column` VALUES (539, 48, 'tearing', '流泪', 'tinyint(1)', 'Integer', 'tearing', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 8, 'admin', '2025-06-27 21:31:51', '', '2025-06-27 21:44:38');
INSERT INTO `gen_table_column` VALUES (540, 48, 'red_eyes', '眼红', 'tinyint(1)', 'Integer', 'redEyes', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 9, 'admin', '2025-06-27 21:31:51', '', '2025-06-27 21:44:38');
INSERT INTO `gen_table_column` VALUES (541, 48, 'eye_burning', '眼灼热感', 'tinyint(1)', 'Integer', 'eyeBurning', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 10, 'admin', '2025-06-27 21:31:51', '', '2025-06-27 21:44:38');
INSERT INTO `gen_table_column` VALUES (542, 48, 'itchy_throat', '咽痒', 'tinyint(1)', 'Integer', 'itchyThroat', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 11, 'admin', '2025-06-27 21:31:51', '', '2025-06-27 21:44:38');
INSERT INTO `gen_table_column` VALUES (543, 48, 'fever', '发热', 'tinyint(1)', 'Integer', 'fever', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 12, 'admin', '2025-06-27 21:31:51', '', '2025-06-27 21:44:38');
INSERT INTO `gen_table_column` VALUES (544, 48, 'mouth_breathing', '张口呼吸', 'tinyint(1)', 'Integer', 'mouthBreathing', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 13, 'admin', '2025-06-27 21:31:51', '', '2025-06-27 21:44:38');
INSERT INTO `gen_table_column` VALUES (545, 48, 'snoring', '打鼾', 'tinyint(1)', 'Integer', 'snoring', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 14, 'admin', '2025-06-27 21:31:51', '', '2025-06-27 21:44:38');
INSERT INTO `gen_table_column` VALUES (546, 48, 'cough', '咳嗽', 'tinyint(1)', 'Integer', 'cough', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 15, 'admin', '2025-06-27 21:31:51', '', '2025-06-27 21:44:38');
INSERT INTO `gen_table_column` VALUES (547, 48, 'wheezing', '喘息', 'tinyint(1)', 'Integer', 'wheezing', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 16, 'admin', '2025-06-27 21:31:51', '', '2025-06-27 21:44:38');
INSERT INTO `gen_table_column` VALUES (548, 48, 'dyspnea', '气促', 'tinyint(1)', 'Integer', 'dyspnea', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 17, 'admin', '2025-06-27 21:31:51', '', '2025-06-27 21:44:38');
INSERT INTO `gen_table_column` VALUES (549, 48, 'chest_tightness', '胸闷', 'tinyint(1)', 'Integer', 'chestTightness', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 18, 'admin', '2025-06-27 21:31:51', '', '2025-06-27 21:44:38');
INSERT INTO `gen_table_column` VALUES (550, 48, 'sighing', '长叹气', 'tinyint(1)', 'Integer', 'sighing', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 19, 'admin', '2025-06-27 21:31:51', '', '2025-06-27 21:44:38');
INSERT INTO `gen_table_column` VALUES (551, 48, 'activity_limitation', '活动受限', 'tinyint(1)', 'Integer', 'activityLimitation', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 20, 'admin', '2025-06-27 21:31:51', '', '2025-06-27 21:44:38');
INSERT INTO `gen_table_column` VALUES (552, 48, 'nighttime_awake', '夜间憋醒', 'tinyint(1)', 'Integer', 'nighttimeAwake', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 21, 'admin', '2025-06-27 21:31:51', '', '2025-06-27 21:44:38');
INSERT INTO `gen_table_column` VALUES (553, 48, 'morning_night_worse', '夜间及晨起症状加重', 'tinyint(1)', 'Integer', 'morningNightWorse', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 22, 'admin', '2025-06-27 21:31:51', '', '2025-06-27 21:44:38');
INSERT INTO `gen_table_column` VALUES (554, 48, 'rash', '皮瘆', 'tinyint(1)', 'Integer', 'rash', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 23, 'admin', '2025-06-27 21:31:51', '', '2025-06-27 21:44:38');
INSERT INTO `gen_table_column` VALUES (555, 48, 'itching', '瘙痒', 'tinyint(1)', 'Integer', 'itching', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 24, 'admin', '2025-06-27 21:31:51', '', '2025-06-27 21:44:38');
INSERT INTO `gen_table_column` VALUES (556, 48, 'pain', '疼痛', 'tinyint(1)', 'Integer', 'pain', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 25, 'admin', '2025-06-27 21:31:51', '', '2025-06-27 21:44:38');
INSERT INTO `gen_table_column` VALUES (557, 48, 'sleep_disorder', '睡眠障碍', 'tinyint(1)', 'Integer', 'sleepDisorder', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 26, 'admin', '2025-06-27 21:31:51', '', '2025-06-27 21:44:38');
INSERT INTO `gen_table_column` VALUES (558, 48, 'severity', '严重程度', 'enum(\'轻度\',\'中度\',\'重度\',\'极重度\')', 'String', 'severity', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 27, 'admin', '2025-06-27 21:31:51', '', '2025-06-27 21:44:38');
INSERT INTO `gen_table_column` VALUES (559, 48, 'frequency_pattern', '症状频率', 'text', 'String', 'frequencyPattern', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'textarea', '', 28, 'admin', '2025-06-27 21:31:51', '', '2025-06-27 21:44:38');
INSERT INTO `gen_table_column` VALUES (560, 48, 'start_date', '症状开始时间', 'date', 'Date', 'startDate', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'datetime', '', 29, 'admin', '2025-06-27 21:31:51', '', '2025-06-27 21:44:38');
INSERT INTO `gen_table_column` VALUES (561, 48, 'trigger_smoke', '诱因吸烟', 'tinyint(1)', 'Integer', 'triggerSmoke', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 30, 'admin', '2025-06-27 21:31:51', '', '2025-06-27 21:44:38');
INSERT INTO `gen_table_column` VALUES (562, 48, 'trigger_dust_mite', '诱因尘螨', 'tinyint(1)', 'Integer', 'triggerDustMite', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 31, 'admin', '2025-06-27 21:31:51', '', '2025-06-27 21:44:38');
INSERT INTO `gen_table_column` VALUES (563, 48, 'trigger_pollen', '诱因花粉', 'tinyint(1)', 'Integer', 'triggerPollen', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 32, 'admin', '2025-06-27 21:31:51', '', '2025-06-27 21:44:38');
INSERT INTO `gen_table_column` VALUES (564, 48, 'trigger_virus', '诱因病毒感染', 'tinyint(1)', 'Integer', 'triggerVirus', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 33, 'admin', '2025-06-27 21:31:51', '', '2025-06-27 21:44:38');
INSERT INTO `gen_table_column` VALUES (565, 48, 'trigger_mold', '诱因霉菌', 'tinyint(1)', 'Integer', 'triggerMold', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 34, 'admin', '2025-06-27 21:31:51', '', '2025-06-27 21:44:38');
INSERT INTO `gen_table_column` VALUES (566, 48, 'trigger_cold_air', '诱因冷空气', 'tinyint(1)', 'Integer', 'triggerColdAir', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 35, 'admin', '2025-06-27 21:31:51', '', '2025-06-27 21:44:38');
INSERT INTO `gen_table_column` VALUES (567, 48, 'trigger_weather_change', '诱因气候改变', 'tinyint(1)', 'Integer', 'triggerWeatherChange', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 36, 'admin', '2025-06-27 21:31:51', '', '2025-06-27 21:44:38');
INSERT INTO `gen_table_column` VALUES (568, 48, 'trigger_exercise', '诱因运动', 'tinyint(1)', 'Integer', 'triggerExercise', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 37, 'admin', '2025-06-27 21:31:51', '', '2025-06-27 21:44:38');
INSERT INTO `gen_table_column` VALUES (569, 48, 'trigger_crying', '诱因哭闹', 'tinyint(1)', 'Integer', 'triggerCrying', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 38, 'admin', '2025-06-27 21:31:51', '', '2025-06-27 21:44:38');
INSERT INTO `gen_table_column` VALUES (570, 48, 'trigger_food', '诱因食物', 'tinyint(1)', 'Integer', 'triggerFood', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 39, 'admin', '2025-06-27 21:31:51', '', '2025-06-27 21:44:38');
INSERT INTO `gen_table_column` VALUES (571, 48, 'trigger_medication', '诱因药物', 'tinyint(1)', 'Integer', 'triggerMedication', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 40, 'admin', '2025-06-27 21:31:51', '', '2025-06-27 21:44:38');
INSERT INTO `gen_table_column` VALUES (572, 48, 'trigger_other', '诱因其他', 'tinyint(1)', 'Integer', 'triggerOther', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 41, 'admin', '2025-06-27 21:31:51', '', '2025-06-27 21:44:38');
INSERT INTO `gen_table_column` VALUES (573, 49, 'followup_id', NULL, 'int', 'Long', 'followupId', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2025-06-27 21:31:51', '', NULL);
INSERT INTO `gen_table_column` VALUES (574, 49, 'patient_id', NULL, 'varchar(20)', 'String', 'patientId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2025-06-27 21:31:51', '', NULL);
INSERT INTO `gen_table_column` VALUES (575, 49, 'visit_date', NULL, 'date', 'Date', 'visitDate', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'datetime', '', 3, 'admin', '2025-06-27 21:31:51', '', NULL);
INSERT INTO `gen_table_column` VALUES (576, 49, 'visit_type', NULL, 'varchar(20)', 'String', 'visitType', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'select', '', 4, 'admin', '2025-06-27 21:31:51', '', NULL);
INSERT INTO `gen_table_column` VALUES (577, 50, 'prim_id', '一级亲属号', 'int', 'Long', 'primId', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2025-06-28 11:38:12', '', '2025-06-28 14:44:42');
INSERT INTO `gen_table_column` VALUES (578, 50, 'survey_id', '患者号', 'int', 'Long', 'surveyId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2025-06-28 11:38:12', '', '2025-06-28 14:44:42');
INSERT INTO `gen_table_column` VALUES (579, 50, 'relation', '关系', 'varchar(20)', 'String', 'relation', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 3, 'admin', '2025-06-28 11:38:12', '', '2025-06-28 14:44:42');
INSERT INTO `gen_table_column` VALUES (580, 50, 'diseases', '疾病名称', 'text', 'String', 'diseases', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'textarea', '', 4, 'admin', '2025-06-28 11:38:12', '', '2025-06-28 14:44:42');
INSERT INTO `gen_table_column` VALUES (581, 51, 'sec_id', '二级亲属号', 'int', 'Long', 'secId', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2025-06-28 11:38:12', '', '2025-06-28 14:20:44');
INSERT INTO `gen_table_column` VALUES (582, 51, 'survey_id', '患者号', 'int', 'Long', 'surveyId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2025-06-28 11:38:12', '', '2025-06-28 14:20:44');
INSERT INTO `gen_table_column` VALUES (583, 51, 'relation', '关系', 'varchar(20)', 'String', 'relation', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 3, 'admin', '2025-06-28 11:38:12', '', '2025-06-28 14:20:44');
INSERT INTO `gen_table_column` VALUES (584, 51, 'diseases', '疾病名称', 'text', 'String', 'diseases', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'textarea', '', 4, 'admin', '2025-06-28 11:38:12', '', '2025-06-28 14:20:44');
INSERT INTO `gen_table_column` VALUES (585, 52, 'env_area_id', '城乡环境号', 'int', 'Long', 'envAreaId', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2025-06-28 11:38:12', '', '2025-06-28 14:40:11');
INSERT INTO `gen_table_column` VALUES (586, 52, 'survey_id', '患者号', 'int', 'Long', 'surveyId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2025-06-28 11:38:12', '', '2025-06-28 14:40:11');
INSERT INTO `gen_table_column` VALUES (587, 52, 'urban_pm25_avg', '城市PM2.5年均浓度', 'float', 'Long', 'urbanPm25Avg', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 3, 'admin', '2025-06-28 11:38:12', '', '2025-06-28 14:40:11');
INSERT INTO `gen_table_column` VALUES (588, 52, 'urban_pm25_seasonal', '城市PM2.5季节性变化', 'text', 'String', 'urbanPm25Seasonal', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'textarea', '', 4, 'admin', '2025-06-28 11:38:12', '', '2025-06-28 14:40:11');
INSERT INTO `gen_table_column` VALUES (589, 52, 'urban_pollen_types', '城市花粉类型', 'text', 'String', 'urbanPollenTypes', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'textarea', '', 5, 'admin', '2025-06-28 11:38:12', '', '2025-06-28 14:40:11');
INSERT INTO `gen_table_column` VALUES (590, 52, 'urban_pollen_distribution', '城市花粉月度分布', 'text', 'String', 'urbanPollenDistribution', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'textarea', '', 6, 'admin', '2025-06-28 11:38:12', '', '2025-06-28 14:40:11');
INSERT INTO `gen_table_column` VALUES (591, 52, 'urban_pollen_peak', '城市花粉峰值浓度', 'float', 'Long', 'urbanPollenPeak', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 7, 'admin', '2025-06-28 11:38:12', '', '2025-06-28 14:40:11');
INSERT INTO `gen_table_column` VALUES (592, 52, 'urban_pollutants', '城市其他污染物', 'text', 'String', 'urbanPollutants', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'textarea', '', 8, 'admin', '2025-06-28 11:38:12', '', '2025-06-28 14:40:11');
INSERT INTO `gen_table_column` VALUES (593, 52, 'urban_monitor_location', '城市监测点', 'enum(\'交通区\',\'工业区\',\'居民区\')', 'String', 'urbanMonitorLocation', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 9, 'admin', '2025-06-28 11:38:12', '', '2025-06-28 14:40:11');
INSERT INTO `gen_table_column` VALUES (594, 52, 'rural_pm25_burning', '农村PM2.5燃烧期浓度', 'float', 'Long', 'ruralPm25Burning', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 10, 'admin', '2025-06-28 11:38:12', '', '2025-06-28 14:40:11');
INSERT INTO `gen_table_column` VALUES (595, 52, 'rural_pm25_avg', '农村Pm2.5年均值', 'float', 'Long', 'ruralPm25Avg', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 11, 'admin', '2025-06-28 11:38:12', '', '2025-06-28 14:40:11');
INSERT INTO `gen_table_column` VALUES (596, 52, 'rural_pollen_types', '农村花粉类型', 'text', 'String', 'ruralPollenTypes', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'textarea', '', 12, 'admin', '2025-06-28 11:38:12', '', '2025-06-28 14:40:11');
INSERT INTO `gen_table_column` VALUES (597, 52, 'rural_biomass_pollution', '农村生物质燃料导致室内污染', 'tinyint(1)', 'Integer', 'ruralBiomassPollution', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 13, 'admin', '2025-06-28 11:38:12', '', '2025-06-28 14:40:11');
INSERT INTO `gen_table_column` VALUES (598, 52, 'rural_water_source', '农村饮用水类型', 'enum(\'自来水\',\'纯净水\',\'井水\',\'其他\')', 'String', 'ruralWaterSource', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 14, 'admin', '2025-06-28 11:38:12', '', '2025-06-28 14:40:11');
INSERT INTO `gen_table_column` VALUES (599, 53, 'survey_id', '基本信息号', 'int', 'Long', 'surveyId', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2025-06-28 11:38:12', '', '2025-06-28 14:56:18');
INSERT INTO `gen_table_column` VALUES (600, 53, 'patient_id', '病人号', 'varchar(20)', 'String', 'patientId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2025-06-28 11:38:12', '', '2025-06-28 14:56:18');
INSERT INTO `gen_table_column` VALUES (601, 53, 'survey_date', '调查时间', 'date', 'Date', 'surveyDate', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'datetime', '', 3, 'admin', '2025-06-28 11:38:12', '', '2025-06-28 14:56:18');
INSERT INTO `gen_table_column` VALUES (602, 53, 'child_name', '姓名', 'varchar(50)', 'String', 'childName', '0', '0', '0', '1', '1', '1', '0', 'LIKE', 'input', '', 4, 'admin', '2025-06-28 11:38:12', '', '2025-06-28 14:56:18');
INSERT INTO `gen_table_column` VALUES (603, 53, 'gender', '性别', 'char(1)', 'String', 'gender', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 5, 'admin', '2025-06-28 11:38:12', '', '2025-06-28 14:56:18');
INSERT INTO `gen_table_column` VALUES (604, 53, 'age', '年龄', 'int', 'Long', 'age', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 6, 'admin', '2025-06-28 11:38:12', '', '2025-06-28 14:56:18');
INSERT INTO `gen_table_column` VALUES (605, 53, 'residence_type', '居住地类型', 'enum(\'城市\',\'农村\')', 'String', 'residenceType', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 7, 'admin', '2025-06-28 11:38:12', '', '2025-06-28 14:56:18');
INSERT INTO `gen_table_column` VALUES (606, 53, 'residence_years', '居住时长', 'int', 'Long', 'residenceYears', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 8, 'admin', '2025-06-28 11:38:12', '', '2025-06-28 14:56:18');
INSERT INTO `gen_table_column` VALUES (607, 53, 'address', '家庭住址', 'varchar(255)', 'String', 'address', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 9, 'admin', '2025-06-28 11:38:12', '', '2025-06-28 14:56:18');
INSERT INTO `gen_table_column` VALUES (608, 53, 'height', '身高', 'float', 'Long', 'height', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 10, 'admin', '2025-06-28 11:38:12', '', '2025-06-28 14:56:18');
INSERT INTO `gen_table_column` VALUES (609, 53, 'weight', '体重', 'float', 'Long', 'weight', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 11, 'admin', '2025-06-28 11:38:12', '', '2025-06-28 14:56:18');
INSERT INTO `gen_table_column` VALUES (610, 53, 'allergy_history', '既往过敏史', 'tinyint(1)', 'Integer', 'allergyHistory', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 12, 'admin', '2025-06-28 11:38:12', '', '2025-06-28 14:56:18');
INSERT INTO `gen_table_column` VALUES (611, 53, 'has_rhinitis', '既往鼻炎', 'tinyint(1)', 'Integer', 'hasRhinitis', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 13, 'admin', '2025-06-28 11:38:12', '', '2025-06-28 14:56:18');
INSERT INTO `gen_table_column` VALUES (612, 53, 'has_asthma', '既往哮喘', 'tinyint(1)', 'Integer', 'hasAsthma', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 14, 'admin', '2025-06-28 11:38:12', '', '2025-06-28 14:56:18');
INSERT INTO `gen_table_column` VALUES (613, 53, 'has_dermatitis', '既往皮炎', 'tinyint(1)', 'Integer', 'hasDermatitis', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 15, 'admin', '2025-06-28 11:38:12', '', '2025-06-28 14:56:18');
INSERT INTO `gen_table_column` VALUES (614, 53, 'has_conjunctivitis', '既往结膜炎', 'tinyint(1)', 'Integer', 'hasConjunctivitis', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 16, 'admin', '2025-06-28 11:38:12', '', '2025-06-28 14:56:18');
INSERT INTO `gen_table_column` VALUES (615, 53, 'has_urticaria', '既往荨麻疹', 'tinyint(1)', 'Integer', 'hasUrticaria', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 17, 'admin', '2025-06-28 11:38:12', '', '2025-06-28 14:56:18');
INSERT INTO `gen_table_column` VALUES (616, 53, 'diagnosed_rhinitis', '诊断鼻炎', 'tinyint(1)', 'Integer', 'diagnosedRhinitis', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 18, 'admin', '2025-06-28 11:38:12', '', '2025-06-28 14:56:18');
INSERT INTO `gen_table_column` VALUES (617, 53, 'diagnosed_asthma', '诊断哮喘', 'tinyint(1)', 'Integer', 'diagnosedAsthma', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 19, 'admin', '2025-06-28 11:38:12', '', '2025-06-28 14:56:18');
INSERT INTO `gen_table_column` VALUES (618, 53, 'diagnosed_dermatitis', '诊断皮炎', 'tinyint(1)', 'Integer', 'diagnosedDermatitis', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 20, 'admin', '2025-06-28 11:38:12', '', '2025-06-28 14:56:18');
INSERT INTO `gen_table_column` VALUES (619, 53, 'diagnosed_conjunctivitis', '诊断结膜炎', 'tinyint(1)', 'Integer', 'diagnosedConjunctivitis', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 21, 'admin', '2025-06-28 11:38:12', '', '2025-06-28 14:56:18');
INSERT INTO `gen_table_column` VALUES (620, 53, 'diagnosed_urticaria', '诊断荨麻疹', 'tinyint(1)', 'Integer', 'diagnosedUrticaria', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 22, 'admin', '2025-06-28 11:38:12', '', '2025-06-28 14:56:18');
INSERT INTO `gen_table_column` VALUES (621, 54, 'confound_id', '其他因素号', 'int', 'Long', 'confoundId', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2025-06-28 11:38:12', '', '2025-06-28 14:58:04');
INSERT INTO `gen_table_column` VALUES (622, 54, 'survey_id', '患者号', 'int', 'Long', 'surveyId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2025-06-28 11:38:12', '', '2025-06-28 14:58:04');
INSERT INTO `gen_table_column` VALUES (623, 54, 'diet_type', '饮食习惯', 'enum(\'高加工食品\',\'传统饮食\')', 'String', 'dietType', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 3, 'admin', '2025-06-28 11:38:12', '', '2025-06-28 14:58:04');
INSERT INTO `gen_table_column` VALUES (624, 54, 'vitamin_d_400u', '每日摄入维生素D400u', 'tinyint(1)', 'Integer', 'vitaminD400u', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 4, 'admin', '2025-06-28 11:38:12', '', '2025-06-28 14:58:04');
INSERT INTO `gen_table_column` VALUES (625, 54, 'vitamin_d_years', '口服周期', 'float', 'Long', 'vitaminDYears', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 5, 'admin', '2025-06-28 11:38:12', '', '2025-06-28 14:58:04');
INSERT INTO `gen_table_column` VALUES (626, 54, 'omega3_intake', 'Omega-3摄入量', 'text', 'String', 'omega3Intake', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'textarea', '', 6, 'admin', '2025-06-28 11:38:12', '', '2025-06-28 14:58:04');
INSERT INTO `gen_table_column` VALUES (627, 54, 'stress_level_pss10', '长期压力水平', 'int', 'Long', 'stressLevelPss10', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 7, 'admin', '2025-06-28 11:38:12', '', '2025-06-28 14:58:04');
INSERT INTO `gen_table_column` VALUES (628, 54, 'mental_state_phq9_gad7', '焦虑或抑郁状态', 'text', 'String', 'mentalStatePhq9Gad7', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'textarea', '', 8, 'admin', '2025-06-28 11:38:12', '', '2025-06-28 14:58:04');
INSERT INTO `gen_table_column` VALUES (629, 54, 'vaccine_on_schedule', '按计划接种', 'tinyint(1)', 'Integer', 'vaccineOnSchedule', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 9, 'admin', '2025-06-28 11:38:12', '', '2025-06-28 14:58:04');
INSERT INTO `gen_table_column` VALUES (630, 54, 'antibiotic_freq', '抗生素使用频率', 'enum(\'每月\',\'每季度\',\'每年\')', 'String', 'antibioticFreq', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 10, 'admin', '2025-06-28 11:38:12', '', '2025-06-28 14:58:04');
INSERT INTO `gen_table_column` VALUES (631, 54, 'breastfeeding', '母乳喂养', 'tinyint(1)', 'Integer', 'breastfeeding', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 11, 'admin', '2025-06-28 11:38:12', '', '2025-06-28 14:58:04');
INSERT INTO `gen_table_column` VALUES (632, 54, 'breastfeeding_months', '具体月数', 'int', 'Long', 'breastfeedingMonths', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 12, 'admin', '2025-06-28 11:38:12', '', '2025-06-28 14:58:04');
INSERT INTO `gen_table_column` VALUES (633, 54, 'delivery_type', '分娩情况', 'enum(\'自然分娩\',\'剖宫产\')', 'String', 'deliveryType', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 13, 'admin', '2025-06-28 11:38:12', '', '2025-06-28 14:58:04');
INSERT INTO `gen_table_column` VALUES (634, 54, 'pet_exposure_stage', '宠物接触年龄', 'enum(\'婴儿期\',\'幼儿期\',\'学龄前期\',\'学龄期\')', 'String', 'petExposureStage', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 14, 'admin', '2025-06-28 11:38:12', '', '2025-06-28 14:58:04');
INSERT INTO `gen_table_column` VALUES (635, 54, 'farm_exposure', '农场环境暴露', 'tinyint(1)', 'Integer', 'farmExposure', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 15, 'admin', '2025-06-28 11:38:12', '', '2025-06-28 14:58:04');
INSERT INTO `gen_table_column` VALUES (636, 54, 'farm_exposure_months', '具体月数', 'int', 'Long', 'farmExposureMonths', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 16, 'admin', '2025-06-28 11:38:12', '', '2025-06-28 14:58:04');
INSERT INTO `gen_table_column` VALUES (637, 54, 'absent_days_allergy', '缺课天数', 'int', 'Long', 'absentDaysAllergy', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 17, 'admin', '2025-06-28 11:38:12', '', '2025-06-28 14:58:04');
INSERT INTO `gen_table_column` VALUES (638, 54, 'annual_medical_cost', '每年人均医疗费用支出', 'decimal(10,2)', 'BigDecimal', 'annualMedicalCost', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 18, 'admin', '2025-06-28 11:38:12', '', '2025-06-28 14:58:04');
INSERT INTO `gen_table_column` VALUES (639, 55, 'env_id', '家庭环境号', 'int', 'Long', 'envId', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2025-06-28 11:38:12', '', '2025-06-28 14:52:33');
INSERT INTO `gen_table_column` VALUES (640, 55, 'survey_id', '患者号', 'int', 'Long', 'surveyId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2025-06-28 11:38:12', '', '2025-06-28 14:52:33');
INSERT INTO `gen_table_column` VALUES (641, 55, 'house_type', '房屋类型', 'enum(\'平房\',\'楼房\',\'别墅\',\'其他\')', 'String', 'houseType', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 3, 'admin', '2025-06-28 11:38:12', '', '2025-06-28 14:52:33');
INSERT INTO `gen_table_column` VALUES (642, 55, 'building_material', '建筑材料', 'enum(\'木质\',\'混凝土\',\'其他\')', 'String', 'buildingMaterial', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 4, 'admin', '2025-06-28 11:38:12', '', '2025-06-28 14:52:33');
INSERT INTO `gen_table_column` VALUES (643, 55, 'ventilation_freq', '通风频率', 'enum(\'每日\',\'每周\',\'偶尔\')', 'String', 'ventilationFreq', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 5, 'admin', '2025-06-28 11:38:12', '', '2025-06-28 14:52:33');
INSERT INTO `gen_table_column` VALUES (644, 55, 'ac_usage_season', '空调使用季节', 'enum(\'几乎不用\',\'夏季每日\',\'全年高频\')', 'String', 'acUsageSeason', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 6, 'admin', '2025-06-28 11:38:12', '', '2025-06-28 14:52:33');
INSERT INTO `gen_table_column` VALUES (645, 55, 'ac_usage_freq', '空调使用频率', 'enum(\'每日\',\'每周3-5天\',\'偶尔\')', 'String', 'acUsageFreq', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 7, 'admin', '2025-06-28 11:38:12', '', '2025-06-28 14:52:33');
INSERT INTO `gen_table_column` VALUES (646, 55, 'ac_temp_setting', '空调温度设定', 'enum(\'＜24℃\',\'24-26℃\',\'＞26℃\')', 'String', 'acTempSetting', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 8, 'admin', '2025-06-28 11:38:12', '', '2025-06-28 14:52:33');
INSERT INTO `gen_table_column` VALUES (647, 55, 'ac_modes', '空调模式', 'text', 'String', 'acModes', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'textarea', '', 9, 'admin', '2025-06-28 11:38:12', '', '2025-06-28 14:52:33');
INSERT INTO `gen_table_column` VALUES (648, 55, 'ac_filter_cleaning_freq', '空调滤网清洁频率', 'enum(\'每月\',\'每季度\',\'每年\',\'从未清洁\')', 'String', 'acFilterCleaningFreq', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 10, 'admin', '2025-06-28 11:38:12', '', '2025-06-28 14:52:33');
INSERT INTO `gen_table_column` VALUES (649, 55, 'heating_type', '暖气使用频率', 'text', 'String', 'heatingType', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 11, 'admin', '2025-06-28 11:38:12', '', '2025-06-28 14:52:33');
INSERT INTO `gen_table_column` VALUES (650, 55, 'heating_temp_range', '室温范围', 'enum(\'＜18℃\',\'18-22℃\',\'＞22℃\')', 'String', 'heatingTempRange', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 12, 'admin', '2025-06-28 11:38:12', '', '2025-06-28 14:52:33');
INSERT INTO `gen_table_column` VALUES (651, 55, 'has_carpet', '有无地毯', 'tinyint(1)', 'Integer', 'hasCarpet', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 13, 'admin', '2025-06-28 11:38:12', '', '2025-06-28 14:52:33');
INSERT INTO `gen_table_column` VALUES (652, 55, 'has_soft_toys', '有无毛绒玩具', 'tinyint(1)', 'Integer', 'hasSoftToys', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 14, 'admin', '2025-06-28 11:38:12', '', '2025-06-28 14:52:33');
INSERT INTO `gen_table_column` VALUES (653, 55, 'pm25_avg', 'PM2.5家庭年均浓度', 'float', 'Long', 'pm25Avg', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 15, 'admin', '2025-06-28 11:38:12', '', '2025-06-28 14:52:33');
INSERT INTO `gen_table_column` VALUES (654, 55, 'pollen_info', '花粉信息', 'text', 'String', 'pollenInfo', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'textarea', '', 16, 'admin', '2025-06-28 11:38:12', '', '2025-06-28 14:52:33');
INSERT INTO `gen_table_column` VALUES (655, 55, 'formaldehyde_level', '甲醛浓度', 'float', 'Long', 'formaldehydeLevel', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 17, 'admin', '2025-06-28 11:38:12', '', '2025-06-28 14:52:33');
INSERT INTO `gen_table_column` VALUES (656, 55, 'formaldehyde_test_time', '甲醛检测时间', 'date', 'Date', 'formaldehydeTestTime', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'datetime', '', 18, 'admin', '2025-06-28 11:38:12', '', '2025-06-28 14:52:33');
INSERT INTO `gen_table_column` VALUES (657, 55, 'dust_mite_level', '尘螨浓度', 'text', 'String', 'dustMiteLevel', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'textarea', '', 19, 'admin', '2025-06-28 11:38:12', '', '2025-06-28 14:52:33');
INSERT INTO `gen_table_column` VALUES (658, 55, 'other_allergens', '其他过敏源', 'text', 'String', 'otherAllergens', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'textarea', '', 20, 'admin', '2025-06-28 11:38:12', '', '2025-06-28 14:52:33');
INSERT INTO `gen_table_column` VALUES (659, 55, 'exercise_frequency', '运动频率', 'int', 'Long', 'exerciseFrequency', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 21, 'admin', '2025-06-28 11:38:12', '', '2025-06-28 14:52:33');
INSERT INTO `gen_table_column` VALUES (660, 55, 'exercise_duration', '运动时间', 'int', 'Long', 'exerciseDuration', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 22, 'admin', '2025-06-28 11:38:12', '', '2025-06-28 14:52:33');
INSERT INTO `gen_table_column` VALUES (661, 55, 'exercise_intensity', '运动强度', 'enum(\'轻\',\'中\',\'重\')', 'String', 'exerciseIntensity', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 23, 'admin', '2025-06-28 11:38:12', '', '2025-06-28 14:52:33');
INSERT INTO `gen_table_column` VALUES (662, 55, 'swimming', '有无游泳', 'tinyint(1)', 'Integer', 'swimming', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 24, 'admin', '2025-06-28 11:38:12', '', '2025-06-28 14:52:33');
INSERT INTO `gen_table_column` VALUES (663, 55, 'sleep_hours', '睡眠时长', 'float', 'Long', 'sleepHours', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 25, 'admin', '2025-06-28 11:38:12', '', '2025-06-28 14:52:33');
INSERT INTO `gen_table_column` VALUES (664, 55, 'insomnia', '有无失眠', 'tinyint(1)', 'Integer', 'insomnia', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 26, 'admin', '2025-06-28 11:38:12', '', '2025-06-28 14:52:33');
INSERT INTO `gen_table_column` VALUES (665, 55, 'circadian_disruption', '昼夜节律紊乱', 'tinyint(1)', 'Integer', 'circadianDisruption', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 27, 'admin', '2025-06-28 11:38:12', '', '2025-06-28 14:52:33');
INSERT INTO `gen_table_column` VALUES (666, 55, 'smoke_exposure_type', '烟酒暴露情况', 'enum(\'主动\',\'被动暴露\',\'无\')', 'String', 'smokeExposureType', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 28, 'admin', '2025-06-28 11:38:12', '', '2025-06-28 14:52:33');
INSERT INTO `gen_table_column` VALUES (667, 55, 'cleaning_freq', '清洁频率', 'enum(\'每日\',\'每周\',\'每月\')', 'String', 'cleaningFreq', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 29, 'admin', '2025-06-28 11:38:12', '', '2025-06-28 14:52:33');
INSERT INTO `gen_table_column` VALUES (668, 55, 'has_pets', '有无宠物', 'tinyint(1)', 'Integer', 'hasPets', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 30, 'admin', '2025-06-28 11:38:12', '', '2025-06-28 14:52:33');
INSERT INTO `gen_table_column` VALUES (669, 55, 'pet_types', '宠物类型', 'text', 'String', 'petTypes', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'textarea', '', 31, 'admin', '2025-06-28 11:38:12', '', '2025-06-28 14:52:33');
INSERT INTO `gen_table_column` VALUES (670, 55, 'pet_count', '宠物数量', 'int', 'Long', 'petCount', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 32, 'admin', '2025-06-28 11:38:12', '', '2025-06-28 14:52:33');
INSERT INTO `gen_table_column` VALUES (671, 55, 'lives_with_smoker', '吸烟者同居情况', 'tinyint(1)', 'Integer', 'livesWithSmoker', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 33, 'admin', '2025-06-28 11:38:12', '', '2025-06-28 14:52:33');
INSERT INTO `gen_table_column` VALUES (672, 55, 'cooking_fuel', '烹饪燃料', 'enum(\'天然气\',\'煤气\',\'生物质燃料\')', 'String', 'cookingFuel', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 34, 'admin', '2025-06-28 11:38:12', '', '2025-06-28 14:52:33');
INSERT INTO `gen_table_column` VALUES (673, 55, 'uses_air_purifier', '空气净化器使用', 'tinyint(1)', 'Integer', 'usesAirPurifier', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 35, 'admin', '2025-06-28 11:38:12', '', '2025-06-28 14:52:33');
INSERT INTO `gen_table_column` VALUES (674, 55, 'uses_vacuum_cleaner', '吸尘器使用', 'tinyint(1)', 'Integer', 'usesVacuumCleaner', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 36, 'admin', '2025-06-28 11:38:12', '', '2025-06-28 14:52:33');
INSERT INTO `gen_table_column` VALUES (675, 55, 'avoidance_quality', '过敏源回避措施执行情况', 'enum(\'优\',\'良\',\'差\')', 'String', 'avoidanceQuality', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 37, 'admin', '2025-06-28 11:38:12', '', '2025-06-28 14:52:33');
INSERT INTO `gen_table_column` VALUES (676, 56, 'family_env_id', '家族环境号', 'int', 'Long', 'familyEnvId', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2025-06-28 11:38:12', '', '2025-06-28 14:58:44');
INSERT INTO `gen_table_column` VALUES (677, 56, 'survey_id', '患者号', 'int', 'Long', 'surveyId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2025-06-28 11:38:12', '', '2025-06-28 14:58:44');
INSERT INTO `gen_table_column` VALUES (678, 56, 'shared_smoking_exposure', '共同暴露吸烟环境', 'tinyint(1)', 'Integer', 'sharedSmokingExposure', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 3, 'admin', '2025-06-28 11:38:12', '', '2025-06-28 14:58:44');
INSERT INTO `gen_table_column` VALUES (679, 57, 'learn_env_id', '学习/工作环境号', 'int', 'Long', 'learnEnvId', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2025-06-28 11:38:12', '', '2025-06-28 14:30:45');
INSERT INTO `gen_table_column` VALUES (680, 57, 'survey_id', '患者号', 'int', 'Long', 'surveyId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2025-06-28 11:38:12', '', '2025-06-28 14:30:45');
INSERT INTO `gen_table_column` VALUES (681, 57, 'location_type', '单位位置', 'enum(\'城市中心\',\'郊区\',\'农村\')', 'String', 'locationType', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 3, 'admin', '2025-06-28 11:38:12', '', '2025-06-28 14:30:45');
INSERT INTO `gen_table_column` VALUES (682, 57, 'ventilation_quality', '通风情况', 'enum(\'良好\',\'一般\',\'差\')', 'String', 'ventilationQuality', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 4, 'admin', '2025-06-28 11:38:12', '', '2025-06-28 14:30:45');
INSERT INTO `gen_table_column` VALUES (683, 57, 'pm25_annual', 'PM2.5年均值', 'float', 'Long', 'pm25Annual', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 5, 'admin', '2025-06-28 11:38:12', '', '2025-06-28 14:30:45');
INSERT INTO `gen_table_column` VALUES (684, 57, 'pollen_peak_concentration', '花粉季节性峰值浓度', 'float', 'Long', 'pollenPeakConcentration', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 6, 'admin', '2025-06-28 11:38:12', '', '2025-06-28 14:30:45');
INSERT INTO `gen_table_column` VALUES (685, 57, 'pollen_types', '花粉类型', 'text', 'String', 'pollenTypes', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'textarea', '', 7, 'admin', '2025-06-28 11:38:12', '', '2025-06-28 14:30:45');
INSERT INTO `gen_table_column` VALUES (686, 57, 'formaldehyde_level_workplace', '甲醛检测值', 'float', 'Long', 'formaldehydeLevelWorkplace', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 8, 'admin', '2025-06-28 11:38:12', '', '2025-06-28 14:30:45');
INSERT INTO `gen_table_column` VALUES (687, 57, 'has_carpet', '有无地毯', 'tinyint(1)', 'Integer', 'hasCarpet', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 9, 'admin', '2025-06-28 11:38:12', '', '2025-06-28 14:30:45');
INSERT INTO `gen_table_column` VALUES (688, 57, 'has_fabric_furniture', '有无布艺家具', 'tinyint(1)', 'Integer', 'hasFabricFurniture', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 10, 'admin', '2025-06-28 11:38:12', '', '2025-06-28 14:30:45');
INSERT INTO `gen_table_column` VALUES (689, 58, 'method_id', '检测方法号', 'int', 'Long', 'methodId', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2025-06-28 11:38:12', '', '2025-06-28 14:42:40');
INSERT INTO `gen_table_column` VALUES (690, 58, 'survey_id', '患者号', 'int', 'Long', 'surveyId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2025-06-28 11:38:12', '', '2025-06-28 14:42:40');
INSERT INTO `gen_table_column` VALUES (691, 58, 'pm25_detector_model', 'PM2.5监测异型号', 'varchar(100)', 'String', 'pm25DetectorModel', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 3, 'admin', '2025-06-28 11:38:12', '', '2025-06-28 14:42:40');
INSERT INTO `gen_table_column` VALUES (692, 58, 'pollen_gravity_settle', '重力沉降法', 'tinyint(1)', 'Integer', 'pollenGravitySettle', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 4, 'admin', '2025-06-28 11:38:12', '', '2025-06-28 14:42:40');
INSERT INTO `gen_table_column` VALUES (693, 58, 'pollen_volume_sampling', '体积采样法', 'tinyint(1)', 'Integer', 'pollenVolumeSampling', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 5, 'admin', '2025-06-28 11:38:12', '', '2025-06-28 14:42:40');
INSERT INTO `gen_table_column` VALUES (694, 58, 'pollen_molecular_detection', '分子检测', 'tinyint(1)', 'Integer', 'pollenMolecularDetection', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 6, 'admin', '2025-06-28 11:38:12', '', '2025-06-28 14:42:40');
INSERT INTO `gen_table_column` VALUES (695, 58, 'mite_protein_detection', '过敏源蛋白检测法', 'tinyint(1)', 'Integer', 'miteProteinDetection', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 7, 'admin', '2025-06-28 11:38:12', '', '2025-06-28 14:42:40');
INSERT INTO `gen_table_column` VALUES (696, 58, 'mite_microscope_count', '显微镜直接计数法', 'tinyint(1)', 'Integer', 'miteMicroscopeCount', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 8, 'admin', '2025-06-28 11:38:12', '', '2025-06-28 14:42:40');
INSERT INTO `gen_table_column` VALUES (697, 58, 'mite_pcr', 'PCR分子检测法', 'tinyint(1)', 'Integer', 'mitePcr', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 9, 'admin', '2025-06-28 11:38:12', '', '2025-06-28 14:42:40');
INSERT INTO `gen_table_column` VALUES (698, 58, 'mite_metabolite', '尘螨代谢产物检测法', 'tinyint(1)', 'Integer', 'miteMetabolite', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 10, 'admin', '2025-06-28 11:38:12', '', '2025-06-28 14:42:40');
INSERT INTO `gen_table_column` VALUES (699, 58, 'mite_air_sampling', '空气采样法', 'tinyint(1)', 'Integer', 'miteAirSampling', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 11, 'admin', '2025-06-28 11:38:12', '', '2025-06-28 14:42:40');
INSERT INTO `gen_table_column` VALUES (700, 58, 'mite_sensor_tech', '环境传感器技术', 'tinyint(1)', 'Integer', 'miteSensorTech', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 12, 'admin', '2025-06-28 11:38:12', '', '2025-06-28 14:42:40');
INSERT INTO `gen_table_column` VALUES (701, 59, 'provider_id', '信息号', 'int', 'Long', 'providerId', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2025-06-28 11:38:12', '', '2025-06-28 14:59:51');
INSERT INTO `gen_table_column` VALUES (702, 59, 'survey_id', '患者号', 'int', 'Long', 'surveyId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2025-06-28 11:38:12', '', '2025-06-28 14:59:51');
INSERT INTO `gen_table_column` VALUES (703, 59, 'name', '姓名', 'varchar(50)', 'String', 'name', '0', '0', '0', '1', '1', '1', '0', 'LIKE', 'input', '', 3, 'admin', '2025-06-28 11:38:12', '', '2025-06-28 14:59:51');
INSERT INTO `gen_table_column` VALUES (704, 59, 'title', '职称', 'enum(\'住院医师\',\'主治医师\',\'副主任医师\',\'主任医师\')', 'String', 'title', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 4, 'admin', '2025-06-28 11:38:12', '', '2025-06-28 14:59:51');

-- ----------------------------
-- Table structure for history
-- ----------------------------
DROP TABLE IF EXISTS `history`;
CREATE TABLE `history`  (
  `history_id` int NOT NULL AUTO_INCREMENT,
  `patient_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `food_allergy_history` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `allergen_exposure` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `past_disease_history` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  PRIMARY KEY (`history_id`) USING BTREE,
  INDEX `patient_id`(`patient_id` ASC) USING BTREE,
  CONSTRAINT `fk_patient_history` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`patient_id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of history
-- ----------------------------

-- ----------------------------
-- Table structure for imaging
-- ----------------------------
DROP TABLE IF EXISTS `imaging`;
CREATE TABLE `imaging`  (
  `imaging_id` int NOT NULL AUTO_INCREMENT,
  `patient_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `imaging_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `imaging_date` date NULL DEFAULT NULL,
  `report` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  PRIMARY KEY (`imaging_id`) USING BTREE,
  INDEX `patient_id`(`patient_id` ASC) USING BTREE,
  CONSTRAINT `fk_patient_imaging` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`patient_id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of imaging
-- ----------------------------

-- ----------------------------
-- Table structure for insurance_info
-- ----------------------------
DROP TABLE IF EXISTS `insurance_info`;
CREATE TABLE `insurance_info`  (
  `insurance_id` int NOT NULL AUTO_INCREMENT,
  `patient_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `insurance_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `insurance_number` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`insurance_id`) USING BTREE,
  INDEX `patient_id`(`patient_id` ASC) USING BTREE,
  CONSTRAINT `fk_patient_insurance_info` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`patient_id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of insurance_info
-- ----------------------------

-- ----------------------------
-- Table structure for lab_tests
-- ----------------------------
DROP TABLE IF EXISTS `lab_tests`;
CREATE TABLE `lab_tests`  (
  `test_id` int NOT NULL AUTO_INCREMENT,
  `patient_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `test_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `test_date` date NULL DEFAULT NULL,
  `test_result` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  PRIMARY KEY (`test_id`) USING BTREE,
  INDEX `patient_id`(`patient_id` ASC) USING BTREE,
  CONSTRAINT `fk_patient_lab_tests` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`patient_id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of lab_tests
-- ----------------------------

-- ----------------------------
-- Table structure for lung_tests
-- ----------------------------
DROP TABLE IF EXISTS `lung_tests`;
CREATE TABLE `lung_tests`  (
  `lung_id` int NOT NULL AUTO_INCREMENT,
  `patient_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `test_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `test_date` date NULL DEFAULT NULL,
  `test_result` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  PRIMARY KEY (`lung_id`) USING BTREE,
  INDEX `patient_id`(`patient_id` ASC) USING BTREE,
  CONSTRAINT `fk_patient_lung_tests` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`patient_id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of lung_tests
-- ----------------------------

-- ----------------------------
-- Table structure for medical_orgs
-- ----------------------------
DROP TABLE IF EXISTS `medical_orgs`;
CREATE TABLE `medical_orgs`  (
  `org_id` int NOT NULL AUTO_INCREMENT,
  `patient_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `hospital_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `department_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`org_id`) USING BTREE,
  INDEX `patient_id`(`patient_id` ASC) USING BTREE,
  CONSTRAINT `fk_patient_medical_orgs` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`patient_id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of medical_orgs
-- ----------------------------

-- ----------------------------
-- Table structure for medications
-- ----------------------------
DROP TABLE IF EXISTS `medications`;
CREATE TABLE `medications`  (
  `med_id` int NOT NULL AUTO_INCREMENT,
  `patient_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `medication_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `medication_specification` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `single_dose` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `usage_days` int NULL DEFAULT NULL,
  `frequency` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `administration_route` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `administration_site` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `treatment_start` date NULL DEFAULT NULL,
  `treatment_end` date NULL DEFAULT NULL,
  `medication_guidance` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `precautions` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  PRIMARY KEY (`med_id`) USING BTREE,
  INDEX `patient_id`(`patient_id` ASC) USING BTREE,
  CONSTRAINT `fk_patient_medications` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`patient_id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of medications
-- ----------------------------

-- ----------------------------
-- Table structure for medications_history
-- ----------------------------
DROP TABLE IF EXISTS `medications_history`;
CREATE TABLE `medications_history`  (
  `med_his_id` int NOT NULL AUTO_INCREMENT,
  `patient_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `medication_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `duration_days` int NULL DEFAULT NULL,
  PRIMARY KEY (`med_his_id`) USING BTREE,
  INDEX `patient_id`(`patient_id` ASC) USING BTREE,
  CONSTRAINT `fk_patient_medications_history` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`patient_id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of medications_history
-- ----------------------------

-- ----------------------------
-- Table structure for patients
-- ----------------------------
DROP TABLE IF EXISTS `patients`;
CREATE TABLE `patients`  (
  `patient_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `visit_time` datetime NULL DEFAULT NULL,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `gender` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `birth_date` date NULL DEFAULT NULL,
  `age` int NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `height` float NULL DEFAULT NULL,
  `weight` float NULL DEFAULT NULL,
  `birth_weight` float NULL DEFAULT NULL,
  `lifestyle` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`patient_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of patients
-- ----------------------------
INSERT INTO `patients` VALUES ('001', '2025-06-27 00:00:00', '张三', '男', '2025-06-06', 1, '福州', 1, 1, 1, '无');
INSERT INTO `patients` VALUES ('002', '2025-06-28 00:00:00', '李四', '男', '2025-06-06', 1, '福州', 1, 1, 1, '无');
INSERT INTO `patients` VALUES ('003', '2025-06-27 00:00:00', '张一', '男', '2025-06-05', 1, '福州', 1, 1, 1, '无');
INSERT INTO `patients` VALUES ('004', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for providers
-- ----------------------------
DROP TABLE IF EXISTS `providers`;
CREATE TABLE `providers`  (
  `provider_id` int NOT NULL AUTO_INCREMENT,
  `patient_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `provider_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`provider_id`) USING BTREE,
  INDEX `patient_id`(`patient_id` ASC) USING BTREE,
  CONSTRAINT `fk_patient_providers` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`patient_id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of providers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `blob_data` blob NULL COMMENT '存放持久化Trigger对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = 'Blob类型的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '调度名称',
  `calendar_name` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '日历名称',
  `calendar` blob NOT NULL COMMENT '存放持久化calendar对象',
  PRIMARY KEY (`sched_name`, `calendar_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '日历信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `cron_expression` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'cron表达式',
  `time_zone_id` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '时区',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = 'Cron类型的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '调度名称',
  `entry_id` varchar(95) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '调度器实例id',
  `trigger_name` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `instance_name` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '调度器实例名',
  `fired_time` bigint NOT NULL COMMENT '触发的时间',
  `sched_time` bigint NOT NULL COMMENT '定时器制定的时间',
  `priority` int NOT NULL COMMENT '优先级',
  `state` varchar(16) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '状态',
  `job_name` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '任务组名',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '是否并发',
  `requests_recovery` varchar(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '是否接受恢复执行',
  PRIMARY KEY (`sched_name`, `entry_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '已触发的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '调度名称',
  `job_name` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '任务组名',
  `description` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '相关介绍',
  `job_class_name` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '执行任务类名称',
  `is_durable` varchar(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '是否持久化',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '是否并发',
  `is_update_data` varchar(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '是否更新数据',
  `requests_recovery` varchar(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '是否接受恢复执行',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '任务详细信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '调度名称',
  `lock_name` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '悲观锁名称',
  PRIMARY KEY (`sched_name`, `lock_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '存储的悲观锁信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '调度名称',
  `trigger_group` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  PRIMARY KEY (`sched_name`, `trigger_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '暂停的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '调度名称',
  `instance_name` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '实例名称',
  `last_checkin_time` bigint NOT NULL COMMENT '上次检查时间',
  `checkin_interval` bigint NOT NULL COMMENT '检查间隔时间',
  PRIMARY KEY (`sched_name`, `instance_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '调度器状态表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `repeat_count` bigint NOT NULL COMMENT '重复的次数统计',
  `repeat_interval` bigint NOT NULL COMMENT '重复的间隔时间',
  `times_triggered` bigint NOT NULL COMMENT '已经触发的次数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '简单触发器的信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `str_prop_1` varchar(512) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第一个参数',
  `str_prop_2` varchar(512) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第二个参数',
  `str_prop_3` varchar(512) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第三个参数',
  `int_prop_1` int NULL DEFAULT NULL COMMENT 'int类型的trigger的第一个参数',
  `int_prop_2` int NULL DEFAULT NULL COMMENT 'int类型的trigger的第二个参数',
  `long_prop_1` bigint NULL DEFAULT NULL COMMENT 'long类型的trigger的第一个参数',
  `long_prop_2` bigint NULL DEFAULT NULL COMMENT 'long类型的trigger的第二个参数',
  `dec_prop_1` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第一个参数',
  `dec_prop_2` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第二个参数',
  `bool_prop_1` varchar(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第一个参数',
  `bool_prop_2` varchar(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第二个参数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '同步机制的行锁表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '触发器的名字',
  `trigger_group` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '触发器所属组的名字',
  `job_name` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'qrtz_job_details表job_name的外键',
  `job_group` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'qrtz_job_details表job_group的外键',
  `description` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '相关介绍',
  `next_fire_time` bigint NULL DEFAULT NULL COMMENT '上一次触发时间（毫秒）',
  `prev_fire_time` bigint NULL DEFAULT NULL COMMENT '下一次触发时间（默认为-1表示不触发）',
  `priority` int NULL DEFAULT NULL COMMENT '优先级',
  `trigger_state` varchar(16) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '触发器状态',
  `trigger_type` varchar(8) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '触发器的类型',
  `start_time` bigint NOT NULL COMMENT '开始时间',
  `end_time` bigint NULL DEFAULT NULL COMMENT '结束时间',
  `calendar_name` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '日程表名称',
  `misfire_instr` smallint NULL DEFAULT NULL COMMENT '补偿执行的策略',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  INDEX `sched_name`(`sched_name` ASC, `job_name` ASC, `job_group` ASC) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '触发器详细信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for survey_area_environment
-- ----------------------------
DROP TABLE IF EXISTS `survey_area_environment`;
CREATE TABLE `survey_area_environment`  (
  `env_area_id` int NOT NULL AUTO_INCREMENT,
  `survey_id` int NOT NULL,
  `urban_pm25_avg` float NULL DEFAULT NULL,
  `urban_pm25_seasonal` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `urban_pollen_types` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `urban_pollen_distribution` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `urban_pollen_peak` float NULL DEFAULT NULL,
  `urban_pollutants` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `urban_monitor_location` enum('交通区','工业区','居民区') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `rural_pm25_burning` float NULL DEFAULT NULL,
  `rural_pm25_avg` float NULL DEFAULT NULL,
  `rural_pollen_types` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `rural_biomass_pollution` tinyint(1) NULL DEFAULT NULL,
  `rural_water_source` enum('自来水','纯净水','井水','其他') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`env_area_id`) USING BTREE,
  INDEX `survey_id`(`survey_id` ASC) USING BTREE,
  CONSTRAINT `survey_area_environment_ibfk_1` FOREIGN KEY (`survey_id`) REFERENCES `survey_basic_info` (`survey_id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of survey_area_environment
-- ----------------------------

-- ----------------------------
-- Table structure for survey_basic_info
-- ----------------------------
DROP TABLE IF EXISTS `survey_basic_info`;
CREATE TABLE `survey_basic_info`  (
  `survey_id` int NOT NULL AUTO_INCREMENT,
  `patient_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `survey_date` date NULL DEFAULT NULL,
  `child_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `gender` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `age` int NULL DEFAULT NULL,
  `residence_type` enum('城市','农村') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `residence_years` int NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `height` float NULL DEFAULT NULL,
  `weight` float NULL DEFAULT NULL,
  `allergy_history` tinyint(1) NULL DEFAULT NULL,
  `has_rhinitis` tinyint(1) NULL DEFAULT NULL,
  `has_asthma` tinyint(1) NULL DEFAULT NULL,
  `has_dermatitis` tinyint(1) NULL DEFAULT NULL,
  `has_conjunctivitis` tinyint(1) NULL DEFAULT NULL,
  `has_urticaria` tinyint(1) NULL DEFAULT NULL,
  `diagnosed_rhinitis` tinyint(1) NULL DEFAULT NULL,
  `diagnosed_asthma` tinyint(1) NULL DEFAULT NULL,
  `diagnosed_dermatitis` tinyint(1) NULL DEFAULT NULL,
  `diagnosed_conjunctivitis` tinyint(1) NULL DEFAULT NULL,
  `diagnosed_urticaria` tinyint(1) NULL DEFAULT NULL,
  PRIMARY KEY (`survey_id`) USING BTREE,
  INDEX `patient_id`(`patient_id` ASC) USING BTREE,
  CONSTRAINT `survey_basic_info_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`patient_id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of survey_basic_info
-- ----------------------------

-- ----------------------------
-- Table structure for survey_confounding_factors
-- ----------------------------
DROP TABLE IF EXISTS `survey_confounding_factors`;
CREATE TABLE `survey_confounding_factors`  (
  `confound_id` int NOT NULL AUTO_INCREMENT,
  `survey_id` int NOT NULL,
  `diet_type` enum('高加工食品','传统饮食') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `vitamin_d_400u` tinyint(1) NULL DEFAULT NULL,
  `vitamin_d_years` float NULL DEFAULT NULL,
  `omega3_intake` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `stress_level_pss10` int NULL DEFAULT NULL,
  `mental_state_phq9_gad7` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `vaccine_on_schedule` tinyint(1) NULL DEFAULT NULL,
  `antibiotic_freq` enum('每月','每季度','每年') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `breastfeeding` tinyint(1) NULL DEFAULT NULL,
  `breastfeeding_months` int NULL DEFAULT NULL,
  `delivery_type` enum('自然分娩','剖宫产') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `pet_exposure_stage` enum('婴儿期','幼儿期','学龄前期','学龄期') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `farm_exposure` tinyint(1) NULL DEFAULT NULL,
  `farm_exposure_months` int NULL DEFAULT NULL,
  `absent_days_allergy` int NULL DEFAULT NULL,
  `annual_medical_cost` decimal(10, 2) NULL DEFAULT NULL,
  PRIMARY KEY (`confound_id`) USING BTREE,
  INDEX `survey_id`(`survey_id` ASC) USING BTREE,
  CONSTRAINT `survey_confounding_factors_ibfk_1` FOREIGN KEY (`survey_id`) REFERENCES `survey_basic_info` (`survey_id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of survey_confounding_factors
-- ----------------------------

-- ----------------------------
-- Table structure for survey_environment_exposure
-- ----------------------------
DROP TABLE IF EXISTS `survey_environment_exposure`;
CREATE TABLE `survey_environment_exposure`  (
  `env_id` int NOT NULL AUTO_INCREMENT,
  `survey_id` int NOT NULL,
  `house_type` enum('平房','楼房','别墅','其他') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `building_material` enum('木质','混凝土','其他') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `ventilation_freq` enum('每日','每周','偶尔') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `ac_usage_season` enum('几乎不用','夏季每日','全年高频') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `ac_usage_freq` enum('每日','每周3-5天','偶尔') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `ac_temp_setting` enum('＜24℃','24-26℃','＞26℃') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `ac_modes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `ac_filter_cleaning_freq` enum('每月','每季度','每年','从未清洁') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `heating_type` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `heating_temp_range` enum('＜18℃','18-22℃','＞22℃') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `has_carpet` tinyint(1) NULL DEFAULT NULL,
  `has_soft_toys` tinyint(1) NULL DEFAULT NULL,
  `pm25_avg` float NULL DEFAULT NULL,
  `pollen_info` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `formaldehyde_level` float NULL DEFAULT NULL,
  `formaldehyde_test_time` date NULL DEFAULT NULL,
  `dust_mite_level` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `other_allergens` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `exercise_frequency` int NULL DEFAULT NULL,
  `exercise_duration` int NULL DEFAULT NULL,
  `exercise_intensity` enum('轻','中','重') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `swimming` tinyint(1) NULL DEFAULT NULL,
  `sleep_hours` float NULL DEFAULT NULL,
  `insomnia` tinyint(1) NULL DEFAULT NULL,
  `circadian_disruption` tinyint(1) NULL DEFAULT NULL,
  `smoke_exposure_type` enum('主动','被动暴露','无') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `cleaning_freq` enum('每日','每周','每月') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `has_pets` tinyint(1) NULL DEFAULT NULL,
  `pet_types` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `pet_count` int NULL DEFAULT NULL,
  `lives_with_smoker` tinyint(1) NULL DEFAULT NULL,
  `cooking_fuel` enum('天然气','煤气','生物质燃料') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `uses_air_purifier` tinyint(1) NULL DEFAULT NULL,
  `uses_vacuum_cleaner` tinyint(1) NULL DEFAULT NULL,
  `avoidance_quality` enum('优','良','差') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`env_id`) USING BTREE,
  INDEX `survey_id`(`survey_id` ASC) USING BTREE,
  CONSTRAINT `survey_environment_exposure_ibfk_1` FOREIGN KEY (`survey_id`) REFERENCES `survey_basic_info` (`survey_id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of survey_environment_exposure
-- ----------------------------

-- ----------------------------
-- Table structure for survey_family_env
-- ----------------------------
DROP TABLE IF EXISTS `survey_family_env`;
CREATE TABLE `survey_family_env`  (
  `family_env_id` int NOT NULL AUTO_INCREMENT,
  `survey_id` int NOT NULL,
  `shared_smoking_exposure` tinyint(1) NULL DEFAULT NULL,
  PRIMARY KEY (`family_env_id`) USING BTREE,
  INDEX `survey_id`(`survey_id` ASC) USING BTREE,
  CONSTRAINT `survey_family_env_ibfk_1` FOREIGN KEY (`survey_id`) REFERENCES `survey_basic_info` (`survey_id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of survey_family_env
-- ----------------------------

-- ----------------------------
-- Table structure for survey_learning_work_env
-- ----------------------------
DROP TABLE IF EXISTS `survey_learning_work_env`;
CREATE TABLE `survey_learning_work_env`  (
  `learn_env_id` int NOT NULL AUTO_INCREMENT,
  `survey_id` int NOT NULL,
  `location_type` enum('城市中心','郊区','农村') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `ventilation_quality` enum('良好','一般','差') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `pm25_annual` float NULL DEFAULT NULL,
  `pollen_peak_concentration` float NULL DEFAULT NULL,
  `pollen_types` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `formaldehyde_level_workplace` float NULL DEFAULT NULL,
  `has_carpet` tinyint(1) NULL DEFAULT NULL,
  `has_fabric_furniture` tinyint(1) NULL DEFAULT NULL,
  PRIMARY KEY (`learn_env_id`) USING BTREE,
  INDEX `survey_id`(`survey_id` ASC) USING BTREE,
  CONSTRAINT `survey_learning_work_env_ibfk_1` FOREIGN KEY (`survey_id`) REFERENCES `survey_basic_info` (`survey_id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of survey_learning_work_env
-- ----------------------------

-- ----------------------------
-- Table structure for survey_monitoring_methods
-- ----------------------------
DROP TABLE IF EXISTS `survey_monitoring_methods`;
CREATE TABLE `survey_monitoring_methods`  (
  `method_id` int NOT NULL AUTO_INCREMENT,
  `survey_id` int NOT NULL,
  `pm25_detector_model` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `pollen_gravity_settle` tinyint(1) NULL DEFAULT NULL,
  `pollen_volume_sampling` tinyint(1) NULL DEFAULT NULL,
  `pollen_molecular_detection` tinyint(1) NULL DEFAULT NULL,
  `mite_protein_detection` tinyint(1) NULL DEFAULT NULL,
  `mite_microscope_count` tinyint(1) NULL DEFAULT NULL,
  `mite_pcr` tinyint(1) NULL DEFAULT NULL,
  `mite_metabolite` tinyint(1) NULL DEFAULT NULL,
  `mite_air_sampling` tinyint(1) NULL DEFAULT NULL,
  `mite_sensor_tech` tinyint(1) NULL DEFAULT NULL,
  PRIMARY KEY (`method_id`) USING BTREE,
  INDEX `survey_id`(`survey_id` ASC) USING BTREE,
  CONSTRAINT `survey_monitoring_methods_ibfk_1` FOREIGN KEY (`survey_id`) REFERENCES `survey_basic_info` (`survey_id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of survey_monitoring_methods
-- ----------------------------

-- ----------------------------
-- Table structure for survey_providers
-- ----------------------------
DROP TABLE IF EXISTS `survey_providers`;
CREATE TABLE `survey_providers`  (
  `provider_id` int NOT NULL AUTO_INCREMENT,
  `survey_id` int NOT NULL,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `title` enum('住院医师','主治医师','副主任医师','主任医师') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`provider_id`) USING BTREE,
  INDEX `survey_id`(`survey_id` ASC) USING BTREE,
  CONSTRAINT `survey_providers_ibfk_1` FOREIGN KEY (`survey_id`) REFERENCES `survey_basic_info` (`survey_id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of survey_providers
-- ----------------------------

-- ----------------------------
-- Table structure for symptoms
-- ----------------------------
DROP TABLE IF EXISTS `symptoms`;
CREATE TABLE `symptoms`  (
  `symptom_id` int NOT NULL AUTO_INCREMENT,
  `patient_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `symptom_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `severity_level` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `frequency` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `onset_time` date NULL DEFAULT NULL,
  `trigger_factor` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `physical_signs` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  PRIMARY KEY (`symptom_id`) USING BTREE,
  INDEX `patient_id`(`patient_id` ASC) USING BTREE,
  CONSTRAINT `fk_patient_symptoms` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`patient_id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of symptoms
-- ----------------------------

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '参数配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2025-06-26 21:44:33', '', NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2025-06-26 21:44:33', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2025-06-26 21:44:33', '', NULL, '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config` VALUES (4, '账号自助-验证码开关', 'sys.account.captchaEnabled', 'true', 'Y', 'admin', '2025-06-26 21:44:33', '', NULL, '是否开启验证码功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (5, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'Y', 'admin', '2025-06-26 21:44:33', '', NULL, '是否开启注册用户功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (6, '用户登录-黑名单列表', 'sys.login.blackIPList', '', 'Y', 'admin', '2025-06-26 21:44:33', '', NULL, '设置登录IP黑名单限制，多个匹配项以;分隔，支持匹配（*通配、网段）');
INSERT INTO `sys_config` VALUES (7, '用户管理-初始密码修改策略', 'sys.account.initPasswordModify', '1', 'Y', 'admin', '2025-06-26 21:44:33', '', NULL, '0：初始密码修改策略关闭，没有任何提示，1：提醒用户，如果未修改初始密码，则在登录时就会提醒修改密码对话框');
INSERT INTO `sys_config` VALUES (8, '用户管理-账号密码更新周期', 'sys.account.passwordValidateDays', '0', 'Y', 'admin', '2025-06-26 21:44:33', '', NULL, '密码更新周期（填写数字，数据初始化值为0不限制，若修改必须为大于0小于365的正整数），如果超过这个周期登录系统时，则在登录时就会提醒修改密码对话框');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 200 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '部门表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', '若依科技', 0, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-06-26 21:44:33', '', NULL);
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '深圳总公司', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-06-26 21:44:33', '', NULL);
INSERT INTO `sys_dept` VALUES (102, 100, '0,100', '长沙分公司', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-06-26 21:44:33', '', NULL);
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101', '研发部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-06-26 21:44:33', '', NULL);
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101', '市场部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-06-26 21:44:33', '', NULL);
INSERT INTO `sys_dept` VALUES (105, 101, '0,100,101', '测试部门', 3, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-06-26 21:44:33', '', NULL);
INSERT INTO `sys_dept` VALUES (106, 101, '0,100,101', '财务部门', 4, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-06-26 21:44:33', '', NULL);
INSERT INTO `sys_dept` VALUES (107, 101, '0,100,101', '运维部门', 5, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-06-26 21:44:33', '', NULL);
INSERT INTO `sys_dept` VALUES (108, 102, '0,100,102', '市场部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-06-26 21:44:33', '', NULL);
INSERT INTO `sys_dept` VALUES (109, 102, '0,100,102', '财务部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-06-26 21:44:33', '', NULL);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '字典数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2025-06-26 21:44:33', '', NULL, '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2025-06-26 21:44:33', '', NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2025-06-26 21:44:33', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2025-06-26 21:44:33', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2025-06-26 21:44:33', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2025-06-26 21:44:33', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2025-06-26 21:44:33', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2025-06-26 21:44:33', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2025-06-26 21:44:33', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2025-06-26 21:44:33', '', NULL, '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2025-06-26 21:44:33', '', NULL, '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2025-06-26 21:44:33', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2025-06-26 21:44:33', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2025-06-26 21:44:33', '', NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2025-06-26 21:44:33', '', NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2025-06-26 21:44:33', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2025-06-26 21:44:33', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 99, '其他', '0', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2025-06-26 21:44:33', '', NULL, '其他操作');
INSERT INTO `sys_dict_data` VALUES (19, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2025-06-26 21:44:33', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (20, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2025-06-26 21:44:33', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (21, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2025-06-26 21:44:33', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (22, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2025-06-26 21:44:33', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (23, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2025-06-26 21:44:33', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (24, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2025-06-26 21:44:33', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (25, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2025-06-26 21:44:33', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (26, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2025-06-26 21:44:33', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (27, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2025-06-26 21:44:33', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (28, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2025-06-26 21:44:33', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (29, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2025-06-26 21:44:33', '', NULL, '停用状态');

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '字典类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2025-06-26 21:44:33', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2025-06-26 21:44:33', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2025-06-26 21:44:33', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2025-06-26 21:44:33', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2025-06-26 21:44:33', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2025-06-26 21:44:33', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2025-06-26 21:44:33', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2025-06-26 21:44:33', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2025-06-26 21:44:33', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2025-06-26 21:44:33', '', NULL, '登录状态列表');

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `job_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '定时任务调度表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2025-06-26 21:44:33', '', NULL, '');
INSERT INTO `sys_job` VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2025-06-26 21:44:33', '', NULL, '');
INSERT INTO `sys_job` VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2025-06-26 21:44:33', '', NULL, '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`  (
  `job_log_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '异常信息',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '定时任务调度日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '提示消息',
  `login_time` datetime NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE,
  INDEX `idx_sys_logininfor_s`(`status` ASC) USING BTREE,
  INDEX `idx_sys_logininfor_lt`(`login_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 111 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '系统访问记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (100, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-06-26 22:36:22');
INSERT INTO `sys_logininfor` VALUES (101, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-06-26 22:40:43');
INSERT INTO `sys_logininfor` VALUES (102, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '验证码错误', '2025-06-27 09:08:49');
INSERT INTO `sys_logininfor` VALUES (103, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-06-27 09:08:52');
INSERT INTO `sys_logininfor` VALUES (104, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-06-27 11:05:52');
INSERT INTO `sys_logininfor` VALUES (105, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-06-27 14:22:18');
INSERT INTO `sys_logininfor` VALUES (106, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-06-27 17:19:16');
INSERT INTO `sys_logininfor` VALUES (107, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-06-27 19:23:20');
INSERT INTO `sys_logininfor` VALUES (108, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-06-28 09:52:25');
INSERT INTO `sys_logininfor` VALUES (109, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-06-28 11:37:45');
INSERT INTO `sys_logininfor` VALUES (110, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-06-28 14:18:48');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '路由参数',
  `route_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '路由名称',
  `is_frame` int NULL DEFAULT 1 COMMENT '是否为外链（0是 1否）',
  `is_cache` int NULL DEFAULT 0 COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2447 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '菜单权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 1, 'system', NULL, '', '', 1, 0, 'M', '0', '0', '', 'system', 'admin', '2025-06-26 21:44:33', '', NULL, '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 2, 'monitor', NULL, '', '', 1, 0, 'M', '0', '0', '', 'monitor', 'admin', '2025-06-26 21:44:33', '', NULL, '系统监控目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 3, 'tool', NULL, '', '', 1, 0, 'M', '0', '0', '', 'tool', 'admin', '2025-06-26 21:44:33', '', NULL, '系统工具目录');
INSERT INTO `sys_menu` VALUES (4, '若依官网', 0, 4, 'http://ruoyi.vip', NULL, '', '', 0, 0, 'M', '1', '0', '', 'guide', 'admin', '2025-06-26 21:44:33', 'admin', '2025-06-27 09:16:58', '若依官网地址');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, 'user', 'system/user/index', '', '', 1, 0, 'C', '0', '0', 'system:user:list', 'user', 'admin', '2025-06-26 21:44:33', '', NULL, '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, 'role', 'system/role/index', '', '', 1, 0, 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2025-06-26 21:44:33', '', NULL, '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', '', '', 1, 0, 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2025-06-26 21:44:33', '', NULL, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 4, 'dept', 'system/dept/index', '', '', 1, 0, 'C', '0', '0', 'system:dept:list', 'tree', 'admin', '2025-06-26 21:44:33', '', NULL, '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, 'post', 'system/post/index', '', '', 1, 0, 'C', '0', '0', 'system:post:list', 'post', 'admin', '2025-06-26 21:44:33', '', NULL, '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, 'dict', 'system/dict/index', '', '', 1, 0, 'C', '0', '0', 'system:dict:list', 'dict', 'admin', '2025-06-26 21:44:33', '', NULL, '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, 'config', 'system/config/index', '', '', 1, 0, 'C', '0', '0', 'system:config:list', 'edit', 'admin', '2025-06-26 21:44:33', '', NULL, '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, 8, 'notice', 'system/notice/index', '', '', 1, 0, 'C', '0', '0', 'system:notice:list', 'message', 'admin', '2025-06-26 21:44:33', '', NULL, '通知公告菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, 'log', '', '', '', 1, 0, 'M', '0', '0', '', 'log', 'admin', '2025-06-26 21:44:33', '', NULL, '日志管理菜单');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, 'online', 'monitor/online/index', '', '', 1, 0, 'C', '0', '0', 'monitor:online:list', 'online', 'admin', '2025-06-26 21:44:33', '', NULL, '在线用户菜单');
INSERT INTO `sys_menu` VALUES (110, '定时任务', 2, 2, 'job', 'monitor/job/index', '', '', 1, 0, 'C', '0', '0', 'monitor:job:list', 'job', 'admin', '2025-06-26 21:44:33', '', NULL, '定时任务菜单');
INSERT INTO `sys_menu` VALUES (111, '数据监控', 2, 3, 'druid', 'monitor/druid/index', '', '', 1, 0, 'C', '0', '0', 'monitor:druid:list', 'druid', 'admin', '2025-06-26 21:44:33', '', NULL, '数据监控菜单');
INSERT INTO `sys_menu` VALUES (112, '服务监控', 2, 4, 'server', 'monitor/server/index', '', '', 1, 0, 'C', '0', '0', 'monitor:server:list', 'server', 'admin', '2025-06-26 21:44:33', '', NULL, '服务监控菜单');
INSERT INTO `sys_menu` VALUES (113, '缓存监控', 2, 5, 'cache', 'monitor/cache/index', '', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis', 'admin', '2025-06-26 21:44:33', '', NULL, '缓存监控菜单');
INSERT INTO `sys_menu` VALUES (114, '缓存列表', 2, 6, 'cacheList', 'monitor/cache/list', '', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis-list', 'admin', '2025-06-26 21:44:33', '', NULL, '缓存列表菜单');
INSERT INTO `sys_menu` VALUES (115, '表单构建', 3, 1, 'build', 'tool/build/index', '', '', 1, 0, 'C', '0', '0', 'tool:build:list', 'build', 'admin', '2025-06-26 21:44:33', '', NULL, '表单构建菜单');
INSERT INTO `sys_menu` VALUES (116, '代码生成', 3, 2, 'gen', 'tool/gen/index', '', '', 1, 0, 'C', '0', '0', 'tool:gen:list', 'code', 'admin', '2025-06-26 21:44:33', '', NULL, '代码生成菜单');
INSERT INTO `sys_menu` VALUES (117, '系统接口', 3, 3, 'swagger', 'tool/swagger/index', '', '', 1, 0, 'C', '0', '0', 'tool:swagger:list', 'swagger', 'admin', '2025-06-26 21:44:33', '', NULL, '系统接口菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, 'operlog', 'monitor/operlog/index', '', '', 1, 0, 'C', '0', '0', 'monitor:operlog:list', 'form', 'admin', '2025-06-26 21:44:33', '', NULL, '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, 'logininfor', 'monitor/logininfor/index', '', '', 1, 0, 'C', '0', '0', 'monitor:logininfor:list', 'logininfor', 'admin', '2025-06-26 21:44:33', '', NULL, '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1000, '用户查询', 100, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:query', '#', 'admin', '2025-06-26 21:44:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1001, '用户新增', 100, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:add', '#', 'admin', '2025-06-26 21:44:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1002, '用户修改', 100, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:edit', '#', 'admin', '2025-06-26 21:44:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1003, '用户删除', 100, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:remove', '#', 'admin', '2025-06-26 21:44:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1004, '用户导出', 100, 5, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:export', '#', 'admin', '2025-06-26 21:44:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1005, '用户导入', 100, 6, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:import', '#', 'admin', '2025-06-26 21:44:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1006, '重置密码', 100, 7, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2025-06-26 21:44:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1007, '角色查询', 101, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:query', '#', 'admin', '2025-06-26 21:44:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1008, '角色新增', 101, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:add', '#', 'admin', '2025-06-26 21:44:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1009, '角色修改', 101, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:edit', '#', 'admin', '2025-06-26 21:44:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1010, '角色删除', 101, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:remove', '#', 'admin', '2025-06-26 21:44:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1011, '角色导出', 101, 5, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:export', '#', 'admin', '2025-06-26 21:44:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1012, '菜单查询', 102, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:query', '#', 'admin', '2025-06-26 21:44:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1013, '菜单新增', 102, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:add', '#', 'admin', '2025-06-26 21:44:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1014, '菜单修改', 102, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2025-06-26 21:44:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1015, '菜单删除', 102, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2025-06-26 21:44:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1016, '部门查询', 103, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:query', '#', 'admin', '2025-06-26 21:44:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1017, '部门新增', 103, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:add', '#', 'admin', '2025-06-26 21:44:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1018, '部门修改', 103, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2025-06-26 21:44:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1019, '部门删除', 103, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2025-06-26 21:44:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1020, '岗位查询', 104, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:query', '#', 'admin', '2025-06-26 21:44:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1021, '岗位新增', 104, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:add', '#', 'admin', '2025-06-26 21:44:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1022, '岗位修改', 104, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:edit', '#', 'admin', '2025-06-26 21:44:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1023, '岗位删除', 104, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:remove', '#', 'admin', '2025-06-26 21:44:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1024, '岗位导出', 104, 5, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:export', '#', 'admin', '2025-06-26 21:44:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1025, '字典查询', 105, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:query', '#', 'admin', '2025-06-26 21:44:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1026, '字典新增', 105, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:add', '#', 'admin', '2025-06-26 21:44:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1027, '字典修改', 105, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2025-06-26 21:44:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1028, '字典删除', 105, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2025-06-26 21:44:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1029, '字典导出', 105, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:export', '#', 'admin', '2025-06-26 21:44:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1030, '参数查询', 106, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:query', '#', 'admin', '2025-06-26 21:44:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1031, '参数新增', 106, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:add', '#', 'admin', '2025-06-26 21:44:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1032, '参数修改', 106, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:edit', '#', 'admin', '2025-06-26 21:44:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1033, '参数删除', 106, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:remove', '#', 'admin', '2025-06-26 21:44:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1034, '参数导出', 106, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:export', '#', 'admin', '2025-06-26 21:44:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1035, '公告查询', 107, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:query', '#', 'admin', '2025-06-26 21:44:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1036, '公告新增', 107, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:add', '#', 'admin', '2025-06-26 21:44:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1037, '公告修改', 107, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:edit', '#', 'admin', '2025-06-26 21:44:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1038, '公告删除', 107, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:remove', '#', 'admin', '2025-06-26 21:44:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1039, '操作查询', 500, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:query', '#', 'admin', '2025-06-26 21:44:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1040, '操作删除', 500, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:remove', '#', 'admin', '2025-06-26 21:44:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1041, '日志导出', 500, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:export', '#', 'admin', '2025-06-26 21:44:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1042, '登录查询', 501, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:query', '#', 'admin', '2025-06-26 21:44:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1043, '登录删除', 501, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:remove', '#', 'admin', '2025-06-26 21:44:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1044, '日志导出', 501, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:export', '#', 'admin', '2025-06-26 21:44:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1045, '账户解锁', 501, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:unlock', '#', 'admin', '2025-06-26 21:44:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1046, '在线查询', 109, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:online:query', '#', 'admin', '2025-06-26 21:44:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1047, '批量强退', 109, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin', '2025-06-26 21:44:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1048, '单条强退', 109, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin', '2025-06-26 21:44:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1049, '任务查询', 110, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:query', '#', 'admin', '2025-06-26 21:44:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1050, '任务新增', 110, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:add', '#', 'admin', '2025-06-26 21:44:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1051, '任务修改', 110, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:edit', '#', 'admin', '2025-06-26 21:44:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1052, '任务删除', 110, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:remove', '#', 'admin', '2025-06-26 21:44:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1053, '状态修改', 110, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:changeStatus', '#', 'admin', '2025-06-26 21:44:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1054, '任务导出', 110, 6, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:export', '#', 'admin', '2025-06-26 21:44:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1055, '生成查询', 116, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:query', '#', 'admin', '2025-06-26 21:44:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1056, '生成修改', 116, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:edit', '#', 'admin', '2025-06-26 21:44:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1057, '生成删除', 116, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:remove', '#', 'admin', '2025-06-26 21:44:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1058, '导入代码', 116, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:import', '#', 'admin', '2025-06-26 21:44:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1059, '预览代码', 116, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:preview', '#', 'admin', '2025-06-26 21:44:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1060, '生成代码', 116, 6, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:code', '#', 'admin', '2025-06-26 21:44:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2000, '流调数据库', 0, 0, 'EpidemSys', NULL, NULL, '', 1, 0, 'M', '0', '0', NULL, 'edit', 'admin', '2025-06-27 09:19:54', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2061, '临床数据库', 0, 0, 'ClinicalSys', NULL, NULL, '', 1, 0, 'M', '0', '0', NULL, 'logininfor', 'admin', '2025-06-27 14:24:03', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2236, '联系人', 2061, 1, 'contacts', 'ClinicalSys/contacts/index', NULL, '', 1, 0, 'C', '0', '0', 'ClinicalSys:contacts:list', '#', 'admin', '2025-06-27 16:16:03', '', NULL, '联系人菜单');
INSERT INTO `sys_menu` VALUES (2237, '联系人查询', 2236, 1, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'ClinicalSys:contacts:query', '#', 'admin', '2025-06-27 16:16:03', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2238, '联系人新增', 2236, 2, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'ClinicalSys:contacts:add', '#', 'admin', '2025-06-27 16:16:03', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2239, '联系人修改', 2236, 3, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'ClinicalSys:contacts:edit', '#', 'admin', '2025-06-27 16:16:03', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2240, '联系人删除', 2236, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'ClinicalSys:contacts:remove', '#', 'admin', '2025-06-27 16:16:03', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2241, '联系人导出', 2236, 5, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'ClinicalSys:contacts:export', '#', 'admin', '2025-06-27 16:16:03', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2242, '疾病诊断', 2061, 1, 'diagnoses', 'ClinicalSys/diagnoses/index', NULL, '', 1, 0, 'C', '0', '0', 'ClinicalSys:diagnoses:list', '#', 'admin', '2025-06-27 16:16:07', '', NULL, '疾病诊断菜单');
INSERT INTO `sys_menu` VALUES (2243, '疾病诊断查询', 2242, 1, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'ClinicalSys:diagnoses:query', '#', 'admin', '2025-06-27 16:16:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2244, '疾病诊断新增', 2242, 2, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'ClinicalSys:diagnoses:add', '#', 'admin', '2025-06-27 16:16:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2245, '疾病诊断修改', 2242, 3, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'ClinicalSys:diagnoses:edit', '#', 'admin', '2025-06-27 16:16:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2246, '疾病诊断删除', 2242, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'ClinicalSys:diagnoses:remove', '#', 'admin', '2025-06-27 16:16:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2247, '疾病诊断导出', 2242, 5, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'ClinicalSys:diagnoses:export', '#', 'admin', '2025-06-27 16:16:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2248, '费用', 2061, 1, 'expenses', 'ClinicalSys/expenses/index', NULL, '', 1, 0, 'C', '0', '0', 'ClinicalSys:expenses:list', '#', 'admin', '2025-06-27 16:16:10', '', NULL, '费用菜单');
INSERT INTO `sys_menu` VALUES (2249, '费用查询', 2248, 1, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'ClinicalSys:expenses:query', '#', 'admin', '2025-06-27 16:16:10', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2250, '费用新增', 2248, 2, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'ClinicalSys:expenses:add', '#', 'admin', '2025-06-27 16:16:10', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2251, '费用修改', 2248, 3, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'ClinicalSys:expenses:edit', '#', 'admin', '2025-06-27 16:16:10', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2252, '费用删除', 2248, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'ClinicalSys:expenses:remove', '#', 'admin', '2025-06-27 16:16:10', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2253, '费用导出', 2248, 5, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'ClinicalSys:expenses:export', '#', 'admin', '2025-06-27 16:16:10', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2266, '影像学检查', 2061, 1, 'imaging', 'ClinicalSys/imaging/index', NULL, '', 1, 0, 'C', '0', '0', 'ClinicalSys:imaging:list', '#', 'admin', '2025-06-27 16:16:23', '', NULL, '影像学检查菜单');
INSERT INTO `sys_menu` VALUES (2267, '影像学检查查询', 2266, 1, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'ClinicalSys:imaging:query', '#', 'admin', '2025-06-27 16:16:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2268, '影像学检查新增', 2266, 2, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'ClinicalSys:imaging:add', '#', 'admin', '2025-06-27 16:16:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2269, '影像学检查修改', 2266, 3, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'ClinicalSys:imaging:edit', '#', 'admin', '2025-06-27 16:16:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2270, '影像学检查删除', 2266, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'ClinicalSys:imaging:remove', '#', 'admin', '2025-06-27 16:16:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2271, '影像学检查导出', 2266, 5, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'ClinicalSys:imaging:export', '#', 'admin', '2025-06-27 16:16:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2272, '医保情况', 2061, 1, 'info', 'ClinicalSys/info/index', NULL, '', 1, 0, 'C', '0', '0', 'ClinicalSys:info:list', '#', 'admin', '2025-06-27 16:16:26', '', NULL, '医保情况菜单');
INSERT INTO `sys_menu` VALUES (2273, '医保情况查询', 2272, 1, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'ClinicalSys:info:query', '#', 'admin', '2025-06-27 16:16:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2274, '医保情况新增', 2272, 2, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'ClinicalSys:info:add', '#', 'admin', '2025-06-27 16:16:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2275, '医保情况修改', 2272, 3, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'ClinicalSys:info:edit', '#', 'admin', '2025-06-27 16:16:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2276, '医保情况删除', 2272, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'ClinicalSys:info:remove', '#', 'admin', '2025-06-27 16:16:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2277, '医保情况导出', 2272, 5, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'ClinicalSys:info:export', '#', 'admin', '2025-06-27 16:16:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2296, '用药', 2061, 1, 'medications', 'ClinicalSys/medications/index', NULL, '', 1, 0, 'C', '0', '0', 'ClinicalSys:medications:list', '#', 'admin', '2025-06-27 16:16:41', '', NULL, '用药菜单');
INSERT INTO `sys_menu` VALUES (2297, '用药查询', 2296, 1, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'ClinicalSys:medications:query', '#', 'admin', '2025-06-27 16:16:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2298, '用药新增', 2296, 2, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'ClinicalSys:medications:add', '#', 'admin', '2025-06-27 16:16:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2299, '用药修改', 2296, 3, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'ClinicalSys:medications:edit', '#', 'admin', '2025-06-27 16:16:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2300, '用药删除', 2296, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'ClinicalSys:medications:remove', '#', 'admin', '2025-06-27 16:16:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2301, '用药导出', 2296, 5, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'ClinicalSys:medications:export', '#', 'admin', '2025-06-27 16:16:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2302, '随访信息', 2061, 1, 'notes', 'ClinicalSys/notes/index', NULL, '', 1, 0, 'C', '0', '0', 'ClinicalSys:notes:list', '#', 'admin', '2025-06-27 16:16:45', '', NULL, '随访信息菜单');
INSERT INTO `sys_menu` VALUES (2303, '随访信息查询', 2302, 1, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'ClinicalSys:notes:query', '#', 'admin', '2025-06-27 16:16:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2304, '随访信息新增', 2302, 2, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'ClinicalSys:notes:add', '#', 'admin', '2025-06-27 16:16:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2305, '随访信息修改', 2302, 3, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'ClinicalSys:notes:edit', '#', 'admin', '2025-06-27 16:16:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2306, '随访信息删除', 2302, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'ClinicalSys:notes:remove', '#', 'admin', '2025-06-27 16:16:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2307, '随访信息导出', 2302, 5, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'ClinicalSys:notes:export', '#', 'admin', '2025-06-27 16:16:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2308, '医疗服务机构标识信息', 2061, 1, 'orgs', 'ClinicalSys/orgs/index', NULL, '', 1, 0, 'C', '0', '0', 'ClinicalSys:orgs:list', '#', 'admin', '2025-06-27 16:16:49', '', NULL, '医疗服务机构标识信息菜单');
INSERT INTO `sys_menu` VALUES (2309, '医疗服务机构标识信息查询', 2308, 1, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'ClinicalSys:orgs:query', '#', 'admin', '2025-06-27 16:16:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2310, '医疗服务机构标识信息新增', 2308, 2, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'ClinicalSys:orgs:add', '#', 'admin', '2025-06-27 16:16:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2311, '医疗服务机构标识信息修改', 2308, 3, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'ClinicalSys:orgs:edit', '#', 'admin', '2025-06-27 16:16:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2312, '医疗服务机构标识信息删除', 2308, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'ClinicalSys:orgs:remove', '#', 'admin', '2025-06-27 16:16:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2313, '医疗服务机构标识信息导出', 2308, 5, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'ClinicalSys:orgs:export', '#', 'admin', '2025-06-27 16:16:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2314, '患者基本信息', 2061, 1, 'patients', 'ClinicalSys/patients/index', NULL, '', 1, 0, 'C', '0', '0', 'ClinicalSys:patients:list', '#', 'admin', '2025-06-27 16:16:53', '', NULL, '患者基本信息菜单');
INSERT INTO `sys_menu` VALUES (2315, '患者基本信息查询', 2314, 1, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'ClinicalSys:patients:query', '#', 'admin', '2025-06-27 16:16:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2316, '患者基本信息新增', 2314, 2, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'ClinicalSys:patients:add', '#', 'admin', '2025-06-27 16:16:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2317, '患者基本信息修改', 2314, 3, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'ClinicalSys:patients:edit', '#', 'admin', '2025-06-27 16:16:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2318, '患者基本信息删除', 2314, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'ClinicalSys:patients:remove', '#', 'admin', '2025-06-27 16:16:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2319, '患者基本信息导出', 2314, 5, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'ClinicalSys:patients:export', '#', 'admin', '2025-06-27 16:16:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2320, '医疗服务者标识信息', 2061, 1, 'providers', 'ClinicalSys/providers/index', NULL, '', 1, 0, 'C', '0', '0', 'ClinicalSys:providers:list', '#', 'admin', '2025-06-27 16:16:57', '', NULL, '医疗服务者标识信息菜单');
INSERT INTO `sys_menu` VALUES (2321, '医疗服务者标识信息查询', 2320, 1, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'ClinicalSys:providers:query', '#', 'admin', '2025-06-27 16:16:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2322, '医疗服务者标识信息新增', 2320, 2, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'ClinicalSys:providers:add', '#', 'admin', '2025-06-27 16:16:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2323, '医疗服务者标识信息修改', 2320, 3, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'ClinicalSys:providers:edit', '#', 'admin', '2025-06-27 16:16:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2324, '医疗服务者标识信息删除', 2320, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'ClinicalSys:providers:remove', '#', 'admin', '2025-06-27 16:16:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2325, '医疗服务者标识信息导出', 2320, 5, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'ClinicalSys:providers:export', '#', 'admin', '2025-06-27 16:16:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2326, '症状及体征', 2061, 1, 'symptoms', 'ClinicalSys/symptoms/index', NULL, '', 1, 0, 'C', '0', '0', 'ClinicalSys:symptoms:list', '#', 'admin', '2025-06-27 16:17:00', '', NULL, '症状及体征菜单');
INSERT INTO `sys_menu` VALUES (2327, '症状及体征查询', 2326, 1, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'ClinicalSys:symptoms:query', '#', 'admin', '2025-06-27 16:17:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2328, '症状及体征新增', 2326, 2, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'ClinicalSys:symptoms:add', '#', 'admin', '2025-06-27 16:17:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2329, '症状及体征修改', 2326, 3, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'ClinicalSys:symptoms:edit', '#', 'admin', '2025-06-27 16:17:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2330, '症状及体征删除', 2326, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'ClinicalSys:symptoms:remove', '#', 'admin', '2025-06-27 16:17:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2331, '症状及体征导出', 2326, 5, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'ClinicalSys:symptoms:export', '#', 'admin', '2025-06-27 16:17:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2332, '呼出气一氧化氮检测', 2061, 1, 'tests', 'ClinicalSys/tests/index', NULL, '', 1, 0, 'C', '0', '0', 'ClinicalSys:tests:list', '#', 'admin', '2025-06-27 16:17:04', '', NULL, '呼出气一氧化氮检测菜单');
INSERT INTO `sys_menu` VALUES (2333, '呼出气一氧化氮检测查询', 2332, 1, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'ClinicalSys:tests:query', '#', 'admin', '2025-06-27 16:17:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2334, '呼出气一氧化氮检测新增', 2332, 2, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'ClinicalSys:tests:add', '#', 'admin', '2025-06-27 16:17:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2335, '呼出气一氧化氮检测修改', 2332, 3, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'ClinicalSys:tests:edit', '#', 'admin', '2025-06-27 16:17:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2336, '呼出气一氧化氮检测删除', 2332, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'ClinicalSys:tests:remove', '#', 'admin', '2025-06-27 16:17:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2337, '呼出气一氧化氮检测导出', 2332, 5, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'ClinicalSys:tests:export', '#', 'admin', '2025-06-27 16:17:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2338, '其他辅助治疗', 2061, 1, 'treatments', 'ClinicalSys/treatments/index', NULL, '', 1, 0, 'C', '0', '0', 'ClinicalSys:treatments:list', '#', 'admin', '2025-06-27 16:17:08', '', NULL, '其他辅助治疗菜单');
INSERT INTO `sys_menu` VALUES (2339, '其他辅助治疗查询', 2338, 1, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'ClinicalSys:treatments:query', '#', 'admin', '2025-06-27 16:17:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2340, '其他辅助治疗新增', 2338, 2, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'ClinicalSys:treatments:add', '#', 'admin', '2025-06-27 16:17:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2341, '其他辅助治疗修改', 2338, 3, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'ClinicalSys:treatments:edit', '#', 'admin', '2025-06-27 16:17:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2342, '其他辅助治疗删除', 2338, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'ClinicalSys:treatments:remove', '#', 'admin', '2025-06-27 16:17:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2343, '其他辅助治疗导出', 2338, 5, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'ClinicalSys:treatments:export', '#', 'admin', '2025-06-27 16:17:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2350, '既往史', 2061, 1, 'history', 'ClinicalSys/history/index', NULL, '', 1, 0, 'C', '0', '0', 'ClinicalSys:history:list', '#', 'admin', '2025-06-27 21:04:39', '', NULL, '既往史菜单');
INSERT INTO `sys_menu` VALUES (2351, '既往史查询', 2350, 1, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'ClinicalSys:history:query', '#', 'admin', '2025-06-27 21:04:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2352, '既往史新增', 2350, 2, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'ClinicalSys:history:add', '#', 'admin', '2025-06-27 21:04:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2353, '既往史修改', 2350, 3, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'ClinicalSys:history:edit', '#', 'admin', '2025-06-27 21:04:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2354, '既往史删除', 2350, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'ClinicalSys:history:remove', '#', 'admin', '2025-06-27 21:04:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2355, '既往史导出', 2350, 5, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'ClinicalSys:history:export', '#', 'admin', '2025-06-27 21:04:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2362, '家族史', 2061, 1, 'familyhistory', 'ClinicalSys/familyhistory/index', NULL, '', 1, 0, 'C', '0', '0', 'ClinicalSys:familyhistory:list', '#', 'admin', '2025-06-27 21:16:28', '', NULL, '家族史菜单');
INSERT INTO `sys_menu` VALUES (2363, '家族史查询', 2362, 1, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'ClinicalSys:familyhistory:query', '#', 'admin', '2025-06-27 21:16:28', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2364, '家族史新增', 2362, 2, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'ClinicalSys:familyhistory:add', '#', 'admin', '2025-06-27 21:16:28', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2365, '家族史修改', 2362, 3, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'ClinicalSys:familyhistory:edit', '#', 'admin', '2025-06-27 21:16:28', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2366, '家族史删除', 2362, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'ClinicalSys:familyhistory:remove', '#', 'admin', '2025-06-27 21:16:28', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2367, '家族史导出', 2362, 5, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'ClinicalSys:familyhistory:export', '#', 'admin', '2025-06-27 21:16:28', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2368, '实验室检查', 2061, 1, 'labtests', 'ClinicalSys/labtests/index', NULL, '', 1, 0, 'C', '0', '0', 'ClinicalSys:labtests:list', '#', 'admin', '2025-06-27 21:16:33', '', NULL, '实验室检查菜单');
INSERT INTO `sys_menu` VALUES (2369, '实验室检查查询', 2368, 1, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'ClinicalSys:labtests:query', '#', 'admin', '2025-06-27 21:16:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2370, '实验室检查新增', 2368, 2, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'ClinicalSys:labtests:add', '#', 'admin', '2025-06-27 21:16:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2371, '实验室检查修改', 2368, 3, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'ClinicalSys:labtests:edit', '#', 'admin', '2025-06-27 21:16:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2372, '实验室检查删除', 2368, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'ClinicalSys:labtests:remove', '#', 'admin', '2025-06-27 21:16:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2373, '实验室检查导出', 2368, 5, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'ClinicalSys:labtests:export', '#', 'admin', '2025-06-27 21:16:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2374, '肺功能检查', 2061, 1, 'lungtests', 'ClinicalSys/lungtests/index', NULL, '', 1, 0, 'C', '0', '0', 'ClinicalSys:lungtests:list', '#', 'admin', '2025-06-27 21:16:38', '', NULL, '肺功能检查菜单');
INSERT INTO `sys_menu` VALUES (2375, '肺功能检查查询', 2374, 1, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'ClinicalSys:lungtests:query', '#', 'admin', '2025-06-27 21:16:38', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2376, '肺功能检查新增', 2374, 2, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'ClinicalSys:lungtests:add', '#', 'admin', '2025-06-27 21:16:38', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2377, '肺功能检查修改', 2374, 3, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'ClinicalSys:lungtests:edit', '#', 'admin', '2025-06-27 21:16:38', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2378, '肺功能检查删除', 2374, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'ClinicalSys:lungtests:remove', '#', 'admin', '2025-06-27 21:16:38', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2379, '肺功能检查导出', 2374, 5, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'ClinicalSys:lungtests:export', '#', 'admin', '2025-06-27 21:16:38', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2380, '既往用药史', 2061, 1, 'medicationshistory', 'ClinicalSys/medicationshistory/index', NULL, '', 1, 0, 'C', '0', '0', 'ClinicalSys:medicationshistory:list', '#', 'admin', '2025-06-27 21:16:42', '', NULL, '既往用药史菜单');
INSERT INTO `sys_menu` VALUES (2381, '既往用药史查询', 2380, 1, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'ClinicalSys:medicationshistory:query', '#', 'admin', '2025-06-27 21:16:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2382, '既往用药史新增', 2380, 2, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'ClinicalSys:medicationshistory:add', '#', 'admin', '2025-06-27 21:16:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2383, '既往用药史修改', 2380, 3, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'ClinicalSys:medicationshistory:edit', '#', 'admin', '2025-06-27 21:16:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2384, '既往用药史删除', 2380, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'ClinicalSys:medicationshistory:remove', '#', 'admin', '2025-06-27 21:16:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2385, '既往用药史导出', 2380, 5, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'ClinicalSys:medicationshistory:export', '#', 'admin', '2025-06-27 21:16:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2386, '随访数据库', 0, 0, 'FollowSys', NULL, NULL, '', 1, 0, 'M', '0', '0', NULL, 'clipboard', 'admin', '2025-06-27 21:30:37', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2387, '家庭环境暴露信息', 2000, 1, 'exposure', 'EpidemSys/exposure/index', NULL, '', 1, 0, 'C', '0', '0', 'EpidemSys:exposure:list', '#', 'admin', '2025-06-28 15:06:35', '', NULL, '家庭环境暴露信息菜单');
INSERT INTO `sys_menu` VALUES (2388, '家庭环境暴露信息查询', 2387, 1, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'EpidemSys:exposure:query', '#', 'admin', '2025-06-28 15:06:35', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2389, '家庭环境暴露信息新增', 2387, 2, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'EpidemSys:exposure:add', '#', 'admin', '2025-06-28 15:06:35', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2390, '家庭环境暴露信息修改', 2387, 3, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'EpidemSys:exposure:edit', '#', 'admin', '2025-06-28 15:06:35', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2391, '家庭环境暴露信息删除', 2387, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'EpidemSys:exposure:remove', '#', 'admin', '2025-06-28 15:06:35', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2392, '家庭环境暴露信息导出', 2387, 5, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'EpidemSys:exposure:export', '#', 'admin', '2025-06-28 15:06:35', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2393, '其他潜在混杂因素', 2000, 1, 'factors', 'EpidemSys/factors/index', NULL, '', 1, 0, 'C', '0', '0', 'EpidemSys:factors:list', '#', 'admin', '2025-06-28 15:06:38', '', NULL, '其他潜在混杂因素菜单');
INSERT INTO `sys_menu` VALUES (2394, '其他潜在混杂因素查询', 2393, 1, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'EpidemSys:factors:query', '#', 'admin', '2025-06-28 15:06:38', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2395, '其他潜在混杂因素新增', 2393, 2, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'EpidemSys:factors:add', '#', 'admin', '2025-06-28 15:06:38', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2396, '其他潜在混杂因素修改', 2393, 3, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'EpidemSys:factors:edit', '#', 'admin', '2025-06-28 15:06:38', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2397, '其他潜在混杂因素删除', 2393, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'EpidemSys:factors:remove', '#', 'admin', '2025-06-28 15:06:38', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2398, '其他潜在混杂因素导出', 2393, 5, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'EpidemSys:factors:export', '#', 'admin', '2025-06-28 15:06:38', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2399, '患儿基本信息', 2000, 1, 'info', 'EpidemSys/info/index', NULL, '', 1, 0, 'C', '0', '0', 'EpidemSys:info:list', '#', 'admin', '2025-06-28 15:06:43', '', NULL, '患儿基本信息菜单');
INSERT INTO `sys_menu` VALUES (2400, '患儿基本信息查询', 2399, 1, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'EpidemSys:info:query', '#', 'admin', '2025-06-28 15:06:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2401, '患儿基本信息新增', 2399, 2, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'EpidemSys:info:add', '#', 'admin', '2025-06-28 15:06:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2402, '患儿基本信息修改', 2399, 3, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'EpidemSys:info:edit', '#', 'admin', '2025-06-28 15:06:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2403, '患儿基本信息删除', 2399, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'EpidemSys:info:remove', '#', 'admin', '2025-06-28 15:06:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2404, '患儿基本信息导出', 2399, 5, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'EpidemSys:info:export', '#', 'admin', '2025-06-28 15:06:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2405, '环境监测方法', 2000, 1, 'methods', 'EpidemSys/methods/index', NULL, '', 1, 0, 'C', '0', '0', 'EpidemSys:methods:list', '#', 'admin', '2025-06-28 15:06:47', '', NULL, '环境监测方法菜单');
INSERT INTO `sys_menu` VALUES (2406, '环境监测方法查询', 2405, 1, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'EpidemSys:methods:query', '#', 'admin', '2025-06-28 15:06:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2407, '环境监测方法新增', 2405, 2, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'EpidemSys:methods:add', '#', 'admin', '2025-06-28 15:06:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2408, '环境监测方法修改', 2405, 3, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'EpidemSys:methods:edit', '#', 'admin', '2025-06-28 15:06:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2409, '环境监测方法删除', 2405, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'EpidemSys:methods:remove', '#', 'admin', '2025-06-28 15:06:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2410, '环境监测方法导出', 2405, 5, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'EpidemSys:methods:export', '#', 'admin', '2025-06-28 15:06:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2411, '一级亲属过敏史', 2000, 1, 'primary', 'EpidemSys/primary/index', NULL, '', 1, 0, 'C', '0', '0', 'EpidemSys:primary:list', '#', 'admin', '2025-06-28 15:06:50', '', NULL, '一级亲属过敏史菜单');
INSERT INTO `sys_menu` VALUES (2412, '一级亲属过敏史查询', 2411, 1, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'EpidemSys:primary:query', '#', 'admin', '2025-06-28 15:06:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2413, '一级亲属过敏史新增', 2411, 2, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'EpidemSys:primary:add', '#', 'admin', '2025-06-28 15:06:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2414, '一级亲属过敏史修改', 2411, 3, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'EpidemSys:primary:edit', '#', 'admin', '2025-06-28 15:06:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2415, '一级亲属过敏史删除', 2411, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'EpidemSys:primary:remove', '#', 'admin', '2025-06-28 15:06:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2416, '一级亲属过敏史导出', 2411, 5, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'EpidemSys:primary:export', '#', 'admin', '2025-06-28 15:06:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2417, '医疗调查服务者标识信息', 2000, 1, 'providers', 'EpidemSys/providers/index', NULL, '', 1, 0, 'C', '0', '0', 'EpidemSys:providers:list', '#', 'admin', '2025-06-28 15:06:53', '', NULL, '医疗调查服务者标识信息菜单');
INSERT INTO `sys_menu` VALUES (2418, '医疗调查服务者标识信息查询', 2417, 1, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'EpidemSys:providers:query', '#', 'admin', '2025-06-28 15:06:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2419, '医疗调查服务者标识信息新增', 2417, 2, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'EpidemSys:providers:add', '#', 'admin', '2025-06-28 15:06:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2420, '医疗调查服务者标识信息修改', 2417, 3, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'EpidemSys:providers:edit', '#', 'admin', '2025-06-28 15:06:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2421, '医疗调查服务者标识信息删除', 2417, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'EpidemSys:providers:remove', '#', 'admin', '2025-06-28 15:06:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2422, '医疗调查服务者标识信息导出', 2417, 5, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'EpidemSys:providers:export', '#', 'admin', '2025-06-28 15:06:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2423, '城乡环境监测数据', 2000, 1, 'SAenvironment', 'EpidemSys/SAenvironment/index', NULL, '', 1, 0, 'C', '0', '0', 'EpidemSys:SAenvironment:list', '#', 'admin', '2025-06-28 15:06:56', '', NULL, '城乡环境监测数据菜单');
INSERT INTO `sys_menu` VALUES (2424, '城乡环境监测数据查询', 2423, 1, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'EpidemSys:SAenvironment:query', '#', 'admin', '2025-06-28 15:06:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2425, '城乡环境监测数据新增', 2423, 2, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'EpidemSys:SAenvironment:add', '#', 'admin', '2025-06-28 15:06:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2426, '城乡环境监测数据修改', 2423, 3, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'EpidemSys:SAenvironment:edit', '#', 'admin', '2025-06-28 15:06:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2427, '城乡环境监测数据删除', 2423, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'EpidemSys:SAenvironment:remove', '#', 'admin', '2025-06-28 15:06:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2428, '城乡环境监测数据导出', 2423, 5, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'EpidemSys:SAenvironment:export', '#', 'admin', '2025-06-28 15:06:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2429, '二级亲属过敏史', 2000, 1, 'secondary', 'EpidemSys/secondary/index', NULL, '', 1, 0, 'C', '0', '0', 'EpidemSys:secondary:list', '#', 'admin', '2025-06-28 15:07:00', '', NULL, '二级亲属过敏史菜单');
INSERT INTO `sys_menu` VALUES (2430, '二级亲属过敏史查询', 2429, 1, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'EpidemSys:secondary:query', '#', 'admin', '2025-06-28 15:07:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2431, '二级亲属过敏史新增', 2429, 2, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'EpidemSys:secondary:add', '#', 'admin', '2025-06-28 15:07:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2432, '二级亲属过敏史修改', 2429, 3, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'EpidemSys:secondary:edit', '#', 'admin', '2025-06-28 15:07:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2433, '二级亲属过敏史删除', 2429, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'EpidemSys:secondary:remove', '#', 'admin', '2025-06-28 15:07:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2434, '二级亲属过敏史导出', 2429, 5, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'EpidemSys:secondary:export', '#', 'admin', '2025-06-28 15:07:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2435, '家族环境居住相似性', 2000, 1, 'SFenv', 'EpidemSys/SFenv/index', NULL, '', 1, 0, 'C', '0', '0', 'EpidemSys:SFenv:list', '#', 'admin', '2025-06-28 15:07:04', '', NULL, '家族环境居住相似性菜单');
INSERT INTO `sys_menu` VALUES (2436, '家族环境居住相似性查询', 2435, 1, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'EpidemSys:SFenv:query', '#', 'admin', '2025-06-28 15:07:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2437, '家族环境居住相似性新增', 2435, 2, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'EpidemSys:SFenv:add', '#', 'admin', '2025-06-28 15:07:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2438, '家族环境居住相似性修改', 2435, 3, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'EpidemSys:SFenv:edit', '#', 'admin', '2025-06-28 15:07:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2439, '家族环境居住相似性删除', 2435, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'EpidemSys:SFenv:remove', '#', 'admin', '2025-06-28 15:07:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2440, '家族环境居住相似性导出', 2435, 5, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'EpidemSys:SFenv:export', '#', 'admin', '2025-06-28 15:07:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2441, '学习/工作环境信息', 2000, 1, 'StudyLearnenv', 'EpidemSys/StudyLearnenv/index', NULL, '', 1, 0, 'C', '0', '0', 'EpidemSys:StudyLearnenv:list', '#', 'admin', '2025-06-28 15:07:08', '', NULL, '学习/工作环境信息菜单');
INSERT INTO `sys_menu` VALUES (2442, '学习/工作环境信息查询', 2441, 1, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'EpidemSys:StudyLearnenv:query', '#', 'admin', '2025-06-28 15:07:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2443, '学习/工作环境信息新增', 2441, 2, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'EpidemSys:StudyLearnenv:add', '#', 'admin', '2025-06-28 15:07:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2444, '学习/工作环境信息修改', 2441, 3, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'EpidemSys:StudyLearnenv:edit', '#', 'admin', '2025-06-28 15:07:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2445, '学习/工作环境信息删除', 2441, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'EpidemSys:StudyLearnenv:remove', '#', 'admin', '2025-06-28 15:07:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2446, '学习/工作环境信息导出', 2441, 5, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'EpidemSys:StudyLearnenv:export', '#', 'admin', '2025-06-28 15:07:08', '', NULL, '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` int NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '通知公告表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (1, '温馨提醒：2018-07-01 若依新版本发布啦', '2', 0xE696B0E78988E69CACE58685E5AEB9, '0', 'admin', '2025-06-26 21:44:33', '', NULL, '管理员');
INSERT INTO `sys_notice` VALUES (2, '维护通知：2018-07-01 若依系统凌晨维护', '1', 0xE7BBB4E68AA4E58685E5AEB9, '0', 'admin', '2025-06-26 21:44:33', '', NULL, '管理员');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` int NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '返回参数',
  `status` int NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime NULL DEFAULT NULL COMMENT '操作时间',
  `cost_time` bigint NULL DEFAULT 0 COMMENT '消耗时间',
  PRIMARY KEY (`oper_id`) USING BTREE,
  INDEX `idx_sys_oper_log_bt`(`business_type` ASC) USING BTREE,
  INDEX `idx_sys_oper_log_s`(`status` ASC) USING BTREE,
  INDEX `idx_sys_oper_log_ot`(`oper_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 369 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '操作日志记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (100, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2025-06-26 21:44:33\",\"icon\":\"guide\",\"isCache\":\"0\",\"isFrame\":\"0\",\"menuId\":4,\"menuName\":\"若依官网\",\"menuType\":\"M\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"http://ruoyi.vip\",\"perms\":\"\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-27 09:16:58', 22);
INSERT INTO `sys_oper_log` VALUES (101, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"edit\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"流调数据库\",\"menuType\":\"M\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"path\":\"EpidemSys\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-27 09:19:54', 8);
INSERT INTO `sys_oper_log` VALUES (102, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"family_history_primary,family_history_secondary,survey_area_environment,survey_basic_info,survey_confounding_factors,survey_environment_exposure,survey_family_env,survey_learning_work_env,survey_monitoring_methods,survey_providers\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-27 09:20:47', 285);
INSERT INTO `sys_oper_log` VALUES (103, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"primary\",\"className\":\"FamilyHistoryPrimary\",\"columns\":[{\"capJavaField\":\"PrimId\",\"columnComment\":\"一级亲属号\",\"columnId\":1,\"columnName\":\"prim_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 09:20:47\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"primId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"SurveyId\",\"columnComment\":\"患者号\",\"columnId\":2,\"columnName\":\"survey_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 09:20:47\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"surveyId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Relation\",\"columnComment\":\"关系\",\"columnId\":3,\"columnName\":\"relation\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 09:20:47\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"relation\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Diseases\",\"columnComment\":\"疾病\",\"columnId\":4,\"columnName\":\"diseases\",\"columnType\":\"text\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 09:20:47\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"textarea\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-27 09:23:28', 23);
INSERT INTO `sys_oper_log` VALUES (104, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"secondary\",\"className\":\"FamilyHistorySecondary\",\"columns\":[{\"capJavaField\":\"SecId\",\"columnComment\":\"二级亲属号\",\"columnId\":5,\"columnName\":\"sec_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 09:20:47\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"secId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"SurveyId\",\"columnComment\":\"患者号\",\"columnId\":6,\"columnName\":\"survey_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 09:20:47\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"surveyId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Relation\",\"columnComment\":\"关系\",\"columnId\":7,\"columnName\":\"relation\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 09:20:47\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"0\",\"javaField\":\"relation\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Diseases\",\"columnComment\":\"疾病\",\"columnId\":8,\"columnName\":\"diseases\",\"columnType\":\"text\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 09:20:47\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"textarea\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"0\",\"javaFie', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-27 09:24:39', 15);
INSERT INTO `sys_oper_log` VALUES (105, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"primary\",\"className\":\"FamilyHistoryPrimary\",\"columns\":[{\"capJavaField\":\"PrimId\",\"columnComment\":\"一级亲属号\",\"columnId\":1,\"columnName\":\"prim_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 09:20:47\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"primId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2025-06-27 09:23:28\",\"usableColumn\":false},{\"capJavaField\":\"SurveyId\",\"columnComment\":\"患者号\",\"columnId\":2,\"columnName\":\"survey_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 09:20:47\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"surveyId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2025-06-27 09:23:28\",\"usableColumn\":false},{\"capJavaField\":\"Relation\",\"columnComment\":\"关系\",\"columnId\":3,\"columnName\":\"relation\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 09:20:47\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"0\",\"javaField\":\"relation\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2025-06-27 09:23:28\",\"usableColumn\":false},{\"capJavaField\":\"Diseases\",\"columnComment\":\"疾病\",\"columnId\":4,\"columnName\":\"diseases\",\"columnType\":\"text\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 09:20:47\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"textarea\",\"increment\":false,\"insert\":true,\"isEd', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-27 09:24:48', 10);
INSERT INTO `sys_oper_log` VALUES (106, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"environment\",\"className\":\"SurveyAreaEnvironment\",\"columns\":[{\"capJavaField\":\"EnvAreaId\",\"columnComment\":\"城乡环境号\",\"columnId\":9,\"columnName\":\"env_area_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 09:20:47\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"envAreaId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"SurveyId\",\"columnComment\":\"患者号\",\"columnId\":10,\"columnName\":\"survey_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 09:20:47\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"surveyId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"UrbanPm25Avg\",\"columnComment\":\"城市pm2.5年均浓度\",\"columnId\":11,\"columnName\":\"urban_pm25_avg\",\"columnType\":\"float\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 09:20:47\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"0\",\"javaField\":\"urbanPm25Avg\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"UrbanPm25Seasonal\",\"columnComment\":\"城市pm2.5季节性变化\",\"columnId\":12,\"columnName\":\"urban_pm25_seasonal\",\"columnType\":\"text\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 09:20:47\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"textarea\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-27 09:29:58', 24);
INSERT INTO `sys_oper_log` VALUES (107, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"info\",\"className\":\"SurveyBasicInfo\",\"columns\":[{\"capJavaField\":\"SurveyId\",\"columnComment\":\"患者号\",\"columnId\":23,\"columnName\":\"survey_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 09:20:47\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"surveyId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"PatientId\",\"columnComment\":\"病人号\",\"columnId\":24,\"columnName\":\"patient_id\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 09:20:47\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"patientId\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"SurveyDate\",\"columnComment\":\"调查时间\",\"columnId\":25,\"columnName\":\"survey_date\",\"columnType\":\"date\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 09:20:47\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"0\",\"javaField\":\"surveyDate\",\"javaType\":\"Date\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ChildName\",\"columnComment\":\"姓名\",\"columnId\":26,\"columnName\":\"child_name\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 09:20:47\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"is', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-27 09:36:10', 34);
INSERT INTO `sys_oper_log` VALUES (108, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"factors\",\"className\":\"SurveyConfoundingFactors\",\"columns\":[{\"capJavaField\":\"ConfoundId\",\"columnComment\":\"其他因素号\",\"columnId\":45,\"columnName\":\"confound_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 09:20:47\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"confoundId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"SurveyId\",\"columnComment\":\"患者号\",\"columnId\":46,\"columnName\":\"survey_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 09:20:47\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"surveyId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"DietType\",\"columnComment\":\"饮食习惯\",\"columnId\":47,\"columnName\":\"diet_type\",\"columnType\":\"enum(\'高加工食品\',\'传统饮食\')\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 09:20:47\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"0\",\"javaField\":\"dietType\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"VitaminD400u\",\"columnComment\":\"是否每日摄入维生素\",\"columnId\":48,\"columnName\":\"vitamin_d_400u\",\"columnType\":\"tinyint(1)\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 09:20:47\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-27 09:42:09', 24);
INSERT INTO `sys_oper_log` VALUES (109, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"exposure\",\"className\":\"SurveyEnvironmentExposure\",\"columns\":[{\"capJavaField\":\"EnvId\",\"columnComment\":\"家庭环境号\",\"columnId\":63,\"columnName\":\"env_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 09:20:47\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"envId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"SurveyId\",\"columnComment\":\"患者号\",\"columnId\":64,\"columnName\":\"survey_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 09:20:47\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"surveyId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"HouseType\",\"columnComment\":\"房屋类型\",\"columnId\":65,\"columnName\":\"house_type\",\"columnType\":\"enum(\'平房\',\'楼房\',\'别墅\',\'其他\')\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 09:20:47\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"0\",\"javaField\":\"houseType\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"BuildingMaterial\",\"columnComment\":\"建筑材料\",\"columnId\":66,\"columnName\":\"building_material\",\"columnType\":\"enum(\'木质\',\'混凝土\',\'其他\')\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 09:20:47\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"i', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-27 09:51:34', 53);
INSERT INTO `sys_oper_log` VALUES (110, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"env\",\"className\":\"SurveyFamilyEnv\",\"columns\":[{\"capJavaField\":\"FamilyEnvId\",\"columnComment\":\"家族环境号\",\"columnId\":100,\"columnName\":\"family_env_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 09:20:47\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"familyEnvId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"SurveyId\",\"columnComment\":\"患者号\",\"columnId\":101,\"columnName\":\"survey_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 09:20:47\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"surveyId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"SharedSmokingExposure\",\"columnComment\":\"共同暴露因素：吸烟\",\"columnId\":102,\"columnName\":\"shared_smoking_exposure\",\"columnType\":\"tinyint(1)\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 09:20:47\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"sharedSmokingExposure\",\"javaType\":\"Integer\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"usableColumn\":false}],\"crud\":true,\"functionAuthor\":\"ruoyi\",\"functionName\":\"家族环境\",\"genPath\":\"/\",\"genType\":\"0\",\"moduleName\":\"EpidemSys\",\"options\":\"{\\\"parentMenuId\\\":2000}\",\"packageName\":\"com.ruoyi.EpidemSys\",\"params\":{\"parentMenuId\":2000},\"parentMenuId\":2000,\"sub\":false,\"tableComment\":\"家族环境\",\"tableId\":7,\"tableN', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-27 09:53:11', 7);
INSERT INTO `sys_oper_log` VALUES (111, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"env\",\"className\":\"SurveyLearningWorkEnv\",\"columns\":[{\"capJavaField\":\"LearnEnvId\",\"columnComment\":\"学习/工作环境号\",\"columnId\":103,\"columnName\":\"learn_env_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 09:20:47\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"learnEnvId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":8,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"SurveyId\",\"columnComment\":\"患者号\",\"columnId\":104,\"columnName\":\"survey_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 09:20:47\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"surveyId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":8,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"LocationType\",\"columnComment\":\"位置类型\",\"columnId\":105,\"columnName\":\"location_type\",\"columnType\":\"enum(\'城市中心\',\'郊区\',\'农村\')\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 09:20:47\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"0\",\"javaField\":\"locationType\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":8,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"VentilationQuality\",\"columnComment\":\"通风情况\",\"columnId\":106,\"columnName\":\"ventilation_quality\",\"columnType\":\"enum(\'良好\',\'一般\',\'差\')\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 09:20:47\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-27 09:56:19', 18);
INSERT INTO `sys_oper_log` VALUES (112, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"env\",\"className\":\"SurveyLearningWorkEnv\",\"columns\":[{\"capJavaField\":\"LearnEnvId\",\"columnComment\":\"学习/工作环境号\",\"columnId\":103,\"columnName\":\"learn_env_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 09:20:47\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"learnEnvId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":8,\"updateBy\":\"\",\"updateTime\":\"2025-06-27 09:56:19\",\"usableColumn\":false},{\"capJavaField\":\"SurveyId\",\"columnComment\":\"患者号\",\"columnId\":104,\"columnName\":\"survey_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 09:20:47\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"surveyId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":8,\"updateBy\":\"\",\"updateTime\":\"2025-06-27 09:56:19\",\"usableColumn\":false},{\"capJavaField\":\"LocationType\",\"columnComment\":\"位置类型\",\"columnId\":105,\"columnName\":\"location_type\",\"columnType\":\"enum(\'城市中心\',\'郊区\',\'农村\')\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 09:20:47\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"0\",\"javaField\":\"locationType\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":8,\"updateBy\":\"\",\"updateTime\":\"2025-06-27 09:56:19\",\"usableColumn\":false},{\"capJavaField\":\"VentilationQuality\",\"columnComment\":\"通风情况\",\"columnId\":106,\"columnName\":\"ventilation_quality\",\"columnType\":\"enum(\'良好\',\'一般\',\'差\')\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 09:20:47\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-27 09:57:55', 16);
INSERT INTO `sys_oper_log` VALUES (113, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"SLenv\",\"className\":\"SurveyLearningWorkEnv\",\"columns\":[{\"capJavaField\":\"LearnEnvId\",\"columnComment\":\"学习/工作环境号\",\"columnId\":103,\"columnName\":\"learn_env_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 09:20:47\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"learnEnvId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":8,\"updateBy\":\"\",\"updateTime\":\"2025-06-27 09:57:55\",\"usableColumn\":false},{\"capJavaField\":\"SurveyId\",\"columnComment\":\"患者号\",\"columnId\":104,\"columnName\":\"survey_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 09:20:47\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"surveyId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":8,\"updateBy\":\"\",\"updateTime\":\"2025-06-27 09:57:55\",\"usableColumn\":false},{\"capJavaField\":\"LocationType\",\"columnComment\":\"位置类型\",\"columnId\":105,\"columnName\":\"location_type\",\"columnType\":\"enum(\'城市中心\',\'郊区\',\'农村\')\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 09:20:47\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"0\",\"javaField\":\"locationType\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":8,\"updateBy\":\"\",\"updateTime\":\"2025-06-27 09:57:55\",\"usableColumn\":false},{\"capJavaField\":\"VentilationQuality\",\"columnComment\":\"通风情况\",\"columnId\":106,\"columnName\":\"ventilation_quality\",\"columnType\":\"enum(\'良好\',\'一般\',\'差\')\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 09:20:4', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-27 09:59:30', 16);
INSERT INTO `sys_oper_log` VALUES (114, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"methods\",\"className\":\"SurveyMonitoringMethods\",\"columns\":[{\"capJavaField\":\"MethodId\",\"columnComment\":\"方法号\",\"columnId\":113,\"columnName\":\"method_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 09:20:47\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"methodId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":9,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"SurveyId\",\"columnComment\":\"患者号\",\"columnId\":114,\"columnName\":\"survey_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 09:20:47\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"surveyId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":9,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Pm25DetectorModel\",\"columnComment\":\"pm2.5监测仪器号\",\"columnId\":115,\"columnName\":\"pm25_detector_model\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 09:20:47\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"0\",\"javaField\":\"pm25DetectorModel\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":9,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"PollenGravitySettle\",\"columnComment\":\"花粉重力沉降法\",\"columnId\":116,\"columnName\":\"pollen_gravity_settle\",\"columnType\":\"tinyint(1)\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 09:20:47\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-27 10:02:34', 16);
INSERT INTO `sys_oper_log` VALUES (115, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"providers\",\"className\":\"SurveyProviders\",\"columns\":[{\"capJavaField\":\"ProviderId\",\"columnComment\":\"调查者号\",\"columnId\":125,\"columnName\":\"provider_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 09:20:47\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"providerId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":10,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"SurveyId\",\"columnComment\":\"患者号\",\"columnId\":126,\"columnName\":\"survey_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 09:20:47\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"surveyId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":10,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"姓名\",\"columnId\":127,\"columnName\":\"name\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 09:20:47\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":10,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Title\",\"columnComment\":\"职称\",\"columnId\":128,\"columnName\":\"title\",\"columnType\":\"enum(\'住院医师\',\'主治医师\',\'副主任医师\',\'主任医师\')\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 09:20:47\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-27 10:03:45', 8);
INSERT INTO `sys_oper_log` VALUES (116, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"family_history_primary,family_history_secondary,survey_area_environment,survey_basic_info,survey_confounding_factors,survey_environment_exposure,survey_family_env,survey_learning_work_env,survey_monitoring_methods,survey_providers\"}', NULL, 0, NULL, '2025-06-27 10:04:09', 774);
INSERT INTO `sys_oper_log` VALUES (117, '城乡环境监测', 1, 'com.ruoyi.EpidemSys.controller.SurveyAreaEnvironmentController.add()', 'POST', 1, 'admin', '研发部门', '/EpidemSys/environment', '127.0.0.1', '内网IP', '{\"params\":{},\"ruralBiomassPollution\":1,\"ruralPm25Avg\":1,\"ruralPm25Burning\":1,\"ruralPollenTypes\":\"1\",\"surveyId\":1,\"urbanPm25Avg\":1,\"urbanPm25Seasonal\":\"1\",\"urbanPollenDistribution\":\"1\",\"urbanPollenPeak\":1,\"urbanPollenTypes\":\"1\",\"urbanPollutants\":\"1\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot add or update a child row: a foreign key constraint fails (`ry-vue`.`survey_area_environment`, CONSTRAINT `survey_area_environment_ibfk_1` FOREIGN KEY (`survey_id`) REFERENCES `survey_basic_info` (`survey_id`))\r\n### The error may exist in file [E:\\RuoYi-Vue-master\\ruoyi-admin\\target\\classes\\mapper\\EpidemSys\\SurveyAreaEnvironmentMapper.xml]\r\n### The error may involve com.ruoyi.EpidemSys.mapper.SurveyAreaEnvironmentMapper.insertSurveyAreaEnvironment-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into survey_area_environment          ( survey_id,             urban_pm25_avg,             urban_pm25_seasonal,             urban_pollen_types,             urban_pollen_distribution,             urban_pollen_peak,             urban_pollutants,                          rural_pm25_burning,             rural_pm25_avg,             rural_pollen_types,             rural_biomass_pollution )           values ( ?,             ?,             ?,             ?,             ?,             ?,             ?,                          ?,             ?,             ?,             ? )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot add or update a child row: a foreign key constraint fails (`ry-vue`.`survey_area_environment`, CONSTRAINT `survey_area_environment_ibfk_1` FOREIGN KEY (`survey_id`) REFERENCES `survey_basic_info` (`survey_id`))\n; Cannot add or update a child row: a foreign key constraint fails (`ry-vue`.`survey_area_environment`, CONSTRAINT `survey_area_environment_ibfk_1` FOREIGN KEY (`survey_id`) REFERENCES `survey_basic_info` (`survey_id`)); nested exception is java.sql.SQLIntegrityConstraintViolationException: Cannot add or update a child row: a foreign key constraint fails (`ry-vue`.`survey_area_environment`, CONSTRAINT `survey_area_environment_ibfk_1` FOREIGN KEY (`survey_id`) REFERENCES `survey_basic_info` (`survey_id`))', '2025-06-27 10:13:57', 161);
INSERT INTO `sys_oper_log` VALUES (118, '城乡环境监测', 1, 'com.ruoyi.EpidemSys.controller.SurveyAreaEnvironmentController.add()', 'POST', 1, 'admin', '研发部门', '/EpidemSys/environment', '127.0.0.1', '内网IP', '{\"params\":{},\"surveyId\":1}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot add or update a child row: a foreign key constraint fails (`ry-vue`.`survey_area_environment`, CONSTRAINT `survey_area_environment_ibfk_1` FOREIGN KEY (`survey_id`) REFERENCES `survey_basic_info` (`survey_id`))\r\n### The error may exist in file [E:\\RuoYi-Vue-master\\ruoyi-admin\\target\\classes\\mapper\\EpidemSys\\SurveyAreaEnvironmentMapper.xml]\r\n### The error may involve com.ruoyi.EpidemSys.mapper.SurveyAreaEnvironmentMapper.insertSurveyAreaEnvironment-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into survey_area_environment          ( survey_id )           values ( ? )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot add or update a child row: a foreign key constraint fails (`ry-vue`.`survey_area_environment`, CONSTRAINT `survey_area_environment_ibfk_1` FOREIGN KEY (`survey_id`) REFERENCES `survey_basic_info` (`survey_id`))\n; Cannot add or update a child row: a foreign key constraint fails (`ry-vue`.`survey_area_environment`, CONSTRAINT `survey_area_environment_ibfk_1` FOREIGN KEY (`survey_id`) REFERENCES `survey_basic_info` (`survey_id`)); nested exception is java.sql.SQLIntegrityConstraintViolationException: Cannot add or update a child row: a foreign key constraint fails (`ry-vue`.`survey_area_environment`, CONSTRAINT `survey_area_environment_ibfk_1` FOREIGN KEY (`survey_id`) REFERENCES `survey_basic_info` (`survey_id`))', '2025-06-27 10:14:11', 2);
INSERT INTO `sys_oper_log` VALUES (119, '家庭环境暴露信息', 1, 'com.ruoyi.EpidemSys.controller.SurveyEnvironmentExposureController.add()', 'POST', 1, 'admin', '研发部门', '/EpidemSys/exposure', '127.0.0.1', '内网IP', '{\"params\":{},\"surveyId\":1}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot add or update a child row: a foreign key constraint fails (`ry-vue`.`survey_environment_exposure`, CONSTRAINT `survey_environment_exposure_ibfk_1` FOREIGN KEY (`survey_id`) REFERENCES `survey_basic_info` (`survey_id`))\r\n### The error may exist in file [E:\\RuoYi-Vue-master\\ruoyi-admin\\target\\classes\\mapper\\EpidemSys\\SurveyEnvironmentExposureMapper.xml]\r\n### The error may involve com.ruoyi.EpidemSys.mapper.SurveyEnvironmentExposureMapper.insertSurveyEnvironmentExposure-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into survey_environment_exposure          ( survey_id )           values ( ? )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot add or update a child row: a foreign key constraint fails (`ry-vue`.`survey_environment_exposure`, CONSTRAINT `survey_environment_exposure_ibfk_1` FOREIGN KEY (`survey_id`) REFERENCES `survey_basic_info` (`survey_id`))\n; Cannot add or update a child row: a foreign key constraint fails (`ry-vue`.`survey_environment_exposure`, CONSTRAINT `survey_environment_exposure_ibfk_1` FOREIGN KEY (`survey_id`) REFERENCES `survey_basic_info` (`survey_id`)); nested exception is java.sql.SQLIntegrityConstraintViolationException: Cannot add or update a child row: a foreign key constraint fails (`ry-vue`.`survey_environment_exposure`, CONSTRAINT `survey_environment_exposure_ibfk_1` FOREIGN KEY (`survey_id`) REFERENCES `survey_basic_info` (`survey_id`))', '2025-06-27 10:16:05', 17);
INSERT INTO `sys_oper_log` VALUES (120, '患儿基本信息', 1, 'com.ruoyi.EpidemSys.controller.SurveyBasicInfoController.add()', 'POST', 1, 'admin', '研发部门', '/EpidemSys/info', '127.0.0.1', '内网IP', '{\"address\":\"福州市\",\"age\":20,\"childName\":\"张三\",\"gender\":\"男\",\"height\":180,\"params\":{},\"patientId\":\"001\",\"residenceYears\":1,\"surveyDate\":\"2025-06-27\",\"weight\":130}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot add or update a child row: a foreign key constraint fails (`ry-vue`.`survey_basic_info`, CONSTRAINT `survey_basic_info_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `clinical_db`.`patients` (`patient_id`))\r\n### The error may exist in file [E:\\RuoYi-Vue-master\\ruoyi-admin\\target\\classes\\mapper\\EpidemSys\\SurveyBasicInfoMapper.xml]\r\n### The error may involve com.ruoyi.EpidemSys.mapper.SurveyBasicInfoMapper.insertSurveyBasicInfo-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into survey_basic_info          ( patient_id,             survey_date,             child_name,             gender,             age,                          residence_years,             address,             height,             weight )           values ( ?,             ?,             ?,             ?,             ?,                          ?,             ?,             ?,             ? )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot add or update a child row: a foreign key constraint fails (`ry-vue`.`survey_basic_info`, CONSTRAINT `survey_basic_info_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `clinical_db`.`patients` (`patient_id`))\n; Cannot add or update a child row: a foreign key constraint fails (`ry-vue`.`survey_basic_info`, CONSTRAINT `survey_basic_info_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `clinical_db`.`patients` (`patient_id`)); nested exception is java.sql.SQLIntegrityConstraintViolationException: Cannot add or update a child row: a foreign key constraint fails (`ry-vue`.`survey_basic_info`, CONSTRAINT `survey_basic_info_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `clinical_db`.`patients` (`patient_id`))', '2025-06-27 11:07:57', 68);
INSERT INTO `sys_oper_log` VALUES (121, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"logininfor\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"临床数据库\",\"menuType\":\"M\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"path\":\"ClinicalSys\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-27 14:24:03', 23);
INSERT INTO `sys_oper_log` VALUES (122, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', '研发部门', '/tool/gen/1,2,3,4,5,6,7,8,9,10', '127.0.0.1', '内网IP', '[1,2,3,4,5,6,7,8,9,10]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-27 14:24:20', 21);
INSERT INTO `sys_oper_log` VALUES (123, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"clinical_other_treatments,contacts,diagnoses,expenses,family_history,imaging,providers,feno_tests,followup_notes,history,symptoms,insurance_info,lab_tests,lung_tests,medical_orgs,medications,medications_history,patients\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-27 14:25:10', 291);
INSERT INTO `sys_oper_log` VALUES (124, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"treatments\",\"className\":\"ClinicalOtherTreatments\",\"columns\":[{\"capJavaField\":\"TreatmentId\",\"columnComment\":\"其他治疗号\",\"columnId\":129,\"columnName\":\"treatment_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 14:25:10\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"treatmentId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":11,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"PatientId\",\"columnComment\":\"病人号\",\"columnId\":130,\"columnName\":\"patient_id\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 14:25:10\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"patientId\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":11,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"TreatmentName\",\"columnComment\":\"治疗方法\",\"columnId\":131,\"columnName\":\"treatment_name\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 14:25:10\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"0\",\"javaField\":\"treatmentName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"LIKE\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":11,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"StartTime\",\"columnComment\":\"开始时间\",\"columnId\":132,\"columnName\":\"start_time\",\"columnType\":\"date\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 14:25:10\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInse', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-27 14:28:18', 31);
INSERT INTO `sys_oper_log` VALUES (125, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"diagnoses\",\"className\":\"Diagnoses\",\"columns\":[{\"capJavaField\":\"DiagnosisId\",\"columnComment\":\"诊断号\",\"columnId\":140,\"columnName\":\"diagnosis_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 14:25:10\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"diagnosisId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":13,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"PatientId\",\"columnComment\":\"病人号\",\"columnId\":141,\"columnName\":\"patient_id\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 14:25:10\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"patientId\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":13,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"DiseaseName\",\"columnComment\":\"疾病名称\",\"columnId\":142,\"columnName\":\"disease_name\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 14:25:10\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"0\",\"javaField\":\"diseaseName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"LIKE\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":13,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Severity\",\"columnComment\":\"严重程度\",\"columnId\":143,\"columnName\":\"severity\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 14:25:10\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-27 14:30:40', 14);
INSERT INTO `sys_oper_log` VALUES (126, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"expenses\",\"className\":\"Expenses\",\"columns\":[{\"capJavaField\":\"ExpenseId\",\"columnComment\":\"费用号\",\"columnId\":145,\"columnName\":\"expense_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 14:25:10\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"expenseId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":14,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"PatientId\",\"columnComment\":\"病人号\",\"columnId\":146,\"columnName\":\"patient_id\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 14:25:10\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"patientId\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":14,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ExpenseType\",\"columnComment\":\"费用类别\",\"columnId\":147,\"columnName\":\"expense_type\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 14:25:10\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"expenseType\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":14,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Amount\",\"columnComment\":\"费用\",\"columnId\":148,\"columnName\":\"amount\",\"columnType\":\"decimal(10,2)\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 14:25:10\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQu', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-27 14:31:44', 12);
INSERT INTO `sys_oper_log` VALUES (127, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"treatments\",\"className\":\"ClinicalOtherTreatments\",\"columns\":[{\"capJavaField\":\"TreatmentId\",\"columnComment\":\"其他治疗号\",\"columnId\":129,\"columnName\":\"treatment_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 14:25:10\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"treatmentId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":11,\"updateBy\":\"\",\"updateTime\":\"2025-06-27 14:28:18\",\"usableColumn\":false},{\"capJavaField\":\"PatientId\",\"columnComment\":\"病人号\",\"columnId\":130,\"columnName\":\"patient_id\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 14:25:10\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"patientId\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":11,\"updateBy\":\"\",\"updateTime\":\"2025-06-27 14:28:18\",\"usableColumn\":false},{\"capJavaField\":\"TreatmentName\",\"columnComment\":\"治疗方法\",\"columnId\":131,\"columnName\":\"treatment_name\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 14:25:10\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"0\",\"javaField\":\"treatmentName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"LIKE\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":11,\"updateBy\":\"\",\"updateTime\":\"2025-06-27 14:28:18\",\"usableColumn\":false},{\"capJavaField\":\"StartTime\",\"columnComment\":\"开始时间\",\"columnId\":132,\"columnName\":\"start_time\",\"columnType\":\"date\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 14:25:10\",\"dictType\":\"\",', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-27 14:32:01', 14);
INSERT INTO `sys_oper_log` VALUES (128, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"diagnoses\",\"className\":\"Diagnoses\",\"columns\":[{\"capJavaField\":\"DiagnosisId\",\"columnComment\":\"诊断号\",\"columnId\":140,\"columnName\":\"diagnosis_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 14:25:10\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"diagnosisId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":13,\"updateBy\":\"\",\"updateTime\":\"2025-06-27 14:30:40\",\"usableColumn\":false},{\"capJavaField\":\"PatientId\",\"columnComment\":\"病人号\",\"columnId\":141,\"columnName\":\"patient_id\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 14:25:10\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"patientId\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":13,\"updateBy\":\"\",\"updateTime\":\"2025-06-27 14:30:40\",\"usableColumn\":false},{\"capJavaField\":\"DiseaseName\",\"columnComment\":\"疾病名称\",\"columnId\":142,\"columnName\":\"disease_name\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 14:25:10\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"0\",\"javaField\":\"diseaseName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"LIKE\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":13,\"updateBy\":\"\",\"updateTime\":\"2025-06-27 14:30:40\",\"usableColumn\":false},{\"capJavaField\":\"Severity\",\"columnComment\":\"严重程度\",\"columnId\":143,\"columnName\":\"severity\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 14:25:10\",\"dictType\":\"\",\"edit\":true,\"htmlTy', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-27 14:32:11', 13);
INSERT INTO `sys_oper_log` VALUES (129, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"history\",\"className\":\"FamilyHistory\",\"columns\":[{\"capJavaField\":\"FamId\",\"columnComment\":\"家族号\",\"columnId\":149,\"columnName\":\"fam_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 14:25:10\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"famId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":15,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"PatientId\",\"columnComment\":\"病人号\",\"columnId\":150,\"columnName\":\"patient_id\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 14:25:10\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"patientId\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":15,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"RelativeRelation\",\"columnComment\":\"相对关系\",\"columnId\":151,\"columnName\":\"relative_relation\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 14:25:10\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"0\",\"javaField\":\"relativeRelation\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":15,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"AllergyDisease\",\"columnComment\":\"过敏性疾病\",\"columnId\":152,\"columnName\":\"allergy_disease\",\"columnType\":\"text\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 14:25:10\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"textarea\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-27 14:35:04', 11);
INSERT INTO `sys_oper_log` VALUES (130, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"expenses\",\"className\":\"Expenses\",\"columns\":[{\"capJavaField\":\"ExpenseId\",\"columnComment\":\"费用号\",\"columnId\":145,\"columnName\":\"expense_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 14:25:10\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"expenseId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":14,\"updateBy\":\"\",\"updateTime\":\"2025-06-27 14:31:44\",\"usableColumn\":false},{\"capJavaField\":\"PatientId\",\"columnComment\":\"病人号\",\"columnId\":146,\"columnName\":\"patient_id\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 14:25:10\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"patientId\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":14,\"updateBy\":\"\",\"updateTime\":\"2025-06-27 14:31:44\",\"usableColumn\":false},{\"capJavaField\":\"ExpenseType\",\"columnComment\":\"费用类别\",\"columnId\":147,\"columnName\":\"expense_type\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 14:25:10\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"0\",\"javaField\":\"expenseType\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":14,\"updateBy\":\"\",\"updateTime\":\"2025-06-27 14:31:44\",\"usableColumn\":false},{\"capJavaField\":\"Amount\",\"columnComment\":\"费用\",\"columnId\":148,\"columnName\":\"amount\",\"columnType\":\"decimal(10,2)\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 14:25:10\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-27 14:35:24', 10);
INSERT INTO `sys_oper_log` VALUES (131, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"tests\",\"className\":\"FenoTests\",\"columns\":[{\"capJavaField\":\"FenoId\",\"columnComment\":\"检测号\",\"columnId\":153,\"columnName\":\"feno_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 14:25:10\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"fenoId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":16,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"PatientId\",\"columnComment\":\"病人号\",\"columnId\":154,\"columnName\":\"patient_id\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 14:25:10\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"patientId\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":16,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"TestName\",\"columnComment\":\"检查名称\",\"columnId\":155,\"columnName\":\"test_name\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 14:25:10\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"0\",\"javaField\":\"testName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"LIKE\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":16,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"TestDate\",\"columnComment\":\"检查日期\",\"columnId\":156,\"columnName\":\"test_date\",\"columnType\":\"date\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 14:25:10\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequi', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-27 14:39:49', 14);
INSERT INTO `sys_oper_log` VALUES (132, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"notes\",\"className\":\"FollowupNotes\",\"columns\":[{\"capJavaField\":\"FollowupId\",\"columnComment\":\"随访号\",\"columnId\":158,\"columnName\":\"followup_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 14:25:10\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"followupId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":17,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"PatientId\",\"columnComment\":\"病人号\",\"columnId\":159,\"columnName\":\"patient_id\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 14:25:10\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"patientId\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":17,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"SymptomImprovement\",\"columnComment\":\"过敏症状改善情况\",\"columnId\":160,\"columnName\":\"symptom_improvement\",\"columnType\":\"text\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 14:25:10\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"textarea\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"0\",\"javaField\":\"symptomImprovement\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":17,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"PhysicalDevelopment\",\"columnComment\":\"身体发育情况\",\"columnId\":161,\"columnName\":\"physical_development\",\"columnType\":\"text\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 14:25:10\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"textarea\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-27 14:41:43', 14);
INSERT INTO `sys_oper_log` VALUES (133, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"history\",\"className\":\"History\",\"columns\":[{\"capJavaField\":\"HistoryId\",\"columnComment\":\"既往史名\",\"columnId\":164,\"columnName\":\"history_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 14:25:10\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"historyId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":18,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"PatientId\",\"columnComment\":\"病人号\",\"columnId\":165,\"columnName\":\"patient_id\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 14:25:10\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"patientId\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":18,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"FoodAllergyHistory\",\"columnComment\":\"食物过敏源阳性史\",\"columnId\":166,\"columnName\":\"food_allergy_history\",\"columnType\":\"text\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 14:25:10\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"textarea\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"0\",\"javaField\":\"foodAllergyHistory\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":18,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"AllergenExposure\",\"columnComment\":\"吸入过敏源阳性史\",\"columnId\":167,\"columnName\":\"allergen_exposure\",\"columnType\":\"text\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 14:25:10\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"textarea\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"is', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-27 14:44:24', 12);
INSERT INTO `sys_oper_log` VALUES (134, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"imaging\",\"className\":\"Imaging\",\"columns\":[{\"capJavaField\":\"ImagingId\",\"columnComment\":\"影像学号\",\"columnId\":169,\"columnName\":\"imaging_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 14:25:10\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"imagingId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":19,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"PatientId\",\"columnComment\":\"病人号\",\"columnId\":170,\"columnName\":\"patient_id\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 14:25:10\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"patientId\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":19,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ImagingType\",\"columnComment\":\"影像学检查名称\",\"columnId\":171,\"columnName\":\"imaging_type\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 14:25:10\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"0\",\"javaField\":\"imagingType\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":19,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ImagingDate\",\"columnComment\":\"检查时期\",\"columnId\":172,\"columnName\":\"imaging_date\",\"columnType\":\"date\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 14:25:10\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-27 14:45:46', 13);
INSERT INTO `sys_oper_log` VALUES (135, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"info\",\"className\":\"InsuranceInfo\",\"columns\":[{\"capJavaField\":\"InsuranceId\",\"columnComment\":\"医保情况号\",\"columnId\":174,\"columnName\":\"insurance_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 14:25:10\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"insuranceId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":20,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"PatientId\",\"columnComment\":\"病人号\",\"columnId\":175,\"columnName\":\"patient_id\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 14:25:10\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"patientId\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":20,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"InsuranceType\",\"columnComment\":\"医保类型\",\"columnId\":176,\"columnName\":\"insurance_type\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 14:25:10\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"0\",\"javaField\":\"insuranceType\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":20,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"InsuranceNumber\",\"columnComment\":\"医保号\",\"columnId\":177,\"columnName\":\"insurance_number\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 14:25:10\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-27 14:48:48', 10);
INSERT INTO `sys_oper_log` VALUES (136, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"tests\",\"className\":\"LabTests\",\"columns\":[{\"capJavaField\":\"TestId\",\"columnComment\":\"实验室检查号\",\"columnId\":178,\"columnName\":\"test_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 14:25:10\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"testId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":21,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"PatientId\",\"columnComment\":\"病人号\",\"columnId\":179,\"columnName\":\"patient_id\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 14:25:10\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"patientId\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":21,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"TestName\",\"columnComment\":\"检查项目名称\",\"columnId\":180,\"columnName\":\"test_name\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 14:25:10\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"0\",\"javaField\":\"testName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"LIKE\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":21,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"TestDate\",\"columnComment\":\"检查日期\",\"columnId\":181,\"columnName\":\"test_date\",\"columnType\":\"date\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 14:25:10\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isR', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-27 14:50:06', 10);
INSERT INTO `sys_oper_log` VALUES (137, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"tests\",\"className\":\"LungTests\",\"columns\":[{\"capJavaField\":\"LungId\",\"columnComment\":\"肺功能检查号\",\"columnId\":183,\"columnName\":\"lung_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 14:25:10\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"lungId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":22,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"PatientId\",\"columnComment\":\"病人号\",\"columnId\":184,\"columnName\":\"patient_id\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 14:25:10\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"patientId\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":22,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"TestName\",\"columnComment\":\"检查名称\",\"columnId\":185,\"columnName\":\"test_name\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 14:25:10\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"0\",\"javaField\":\"testName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"LIKE\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":22,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"TestDate\",\"columnComment\":\"检查日期\",\"columnId\":186,\"columnName\":\"test_date\",\"columnType\":\"date\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 14:25:10\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRe', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-27 14:51:09', 12);
INSERT INTO `sys_oper_log` VALUES (138, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"medications\",\"className\":\"Medications\",\"columns\":[{\"capJavaField\":\"MedId\",\"columnComment\":\"用药号\",\"columnId\":192,\"columnName\":\"med_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 14:25:10\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"medId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":24,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"PatientId\",\"columnComment\":\"病人号\",\"columnId\":193,\"columnName\":\"patient_id\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 14:25:10\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"patientId\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":24,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"MedicationName\",\"columnComment\":\"药物名称\",\"columnId\":194,\"columnName\":\"medication_name\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 14:25:10\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"medicationName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":24,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"MedicationSpecification\",\"columnComment\":\"药物规格\",\"columnId\":195,\"columnName\":\"medication_specification\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 14:25:10\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"is', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-27 14:53:38', 20);
INSERT INTO `sys_oper_log` VALUES (139, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"history\",\"className\":\"MedicationsHistory\",\"columns\":[{\"capJavaField\":\"MedHisId\",\"columnComment\":\"既往用药号\",\"columnId\":205,\"columnName\":\"med_his_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 14:25:10\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"medHisId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":25,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"PatientId\",\"columnComment\":\"病人号\",\"columnId\":206,\"columnName\":\"patient_id\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 14:25:10\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"patientId\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":25,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"MedicationName\",\"columnComment\":\"药物名称\",\"columnId\":207,\"columnName\":\"medication_name\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 14:25:10\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"0\",\"javaField\":\"medicationName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"LIKE\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":25,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"DurationDays\",\"columnComment\":\"药物使用天数\",\"columnId\":208,\"columnName\":\"duration_days\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 14:25:10\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"i', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-27 14:54:32', 9);
INSERT INTO `sys_oper_log` VALUES (140, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"patients\",\"className\":\"Patients\",\"columns\":[{\"capJavaField\":\"PatientId\",\"columnComment\":\"病人号\",\"columnId\":209,\"columnName\":\"patient_id\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 14:25:10\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"patientId\",\"javaType\":\"String\",\"list\":false,\"params\":{},\"pk\":true,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":1,\"superColumn\":false,\"tableId\":26,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"VisitTime\",\"columnComment\":\"就诊时间\",\"columnId\":210,\"columnName\":\"visit_time\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 14:25:10\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"0\",\"javaField\":\"visitTime\",\"javaType\":\"Date\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":26,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"姓名\",\"columnId\":211,\"columnName\":\"name\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 14:25:10\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":26,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Gender\",\"columnComment\":\"性别\",\"columnId\":212,\"columnName\":\"gender\",\"columnType\":\"char(1)\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 14:25:10\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-27 14:56:28', 20);
INSERT INTO `sys_oper_log` VALUES (141, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"providers\",\"className\":\"Providers\",\"columns\":[{\"capJavaField\":\"ProviderId\",\"columnComment\":\"服务者号\",\"columnId\":220,\"columnName\":\"provider_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 14:25:10\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"providerId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":27,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"PatientId\",\"columnComment\":\"病人号\",\"columnId\":221,\"columnName\":\"patient_id\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 14:25:10\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"patientId\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":27,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ProviderName\",\"columnComment\":\"姓名\",\"columnId\":222,\"columnName\":\"provider_name\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 14:25:10\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"0\",\"javaField\":\"providerName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"LIKE\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":27,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Title\",\"columnComment\":\"职称\",\"columnId\":223,\"columnName\":\"title\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 14:25:10\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-27 14:58:55', 11);
INSERT INTO `sys_oper_log` VALUES (142, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"symptoms\",\"className\":\"Symptoms\",\"columns\":[{\"capJavaField\":\"SymptomId\",\"columnComment\":\"症状号\",\"columnId\":224,\"columnName\":\"symptom_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 14:25:10\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"symptomId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":28,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"PatientId\",\"columnComment\":\"病人号\",\"columnId\":225,\"columnName\":\"patient_id\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 14:25:10\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"patientId\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":28,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"SymptomDescription\",\"columnComment\":\"症状描述\",\"columnId\":226,\"columnName\":\"symptom_description\",\"columnType\":\"text\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 14:25:10\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"textarea\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"0\",\"javaField\":\"symptomDescription\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":28,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"SeverityLevel\",\"columnComment\":\"严重程度\",\"columnId\":227,\"columnName\":\"severity_level\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 14:25:10\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-27 15:00:46', 18);
INSERT INTO `sys_oper_log` VALUES (143, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"contacts\",\"className\":\"Contacts\",\"columns\":[{\"capJavaField\":\"ContactId\",\"columnComment\":\"联系人号\",\"columnId\":135,\"columnName\":\"contact_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 14:25:10\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"contactId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":12,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"PatientId\",\"columnComment\":\"病人号\",\"columnId\":136,\"columnName\":\"patient_id\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 14:25:10\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"patientId\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":12,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Phone\",\"columnComment\":\"联系方式\",\"columnId\":137,\"columnName\":\"phone\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 14:25:10\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"0\",\"javaField\":\"phone\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":12,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"EmergencyContact\",\"columnComment\":\"紧急联系方式\",\"columnId\":138,\"columnName\":\"emergency_contact\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 14:25:10\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-27 15:02:10', 9);
INSERT INTO `sys_oper_log` VALUES (144, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"orgs\",\"className\":\"MedicalOrgs\",\"columns\":[{\"capJavaField\":\"OrgId\",\"columnComment\":\"机构号\",\"columnId\":188,\"columnName\":\"org_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 14:25:10\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"orgId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":23,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"PatientId\",\"columnComment\":\"病人号\",\"columnId\":189,\"columnName\":\"patient_id\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 14:25:10\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"patientId\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":23,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"HospitalName\",\"columnComment\":\"机构名称\",\"columnId\":190,\"columnName\":\"hospital_name\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 14:25:10\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"0\",\"javaField\":\"hospitalName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"LIKE\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":23,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"DepartmentName\",\"columnComment\":\"机构地址\",\"columnId\":191,\"columnName\":\"department_name\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 14:25:10\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-27 15:03:52', 9);
INSERT INTO `sys_oper_log` VALUES (145, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"medications\",\"className\":\"Medications\",\"columns\":[{\"capJavaField\":\"MedId\",\"columnComment\":\"用药号\",\"columnId\":192,\"columnName\":\"med_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 14:25:10\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"medId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":24,\"updateBy\":\"\",\"updateTime\":\"2025-06-27 14:53:38\",\"usableColumn\":false},{\"capJavaField\":\"PatientId\",\"columnComment\":\"病人号\",\"columnId\":193,\"columnName\":\"patient_id\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 14:25:10\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"patientId\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":24,\"updateBy\":\"\",\"updateTime\":\"2025-06-27 14:53:38\",\"usableColumn\":false},{\"capJavaField\":\"MedicationName\",\"columnComment\":\"药物名称\",\"columnId\":194,\"columnName\":\"medication_name\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 14:25:10\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"0\",\"javaField\":\"medicationName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"LIKE\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":24,\"updateBy\":\"\",\"updateTime\":\"2025-06-27 14:53:38\",\"usableColumn\":false},{\"capJavaField\":\"MedicationSpecification\",\"columnComment\":\"药物规格\",\"columnId\":195,\"columnName\":\"medication_specification\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 14:25:10\",\"dictT', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-27 15:08:58', 22);
INSERT INTO `sys_oper_log` VALUES (146, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"history\",\"className\":\"MedicationsHistory\",\"columns\":[{\"capJavaField\":\"MedHisId\",\"columnComment\":\"既往用药号\",\"columnId\":205,\"columnName\":\"med_his_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 14:25:10\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"medHisId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":25,\"updateBy\":\"\",\"updateTime\":\"2025-06-27 14:54:32\",\"usableColumn\":false},{\"capJavaField\":\"PatientId\",\"columnComment\":\"病人号\",\"columnId\":206,\"columnName\":\"patient_id\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 14:25:10\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"patientId\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":25,\"updateBy\":\"\",\"updateTime\":\"2025-06-27 14:54:32\",\"usableColumn\":false},{\"capJavaField\":\"MedicationName\",\"columnComment\":\"药物名称\",\"columnId\":207,\"columnName\":\"medication_name\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 14:25:10\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"0\",\"javaField\":\"medicationName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"LIKE\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":25,\"updateBy\":\"\",\"updateTime\":\"2025-06-27 14:54:32\",\"usableColumn\":false},{\"capJavaField\":\"DurationDays\",\"columnComment\":\"药物使用天数\",\"columnId\":208,\"columnName\":\"duration_days\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 14:25:10\",\"dictType\":\"\",\"edit\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-27 15:09:06', 8);
INSERT INTO `sys_oper_log` VALUES (147, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"clinical_other_treatments,contacts,diagnoses,expenses,family_history,feno_tests,followup_notes,history,imaging,insurance_info,lab_tests,lung_tests,medical_orgs,medications,medications_history,patients,providers,symptoms\"}', NULL, 0, NULL, '2025-06-27 15:22:44', 774);
INSERT INTO `sys_oper_log` VALUES (148, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"history\",\"className\":\"FamilyHistory\",\"columns\":[{\"capJavaField\":\"FamId\",\"columnComment\":\"家族号\",\"columnId\":149,\"columnName\":\"fam_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 14:25:10\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"famId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":15,\"updateBy\":\"\",\"updateTime\":\"2025-06-27 14:35:04\",\"usableColumn\":false},{\"capJavaField\":\"PatientId\",\"columnComment\":\"病人号\",\"columnId\":150,\"columnName\":\"patient_id\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 14:25:10\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"patientId\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":15,\"updateBy\":\"\",\"updateTime\":\"2025-06-27 14:35:04\",\"usableColumn\":false},{\"capJavaField\":\"RelativeRelation\",\"columnComment\":\"相对关系\",\"columnId\":151,\"columnName\":\"relative_relation\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 14:25:10\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"0\",\"javaField\":\"relativeRelation\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":15,\"updateBy\":\"\",\"updateTime\":\"2025-06-27 14:35:04\",\"usableColumn\":false},{\"capJavaField\":\"AllergyDisease\",\"columnComment\":\"过敏性疾病\",\"columnId\":152,\"columnName\":\"allergy_disease\",\"columnType\":\"text\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 14:25:10\",\"dictType\":\"\",\"edit\":true,\"htm', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-27 15:32:34', 49);
INSERT INTO `sys_oper_log` VALUES (149, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"history\",\"className\":\"History\",\"columns\":[{\"capJavaField\":\"HistoryId\",\"columnComment\":\"既往史名\",\"columnId\":164,\"columnName\":\"history_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 14:25:10\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"historyId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":18,\"updateBy\":\"\",\"updateTime\":\"2025-06-27 14:44:24\",\"usableColumn\":false},{\"capJavaField\":\"PatientId\",\"columnComment\":\"病人号\",\"columnId\":165,\"columnName\":\"patient_id\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 14:25:10\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"patientId\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":18,\"updateBy\":\"\",\"updateTime\":\"2025-06-27 14:44:24\",\"usableColumn\":false},{\"capJavaField\":\"FoodAllergyHistory\",\"columnComment\":\"食物过敏源阳性史\",\"columnId\":166,\"columnName\":\"food_allergy_history\",\"columnType\":\"text\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 14:25:10\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"textarea\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"0\",\"javaField\":\"foodAllergyHistory\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":18,\"updateBy\":\"\",\"updateTime\":\"2025-06-27 14:44:24\",\"usableColumn\":false},{\"capJavaField\":\"AllergenExposure\",\"columnComment\":\"吸入过敏源阳性史\",\"columnId\":167,\"columnName\":\"allergen_exposure\",\"columnType\":\"text\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 14:25:10\",\"dictType', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-27 15:32:56', 18);
INSERT INTO `sys_oper_log` VALUES (150, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"clinical_other_treatments,contacts,diagnoses,expenses,family_history,feno_tests,followup_notes,history,imaging,insurance_info,lab_tests,lung_tests,medical_orgs,medications,medications_history,patients,providers,symptoms\"}', NULL, 0, NULL, '2025-06-27 15:33:04', 682);
INSERT INTO `sys_oper_log` VALUES (151, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"lab_tests\",\"className\":\"LabTests\",\"columns\":[{\"capJavaField\":\"TestId\",\"columnComment\":\"实验室检查号\",\"columnId\":178,\"columnName\":\"test_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 14:25:10\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"testId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":21,\"updateBy\":\"\",\"updateTime\":\"2025-06-27 14:50:06\",\"usableColumn\":false},{\"capJavaField\":\"PatientId\",\"columnComment\":\"病人号\",\"columnId\":179,\"columnName\":\"patient_id\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 14:25:10\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"patientId\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":21,\"updateBy\":\"\",\"updateTime\":\"2025-06-27 14:50:06\",\"usableColumn\":false},{\"capJavaField\":\"TestName\",\"columnComment\":\"检查项目名称\",\"columnId\":180,\"columnName\":\"test_name\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 14:25:10\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"0\",\"javaField\":\"testName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"LIKE\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":21,\"updateBy\":\"\",\"updateTime\":\"2025-06-27 14:50:06\",\"usableColumn\":false},{\"capJavaField\":\"TestDate\",\"columnComment\":\"检查日期\",\"columnId\":181,\"columnName\":\"test_date\",\"columnType\":\"date\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 14:25:10\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"datetime\",\"increment\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-27 15:52:12', 54);
INSERT INTO `sys_oper_log` VALUES (152, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"lung_tests\",\"className\":\"LungTests\",\"columns\":[{\"capJavaField\":\"LungId\",\"columnComment\":\"肺功能检查号\",\"columnId\":183,\"columnName\":\"lung_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 14:25:10\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"lungId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":22,\"updateBy\":\"\",\"updateTime\":\"2025-06-27 14:51:09\",\"usableColumn\":false},{\"capJavaField\":\"PatientId\",\"columnComment\":\"病人号\",\"columnId\":184,\"columnName\":\"patient_id\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 14:25:10\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"patientId\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":22,\"updateBy\":\"\",\"updateTime\":\"2025-06-27 14:51:09\",\"usableColumn\":false},{\"capJavaField\":\"TestName\",\"columnComment\":\"检查名称\",\"columnId\":185,\"columnName\":\"test_name\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 14:25:10\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"0\",\"javaField\":\"testName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"LIKE\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":22,\"updateBy\":\"\",\"updateTime\":\"2025-06-27 14:51:09\",\"usableColumn\":false},{\"capJavaField\":\"TestDate\",\"columnComment\":\"检查日期\",\"columnId\":186,\"columnName\":\"test_date\",\"columnType\":\"date\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 14:25:10\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"datetime\",\"increment\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-27 15:52:22', 17);
INSERT INTO `sys_oper_log` VALUES (153, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"medications_history\",\"className\":\"MedicationsHistory\",\"columns\":[{\"capJavaField\":\"MedHisId\",\"columnComment\":\"既往用药号\",\"columnId\":205,\"columnName\":\"med_his_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 14:25:10\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"medHisId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":25,\"updateBy\":\"\",\"updateTime\":\"2025-06-27 15:09:06\",\"usableColumn\":false},{\"capJavaField\":\"PatientId\",\"columnComment\":\"病人号\",\"columnId\":206,\"columnName\":\"patient_id\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 14:25:10\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"patientId\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":25,\"updateBy\":\"\",\"updateTime\":\"2025-06-27 15:09:06\",\"usableColumn\":false},{\"capJavaField\":\"MedicationName\",\"columnComment\":\"药物名称\",\"columnId\":207,\"columnName\":\"medication_name\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 14:25:10\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"0\",\"javaField\":\"medicationName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"LIKE\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":25,\"updateBy\":\"\",\"updateTime\":\"2025-06-27 15:09:06\",\"usableColumn\":false},{\"capJavaField\":\"DurationDays\",\"columnComment\":\"药物使用天数\",\"columnId\":208,\"columnName\":\"duration_days\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 14:25:10\",\"dictTyp', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-27 15:52:57', 13);
INSERT INTO `sys_oper_log` VALUES (154, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"symptoms\",\"className\":\"Symptoms\",\"columns\":[{\"capJavaField\":\"SymptomId\",\"columnComment\":\"症状号\",\"columnId\":224,\"columnName\":\"symptom_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 14:25:10\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"symptomId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":28,\"updateBy\":\"\",\"updateTime\":\"2025-06-27 15:00:46\",\"usableColumn\":false},{\"capJavaField\":\"PatientId\",\"columnComment\":\"病人号\",\"columnId\":225,\"columnName\":\"patient_id\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 14:25:10\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"patientId\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":28,\"updateBy\":\"\",\"updateTime\":\"2025-06-27 15:00:46\",\"usableColumn\":false},{\"capJavaField\":\"SymptomDescription\",\"columnComment\":\"症状描述\",\"columnId\":226,\"columnName\":\"symptom_description\",\"columnType\":\"text\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 14:25:10\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"textarea\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"0\",\"javaField\":\"symptomDescription\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":28,\"updateBy\":\"\",\"updateTime\":\"2025-06-27 15:00:46\",\"usableColumn\":false},{\"capJavaField\":\"SeverityLevel\",\"columnComment\":\"严重程度\",\"columnId\":227,\"columnName\":\"severity_level\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 14:25:10\",\"dictType\":\"\",\"e', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-27 15:53:25', 18);
INSERT INTO `sys_oper_log` VALUES (155, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"clinical_other_treatments,contacts,diagnoses,expenses,family_history,feno_tests,followup_notes,history,imaging,insurance_info,lab_tests,lung_tests,medical_orgs,medications,medications_history,patients,providers,symptoms\"}', NULL, 0, NULL, '2025-06-27 15:53:33', 666);
INSERT INTO `sys_oper_log` VALUES (156, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"family_history\",\"className\":\"FamilyHistory\",\"columns\":[{\"capJavaField\":\"FamId\",\"columnComment\":\"家族号\",\"columnId\":149,\"columnName\":\"fam_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 14:25:10\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"famId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":15,\"updateBy\":\"\",\"updateTime\":\"2025-06-27 15:32:34\",\"usableColumn\":false},{\"capJavaField\":\"PatientId\",\"columnComment\":\"病人号\",\"columnId\":150,\"columnName\":\"patient_id\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 14:25:10\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"patientId\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":15,\"updateBy\":\"\",\"updateTime\":\"2025-06-27 15:32:34\",\"usableColumn\":false},{\"capJavaField\":\"RelativeRelation\",\"columnComment\":\"相对关系\",\"columnId\":151,\"columnName\":\"relative_relation\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 14:25:10\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"0\",\"javaField\":\"relativeRelation\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":15,\"updateBy\":\"\",\"updateTime\":\"2025-06-27 15:32:34\",\"usableColumn\":false},{\"capJavaField\":\"AllergyDisease\",\"columnComment\":\"过敏性疾病\",\"columnId\":152,\"columnName\":\"allergy_disease\",\"columnType\":\"text\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 14:25:10\",\"dictType\":\"\",\"edit\":tr', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-27 16:09:48', 51);
INSERT INTO `sys_oper_log` VALUES (157, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"clinical_other_treatments,contacts,diagnoses,expenses,family_history,feno_tests,followup_notes,history,imaging,insurance_info\"}', NULL, 0, NULL, '2025-06-27 16:09:51', 456);
INSERT INTO `sys_oper_log` VALUES (158, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"clinical_other_treatments,contacts,diagnoses,expenses,family_history,feno_tests,followup_notes,history,imaging,insurance_info,lab_tests,lung_tests,medical_orgs,medications,medications_history,patients,providers,symptoms\"}', NULL, 0, NULL, '2025-06-27 16:12:58', 744);
INSERT INTO `sys_oper_log` VALUES (159, '患者基本信息', 1, 'com.ruoyi.ClinicalSys.controller.PatientsController.add()', 'POST', 1, 'admin', '研发部门', '/ClinicalSys/patients', '127.0.0.1', '内网IP', '{\"address\":\"1\",\"age\":1,\"birthDate\":\"2025-06-02\",\"birthWeight\":1,\"gender\":\"男\",\"height\":1,\"lifestyle\":\"1\",\"name\":\"张三\",\"params\":{},\"visitTime\":\"2025-06-03\",\"weight\":1}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'patient_id\' doesn\'t have a default value\r\n### The error may exist in file [E:\\RuoYi-Vue-master\\ruoyi-admin\\target\\classes\\mapper\\ClinicalSys\\PatientsMapper.xml]\r\n### The error may involve com.ruoyi.ClinicalSys.mapper.PatientsMapper.insertPatients-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into patients          ( visit_time,             name,             gender,             birth_date,             age,             address,             height,             weight,             birth_weight,             lifestyle )           values ( ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'patient_id\' doesn\'t have a default value\n; Field \'patient_id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'patient_id\' doesn\'t have a default value', '2025-06-27 16:17:56', 151);
INSERT INTO `sys_oper_log` VALUES (160, '患者基本信息', 2, 'com.ruoyi.ClinicalSys.controller.PatientsController.edit()', 'PUT', 1, 'admin', '研发部门', '/ClinicalSys/patients', '127.0.0.1', '内网IP', '{\"address\":\"福州\",\"age\":1,\"birthDate\":\"2025-06-01\",\"birthWeight\":1,\"gender\":\"男\",\"height\":1,\"lifestyle\":\"无\",\"name\":\"李四\",\"params\":{},\"patientId\":\"001\",\"visitTime\":\"2025-06-27\",\"weight\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-27 16:24:55', 7);
INSERT INTO `sys_oper_log` VALUES (161, '患者基本信息', 2, 'com.ruoyi.ClinicalSys.controller.PatientsController.edit()', 'PUT', 1, 'admin', '研发部门', '/ClinicalSys/patients', '127.0.0.1', '内网IP', '{\"address\":\"福州\",\"age\":1,\"birthDate\":\"2025-06-01\",\"birthWeight\":1,\"gender\":\"男\",\"height\":1,\"lifestyle\":\"无\",\"name\":\"张三\",\"params\":{},\"patientId\":\"001\",\"visitTime\":\"2025-06-27\",\"weight\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-27 16:25:47', 5);
INSERT INTO `sys_oper_log` VALUES (162, '患者基本信息', 1, 'com.ruoyi.ClinicalSys.controller.PatientsController.add()', 'POST', 1, 'admin', '研发部门', '/ClinicalSys/patients', '127.0.0.1', '内网IP', '{\"address\":\"福州\",\"age\":1,\"birthDate\":\"2025-06-06\",\"birthWeight\":1,\"gender\":\"男\",\"height\":1,\"lifestyle\":\"无\",\"name\":\"李四\",\"params\":{},\"visitTime\":\"2025-06-28\",\"weight\":1}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'patient_id\' doesn\'t have a default value\r\n### The error may exist in file [E:\\RuoYi-Vue-master\\ruoyi-admin\\target\\classes\\mapper\\ClinicalSys\\PatientsMapper.xml]\r\n### The error may involve com.ruoyi.ClinicalSys.mapper.PatientsMapper.insertPatients-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into patients          ( visit_time,             name,             gender,             birth_date,             age,             address,             height,             weight,             birth_weight,             lifestyle )           values ( ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'patient_id\' doesn\'t have a default value\n; Field \'patient_id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'patient_id\' doesn\'t have a default value', '2025-06-27 16:26:09', 4);
INSERT INTO `sys_oper_log` VALUES (163, '患者基本信息', 2, 'com.ruoyi.ClinicalSys.controller.PatientsController.edit()', 'PUT', 1, 'admin', '研发部门', '/ClinicalSys/patients', '127.0.0.1', '内网IP', '{\"address\":\"福州\",\"age\":1,\"birthDate\":\"2025-06-01\",\"birthWeight\":1,\"gender\":\"男\",\"height\":2,\"lifestyle\":\"无\",\"name\":\"张三\",\"params\":{},\"patientId\":\"001\",\"visitTime\":\"2025-06-27\",\"weight\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-27 16:27:33', 4);
INSERT INTO `sys_oper_log` VALUES (164, '患者基本信息', 2, 'com.ruoyi.ClinicalSys.controller.PatientsController.edit()', 'PUT', 1, 'admin', '研发部门', '/ClinicalSys/patients', '127.0.0.1', '内网IP', '{\"address\":\"福州\",\"age\":1,\"birthDate\":\"2025-06-06\",\"birthWeight\":1,\"gender\":\"男\",\"height\":1,\"lifestyle\":\"无\",\"name\":\"李四\",\"params\":{},\"patientId\":\"002\",\"visitTime\":\"2025-06-27\",\"weight\":1}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2025-06-27 16:41:26', 19);
INSERT INTO `sys_oper_log` VALUES (165, '患者基本信息', 2, 'com.ruoyi.ClinicalSys.controller.PatientsController.edit()', 'PUT', 1, 'admin', '研发部门', '/ClinicalSys/patients', '127.0.0.1', '内网IP', '{\"address\":\"福州\",\"age\":1,\"birthDate\":\"2025-06-06\",\"birthWeight\":1,\"gender\":\"男\",\"height\":1,\"lifestyle\":\"无\",\"name\":\"李四\",\"params\":{},\"patientId\":\"2\",\"visitTime\":\"2025-06-27\",\"weight\":1}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2025-06-27 16:41:45', 4);
INSERT INTO `sys_oper_log` VALUES (166, '患者基本信息', 2, 'com.ruoyi.ClinicalSys.controller.PatientsController.edit()', 'PUT', 1, 'admin', '研发部门', '/ClinicalSys/patients', '127.0.0.1', '内网IP', '{\"address\":\"福州\",\"age\":1,\"birthDate\":\"2025-06-06\",\"birthWeight\":1,\"gender\":\"男\",\"height\":1,\"lifestyle\":\"无\",\"name\":\"李四\",\"params\":{},\"patientId\":\"002\",\"visitTime\":\"2025-06-27\",\"weight\":1}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2025-06-27 16:41:51', 4);
INSERT INTO `sys_oper_log` VALUES (167, '患者基本信息', 2, 'com.ruoyi.ClinicalSys.controller.PatientsController.edit()', 'PUT', 1, 'admin', '研发部门', '/ClinicalSys/patients', '127.0.0.1', '内网IP', '{\"address\":\"福州\",\"age\":1,\"birthDate\":\"2025-06-06\",\"birthWeight\":1,\"gender\":\"男\",\"height\":1,\"lifestyle\":\"无\",\"name\":\"李四\",\"params\":{},\"patientId\":\"002\",\"visitTime\":\"2025-06-27\",\"weight\":11}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2025-06-27 16:43:12', 4);
INSERT INTO `sys_oper_log` VALUES (168, '患者基本信息', 2, 'com.ruoyi.ClinicalSys.controller.PatientsController.edit()', 'PUT', 1, 'admin', '研发部门', '/ClinicalSys/patients', '127.0.0.1', '内网IP', '{\"address\":\"福州\",\"age\":1,\"birthDate\":\"2025-06-06\",\"birthWeight\":1,\"gender\":\"男\",\"height\":1,\"lifestyle\":\"无\",\"name\":\"李四\",\"params\":{},\"patientId\":\"002\",\"visitTime\":\"2025-06-27\",\"weight\":1}', '{\"msg\":\"病人号 002 不存在\",\"code\":500}', 0, NULL, '2025-06-27 17:19:47', 12);
INSERT INTO `sys_oper_log` VALUES (169, '患者基本信息', 2, 'com.ruoyi.ClinicalSys.controller.PatientsController.edit()', 'PUT', 1, 'admin', '研发部门', '/ClinicalSys/patients', '127.0.0.1', '内网IP', '{\"address\":\"福州\",\"age\":1,\"birthDate\":\"2025-06-06\",\"birthWeight\":1,\"gender\":\"男\",\"height\":1,\"lifestyle\":\"无\",\"name\":\"李四\",\"params\":{},\"patientId\":\"003\",\"visitTime\":\"2025-06-27\",\"weight\":1}', '{\"msg\":\"病人号 003 不存在\",\"code\":500}', 0, NULL, '2025-06-27 17:20:42', 3);
INSERT INTO `sys_oper_log` VALUES (170, '患者基本信息', 2, 'com.ruoyi.ClinicalSys.controller.PatientsController.edit()', 'PUT', 1, 'admin', '研发部门', '/ClinicalSys/patients', '127.0.0.1', '内网IP', '{\"address\":\"福州\",\"age\":1,\"birthDate\":\"2025-06-06\",\"birthWeight\":1,\"gender\":\"男\",\"height\":1,\"lifestyle\":\"无\",\"name\":\"李四\",\"params\":{},\"patientId\":\"002\",\"visitTime\":\"2025-06-27\",\"weight\":1}', '{\"msg\":\"病人号 002 不存在\",\"code\":500}', 0, NULL, '2025-06-27 17:20:54', 2);
INSERT INTO `sys_oper_log` VALUES (171, '患者基本信息', 2, 'com.ruoyi.ClinicalSys.controller.PatientsController.edit()', 'PUT', 1, 'admin', '研发部门', '/ClinicalSys/patients', '127.0.0.1', '内网IP', '{\"address\":\"福州\",\"age\":1,\"birthDate\":\"2025-06-06\",\"birthWeight\":1,\"gender\":\"男\",\"height\":1,\"lifestyle\":\"无\",\"name\":\"李四\",\"params\":{},\"patientId\":\"002\",\"visitTime\":\"2025-06-27\",\"weight\":1}', '{\"msg\":\"病人号 002 不存在\",\"code\":500}', 0, NULL, '2025-06-27 17:22:20', 5);
INSERT INTO `sys_oper_log` VALUES (172, '患者基本信息', 2, 'com.ruoyi.ClinicalSys.controller.PatientsController.edit()', 'PUT', 1, 'admin', '研发部门', '/ClinicalSys/patients', '127.0.0.1', '内网IP', '{\"address\":\"福州\",\"age\":1,\"birthDate\":\"2025-06-06\",\"birthWeight\":1,\"gender\":\"男\",\"height\":1,\"lifestyle\":\"无\",\"name\":\"李四\",\"params\":{},\"patientId\":\"002\",\"visitTime\":\"2025-06-27\",\"weight\":1}', '{\"msg\":\"病人号 002 不存在\",\"code\":500}', 0, NULL, '2025-06-27 17:23:17', 4);
INSERT INTO `sys_oper_log` VALUES (173, '患者基本信息', 2, 'com.ruoyi.ClinicalSys.controller.PatientsController.edit()', 'PUT', 1, 'admin', '研发部门', '/ClinicalSys/patients', '127.0.0.1', '内网IP', '{\"address\":\"福州\",\"age\":1,\"birthDate\":\"2025-06-06\",\"birthWeight\":1,\"gender\":\"男\",\"height\":1,\"lifestyle\":\"无\",\"name\":\"李四\",\"params\":{},\"patientId\":\"002\",\"visitTime\":\"2025-06-27\",\"weight\":1}', '{\"msg\":\"病人号 002 不存在\",\"code\":500}', 0, NULL, '2025-06-27 17:38:05', 4);
INSERT INTO `sys_oper_log` VALUES (174, '患者基本信息', 2, 'com.ruoyi.ClinicalSys.controller.PatientsController.edit()', 'PUT', 1, 'admin', '研发部门', '/ClinicalSys/patients', '127.0.0.1', '内网IP', '{\"address\":\"福州\",\"age\":1,\"birthDate\":\"2025-06-06\",\"birthWeight\":1,\"gender\":\"男\",\"height\":1,\"lifestyle\":\"无\",\"name\":\"李四\",\"params\":{},\"patientId\":\"002\",\"visitTime\":\"2025-06-27\",\"weight\":1}', '{\"msg\":\"病人号 002 不存在\",\"code\":500}', 0, NULL, '2025-06-27 17:39:14', 11);
INSERT INTO `sys_oper_log` VALUES (175, '患者基本信息', 2, 'com.ruoyi.ClinicalSys.controller.PatientsController.edit()', 'PUT', 1, 'admin', '研发部门', '/ClinicalSys/patients', '127.0.0.1', '内网IP', '{\"address\":\"福州\",\"age\":1,\"birthDate\":\"2025-06-06\",\"birthWeight\":1,\"gender\":\"男\",\"height\":1,\"lifestyle\":\"无\",\"name\":\"李四\",\"params\":{},\"patientId\":\"011\",\"visitTime\":\"2025-06-27\",\"weight\":1}', '{\"msg\":\"病人号 011 不存在\",\"code\":500}', 0, NULL, '2025-06-27 17:39:43', 2);
INSERT INTO `sys_oper_log` VALUES (176, '患者基本信息', 1, 'com.ruoyi.ClinicalSys.controller.PatientsController.add()', 'POST', 1, 'admin', '研发部门', '/ClinicalSys/patients', '127.0.0.1', '内网IP', '{\"address\":\"福州\",\"age\":1,\"birthDate\":\"2025-06-06\",\"birthWeight\":1,\"gender\":\"男\",\"height\":1,\"lifestyle\":\"无\",\"name\":\"李四\",\"params\":{},\"patientId\":\"002\",\"visitTime\":\"2025-06-27\",\"weight\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-27 17:55:53', 106);
INSERT INTO `sys_oper_log` VALUES (177, '患者基本信息', 1, 'com.ruoyi.ClinicalSys.controller.PatientsController.add()', 'POST', 1, 'admin', '研发部门', '/ClinicalSys/patients', '127.0.0.1', '内网IP', '{\"address\":\"福州\",\"age\":1,\"birthDate\":\"2025-06-06\",\"birthWeight\":1,\"gender\":\"男\",\"height\":1,\"lifestyle\":\"无\",\"name\":\"王五\",\"params\":{},\"patientId\":\"003\",\"visitTime\":\"2025-06-26\",\"weight\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-27 17:56:25', 8);
INSERT INTO `sys_oper_log` VALUES (178, '患者基本信息', 3, 'com.ruoyi.ClinicalSys.controller.PatientsController.remove()', 'DELETE', 1, 'admin', '研发部门', '/ClinicalSys/patients/003', '127.0.0.1', '内网IP', '[\"003\"]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-27 17:57:16', 7);
INSERT INTO `sys_oper_log` VALUES (179, '患者基本信息', 2, 'com.ruoyi.ClinicalSys.controller.PatientsController.edit()', 'PUT', 1, 'admin', '研发部门', '/ClinicalSys/patients', '127.0.0.1', '内网IP', '{\"address\":\"福州\",\"age\":1,\"birthDate\":\"2025-06-06\",\"birthWeight\":1,\"gender\":\"女\",\"height\":1,\"lifestyle\":\"无\",\"name\":\"李四\",\"params\":{},\"patientId\":\"002\",\"visitTime\":\"2025-06-27\",\"weight\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-27 17:57:22', 9);
INSERT INTO `sys_oper_log` VALUES (180, '联系人', 1, 'com.ruoyi.ClinicalSys.controller.ContactsController.add()', 'POST', 1, 'admin', '研发部门', '/ClinicalSys/contacts', '127.0.0.1', '内网IP', '{\"contactId\":1,\"emergencyContact\":\"23455\",\"params\":{},\"patientId\":\"001\",\"phone\":\"12345676\",\"relationship\":\"无\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-27 17:57:48', 9);
INSERT INTO `sys_oper_log` VALUES (181, '联系人', 2, 'com.ruoyi.ClinicalSys.controller.ContactsController.edit()', 'PUT', 1, 'admin', '研发部门', '/ClinicalSys/contacts', '127.0.0.1', '内网IP', '{\"contactId\":1,\"emergencyContact\":\"23455\",\"params\":{},\"patientId\":\"002\",\"phone\":\"12345676\",\"relationship\":\"无\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-27 17:57:57', 5);
INSERT INTO `sys_oper_log` VALUES (182, '患者基本信息', 3, 'com.ruoyi.ClinicalSys.controller.PatientsController.remove()', 'DELETE', 1, 'admin', '研发部门', '/ClinicalSys/patients/002', '127.0.0.1', '内网IP', '[\"002\"]', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot delete or update a parent row: a foreign key constraint fails (`ry-vue`.`contacts`, CONSTRAINT `contacts_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`patient_id`))\r\n### The error may exist in file [E:\\RuoYi-Vue-master\\ruoyi-admin\\target\\classes\\mapper\\ClinicalSys\\PatientsMapper.xml]\r\n### The error may involve com.ruoyi.ClinicalSys.mapper.PatientsMapper.deletePatientsByPatientIds-Inline\r\n### The error occurred while setting parameters\r\n### SQL: delete from patients where patient_id in           (               ?          )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot delete or update a parent row: a foreign key constraint fails (`ry-vue`.`contacts`, CONSTRAINT `contacts_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`patient_id`))\n; Cannot delete or update a parent row: a foreign key constraint fails (`ry-vue`.`contacts`, CONSTRAINT `contacts_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`patient_id`)); nested exception is java.sql.SQLIntegrityConstraintViolationException: Cannot delete or update a parent row: a foreign key constraint fails (`ry-vue`.`contacts`, CONSTRAINT `contacts_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`patient_id`))', '2025-06-27 17:58:06', 72);
INSERT INTO `sys_oper_log` VALUES (183, '患者基本信息', 3, 'com.ruoyi.ClinicalSys.controller.PatientsController.remove()', 'DELETE', 1, 'admin', '研发部门', '/ClinicalSys/patients/002', '127.0.0.1', '内网IP', '[\"002\"]', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot delete or update a parent row: a foreign key constraint fails (`ry-vue`.`contacts`, CONSTRAINT `contacts_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`patient_id`))\r\n### The error may exist in file [E:\\RuoYi-Vue-master\\ruoyi-admin\\target\\classes\\mapper\\ClinicalSys\\PatientsMapper.xml]\r\n### The error may involve com.ruoyi.ClinicalSys.mapper.PatientsMapper.deletePatientsByPatientIds-Inline\r\n### The error occurred while setting parameters\r\n### SQL: delete from patients where patient_id in           (               ?          )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot delete or update a parent row: a foreign key constraint fails (`ry-vue`.`contacts`, CONSTRAINT `contacts_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`patient_id`))\n; Cannot delete or update a parent row: a foreign key constraint fails (`ry-vue`.`contacts`, CONSTRAINT `contacts_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`patient_id`)); nested exception is java.sql.SQLIntegrityConstraintViolationException: Cannot delete or update a parent row: a foreign key constraint fails (`ry-vue`.`contacts`, CONSTRAINT `contacts_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`patient_id`))', '2025-06-27 17:58:14', 4);
INSERT INTO `sys_oper_log` VALUES (184, '患者基本信息', 3, 'com.ruoyi.ClinicalSys.controller.PatientsController.remove()', 'DELETE', 1, 'admin', '研发部门', '/ClinicalSys/patients/002', '127.0.0.1', '内网IP', '[\"002\"]', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot delete or update a parent row: a foreign key constraint fails (`ry-vue`.`contacts`, CONSTRAINT `contacts_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`patient_id`))\r\n### The error may exist in file [E:\\RuoYi-Vue-master\\ruoyi-admin\\target\\classes\\mapper\\ClinicalSys\\PatientsMapper.xml]\r\n### The error may involve com.ruoyi.ClinicalSys.mapper.PatientsMapper.deletePatientsByPatientIds-Inline\r\n### The error occurred while setting parameters\r\n### SQL: delete from patients where patient_id in           (               ?          )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot delete or update a parent row: a foreign key constraint fails (`ry-vue`.`contacts`, CONSTRAINT `contacts_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`patient_id`))\n; Cannot delete or update a parent row: a foreign key constraint fails (`ry-vue`.`contacts`, CONSTRAINT `contacts_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`patient_id`)); nested exception is java.sql.SQLIntegrityConstraintViolationException: Cannot delete or update a parent row: a foreign key constraint fails (`ry-vue`.`contacts`, CONSTRAINT `contacts_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`patient_id`))', '2025-06-27 18:13:15', 5);
INSERT INTO `sys_oper_log` VALUES (185, '患者基本信息', 3, 'com.ruoyi.ClinicalSys.controller.PatientsController.remove()', 'DELETE', 1, 'admin', '研发部门', '/ClinicalSys/patients/002', '127.0.0.1', '内网IP', '[\"002\"]', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot delete or update a parent row: a foreign key constraint fails (`ry-vue`.`contacts`, CONSTRAINT `contacts_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`patient_id`))\r\n### The error may exist in file [E:\\RuoYi-Vue-master\\ruoyi-admin\\target\\classes\\mapper\\ClinicalSys\\PatientsMapper.xml]\r\n### The error may involve com.ruoyi.ClinicalSys.mapper.PatientsMapper.deletePatientsByPatientIds-Inline\r\n### The error occurred while setting parameters\r\n### SQL: delete from patients where patient_id in           (               ?          )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot delete or update a parent row: a foreign key constraint fails (`ry-vue`.`contacts`, CONSTRAINT `contacts_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`patient_id`))\n; Cannot delete or update a parent row: a foreign key constraint fails (`ry-vue`.`contacts`, CONSTRAINT `contacts_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`patient_id`)); nested exception is java.sql.SQLIntegrityConstraintViolationException: Cannot delete or update a parent row: a foreign key constraint fails (`ry-vue`.`contacts`, CONSTRAINT `contacts_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`patient_id`))', '2025-06-27 18:16:48', 5);
INSERT INTO `sys_oper_log` VALUES (186, '联系人', 3, 'com.ruoyi.ClinicalSys.controller.ContactsController.remove()', 'DELETE', 1, 'admin', '研发部门', '/ClinicalSys/contacts/1', '127.0.0.1', '内网IP', '[1]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-27 19:23:58', 8);
INSERT INTO `sys_oper_log` VALUES (187, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"contacts\",\"className\":\"Contacts\",\"columns\":[{\"capJavaField\":\"ContactId\",\"columnComment\":\"联系人号\",\"columnId\":135,\"columnName\":\"contact_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 14:25:10\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"contactId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":12,\"updateBy\":\"\",\"updateTime\":\"2025-06-27 15:02:10\",\"usableColumn\":false},{\"capJavaField\":\"PatientId\",\"columnComment\":\"病人号\",\"columnId\":136,\"columnName\":\"patient_id\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 14:25:10\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"patientId\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":12,\"updateBy\":\"\",\"updateTime\":\"2025-06-27 15:02:10\",\"usableColumn\":false},{\"capJavaField\":\"Phone\",\"columnComment\":\"联系方式\",\"columnId\":137,\"columnName\":\"phone\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 14:25:10\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"0\",\"javaField\":\"phone\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":12,\"updateBy\":\"\",\"updateTime\":\"2025-06-27 15:02:10\",\"usableColumn\":false},{\"capJavaField\":\"EmergencyContact\",\"columnComment\":\"紧急联系方式\",\"columnId\":138,\"columnName\":\"emergency_contact\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 14:25:10\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-27 19:24:30', 52);
INSERT INTO `sys_oper_log` VALUES (188, '联系人', 1, 'com.ruoyi.ClinicalSys.controller.ContactsController.add()', 'POST', 1, 'admin', '研发部门', '/ClinicalSys/contacts', '127.0.0.1', '内网IP', '{\"contactId\":2,\"emergencyContact\":\"23145234\",\"params\":{},\"patientId\":\"002\",\"phone\":\"112342\",\"relationship\":\"无\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-27 19:24:55', 9);
INSERT INTO `sys_oper_log` VALUES (189, '患者基本信息', 3, 'com.ruoyi.ClinicalSys.controller.PatientsController.remove()', 'DELETE', 1, 'admin', '研发部门', '/ClinicalSys/patients/002', '127.0.0.1', '内网IP', '[\"002\"]', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot delete or update a parent row: a foreign key constraint fails (`ry-vue`.`contacts`, CONSTRAINT `contacts_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`patient_id`))\r\n### The error may exist in file [E:\\RuoYi-Vue-master\\ruoyi-admin\\target\\classes\\mapper\\ClinicalSys\\PatientsMapper.xml]\r\n### The error may involve com.ruoyi.ClinicalSys.mapper.PatientsMapper.deletePatientsByPatientIds-Inline\r\n### The error occurred while setting parameters\r\n### SQL: delete from patients where patient_id in           (               ?          )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot delete or update a parent row: a foreign key constraint fails (`ry-vue`.`contacts`, CONSTRAINT `contacts_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`patient_id`))\n; Cannot delete or update a parent row: a foreign key constraint fails (`ry-vue`.`contacts`, CONSTRAINT `contacts_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`patient_id`)); nested exception is java.sql.SQLIntegrityConstraintViolationException: Cannot delete or update a parent row: a foreign key constraint fails (`ry-vue`.`contacts`, CONSTRAINT `contacts_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`patient_id`))', '2025-06-27 19:25:03', 68);
INSERT INTO `sys_oper_log` VALUES (190, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"contacts\",\"className\":\"Contacts\",\"columns\":[{\"capJavaField\":\"ContactId\",\"columnComment\":\"联系人号\",\"columnId\":135,\"columnName\":\"contact_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 14:25:10\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"contactId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":12,\"updateBy\":\"\",\"updateTime\":\"2025-06-27 19:24:30\",\"usableColumn\":false},{\"capJavaField\":\"PatientId\",\"columnComment\":\"病人号\",\"columnId\":136,\"columnName\":\"patient_id\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 14:25:10\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"patientId\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":12,\"updateBy\":\"\",\"updateTime\":\"2025-06-27 19:24:30\",\"usableColumn\":false},{\"capJavaField\":\"Phone\",\"columnComment\":\"联系方式\",\"columnId\":137,\"columnName\":\"phone\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 14:25:10\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"0\",\"javaField\":\"phone\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":12,\"updateBy\":\"\",\"updateTime\":\"2025-06-27 19:24:30\",\"usableColumn\":false},{\"capJavaField\":\"EmergencyContact\",\"columnComment\":\"紧急联系方式\",\"columnId\":138,\"columnName\":\"emergency_contact\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 14:25:10\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-27 19:26:11', 16);
INSERT INTO `sys_oper_log` VALUES (191, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"contacts\"}', NULL, 0, NULL, '2025-06-27 19:26:15', 161);
INSERT INTO `sys_oper_log` VALUES (192, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"contacts\",\"className\":\"Contacts\",\"columns\":[{\"capJavaField\":\"ContactId\",\"columnComment\":\"联系人号\",\"columnId\":135,\"columnName\":\"contact_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 14:25:10\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"contactId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":12,\"updateBy\":\"\",\"updateTime\":\"2025-06-27 19:26:11\",\"usableColumn\":false},{\"capJavaField\":\"PatientId\",\"columnComment\":\"病人号\",\"columnId\":136,\"columnName\":\"patient_id\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 14:25:10\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"patientId\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":12,\"updateBy\":\"\",\"updateTime\":\"2025-06-27 19:26:11\",\"usableColumn\":false},{\"capJavaField\":\"Phone\",\"columnComment\":\"联系方式\",\"columnId\":137,\"columnName\":\"phone\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 14:25:10\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"0\",\"javaField\":\"phone\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":12,\"updateBy\":\"\",\"updateTime\":\"2025-06-27 19:26:11\",\"usableColumn\":false},{\"capJavaField\":\"EmergencyContact\",\"columnComment\":\"紧急联系方式\",\"columnId\":138,\"columnName\":\"emergency_contact\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 14:25:10\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-27 19:28:00', 16);
INSERT INTO `sys_oper_log` VALUES (193, '患者基本信息', 3, 'com.ruoyi.ClinicalSys.controller.PatientsController.remove()', 'DELETE', 1, 'admin', '研发部门', '/ClinicalSys/patients/002', '127.0.0.1', '内网IP', '[\"002\"]', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot delete or update a parent row: a foreign key constraint fails (`ry-vue`.`contacts`, CONSTRAINT `contacts_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`patient_id`))\r\n### The error may exist in file [E:\\RuoYi-Vue-master\\ruoyi-admin\\target\\classes\\mapper\\ClinicalSys\\PatientsMapper.xml]\r\n### The error may involve com.ruoyi.ClinicalSys.mapper.PatientsMapper.deletePatientsByPatientIds-Inline\r\n### The error occurred while setting parameters\r\n### SQL: delete from patients where patient_id in           (               ?          )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot delete or update a parent row: a foreign key constraint fails (`ry-vue`.`contacts`, CONSTRAINT `contacts_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`patient_id`))\n; Cannot delete or update a parent row: a foreign key constraint fails (`ry-vue`.`contacts`, CONSTRAINT `contacts_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`patient_id`)); nested exception is java.sql.SQLIntegrityConstraintViolationException: Cannot delete or update a parent row: a foreign key constraint fails (`ry-vue`.`contacts`, CONSTRAINT `contacts_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`patient_id`))', '2025-06-27 19:28:44', 4);
INSERT INTO `sys_oper_log` VALUES (194, '患者基本信息', 3, 'com.ruoyi.ClinicalSys.controller.PatientsController.remove()', 'DELETE', 1, 'admin', '研发部门', '/ClinicalSys/patients/002', '127.0.0.1', '内网IP', '[\"002\"]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-27 19:46:01', 6);
INSERT INTO `sys_oper_log` VALUES (195, '家族环境', 1, 'com.ruoyi.EpidemSys.controller.SurveyFamilyEnvController.add()', 'POST', 1, 'admin', '研发部门', '/EpidemSys/env', '127.0.0.1', '内网IP', '{\"params\":{},\"sharedSmokingExposure\":1,\"surveyId\":1}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot add or update a child row: a foreign key constraint fails (`ry-vue`.`survey_family_env`, CONSTRAINT `survey_family_env_ibfk_1` FOREIGN KEY (`survey_id`) REFERENCES `survey_basic_info` (`survey_id`))\r\n### The error may exist in file [E:\\RuoYi-Vue-master\\ruoyi-admin\\target\\classes\\mapper\\EpidemSys\\SurveyFamilyEnvMapper.xml]\r\n### The error may involve com.ruoyi.EpidemSys.mapper.SurveyFamilyEnvMapper.insertSurveyFamilyEnv-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into survey_family_env          ( survey_id,             shared_smoking_exposure )           values ( ?,             ? )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot add or update a child row: a foreign key constraint fails (`ry-vue`.`survey_family_env`, CONSTRAINT `survey_family_env_ibfk_1` FOREIGN KEY (`survey_id`) REFERENCES `survey_basic_info` (`survey_id`))\n; Cannot add or update a child row: a foreign key constraint fails (`ry-vue`.`survey_family_env`, CONSTRAINT `survey_family_env_ibfk_1` FOREIGN KEY (`survey_id`) REFERENCES `survey_basic_info` (`survey_id`)); nested exception is java.sql.SQLIntegrityConstraintViolationException: Cannot add or update a child row: a foreign key constraint fails (`ry-vue`.`survey_family_env`, CONSTRAINT `survey_family_env_ibfk_1` FOREIGN KEY (`survey_id`) REFERENCES `survey_basic_info` (`survey_id`))', '2025-06-27 20:01:20', 13);
INSERT INTO `sys_oper_log` VALUES (196, '患儿基本信息', 1, 'com.ruoyi.EpidemSys.controller.SurveyBasicInfoController.add()', 'POST', 1, 'admin', '研发部门', '/EpidemSys/info', '127.0.0.1', '内网IP', '{\"address\":\"福州\",\"age\":1,\"allergyHistory\":1,\"childName\":\"张三\",\"diagnosedAsthma\":1,\"diagnosedConjunctivitis\":1,\"diagnosedDermatitis\":1,\"diagnosedRhinitis\":1,\"diagnosedUrticaria\":1,\"gender\":\"男\",\"hasAsthma\":1,\"hasConjunctivitis\":1,\"hasDermatitis\":1,\"hasRhinitis\":1,\"hasUrticaria\":1,\"height\":1,\"params\":{},\"patientId\":\"001\",\"residenceYears\":1,\"surveyDate\":\"2025-06-27\",\"weight\":1}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot add or update a child row: a foreign key constraint fails (`ry-vue`.`survey_basic_info`, CONSTRAINT `survey_basic_info_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `clinical_db`.`patients` (`patient_id`))\r\n### The error may exist in file [E:\\RuoYi-Vue-master\\ruoyi-admin\\target\\classes\\mapper\\EpidemSys\\SurveyBasicInfoMapper.xml]\r\n### The error may involve com.ruoyi.EpidemSys.mapper.SurveyBasicInfoMapper.insertSurveyBasicInfo-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into survey_basic_info          ( patient_id,             survey_date,             child_name,             gender,             age,                          residence_years,             address,             height,             weight,             allergy_history,             has_rhinitis,             has_asthma,             has_dermatitis,             has_conjunctivitis,             has_urticaria,             diagnosed_rhinitis,             diagnosed_asthma,             diagnosed_dermatitis,             diagnosed_conjunctivitis,             diagnosed_urticaria )           values ( ?,             ?,             ?,             ?,             ?,                          ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ? )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot add or update a child row: a foreign key constraint fails (`ry-vue`.`survey_basic_info`, CONSTRAINT `survey_basic_info_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `clinical_db`.`patients` (`patient_id`))\n; Cannot add or update a child row: a foreign key constraint fails (`ry-vue`.`survey_basic_info`, CONSTRAINT `survey_basic_info_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `clinical_db`.`patients` (`patient_id`)); nested exception is', '2025-06-27 20:12:37', 29);
INSERT INTO `sys_oper_log` VALUES (197, '费用', 1, 'com.ruoyi.ClinicalSys.controller.ExpensesController.add()', 'POST', 1, 'admin', '研发部门', '/ClinicalSys/expenses', '127.0.0.1', '内网IP', '{\"amount\":10,\"expenseId\":1,\"params\":{},\"patientId\":\"001\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-27 20:15:22', 12);
INSERT INTO `sys_oper_log` VALUES (198, '费用', 3, 'com.ruoyi.ClinicalSys.controller.ExpensesController.remove()', 'DELETE', 1, 'admin', '研发部门', '/ClinicalSys/expenses/1', '127.0.0.1', '内网IP', '[1]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-27 20:15:29', 4);
INSERT INTO `sys_oper_log` VALUES (199, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"expenses\",\"className\":\"Expenses\",\"columns\":[{\"capJavaField\":\"ExpenseId\",\"columnComment\":\"费用号\",\"columnId\":145,\"columnName\":\"expense_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 14:25:10\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"expenseId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":14,\"updateBy\":\"\",\"updateTime\":\"2025-06-27 14:35:24\",\"usableColumn\":false},{\"capJavaField\":\"PatientId\",\"columnComment\":\"病人号\",\"columnId\":146,\"columnName\":\"patient_id\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 14:25:10\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"patientId\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":14,\"updateBy\":\"\",\"updateTime\":\"2025-06-27 14:35:24\",\"usableColumn\":false},{\"capJavaField\":\"ExpenseType\",\"columnComment\":\"费用类别\",\"columnId\":147,\"columnName\":\"expense_type\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 14:25:10\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"0\",\"javaField\":\"expenseType\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":14,\"updateBy\":\"\",\"updateTime\":\"2025-06-27 14:35:24\",\"usableColumn\":false},{\"capJavaField\":\"Amount\",\"columnComment\":\"费用\",\"columnId\":148,\"columnName\":\"amount\",\"columnType\":\"decimal(10,2)\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 14:25:10\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"i', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-27 20:15:51', 14);
INSERT INTO `sys_oper_log` VALUES (200, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"tests\",\"className\":\"FenoTests\",\"columns\":[{\"capJavaField\":\"FenoId\",\"columnComment\":\"检测号\",\"columnId\":153,\"columnName\":\"feno_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 14:25:10\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"fenoId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":16,\"updateBy\":\"\",\"updateTime\":\"2025-06-27 14:39:49\",\"usableColumn\":false},{\"capJavaField\":\"PatientId\",\"columnComment\":\"病人号\",\"columnId\":154,\"columnName\":\"patient_id\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 14:25:10\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"patientId\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":16,\"updateBy\":\"\",\"updateTime\":\"2025-06-27 14:39:49\",\"usableColumn\":false},{\"capJavaField\":\"TestName\",\"columnComment\":\"检查名称\",\"columnId\":155,\"columnName\":\"test_name\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 14:25:10\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"0\",\"javaField\":\"testName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"LIKE\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":16,\"updateBy\":\"\",\"updateTime\":\"2025-06-27 14:39:49\",\"usableColumn\":false},{\"capJavaField\":\"TestDate\",\"columnComment\":\"检查日期\",\"columnId\":156,\"columnName\":\"test_date\",\"columnType\":\"date\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 14:25:10\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"datetime\",\"increment\":false,\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-27 20:16:06', 15);
INSERT INTO `sys_oper_log` VALUES (201, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"notes\",\"className\":\"FollowupNotes\",\"columns\":[{\"capJavaField\":\"FollowupId\",\"columnComment\":\"随访号\",\"columnId\":158,\"columnName\":\"followup_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 14:25:10\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"followupId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":17,\"updateBy\":\"\",\"updateTime\":\"2025-06-27 14:41:43\",\"usableColumn\":false},{\"capJavaField\":\"PatientId\",\"columnComment\":\"病人号\",\"columnId\":159,\"columnName\":\"patient_id\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 14:25:10\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"patientId\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":17,\"updateBy\":\"\",\"updateTime\":\"2025-06-27 14:41:43\",\"usableColumn\":false},{\"capJavaField\":\"SymptomImprovement\",\"columnComment\":\"过敏症状改善情况\",\"columnId\":160,\"columnName\":\"symptom_improvement\",\"columnType\":\"text\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 14:25:10\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"textarea\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"0\",\"javaField\":\"symptomImprovement\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":17,\"updateBy\":\"\",\"updateTime\":\"2025-06-27 14:41:43\",\"usableColumn\":false},{\"capJavaField\":\"PhysicalDevelopment\",\"columnComment\":\"身体发育情况\",\"columnId\":161,\"columnName\":\"physical_development\",\"columnType\":\"text\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 14:25:10\",', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-27 20:16:11', 15);
INSERT INTO `sys_oper_log` VALUES (202, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"history\",\"className\":\"History\",\"columns\":[{\"capJavaField\":\"HistoryId\",\"columnComment\":\"既往史名\",\"columnId\":164,\"columnName\":\"history_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 14:25:10\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"historyId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":18,\"updateBy\":\"\",\"updateTime\":\"2025-06-27 15:32:56\",\"usableColumn\":false},{\"capJavaField\":\"PatientId\",\"columnComment\":\"病人号\",\"columnId\":165,\"columnName\":\"patient_id\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 14:25:10\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"patientId\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":18,\"updateBy\":\"\",\"updateTime\":\"2025-06-27 15:32:56\",\"usableColumn\":false},{\"capJavaField\":\"FoodAllergyHistory\",\"columnComment\":\"食物过敏源阳性史\",\"columnId\":166,\"columnName\":\"food_allergy_history\",\"columnType\":\"text\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 14:25:10\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"textarea\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"0\",\"javaField\":\"foodAllergyHistory\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":18,\"updateBy\":\"\",\"updateTime\":\"2025-06-27 15:32:56\",\"usableColumn\":false},{\"capJavaField\":\"AllergenExposure\",\"columnComment\":\"吸入过敏源阳性史\",\"columnId\":167,\"columnName\":\"allergen_exposure\",\"columnType\":\"text\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 14:25:10\",\"dictType', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-27 20:16:17', 14);
INSERT INTO `sys_oper_log` VALUES (203, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"imaging\",\"className\":\"Imaging\",\"columns\":[{\"capJavaField\":\"ImagingId\",\"columnComment\":\"影像学号\",\"columnId\":169,\"columnName\":\"imaging_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 14:25:10\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"imagingId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":19,\"updateBy\":\"\",\"updateTime\":\"2025-06-27 14:45:46\",\"usableColumn\":false},{\"capJavaField\":\"PatientId\",\"columnComment\":\"病人号\",\"columnId\":170,\"columnName\":\"patient_id\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 14:25:10\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"patientId\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":19,\"updateBy\":\"\",\"updateTime\":\"2025-06-27 14:45:46\",\"usableColumn\":false},{\"capJavaField\":\"ImagingType\",\"columnComment\":\"影像学检查名称\",\"columnId\":171,\"columnName\":\"imaging_type\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 14:25:10\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"0\",\"javaField\":\"imagingType\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":19,\"updateBy\":\"\",\"updateTime\":\"2025-06-27 14:45:46\",\"usableColumn\":false},{\"capJavaField\":\"ImagingDate\",\"columnComment\":\"检查时期\",\"columnId\":172,\"columnName\":\"imaging_date\",\"columnType\":\"date\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 14:25:10\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"da', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-27 20:16:23', 16);
INSERT INTO `sys_oper_log` VALUES (204, '联系人', 1, 'com.ruoyi.ClinicalSys.controller.ContactsController.add()', 'POST', 1, 'admin', '研发部门', '/ClinicalSys/contacts', '127.0.0.1', '内网IP', '{\"contactId\":3,\"emergencyContact\":\"1234\",\"params\":{},\"patientId\":\"001\",\"phone\":\"1234\",\"relationship\":\"无\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-27 20:25:01', 4);
INSERT INTO `sys_oper_log` VALUES (205, '疾病诊断', 1, 'com.ruoyi.ClinicalSys.controller.DiagnosesController.add()', 'POST', 1, 'admin', '研发部门', '/ClinicalSys/diagnoses', '127.0.0.1', '内网IP', '{\"diagnosisId\":1,\"diagnosisTime\":\"2025-06-27\",\"diseaseName\":\"1\",\"params\":{},\"patientId\":\"001\",\"severity\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-27 20:25:13', 7);
INSERT INTO `sys_oper_log` VALUES (206, '费用', 1, 'com.ruoyi.ClinicalSys.controller.ExpensesController.add()', 'POST', 1, 'admin', '研发部门', '/ClinicalSys/expenses', '127.0.0.1', '内网IP', '{\"amount\":12,\"expenseId\":2,\"params\":{},\"patientId\":\"001\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-27 20:25:20', 3);
INSERT INTO `sys_oper_log` VALUES (207, '既往史', 1, 'com.ruoyi.ClinicalSys.controller.HistoryController.add()', 'POST', 1, 'admin', '研发部门', '/ClinicalSys/history', '127.0.0.1', '内网IP', '{\"allergenExposure\":\"无\",\"foodAllergyHistory\":\"无无\",\"historyId\":1,\"params\":{},\"pastDiseaseHistory\":\"无\",\"patientId\":\"001\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-27 20:27:34', 6);
INSERT INTO `sys_oper_log` VALUES (208, '影像学检查', 1, 'com.ruoyi.ClinicalSys.controller.ImagingController.add()', 'POST', 1, 'admin', '研发部门', '/ClinicalSys/imaging', '127.0.0.1', '内网IP', '{\"imagingDate\":\"2025-06-27\",\"imagingId\":1,\"imagingType\":\"x\",\"params\":{},\"patientId\":\"001\",\"report\":\"无\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-27 20:27:46', 7);
INSERT INTO `sys_oper_log` VALUES (209, '医保情况', 1, 'com.ruoyi.ClinicalSys.controller.InsuranceInfoController.add()', 'POST', 1, 'admin', '研发部门', '/ClinicalSys/info', '127.0.0.1', '内网IP', '{\"insuranceId\":1,\"insuranceNumber\":\"001\",\"insuranceType\":\"无\",\"params\":{},\"patientId\":\"001\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-27 20:27:59', 6);
INSERT INTO `sys_oper_log` VALUES (210, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"familyhistory\",\"className\":\"FamilyHistory\",\"columns\":[{\"capJavaField\":\"FamId\",\"columnComment\":\"家族号\",\"columnId\":149,\"columnName\":\"fam_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 14:25:10\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"famId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":15,\"updateBy\":\"\",\"updateTime\":\"2025-06-27 16:09:47\",\"usableColumn\":false},{\"capJavaField\":\"PatientId\",\"columnComment\":\"病人号\",\"columnId\":150,\"columnName\":\"patient_id\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 14:25:10\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"patientId\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":15,\"updateBy\":\"\",\"updateTime\":\"2025-06-27 16:09:47\",\"usableColumn\":false},{\"capJavaField\":\"RelativeRelation\",\"columnComment\":\"相对关系\",\"columnId\":151,\"columnName\":\"relative_relation\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 14:25:10\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"0\",\"javaField\":\"relativeRelation\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":15,\"updateBy\":\"\",\"updateTime\":\"2025-06-27 16:09:47\",\"usableColumn\":false},{\"capJavaField\":\"AllergyDisease\",\"columnComment\":\"过敏性疾病\",\"columnId\":152,\"columnName\":\"allergy_disease\",\"columnType\":\"text\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 14:25:10\",\"dictType\":\"\",\"edit\":tru', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-27 20:32:51', 11);
INSERT INTO `sys_oper_log` VALUES (211, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"labtests\",\"className\":\"LabTests\",\"columns\":[{\"capJavaField\":\"TestId\",\"columnComment\":\"实验室检查号\",\"columnId\":178,\"columnName\":\"test_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 14:25:10\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"testId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":21,\"updateBy\":\"\",\"updateTime\":\"2025-06-27 15:52:11\",\"usableColumn\":false},{\"capJavaField\":\"PatientId\",\"columnComment\":\"病人号\",\"columnId\":179,\"columnName\":\"patient_id\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 14:25:10\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"patientId\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":21,\"updateBy\":\"\",\"updateTime\":\"2025-06-27 15:52:11\",\"usableColumn\":false},{\"capJavaField\":\"TestName\",\"columnComment\":\"检查项目名称\",\"columnId\":180,\"columnName\":\"test_name\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 14:25:10\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"0\",\"javaField\":\"testName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"LIKE\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":21,\"updateBy\":\"\",\"updateTime\":\"2025-06-27 15:52:11\",\"usableColumn\":false},{\"capJavaField\":\"TestDate\",\"columnComment\":\"检查日期\",\"columnId\":181,\"columnName\":\"test_date\",\"columnType\":\"date\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 14:25:10\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"datetime\",\"increment\":', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-27 20:33:02', 10);
INSERT INTO `sys_oper_log` VALUES (212, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"lungtests\",\"className\":\"LungTests\",\"columns\":[{\"capJavaField\":\"LungId\",\"columnComment\":\"肺功能检查号\",\"columnId\":183,\"columnName\":\"lung_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 14:25:10\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"lungId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":22,\"updateBy\":\"\",\"updateTime\":\"2025-06-27 15:52:22\",\"usableColumn\":false},{\"capJavaField\":\"PatientId\",\"columnComment\":\"病人号\",\"columnId\":184,\"columnName\":\"patient_id\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 14:25:10\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"patientId\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":22,\"updateBy\":\"\",\"updateTime\":\"2025-06-27 15:52:22\",\"usableColumn\":false},{\"capJavaField\":\"TestName\",\"columnComment\":\"检查名称\",\"columnId\":185,\"columnName\":\"test_name\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 14:25:10\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"0\",\"javaField\":\"testName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"LIKE\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":22,\"updateBy\":\"\",\"updateTime\":\"2025-06-27 15:52:22\",\"usableColumn\":false},{\"capJavaField\":\"TestDate\",\"columnComment\":\"检查日期\",\"columnId\":186,\"columnName\":\"test_date\",\"columnType\":\"date\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 14:25:10\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"datetime\",\"increment\":', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-27 20:33:08', 12);
INSERT INTO `sys_oper_log` VALUES (213, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"medicationshistory\",\"className\":\"MedicationsHistory\",\"columns\":[{\"capJavaField\":\"MedHisId\",\"columnComment\":\"既往用药号\",\"columnId\":205,\"columnName\":\"med_his_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 14:25:10\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"medHisId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":25,\"updateBy\":\"\",\"updateTime\":\"2025-06-27 15:52:57\",\"usableColumn\":false},{\"capJavaField\":\"PatientId\",\"columnComment\":\"病人号\",\"columnId\":206,\"columnName\":\"patient_id\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 14:25:10\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"patientId\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":25,\"updateBy\":\"\",\"updateTime\":\"2025-06-27 15:52:57\",\"usableColumn\":false},{\"capJavaField\":\"MedicationName\",\"columnComment\":\"药物名称\",\"columnId\":207,\"columnName\":\"medication_name\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 14:25:10\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"0\",\"javaField\":\"medicationName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"LIKE\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":25,\"updateBy\":\"\",\"updateTime\":\"2025-06-27 15:52:57\",\"usableColumn\":false},{\"capJavaField\":\"DurationDays\",\"columnComment\":\"药物使用天数\",\"columnId\":208,\"columnName\":\"duration_days\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 14:25:10\",\"dictType', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-27 20:33:20', 10);
INSERT INTO `sys_oper_log` VALUES (214, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"clinical_other_treatments,contacts,diagnoses,expenses,family_history,feno_tests,followup_notes,history,imaging,insurance_info,lab_tests,lung_tests,medical_orgs,medications,medications_history,patients,providers,symptoms\"}', NULL, 0, NULL, '2025-06-27 20:33:42', 668);
INSERT INTO `sys_oper_log` VALUES (215, '患者基本信息', 1, 'com.ruoyi.ClinicalSys.controller.PatientsController.add()', 'POST', 1, 'admin', '研发部门', '/ClinicalSys/patients', '127.0.0.1', '内网IP', '{\"address\":\"福州\",\"age\":1,\"birthDate\":\"2025-06-27\",\"birthWeight\":1,\"gender\":\"男\",\"height\":1,\"lifestyle\":\"无\",\"name\":\"李四\",\"params\":{},\"patientId\":\"002\",\"visitTime\":\"2025-06-27\",\"weight\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-27 20:56:32', 112);
INSERT INTO `sys_oper_log` VALUES (216, '患儿基本信息', 1, 'com.ruoyi.EpidemSys.controller.SurveyBasicInfoController.add()', 'POST', 1, 'admin', '研发部门', '/EpidemSys/info', '127.0.0.1', '内网IP', '{\"address\":\"1\",\"age\":1,\"allergyHistory\":1,\"childName\":\"张三\",\"diagnosedAsthma\":1,\"diagnosedConjunctivitis\":1,\"diagnosedDermatitis\":1,\"diagnosedRhinitis\":1,\"diagnosedUrticaria\":1,\"gender\":\"男\",\"hasAsthma\":1,\"hasConjunctivitis\":1,\"hasDermatitis\":1,\"hasRhinitis\":1,\"hasUrticaria\":1,\"height\":1,\"params\":{},\"patientId\":\"001\",\"residenceYears\":1,\"surveyDate\":\"2025-06-27\",\"weight\":1}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot add or update a child row: a foreign key constraint fails (`ry-vue`.`survey_basic_info`, CONSTRAINT `survey_basic_info_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `clinical_db`.`patients` (`patient_id`))\r\n### The error may exist in file [E:\\RuoYi-Vue-master\\ruoyi-admin\\target\\classes\\mapper\\EpidemSys\\SurveyBasicInfoMapper.xml]\r\n### The error may involve com.ruoyi.EpidemSys.mapper.SurveyBasicInfoMapper.insertSurveyBasicInfo-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into survey_basic_info          ( patient_id,             survey_date,             child_name,             gender,             age,                          residence_years,             address,             height,             weight,             allergy_history,             has_rhinitis,             has_asthma,             has_dermatitis,             has_conjunctivitis,             has_urticaria,             diagnosed_rhinitis,             diagnosed_asthma,             diagnosed_dermatitis,             diagnosed_conjunctivitis,             diagnosed_urticaria )           values ( ?,             ?,             ?,             ?,             ?,                          ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ? )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot add or update a child row: a foreign key constraint fails (`ry-vue`.`survey_basic_info`, CONSTRAINT `survey_basic_info_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `clinical_db`.`patients` (`patient_id`))\n; Cannot add or update a child row: a foreign key constraint fails (`ry-vue`.`survey_basic_info`, CONSTRAINT `survey_basic_info_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `clinical_db`.`patients` (`patient_id`)); nested exception is', '2025-06-27 21:08:11', 99);
INSERT INTO `sys_oper_log` VALUES (217, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2254', '127.0.0.1', '内网IP', '2254', '{\"msg\":\"存在子菜单,不允许删除\",\"code\":601}', 0, NULL, '2025-06-27 21:11:49', 5);
INSERT INTO `sys_oper_log` VALUES (218, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2255', '127.0.0.1', '内网IP', '2255', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-27 21:11:55', 10);
INSERT INTO `sys_oper_log` VALUES (219, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2256', '127.0.0.1', '内网IP', '2256', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-27 21:11:59', 6);
INSERT INTO `sys_oper_log` VALUES (220, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2257', '127.0.0.1', '内网IP', '2257', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-27 21:12:00', 6);
INSERT INTO `sys_oper_log` VALUES (221, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2258', '127.0.0.1', '内网IP', '2258', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-27 21:12:02', 7);
INSERT INTO `sys_oper_log` VALUES (222, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2259', '127.0.0.1', '内网IP', '2259', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-27 21:12:04', 7);
INSERT INTO `sys_oper_log` VALUES (223, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2254', '127.0.0.1', '内网IP', '2254', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-27 21:12:08', 6);
INSERT INTO `sys_oper_log` VALUES (224, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2279', '127.0.0.1', '内网IP', '2279', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-27 21:12:15', 7);
INSERT INTO `sys_oper_log` VALUES (225, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2280', '127.0.0.1', '内网IP', '2280', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-27 21:12:17', 6);
INSERT INTO `sys_oper_log` VALUES (226, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2281', '127.0.0.1', '内网IP', '2281', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-27 21:12:18', 6);
INSERT INTO `sys_oper_log` VALUES (227, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2282', '127.0.0.1', '内网IP', '2282', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-27 21:12:20', 6);
INSERT INTO `sys_oper_log` VALUES (228, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2283', '127.0.0.1', '内网IP', '2283', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-27 21:12:22', 7);
INSERT INTO `sys_oper_log` VALUES (229, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2278', '127.0.0.1', '内网IP', '2278', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-27 21:12:25', 6);
INSERT INTO `sys_oper_log` VALUES (230, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2285', '127.0.0.1', '内网IP', '2285', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-27 21:12:31', 6);
INSERT INTO `sys_oper_log` VALUES (231, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2286', '127.0.0.1', '内网IP', '2286', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-27 21:12:33', 6);
INSERT INTO `sys_oper_log` VALUES (232, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2287', '127.0.0.1', '内网IP', '2287', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-27 21:12:35', 7);
INSERT INTO `sys_oper_log` VALUES (233, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2288', '127.0.0.1', '内网IP', '2288', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-27 21:12:36', 6);
INSERT INTO `sys_oper_log` VALUES (234, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2289', '127.0.0.1', '内网IP', '2289', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-27 21:12:38', 6);
INSERT INTO `sys_oper_log` VALUES (235, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2284', '127.0.0.1', '内网IP', '2284', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-27 21:12:40', 6);
INSERT INTO `sys_oper_log` VALUES (236, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2291', '127.0.0.1', '内网IP', '2291', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-27 21:12:45', 6);
INSERT INTO `sys_oper_log` VALUES (237, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2292', '127.0.0.1', '内网IP', '2292', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-27 21:12:46', 7);
INSERT INTO `sys_oper_log` VALUES (238, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2293', '127.0.0.1', '内网IP', '2293', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-27 21:12:48', 6);
INSERT INTO `sys_oper_log` VALUES (239, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2294', '127.0.0.1', '内网IP', '2294', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-27 21:12:49', 8);
INSERT INTO `sys_oper_log` VALUES (240, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2295', '127.0.0.1', '内网IP', '2295', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-27 21:12:50', 6);
INSERT INTO `sys_oper_log` VALUES (241, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2290', '127.0.0.1', '内网IP', '2290', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-27 21:12:52', 7);
INSERT INTO `sys_oper_log` VALUES (242, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2356', '127.0.0.1', '内网IP', '2356', '{\"msg\":\"存在子菜单,不允许删除\",\"code\":601}', 0, NULL, '2025-06-27 21:13:13', 2);
INSERT INTO `sys_oper_log` VALUES (243, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2357', '127.0.0.1', '内网IP', '2357', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-27 21:13:17', 7);
INSERT INTO `sys_oper_log` VALUES (244, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2358', '127.0.0.1', '内网IP', '2358', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-27 21:13:19', 7);
INSERT INTO `sys_oper_log` VALUES (245, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2359', '127.0.0.1', '内网IP', '2359', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-27 21:13:21', 7);
INSERT INTO `sys_oper_log` VALUES (246, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2360', '127.0.0.1', '内网IP', '2360', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-27 21:13:23', 6);
INSERT INTO `sys_oper_log` VALUES (247, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2361', '127.0.0.1', '内网IP', '2361', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-27 21:13:24', 5);
INSERT INTO `sys_oper_log` VALUES (248, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2356', '127.0.0.1', '内网IP', '2356', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-27 21:13:26', 6);
INSERT INTO `sys_oper_log` VALUES (249, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"lab_tests,lung_tests,medications_history\"}', NULL, 0, NULL, '2025-06-27 21:15:08', 234);
INSERT INTO `sys_oper_log` VALUES (250, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"lab_tests,lung_tests,medications_history,family_history\"}', NULL, 0, NULL, '2025-06-27 21:15:53', 111);
INSERT INTO `sys_oper_log` VALUES (251, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', '研发部门', '/tool/gen/11,12,13,14,15,16,17,18,19,20', '127.0.0.1', '内网IP', '[11,12,13,14,15,16,17,18,19,20]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-27 21:27:15', 21);
INSERT INTO `sys_oper_log` VALUES (252, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', '研发部门', '/tool/gen/21,22,23,24,25,26,27,28', '127.0.0.1', '内网IP', '[21,22,23,24,25,26,27,28]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-27 21:27:18', 8);
INSERT INTO `sys_oper_log` VALUES (253, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"clipboard\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"随访数据库\",\"menuType\":\"M\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"path\":\"FollowSys\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-27 21:30:37', 30);
INSERT INTO `sys_oper_log` VALUES (254, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"followup_visits,followup_other_treatments,followup_physical_exam,followup_providers,followup_pulmonary_tests,followup_questionnaire_scores,followup_summary,followup_symptoms,followup_medication_history,followup_medications,followup_nasal_resistance_tests,followup_info,drug_catalog,followup_adverse_reactions,followup_audiology_tests,followup_diagnoses,followup_endoscopy,followup_expenses,followup_feno_tests,followup_imaging,followup_lab_tests\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-27 21:31:51', 474);
INSERT INTO `sys_oper_log` VALUES (255, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"symptoms\",\"className\":\"FollowupSymptoms\",\"columns\":[{\"capJavaField\":\"SymptomId\",\"columnComment\":\"症状号\",\"columnId\":532,\"columnName\":\"symptom_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 21:31:51\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"symptomId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":48,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"FollowupId\",\"columnComment\":\"随访者号\",\"columnId\":533,\"columnName\":\"followup_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 21:31:51\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"1\",\"javaField\":\"followupId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":48,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ItchyNose\",\"columnComment\":\"鼻痒\",\"columnId\":534,\"columnName\":\"itchy_nose\",\"columnType\":\"tinyint(1)\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 21:31:51\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"0\",\"javaField\":\"itchyNose\",\"javaType\":\"Integer\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":48,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Sneezing\",\"columnComment\":\"喷嚏\",\"columnId\":535,\"columnName\":\"sneezing\",\"columnType\":\"tinyint(1)\",\"createBy\":\"admin\",\"createTime\":\"2025-06-27 21:31:51\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-27 21:44:38', 175);
INSERT INTO `sys_oper_log` VALUES (256, '患者基本信息', 3, 'com.ruoyi.ClinicalSys.controller.PatientsController.remove()', 'DELETE', 1, 'admin', '研发部门', '/ClinicalSys/patients/001,002', '127.0.0.1', '内网IP', '[\"001\",\"002\"]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-27 21:52:23', 6);
INSERT INTO `sys_oper_log` VALUES (257, '患者基本信息', 1, 'com.ruoyi.ClinicalSys.controller.PatientsController.add()', 'POST', 1, 'admin', '研发部门', '/ClinicalSys/patients', '127.0.0.1', '内网IP', '{\"address\":\"福州\",\"age\":1,\"birthDate\":\"2025-06-06\",\"birthWeight\":1,\"gender\":\"男\",\"height\":1,\"lifestyle\":\"无\",\"name\":\"张三\",\"params\":{},\"patientId\":\"001\",\"visitTime\":\"2025-06-27\",\"weight\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-28 09:53:25', 15);
INSERT INTO `sys_oper_log` VALUES (258, '患儿基本信息', 1, 'com.ruoyi.EpidemSys.controller.SurveyBasicInfoController.add()', 'POST', 1, 'admin', '研发部门', '/EpidemSys/info', '127.0.0.1', '内网IP', '{\"address\":\"1\",\"age\":1,\"allergyHistory\":1,\"childName\":\"1\",\"diagnosedAsthma\":1,\"diagnosedConjunctivitis\":11,\"diagnosedDermatitis\":1,\"diagnosedRhinitis\":1,\"diagnosedUrticaria\":1,\"gender\":\"1\",\"hasAsthma\":1,\"hasConjunctivitis\":1,\"hasDermatitis\":1,\"hasRhinitis\":11,\"hasUrticaria\":1,\"height\":1,\"params\":{},\"patientId\":\"001\",\"residenceYears\":1,\"surveyDate\":\"2025-06-27\",\"weight\":1}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot add or update a child row: a foreign key constraint fails (`ry-vue`.`survey_basic_info`, CONSTRAINT `survey_basic_info_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `clinical_db`.`patients` (`patient_id`))\r\n### The error may exist in file [E:\\RuoYi-Vue-master\\ruoyi-admin\\target\\classes\\mapper\\EpidemSys\\SurveyBasicInfoMapper.xml]\r\n### The error may involve com.ruoyi.EpidemSys.mapper.SurveyBasicInfoMapper.insertSurveyBasicInfo-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into survey_basic_info          ( patient_id,             survey_date,             child_name,             gender,             age,                          residence_years,             address,             height,             weight,             allergy_history,             has_rhinitis,             has_asthma,             has_dermatitis,             has_conjunctivitis,             has_urticaria,             diagnosed_rhinitis,             diagnosed_asthma,             diagnosed_dermatitis,             diagnosed_conjunctivitis,             diagnosed_urticaria )           values ( ?,             ?,             ?,             ?,             ?,                          ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ? )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot add or update a child row: a foreign key constraint fails (`ry-vue`.`survey_basic_info`, CONSTRAINT `survey_basic_info_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `clinical_db`.`patients` (`patient_id`))\n; Cannot add or update a child row: a foreign key constraint fails (`ry-vue`.`survey_basic_info`, CONSTRAINT `survey_basic_info_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `clinical_db`.`patients` (`patient_id`)); nested exception is', '2025-06-28 09:54:48', 103);
INSERT INTO `sys_oper_log` VALUES (259, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2007', '127.0.0.1', '内网IP', '2007', '{\"msg\":\"存在子菜单,不允许删除\",\"code\":601}', 0, NULL, '2025-06-28 10:20:01', 4);
INSERT INTO `sys_oper_log` VALUES (260, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2002', '127.0.0.1', '内网IP', '2002', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-28 10:25:15', 9);
INSERT INTO `sys_oper_log` VALUES (261, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2003', '127.0.0.1', '内网IP', '2003', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-28 10:25:17', 8);
INSERT INTO `sys_oper_log` VALUES (262, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2004', '127.0.0.1', '内网IP', '2004', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-28 10:25:18', 6);
INSERT INTO `sys_oper_log` VALUES (263, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2005', '127.0.0.1', '内网IP', '2005', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-28 10:25:20', 6);
INSERT INTO `sys_oper_log` VALUES (264, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2006', '127.0.0.1', '内网IP', '2006', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-28 10:25:21', 5);
INSERT INTO `sys_oper_log` VALUES (265, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2001', '127.0.0.1', '内网IP', '2001', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-28 10:25:22', 5);
INSERT INTO `sys_oper_log` VALUES (266, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2008', '127.0.0.1', '内网IP', '2008', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-28 10:25:26', 6);
INSERT INTO `sys_oper_log` VALUES (267, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2009', '127.0.0.1', '内网IP', '2009', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-28 10:25:27', 6);
INSERT INTO `sys_oper_log` VALUES (268, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2010', '127.0.0.1', '内网IP', '2010', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-28 10:25:29', 7);
INSERT INTO `sys_oper_log` VALUES (269, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2011', '127.0.0.1', '内网IP', '2011', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-28 10:25:30', 5);
INSERT INTO `sys_oper_log` VALUES (270, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2012', '127.0.0.1', '内网IP', '2012', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-28 10:25:31', 6);
INSERT INTO `sys_oper_log` VALUES (271, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2007', '127.0.0.1', '内网IP', '2007', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-28 10:25:33', 6);
INSERT INTO `sys_oper_log` VALUES (272, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2014', '127.0.0.1', '内网IP', '2014', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-28 10:25:36', 6);
INSERT INTO `sys_oper_log` VALUES (273, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2015', '127.0.0.1', '内网IP', '2015', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-28 10:25:37', 5);
INSERT INTO `sys_oper_log` VALUES (274, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2016', '127.0.0.1', '内网IP', '2016', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-28 10:25:38', 5);
INSERT INTO `sys_oper_log` VALUES (275, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2017', '127.0.0.1', '内网IP', '2017', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-28 10:25:40', 6);
INSERT INTO `sys_oper_log` VALUES (276, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2018', '127.0.0.1', '内网IP', '2018', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-28 10:25:41', 7);
INSERT INTO `sys_oper_log` VALUES (277, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2013', '127.0.0.1', '内网IP', '2013', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-28 10:25:42', 5);
INSERT INTO `sys_oper_log` VALUES (278, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2020', '127.0.0.1', '内网IP', '2020', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-28 10:25:45', 5);
INSERT INTO `sys_oper_log` VALUES (279, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2021', '127.0.0.1', '内网IP', '2021', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-28 10:25:46', 6);
INSERT INTO `sys_oper_log` VALUES (280, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2022', '127.0.0.1', '内网IP', '2022', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-28 10:25:47', 8);
INSERT INTO `sys_oper_log` VALUES (281, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2023', '127.0.0.1', '内网IP', '2023', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-28 10:25:49', 6);
INSERT INTO `sys_oper_log` VALUES (282, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2024', '127.0.0.1', '内网IP', '2024', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-28 10:25:50', 5);
INSERT INTO `sys_oper_log` VALUES (283, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2019', '127.0.0.1', '内网IP', '2019', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-28 10:25:52', 6);
INSERT INTO `sys_oper_log` VALUES (284, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2026', '127.0.0.1', '内网IP', '2026', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-28 10:25:55', 5);
INSERT INTO `sys_oper_log` VALUES (285, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2027', '127.0.0.1', '内网IP', '2027', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-28 10:25:57', 6);
INSERT INTO `sys_oper_log` VALUES (286, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2028', '127.0.0.1', '内网IP', '2028', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-28 10:26:00', 7);
INSERT INTO `sys_oper_log` VALUES (287, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2029', '127.0.0.1', '内网IP', '2029', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-28 10:26:01', 7);
INSERT INTO `sys_oper_log` VALUES (288, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2030', '127.0.0.1', '内网IP', '2030', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-28 10:26:03', 6);
INSERT INTO `sys_oper_log` VALUES (289, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2025', '127.0.0.1', '内网IP', '2025', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-28 10:26:05', 6);
INSERT INTO `sys_oper_log` VALUES (290, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2032', '127.0.0.1', '内网IP', '2032', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-28 10:26:07', 5);
INSERT INTO `sys_oper_log` VALUES (291, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2033', '127.0.0.1', '内网IP', '2033', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-28 10:26:09', 6);
INSERT INTO `sys_oper_log` VALUES (292, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2034', '127.0.0.1', '内网IP', '2034', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-28 10:26:10', 6);
INSERT INTO `sys_oper_log` VALUES (293, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2035', '127.0.0.1', '内网IP', '2035', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-28 10:26:12', 6);
INSERT INTO `sys_oper_log` VALUES (294, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2036', '127.0.0.1', '内网IP', '2036', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-28 10:26:13', 6);
INSERT INTO `sys_oper_log` VALUES (295, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2031', '127.0.0.1', '内网IP', '2031', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-28 10:26:15', 5);
INSERT INTO `sys_oper_log` VALUES (296, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2038', '127.0.0.1', '内网IP', '2038', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-28 10:26:17', 6);
INSERT INTO `sys_oper_log` VALUES (297, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2039', '127.0.0.1', '内网IP', '2039', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-28 10:26:19', 5);
INSERT INTO `sys_oper_log` VALUES (298, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2040', '127.0.0.1', '内网IP', '2040', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-28 10:26:20', 4);
INSERT INTO `sys_oper_log` VALUES (299, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2041', '127.0.0.1', '内网IP', '2041', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-28 10:26:21', 5);
INSERT INTO `sys_oper_log` VALUES (300, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2042', '127.0.0.1', '内网IP', '2042', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-28 10:26:23', 5);
INSERT INTO `sys_oper_log` VALUES (301, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2037', '127.0.0.1', '内网IP', '2037', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-28 10:26:24', 5);
INSERT INTO `sys_oper_log` VALUES (302, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2044', '127.0.0.1', '内网IP', '2044', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-28 10:26:26', 5);
INSERT INTO `sys_oper_log` VALUES (303, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2045', '127.0.0.1', '内网IP', '2045', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-28 10:26:28', 4);
INSERT INTO `sys_oper_log` VALUES (304, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2046', '127.0.0.1', '内网IP', '2046', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-28 10:26:29', 5);
INSERT INTO `sys_oper_log` VALUES (305, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2047', '127.0.0.1', '内网IP', '2047', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-28 10:26:31', 6);
INSERT INTO `sys_oper_log` VALUES (306, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2048', '127.0.0.1', '内网IP', '2048', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-28 10:26:32', 6);
INSERT INTO `sys_oper_log` VALUES (307, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2049', '127.0.0.1', '内网IP', '2049', '{\"msg\":\"存在子菜单,不允许删除\",\"code\":601}', 0, NULL, '2025-06-28 10:26:33', 3);
INSERT INTO `sys_oper_log` VALUES (308, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2043', '127.0.0.1', '内网IP', '2043', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-28 10:26:35', 4);
INSERT INTO `sys_oper_log` VALUES (309, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2050', '127.0.0.1', '内网IP', '2050', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-28 10:26:38', 5);
INSERT INTO `sys_oper_log` VALUES (310, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2051', '127.0.0.1', '内网IP', '2051', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-28 10:26:40', 6);
INSERT INTO `sys_oper_log` VALUES (311, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2052', '127.0.0.1', '内网IP', '2052', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-28 10:26:41', 3);
INSERT INTO `sys_oper_log` VALUES (312, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2053', '127.0.0.1', '内网IP', '2053', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-28 10:26:43', 5);
INSERT INTO `sys_oper_log` VALUES (313, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2054', '127.0.0.1', '内网IP', '2054', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-28 10:26:44', 5);
INSERT INTO `sys_oper_log` VALUES (314, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2049', '127.0.0.1', '内网IP', '2049', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-28 10:26:46', 5);
INSERT INTO `sys_oper_log` VALUES (315, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2056', '127.0.0.1', '内网IP', '2056', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-28 10:26:50', 6);
INSERT INTO `sys_oper_log` VALUES (316, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2057', '127.0.0.1', '内网IP', '2057', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-28 10:26:51', 5);
INSERT INTO `sys_oper_log` VALUES (317, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2058', '127.0.0.1', '内网IP', '2058', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-28 10:26:52', 5);
INSERT INTO `sys_oper_log` VALUES (318, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2059', '127.0.0.1', '内网IP', '2059', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-28 10:26:54', 4);
INSERT INTO `sys_oper_log` VALUES (319, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2060', '127.0.0.1', '内网IP', '2060', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-28 10:26:55', 5);
INSERT INTO `sys_oper_log` VALUES (320, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2055', '127.0.0.1', '内网IP', '2055', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-28 10:26:56', 5);
INSERT INTO `sys_oper_log` VALUES (321, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"family_history_primary,survey_area_environment,survey_basic_info,survey_environment_exposure,survey_confounding_factors,family_history_secondary,survey_family_env,survey_learning_work_env,survey_monitoring_methods,survey_providers\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-28 11:38:12', 472);
INSERT INTO `sys_oper_log` VALUES (322, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"secondary\",\"className\":\"FamilyHistorySecondary\",\"columns\":[{\"capJavaField\":\"SecId\",\"columnComment\":\"二级亲属号\",\"columnId\":581,\"columnName\":\"sec_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-06-28 11:38:12\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"secId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":51,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"SurveyId\",\"columnComment\":\"患者号\",\"columnId\":582,\"columnName\":\"survey_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-06-28 11:38:12\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"surveyId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":51,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Relation\",\"columnComment\":\"关系\",\"columnId\":583,\"columnName\":\"relation\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2025-06-28 11:38:12\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"0\",\"javaField\":\"relation\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":51,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Diseases\",\"columnComment\":\"疾病名称\",\"columnId\":584,\"columnName\":\"diseases\",\"columnType\":\"text\",\"createBy\":\"admin\",\"createTime\":\"2025-06-28 11:38:12\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"textarea\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-28 14:20:44', 46);
INSERT INTO `sys_oper_log` VALUES (323, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"StudyLearnenv\",\"className\":\"SurveyLearningWorkEnv\",\"columns\":[{\"capJavaField\":\"LearnEnvId\",\"columnComment\":\"学习/工作环境号\",\"columnId\":679,\"columnName\":\"learn_env_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-06-28 11:38:12\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"learnEnvId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":57,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"SurveyId\",\"columnComment\":\"患者号\",\"columnId\":680,\"columnName\":\"survey_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-06-28 11:38:12\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"surveyId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":57,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"LocationType\",\"columnComment\":\"单位位置\",\"columnId\":681,\"columnName\":\"location_type\",\"columnType\":\"enum(\'城市中心\',\'郊区\',\'农村\')\",\"createBy\":\"admin\",\"createTime\":\"2025-06-28 11:38:12\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"locationType\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":57,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"VentilationQuality\",\"columnComment\":\"通风情况\",\"columnId\":682,\"columnName\":\"ventilation_quality\",\"columnType\":\"enum(\'良好\',\'一般\',\'差\')\",\"createBy\":\"admin\",\"createTime\":\"2025-06-28 11:38:12\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"is', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-28 14:30:32', 29);
INSERT INTO `sys_oper_log` VALUES (324, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"StudyLearnenv\",\"className\":\"SurveyLearningWorkEnv\",\"columns\":[{\"capJavaField\":\"LearnEnvId\",\"columnComment\":\"学习/工作环境号\",\"columnId\":679,\"columnName\":\"learn_env_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-06-28 11:38:12\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"learnEnvId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":57,\"updateBy\":\"\",\"updateTime\":\"2025-06-28 14:30:32\",\"usableColumn\":false},{\"capJavaField\":\"SurveyId\",\"columnComment\":\"患者号\",\"columnId\":680,\"columnName\":\"survey_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-06-28 11:38:12\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"surveyId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":57,\"updateBy\":\"\",\"updateTime\":\"2025-06-28 14:30:32\",\"usableColumn\":false},{\"capJavaField\":\"LocationType\",\"columnComment\":\"单位位置\",\"columnId\":681,\"columnName\":\"location_type\",\"columnType\":\"enum(\'城市中心\',\'郊区\',\'农村\')\",\"createBy\":\"admin\",\"createTime\":\"2025-06-28 11:38:12\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"0\",\"javaField\":\"locationType\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":57,\"updateBy\":\"\",\"updateTime\":\"2025-06-28 14:30:32\",\"usableColumn\":false},{\"capJavaField\":\"VentilationQuality\",\"columnComment\":\"通风情况\",\"columnId\":682,\"columnName\":\"ventilation_quality\",\"columnType\":\"enum(\'良好\',\'一般\',\'差\')\",\"createBy\":\"admin\",\"createTime\":\"2025-06-', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-28 14:30:45', 26);
INSERT INTO `sys_oper_log` VALUES (325, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"factors\",\"className\":\"SurveyConfoundingFactors\",\"columns\":[{\"capJavaField\":\"ConfoundId\",\"columnComment\":\"其他因素号\",\"columnId\":621,\"columnName\":\"confound_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-06-28 11:38:12\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"confoundId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":54,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"SurveyId\",\"columnComment\":\"患者号\",\"columnId\":622,\"columnName\":\"survey_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-06-28 11:38:12\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"0\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"surveyId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":54,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"DietType\",\"columnComment\":\"饮食习惯\",\"columnId\":623,\"columnName\":\"diet_type\",\"columnType\":\"enum(\'高加工食品\',\'传统饮食\')\",\"createBy\":\"admin\",\"createTime\":\"2025-06-28 11:38:12\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"0\",\"javaField\":\"dietType\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":54,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"VitaminD400u\",\"columnComment\":\"每日摄入维生素D400u\",\"columnId\":624,\"columnName\":\"vitamin_d_400u\",\"columnType\":\"tinyint(1)\",\"createBy\":\"admin\",\"createTime\":\"2025-06-28 11:38:12\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-28 14:35:55', 36);
INSERT INTO `sys_oper_log` VALUES (326, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"SAenvironment\",\"className\":\"SurveyAreaEnvironment\",\"columns\":[{\"capJavaField\":\"EnvAreaId\",\"columnComment\":\"城乡环境号\",\"columnId\":585,\"columnName\":\"env_area_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-06-28 11:38:12\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"envAreaId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":52,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"SurveyId\",\"columnComment\":\"患者号\",\"columnId\":586,\"columnName\":\"survey_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-06-28 11:38:12\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"surveyId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":52,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"UrbanPm25Avg\",\"columnComment\":\"城市PM2.5年均浓度\",\"columnId\":587,\"columnName\":\"urban_pm25_avg\",\"columnType\":\"float\",\"createBy\":\"admin\",\"createTime\":\"2025-06-28 11:38:12\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"0\",\"javaField\":\"urbanPm25Avg\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":52,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"UrbanPm25Seasonal\",\"columnComment\":\"城市PM2.5季节性变化\",\"columnId\":588,\"columnName\":\"urban_pm25_seasonal\",\"columnType\":\"text\",\"createBy\":\"admin\",\"createTime\":\"2025-06-28 11:38:12\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"textarea\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isIns', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-28 14:40:11', 32);
INSERT INTO `sys_oper_log` VALUES (327, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"methods\",\"className\":\"SurveyMonitoringMethods\",\"columns\":[{\"capJavaField\":\"MethodId\",\"columnComment\":\"检测方法号\",\"columnId\":689,\"columnName\":\"method_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-06-28 11:38:12\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"methodId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":58,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"SurveyId\",\"columnComment\":\"患者号\",\"columnId\":690,\"columnName\":\"survey_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-06-28 11:38:12\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"surveyId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":58,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Pm25DetectorModel\",\"columnComment\":\"PM2.5监测异型号\",\"columnId\":691,\"columnName\":\"pm25_detector_model\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2025-06-28 11:38:12\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"0\",\"javaField\":\"pm25DetectorModel\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":58,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"PollenGravitySettle\",\"columnComment\":\"重力沉降法\",\"columnId\":692,\"columnName\":\"pollen_gravity_settle\",\"columnType\":\"tinyint(1)\",\"createBy\":\"admin\",\"createTime\":\"2025-06-28 11:38:12\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrem', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-28 14:42:40', 25);
INSERT INTO `sys_oper_log` VALUES (328, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"env\",\"className\":\"SurveyFamilyEnv\",\"columns\":[{\"capJavaField\":\"FamilyEnvId\",\"columnComment\":\"家族环境号\",\"columnId\":676,\"columnName\":\"family_env_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-06-28 11:38:12\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"familyEnvId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":56,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"SurveyId\",\"columnComment\":\"患者号\",\"columnId\":677,\"columnName\":\"survey_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-06-28 11:38:12\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"surveyId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":56,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"SharedSmokingExposure\",\"columnComment\":\"共同暴露吸烟环境\",\"columnId\":678,\"columnName\":\"shared_smoking_exposure\",\"columnType\":\"tinyint(1)\",\"createBy\":\"admin\",\"createTime\":\"2025-06-28 11:38:12\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"0\",\"javaField\":\"sharedSmokingExposure\",\"javaType\":\"Integer\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":56,\"updateBy\":\"\",\"usableColumn\":false}],\"crud\":true,\"functionAuthor\":\"ruoyi\",\"functionName\":\"家族环境居住相似性\",\"genPath\":\"/\",\"genType\":\"0\",\"moduleName\":\"EpidemSys\",\"options\":\"{\\\"parentMenuId\\\":2000}\",\"packageName\":\"com.ruoyi.EpidemSys\",\"params\":{\"parentMenuId\":2000},\"parentMenuId\":2000,\"sub\":false,\"tableComment\":\"家族环境居住相似性\",\"table', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-28 14:43:52', 12);
INSERT INTO `sys_oper_log` VALUES (329, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"primary\",\"className\":\"FamilyHistoryPrimary\",\"columns\":[{\"capJavaField\":\"PrimId\",\"columnComment\":\"一级亲属号\",\"columnId\":577,\"columnName\":\"prim_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-06-28 11:38:12\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"primId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":50,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"SurveyId\",\"columnComment\":\"患者号\",\"columnId\":578,\"columnName\":\"survey_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-06-28 11:38:12\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"surveyId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":50,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Relation\",\"columnComment\":\"关系\",\"columnId\":579,\"columnName\":\"relation\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2025-06-28 11:38:12\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"0\",\"javaField\":\"relation\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":50,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Diseases\",\"columnComment\":\"疾病名称\",\"columnId\":580,\"columnName\":\"diseases\",\"columnType\":\"text\",\"createBy\":\"admin\",\"createTime\":\"2025-06-28 11:38:12\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"textarea\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-28 14:44:42', 16);
INSERT INTO `sys_oper_log` VALUES (330, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"exposure\",\"className\":\"SurveyEnvironmentExposure\",\"columns\":[{\"capJavaField\":\"EnvId\",\"columnComment\":\"家庭环境号\",\"columnId\":639,\"columnName\":\"env_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-06-28 11:38:12\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"envId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":55,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"SurveyId\",\"columnComment\":\"患者号\",\"columnId\":640,\"columnName\":\"survey_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-06-28 11:38:12\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"surveyId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":55,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"HouseType\",\"columnComment\":\"房屋类型\",\"columnId\":641,\"columnName\":\"house_type\",\"columnType\":\"enum(\'平房\',\'楼房\',\'别墅\',\'其他\')\",\"createBy\":\"admin\",\"createTime\":\"2025-06-28 11:38:12\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"0\",\"javaField\":\"houseType\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":55,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"BuildingMaterial\",\"columnComment\":\"建筑材料\",\"columnId\":642,\"columnName\":\"building_material\",\"columnType\":\"enum(\'木质\',\'混凝土\',\'其他\')\",\"createBy\":\"admin\",\"createTime\":\"2025-06-28 11:38:12\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-28 14:52:33', 60);
INSERT INTO `sys_oper_log` VALUES (331, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"info\",\"className\":\"SurveyBasicInfo\",\"columns\":[{\"capJavaField\":\"SurveyId\",\"columnComment\":\"基本信息号\",\"columnId\":599,\"columnName\":\"survey_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-06-28 11:38:12\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"surveyId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":53,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"PatientId\",\"columnComment\":\"病人号\",\"columnId\":600,\"columnName\":\"patient_id\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2025-06-28 11:38:12\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"patientId\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":53,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"SurveyDate\",\"columnComment\":\"调查时间\",\"columnId\":601,\"columnName\":\"survey_date\",\"columnType\":\"date\",\"createBy\":\"admin\",\"createTime\":\"2025-06-28 11:38:12\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"0\",\"javaField\":\"surveyDate\",\"javaType\":\"Date\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":53,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ChildName\",\"columnComment\":\"姓名\",\"columnId\":602,\"columnName\":\"child_name\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2025-06-28 11:38:12\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-28 14:56:18', 40);
INSERT INTO `sys_oper_log` VALUES (332, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"providers\",\"className\":\"SurveyProviders\",\"columns\":[{\"capJavaField\":\"ProviderId\",\"columnComment\":\"信息号\",\"columnId\":701,\"columnName\":\"provider_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-06-28 11:38:12\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"providerId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":59,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"SurveyId\",\"columnComment\":\"患者号\",\"columnId\":702,\"columnName\":\"survey_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-06-28 11:38:12\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"surveyId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":59,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"姓名\",\"columnId\":703,\"columnName\":\"name\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2025-06-28 11:38:12\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":59,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Title\",\"columnComment\":\"职称\",\"columnId\":704,\"columnName\":\"title\",\"columnType\":\"enum(\'住院医师\',\'主治医师\',\'副主任医师\',\'主任医师\')\",\"createBy\":\"admin\",\"createTime\":\"2025-06-28 11:38:12\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-28 14:57:05', 13);
INSERT INTO `sys_oper_log` VALUES (333, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"factors\",\"className\":\"SurveyConfoundingFactors\",\"columns\":[{\"capJavaField\":\"ConfoundId\",\"columnComment\":\"其他因素号\",\"columnId\":621,\"columnName\":\"confound_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-06-28 11:38:12\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"confoundId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":54,\"updateBy\":\"\",\"updateTime\":\"2025-06-28 14:35:55\",\"usableColumn\":false},{\"capJavaField\":\"SurveyId\",\"columnComment\":\"患者号\",\"columnId\":622,\"columnName\":\"survey_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-06-28 11:38:12\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"surveyId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":54,\"updateBy\":\"\",\"updateTime\":\"2025-06-28 14:35:55\",\"usableColumn\":false},{\"capJavaField\":\"DietType\",\"columnComment\":\"饮食习惯\",\"columnId\":623,\"columnName\":\"diet_type\",\"columnType\":\"enum(\'高加工食品\',\'传统饮食\')\",\"createBy\":\"admin\",\"createTime\":\"2025-06-28 11:38:12\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"0\",\"javaField\":\"dietType\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":54,\"updateBy\":\"\",\"updateTime\":\"2025-06-28 14:35:55\",\"usableColumn\":false},{\"capJavaField\":\"VitaminD400u\",\"columnComment\":\"每日摄入维生素D400u\",\"columnId\":624,\"columnName\":\"vitamin_d_400u\",\"columnType\":\"tinyint(1)\",\"createBy\":\"admin\",\"createTime\":\"2025-06-28 11:38:12\",\"dictType\":\"\",\"edit\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-28 14:58:04', 28);
INSERT INTO `sys_oper_log` VALUES (334, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"SFenv\",\"className\":\"SurveyFamilyEnv\",\"columns\":[{\"capJavaField\":\"FamilyEnvId\",\"columnComment\":\"家族环境号\",\"columnId\":676,\"columnName\":\"family_env_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-06-28 11:38:12\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"familyEnvId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":56,\"updateBy\":\"\",\"updateTime\":\"2025-06-28 14:43:52\",\"usableColumn\":false},{\"capJavaField\":\"SurveyId\",\"columnComment\":\"患者号\",\"columnId\":677,\"columnName\":\"survey_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-06-28 11:38:12\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"surveyId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":56,\"updateBy\":\"\",\"updateTime\":\"2025-06-28 14:43:52\",\"usableColumn\":false},{\"capJavaField\":\"SharedSmokingExposure\",\"columnComment\":\"共同暴露吸烟环境\",\"columnId\":678,\"columnName\":\"shared_smoking_exposure\",\"columnType\":\"tinyint(1)\",\"createBy\":\"admin\",\"createTime\":\"2025-06-28 11:38:12\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"0\",\"javaField\":\"sharedSmokingExposure\",\"javaType\":\"Integer\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":56,\"updateBy\":\"\",\"updateTime\":\"2025-06-28 14:43:52\",\"usableColumn\":false}],\"crud\":true,\"functionAuthor\":\"ruoyi\",\"functionName\":\"家族环境居住相似性\",\"genPath\":\"/\",\"genType\":\"0\",\"moduleName\":\"EpidemSys\",\"options\":\"{\\\"parentMenuId\\\":2000}\",\"packageName\":\"com.ruoyi.', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-28 14:58:45', 6);
INSERT INTO `sys_oper_log` VALUES (335, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"providers\",\"className\":\"SurveyProviders\",\"columns\":[{\"capJavaField\":\"ProviderId\",\"columnComment\":\"信息号\",\"columnId\":701,\"columnName\":\"provider_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-06-28 11:38:12\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"providerId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":59,\"updateBy\":\"\",\"updateTime\":\"2025-06-28 14:57:05\",\"usableColumn\":false},{\"capJavaField\":\"SurveyId\",\"columnComment\":\"患者号\",\"columnId\":702,\"columnName\":\"survey_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-06-28 11:38:12\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"surveyId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":59,\"updateBy\":\"\",\"updateTime\":\"2025-06-28 14:57:05\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"姓名\",\"columnId\":703,\"columnName\":\"name\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2025-06-28 11:38:12\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"0\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"LIKE\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":59,\"updateBy\":\"\",\"updateTime\":\"2025-06-28 14:57:05\",\"usableColumn\":false},{\"capJavaField\":\"Title\",\"columnComment\":\"职称\",\"columnId\":704,\"columnName\":\"title\",\"columnType\":\"enum(\'住院医师\',\'主治医师\',\'副主任医师\',\'主任医师\')\",\"createBy\":\"admin\",\"createTime\":\"2025-06-28 11:38:12\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increme', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-28 14:59:51', 6);
INSERT INTO `sys_oper_log` VALUES (336, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"family_history_secondary,survey_learning_work_env,survey_confounding_factors,survey_area_environment,survey_monitoring_methods,survey_family_env,family_history_primary,survey_environment_exposure,survey_basic_info,survey_providers\"}', NULL, 0, NULL, '2025-06-28 14:59:55', 802);
INSERT INTO `sys_oper_log` VALUES (337, '患者基本信息', 1, 'com.ruoyi.ClinicalSys.controller.PatientsController.add()', 'POST', 1, 'admin', '研发部门', '/ClinicalSys/patients', '127.0.0.1', '内网IP', '{\"address\":\"福州\",\"age\":1,\"birthDate\":\"2025-06-06\",\"birthWeight\":1,\"gender\":\"男\",\"height\":1,\"lifestyle\":\"无\",\"name\":\"李四\",\"params\":{},\"patientId\":\"002\",\"visitTime\":\"2025-06-28\",\"weight\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-28 15:12:30', 95);
INSERT INTO `sys_oper_log` VALUES (338, '学习/工作环境信息', 1, 'com.ruoyi.EpidemSys.controller.SurveyLearningWorkEnvController.add()', 'POST', 1, 'admin', '研发部门', '/EpidemSys/StudyLearnenv', '127.0.0.1', '内网IP', '{\"formaldehydeLevelWorkplace\":1,\"hasCarpet\":1,\"hasFabricFurniture\":1,\"locationType\":\"1\",\"params\":{},\"pm25Annual\":1,\"pollenPeakConcentration\":1,\"pollenTypes\":\"1\",\"surveyId\":2,\"ventilationQuality\":\"1\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot add or update a child row: a foreign key constraint fails (`ry-vue`.`survey_learning_work_env`, CONSTRAINT `survey_learning_work_env_ibfk_1` FOREIGN KEY (`survey_id`) REFERENCES `survey_basic_info` (`survey_id`) ON DELETE CASCADE)\r\n### The error may exist in file [E:\\RuoYi-Vue-master\\ruoyi-admin\\target\\classes\\mapper\\EpidemSys\\SurveyLearningWorkEnvMapper.xml]\r\n### The error may involve com.ruoyi.EpidemSys.mapper.SurveyLearningWorkEnvMapper.insertSurveyLearningWorkEnv-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into survey_learning_work_env          ( survey_id,             location_type,             ventilation_quality,             pm25_annual,             pollen_peak_concentration,             pollen_types,             formaldehyde_level_workplace,             has_carpet,             has_fabric_furniture )           values ( ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ? )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot add or update a child row: a foreign key constraint fails (`ry-vue`.`survey_learning_work_env`, CONSTRAINT `survey_learning_work_env_ibfk_1` FOREIGN KEY (`survey_id`) REFERENCES `survey_basic_info` (`survey_id`) ON DELETE CASCADE)\n; Cannot add or update a child row: a foreign key constraint fails (`ry-vue`.`survey_learning_work_env`, CONSTRAINT `survey_learning_work_env_ibfk_1` FOREIGN KEY (`survey_id`) REFERENCES `survey_basic_info` (`survey_id`) ON DELETE CASCADE); nested exception is java.sql.SQLIntegrityConstraintViolationException: Cannot add or update a child row: a foreign key constraint fails (`ry-vue`.`survey_learning_work_env`, CONSTRAINT `survey_learning_work_env_ibfk_1` FOREIGN KEY (`survey_id`) REFERENCES `survey_basic_info` (`survey_id`) ON DELETE CASCADE)', '2025-06-28 15:12:52', 66);
INSERT INTO `sys_oper_log` VALUES (339, '患儿基本信息', 1, 'com.ruoyi.EpidemSys.controller.SurveyBasicInfoController.add()', 'POST', 1, 'admin', '研发部门', '/EpidemSys/info', '127.0.0.1', '内网IP', '{\"address\":\"福州\",\"age\":1,\"allergyHistory\":1,\"childName\":\"李四\",\"diagnosedAsthma\":1,\"diagnosedConjunctivitis\":1,\"diagnosedDermatitis\":1,\"diagnosedRhinitis\":1,\"diagnosedUrticaria\":1,\"gender\":\"男\",\"hasAsthma\":1,\"hasConjunctivitis\":1,\"hasDermatitis\":1,\"hasRhinitis\":1,\"hasUrticaria\":1,\"height\":1,\"params\":{},\"patientId\":\"002\",\"residenceType\":\"城市\",\"residenceYears\":1,\"surveyDate\":\"2025-06-28\",\"surveyId\":1,\"weight\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-28 15:14:27', 14);
INSERT INTO `sys_oper_log` VALUES (340, '学习/工作环境信息', 1, 'com.ruoyi.EpidemSys.controller.SurveyLearningWorkEnvController.add()', 'POST', 1, 'admin', '研发部门', '/EpidemSys/StudyLearnenv', '127.0.0.1', '内网IP', '{\"formaldehydeLevelWorkplace\":1,\"hasCarpet\":1,\"hasFabricFurniture\":1,\"locationType\":\"1\",\"params\":{},\"pm25Annual\":1,\"pollenPeakConcentration\":1,\"pollenTypes\":\"1\",\"surveyId\":2,\"ventilationQuality\":\"1\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot add or update a child row: a foreign key constraint fails (`ry-vue`.`survey_learning_work_env`, CONSTRAINT `survey_learning_work_env_ibfk_1` FOREIGN KEY (`survey_id`) REFERENCES `survey_basic_info` (`survey_id`) ON DELETE CASCADE)\r\n### The error may exist in file [E:\\RuoYi-Vue-master\\ruoyi-admin\\target\\classes\\mapper\\EpidemSys\\SurveyLearningWorkEnvMapper.xml]\r\n### The error may involve com.ruoyi.EpidemSys.mapper.SurveyLearningWorkEnvMapper.insertSurveyLearningWorkEnv-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into survey_learning_work_env          ( survey_id,             location_type,             ventilation_quality,             pm25_annual,             pollen_peak_concentration,             pollen_types,             formaldehyde_level_workplace,             has_carpet,             has_fabric_furniture )           values ( ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ? )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot add or update a child row: a foreign key constraint fails (`ry-vue`.`survey_learning_work_env`, CONSTRAINT `survey_learning_work_env_ibfk_1` FOREIGN KEY (`survey_id`) REFERENCES `survey_basic_info` (`survey_id`) ON DELETE CASCADE)\n; Cannot add or update a child row: a foreign key constraint fails (`ry-vue`.`survey_learning_work_env`, CONSTRAINT `survey_learning_work_env_ibfk_1` FOREIGN KEY (`survey_id`) REFERENCES `survey_basic_info` (`survey_id`) ON DELETE CASCADE); nested exception is java.sql.SQLIntegrityConstraintViolationException: Cannot add or update a child row: a foreign key constraint fails (`ry-vue`.`survey_learning_work_env`, CONSTRAINT `survey_learning_work_env_ibfk_1` FOREIGN KEY (`survey_id`) REFERENCES `survey_basic_info` (`survey_id`) ON DELETE CASCADE)', '2025-06-28 15:14:46', 4);
INSERT INTO `sys_oper_log` VALUES (341, '医疗调查服务者标识信息', 1, 'com.ruoyi.EpidemSys.controller.SurveyProvidersController.add()', 'POST', 1, 'admin', '研发部门', '/EpidemSys/providers', '127.0.0.1', '内网IP', '{\"name\":\"1\",\"params\":{},\"surveyId\":2,\"title\":\"1\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot add or update a child row: a foreign key constraint fails (`ry-vue`.`survey_providers`, CONSTRAINT `survey_providers_ibfk_1` FOREIGN KEY (`survey_id`) REFERENCES `survey_basic_info` (`survey_id`) ON DELETE CASCADE)\r\n### The error may exist in file [E:\\RuoYi-Vue-master\\ruoyi-admin\\target\\classes\\mapper\\EpidemSys\\SurveyProvidersMapper.xml]\r\n### The error may involve com.ruoyi.EpidemSys.mapper.SurveyProvidersMapper.insertSurveyProviders-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into survey_providers          ( survey_id,             name,             title )           values ( ?,             ?,             ? )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot add or update a child row: a foreign key constraint fails (`ry-vue`.`survey_providers`, CONSTRAINT `survey_providers_ibfk_1` FOREIGN KEY (`survey_id`) REFERENCES `survey_basic_info` (`survey_id`) ON DELETE CASCADE)\n; Cannot add or update a child row: a foreign key constraint fails (`ry-vue`.`survey_providers`, CONSTRAINT `survey_providers_ibfk_1` FOREIGN KEY (`survey_id`) REFERENCES `survey_basic_info` (`survey_id`) ON DELETE CASCADE); nested exception is java.sql.SQLIntegrityConstraintViolationException: Cannot add or update a child row: a foreign key constraint fails (`ry-vue`.`survey_providers`, CONSTRAINT `survey_providers_ibfk_1` FOREIGN KEY (`survey_id`) REFERENCES `survey_basic_info` (`survey_id`) ON DELETE CASCADE)', '2025-06-28 15:16:34', 8);
INSERT INTO `sys_oper_log` VALUES (342, '环境监测方法', 1, 'com.ruoyi.EpidemSys.controller.SurveyMonitoringMethodsController.add()', 'POST', 1, 'admin', '研发部门', '/EpidemSys/methods', '127.0.0.1', '内网IP', '{\"miteAirSampling\":1,\"miteMetabolite\":1,\"miteMicroscopeCount\":1,\"mitePcr\":1,\"miteProteinDetection\":1,\"miteSensorTech\":1,\"params\":{},\"pm25DetectorModel\":\"1\",\"pollenGravitySettle\":1,\"pollenMolecularDetection\":1,\"pollenVolumeSampling\":1,\"surveyId\":2}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot add or update a child row: a foreign key constraint fails (`ry-vue`.`survey_monitoring_methods`, CONSTRAINT `survey_monitoring_methods_ibfk_1` FOREIGN KEY (`survey_id`) REFERENCES `survey_basic_info` (`survey_id`) ON DELETE CASCADE)\r\n### The error may exist in file [E:\\RuoYi-Vue-master\\ruoyi-admin\\target\\classes\\mapper\\EpidemSys\\SurveyMonitoringMethodsMapper.xml]\r\n### The error may involve com.ruoyi.EpidemSys.mapper.SurveyMonitoringMethodsMapper.insertSurveyMonitoringMethods-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into survey_monitoring_methods          ( survey_id,             pm25_detector_model,             pollen_gravity_settle,             pollen_volume_sampling,             pollen_molecular_detection,             mite_protein_detection,             mite_microscope_count,             mite_pcr,             mite_metabolite,             mite_air_sampling,             mite_sensor_tech )           values ( ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ? )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot add or update a child row: a foreign key constraint fails (`ry-vue`.`survey_monitoring_methods`, CONSTRAINT `survey_monitoring_methods_ibfk_1` FOREIGN KEY (`survey_id`) REFERENCES `survey_basic_info` (`survey_id`) ON DELETE CASCADE)\n; Cannot add or update a child row: a foreign key constraint fails (`ry-vue`.`survey_monitoring_methods`, CONSTRAINT `survey_monitoring_methods_ibfk_1` FOREIGN KEY (`survey_id`) REFERENCES `survey_basic_info` (`survey_id`) ON DELETE CASCADE); nested exception is java.sql.SQLIntegrityConstraintViolationException: Cannot add or update a child row: a foreign key constraint fails (`ry-vue`.`survey_monitoring_methods`, CONSTRAINT `survey_monitoring_methods_ibfk_1` FOREIGN KEY (`survey_id`) REF', '2025-06-28 15:18:54', 9);
INSERT INTO `sys_oper_log` VALUES (343, '家庭环境暴露信息', 1, 'com.ruoyi.EpidemSys.controller.SurveyEnvironmentExposureController.add()', 'POST', 1, 'admin', '研发部门', '/EpidemSys/exposure', '127.0.0.1', '内网IP', '{\"acFilterCleaningFreq\":\"1\",\"acModes\":\"1\",\"acTempSetting\":\"1\",\"acUsageFreq\":\"1\",\"acUsageSeason\":\"1\",\"avoidanceQuality\":\"1\",\"buildingMaterial\":\"1\",\"circadianDisruption\":1,\"cleaningFreq\":\"1\",\"cookingFuel\":\"1\",\"dustMiteLevel\":\"1\",\"exerciseDuration\":1,\"exerciseFrequency\":1,\"exerciseIntensity\":\"1\",\"formaldehydeLevel\":1,\"formaldehydeTestTime\":\"2025-06-28\",\"hasCarpet\":1,\"hasPets\":1,\"hasSoftToys\":1,\"heatingTempRange\":\"1\",\"heatingType\":\"1\",\"houseType\":\"1\",\"insomnia\":1,\"livesWithSmoker\":1,\"otherAllergens\":\"1\",\"params\":{},\"petCount\":1,\"petTypes\":\"1\",\"pm25Avg\":1,\"pollenInfo\":\"1\",\"sleepHours\":1,\"smokeExposureType\":\"1\",\"surveyId\":2,\"swimming\":1,\"usesAirPurifier\":1,\"usesVacuumCleaner\":1,\"ventilationFreq\":\"1\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot add or update a child row: a foreign key constraint fails (`ry-vue`.`survey_environment_exposure`, CONSTRAINT `survey_environment_exposure_ibfk_1` FOREIGN KEY (`survey_id`) REFERENCES `survey_basic_info` (`survey_id`) ON DELETE CASCADE)\r\n### The error may exist in file [E:\\RuoYi-Vue-master\\ruoyi-admin\\target\\classes\\mapper\\EpidemSys\\SurveyEnvironmentExposureMapper.xml]\r\n### The error may involve com.ruoyi.EpidemSys.mapper.SurveyEnvironmentExposureMapper.insertSurveyEnvironmentExposure-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into survey_environment_exposure          ( survey_id,             house_type,             building_material,             ventilation_freq,             ac_usage_season,             ac_usage_freq,             ac_temp_setting,             ac_modes,             ac_filter_cleaning_freq,             heating_type,             heating_temp_range,             has_carpet,             has_soft_toys,             pm25_avg,             pollen_info,             formaldehyde_level,             formaldehyde_test_time,             dust_mite_level,             other_allergens,             exercise_frequency,             exercise_duration,             exercise_intensity,             swimming,             sleep_hours,             insomnia,             circadian_disruption,             smoke_exposure_type,             cleaning_freq,             has_pets,             pet_types,             pet_count,             lives_with_smoker,             cooking_fuel,             uses_air_purifier,             uses_vacuum_cleaner,             avoidance_quality )           values ( ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,    ', '2025-06-28 15:19:26', 13);
INSERT INTO `sys_oper_log` VALUES (344, '其他潜在混杂因素', 1, 'com.ruoyi.EpidemSys.controller.SurveyConfoundingFactorsController.add()', 'POST', 1, 'admin', '研发部门', '/EpidemSys/factors', '127.0.0.1', '内网IP', '{\"absentDaysAllergy\":1,\"annualMedicalCost\":1,\"antibioticFreq\":\"111\",\"breastfeeding\":1,\"breastfeedingMonths\":1,\"deliveryType\":\"1\",\"dietType\":\"1\",\"farmExposure\":1,\"farmExposureMonths\":1,\"mentalStatePhq9Gad7\":\"1\",\"omega3Intake\":\"1\",\"params\":{},\"petExposureStage\":\"1\",\"stressLevelPss10\":1,\"surveyId\":2,\"vaccineOnSchedule\":1,\"vitaminD400u\":1,\"vitaminDYears\":1}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Data truncated for column \'antibiotic_freq\' at row 1\r\n### The error may exist in file [E:\\RuoYi-Vue-master\\ruoyi-admin\\target\\classes\\mapper\\EpidemSys\\SurveyConfoundingFactorsMapper.xml]\r\n### The error may involve com.ruoyi.EpidemSys.mapper.SurveyConfoundingFactorsMapper.insertSurveyConfoundingFactors-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into survey_confounding_factors          ( survey_id,             diet_type,             vitamin_d_400u,             vitamin_d_years,             omega3_intake,             stress_level_pss10,             mental_state_phq9_gad7,             vaccine_on_schedule,             antibiotic_freq,             breastfeeding,             breastfeeding_months,             delivery_type,             pet_exposure_stage,             farm_exposure,             farm_exposure_months,             absent_days_allergy,             annual_medical_cost )           values ( ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ? )\r\n### Cause: java.sql.SQLException: Data truncated for column \'antibiotic_freq\' at row 1\n; Data truncated for column \'antibiotic_freq\' at row 1; nested exception is java.sql.SQLException: Data truncated for column \'antibiotic_freq\' at row 1', '2025-06-28 15:20:17', 9);
INSERT INTO `sys_oper_log` VALUES (345, '一级亲属过敏史', 1, 'com.ruoyi.EpidemSys.controller.FamilyHistoryPrimaryController.add()', 'POST', 1, 'admin', '研发部门', '/EpidemSys/primary', '127.0.0.1', '内网IP', '{\"diseases\":\"1\",\"params\":{},\"relation\":\"1\",\"surveyId\":2}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot add or update a child row: a foreign key constraint fails (`ry-vue`.`family_history_primary`, CONSTRAINT `family_history_primary_ibfk_1` FOREIGN KEY (`survey_id`) REFERENCES `survey_basic_info` (`survey_id`) ON DELETE CASCADE)\r\n### The error may exist in file [E:\\RuoYi-Vue-master\\ruoyi-admin\\target\\classes\\mapper\\EpidemSys\\FamilyHistoryPrimaryMapper.xml]\r\n### The error may involve com.ruoyi.EpidemSys.mapper.FamilyHistoryPrimaryMapper.insertFamilyHistoryPrimary-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into family_history_primary          ( survey_id,             relation,             diseases )           values ( ?,             ?,             ? )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot add or update a child row: a foreign key constraint fails (`ry-vue`.`family_history_primary`, CONSTRAINT `family_history_primary_ibfk_1` FOREIGN KEY (`survey_id`) REFERENCES `survey_basic_info` (`survey_id`) ON DELETE CASCADE)\n; Cannot add or update a child row: a foreign key constraint fails (`ry-vue`.`family_history_primary`, CONSTRAINT `family_history_primary_ibfk_1` FOREIGN KEY (`survey_id`) REFERENCES `survey_basic_info` (`survey_id`) ON DELETE CASCADE); nested exception is java.sql.SQLIntegrityConstraintViolationException: Cannot add or update a child row: a foreign key constraint fails (`ry-vue`.`family_history_primary`, CONSTRAINT `family_history_primary_ibfk_1` FOREIGN KEY (`survey_id`) REFERENCES `survey_basic_info` (`survey_id`) ON DELETE CASCADE)', '2025-06-28 15:20:26', 8);
INSERT INTO `sys_oper_log` VALUES (346, '医疗调查服务者标识信息', 1, 'com.ruoyi.EpidemSys.controller.SurveyProvidersController.add()', 'POST', 1, 'admin', '研发部门', '/EpidemSys/providers', '127.0.0.1', '内网IP', '{\"name\":\"1\",\"params\":{},\"surveyId\":2,\"title\":\"1\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot add or update a child row: a foreign key constraint fails (`ry-vue`.`survey_providers`, CONSTRAINT `survey_providers_ibfk_1` FOREIGN KEY (`survey_id`) REFERENCES `survey_basic_info` (`survey_id`) ON DELETE CASCADE)\r\n### The error may exist in file [E:\\RuoYi-Vue-master\\ruoyi-admin\\target\\classes\\mapper\\EpidemSys\\SurveyProvidersMapper.xml]\r\n### The error may involve com.ruoyi.EpidemSys.mapper.SurveyProvidersMapper.insertSurveyProviders-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into survey_providers          ( survey_id,             name,             title )           values ( ?,             ?,             ? )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot add or update a child row: a foreign key constraint fails (`ry-vue`.`survey_providers`, CONSTRAINT `survey_providers_ibfk_1` FOREIGN KEY (`survey_id`) REFERENCES `survey_basic_info` (`survey_id`) ON DELETE CASCADE)\n; Cannot add or update a child row: a foreign key constraint fails (`ry-vue`.`survey_providers`, CONSTRAINT `survey_providers_ibfk_1` FOREIGN KEY (`survey_id`) REFERENCES `survey_basic_info` (`survey_id`) ON DELETE CASCADE); nested exception is java.sql.SQLIntegrityConstraintViolationException: Cannot add or update a child row: a foreign key constraint fails (`ry-vue`.`survey_providers`, CONSTRAINT `survey_providers_ibfk_1` FOREIGN KEY (`survey_id`) REFERENCES `survey_basic_info` (`survey_id`) ON DELETE CASCADE)', '2025-06-28 15:20:37', 4);
INSERT INTO `sys_oper_log` VALUES (347, '城乡环境监测数据', 1, 'com.ruoyi.EpidemSys.controller.SurveyAreaEnvironmentController.add()', 'POST', 1, 'admin', '研发部门', '/EpidemSys/SAenvironment', '127.0.0.1', '内网IP', '{\"params\":{},\"ruralBiomassPollution\":1,\"ruralPm25Avg\":1,\"ruralPm25Burning\":1,\"ruralPollenTypes\":\"1\",\"ruralWaterSource\":\"1\",\"surveyId\":2,\"urbanMonitorLocation\":\"1\",\"urbanPm25Avg\":1,\"urbanPm25Seasonal\":\"1\",\"urbanPollenDistribution\":\"1\",\"urbanPollenPeak\":1,\"urbanPollenTypes\":\"1\",\"urbanPollutants\":\"1\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot add or update a child row: a foreign key constraint fails (`ry-vue`.`survey_area_environment`, CONSTRAINT `survey_area_environment_ibfk_1` FOREIGN KEY (`survey_id`) REFERENCES `survey_basic_info` (`survey_id`) ON DELETE CASCADE)\r\n### The error may exist in file [E:\\RuoYi-Vue-master\\ruoyi-admin\\target\\classes\\mapper\\EpidemSys\\SurveyAreaEnvironmentMapper.xml]\r\n### The error may involve com.ruoyi.EpidemSys.mapper.SurveyAreaEnvironmentMapper.insertSurveyAreaEnvironment-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into survey_area_environment          ( survey_id,             urban_pm25_avg,             urban_pm25_seasonal,             urban_pollen_types,             urban_pollen_distribution,             urban_pollen_peak,             urban_pollutants,             urban_monitor_location,             rural_pm25_burning,             rural_pm25_avg,             rural_pollen_types,             rural_biomass_pollution,             rural_water_source )           values ( ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ? )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot add or update a child row: a foreign key constraint fails (`ry-vue`.`survey_area_environment`, CONSTRAINT `survey_area_environment_ibfk_1` FOREIGN KEY (`survey_id`) REFERENCES `survey_basic_info` (`survey_id`) ON DELETE CASCADE)\n; Cannot add or update a child row: a foreign key constraint fails (`ry-vue`.`survey_area_environment`, CONSTRAINT `survey_area_environment_ibfk_1` FOREIGN KEY (`survey_id`) REFERENCES `survey_basic_info` (`survey_id`) ON DELETE CASCADE); nested exception is java.sql.SQLIntegrityConstraintViolationException: Cannot add or update a child row: a foreign key constraint fails (`ry-vue`.`survey_area_environment`, CONS', '2025-06-28 15:20:55', 8);
INSERT INTO `sys_oper_log` VALUES (348, '二级亲属过敏史', 1, 'com.ruoyi.EpidemSys.controller.FamilyHistorySecondaryController.add()', 'POST', 1, 'admin', '研发部门', '/EpidemSys/secondary', '127.0.0.1', '内网IP', '{\"diseases\":\"1\",\"params\":{},\"relation\":\"1\",\"surveyId\":2}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot add or update a child row: a foreign key constraint fails (`ry-vue`.`family_history_secondary`, CONSTRAINT `family_history_secondary_ibfk_1` FOREIGN KEY (`survey_id`) REFERENCES `survey_basic_info` (`survey_id`) ON DELETE CASCADE)\r\n### The error may exist in file [E:\\RuoYi-Vue-master\\ruoyi-admin\\target\\classes\\mapper\\EpidemSys\\FamilyHistorySecondaryMapper.xml]\r\n### The error may involve com.ruoyi.EpidemSys.mapper.FamilyHistorySecondaryMapper.insertFamilyHistorySecondary-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into family_history_secondary          ( survey_id,             relation,             diseases )           values ( ?,             ?,             ? )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot add or update a child row: a foreign key constraint fails (`ry-vue`.`family_history_secondary`, CONSTRAINT `family_history_secondary_ibfk_1` FOREIGN KEY (`survey_id`) REFERENCES `survey_basic_info` (`survey_id`) ON DELETE CASCADE)\n; Cannot add or update a child row: a foreign key constraint fails (`ry-vue`.`family_history_secondary`, CONSTRAINT `family_history_secondary_ibfk_1` FOREIGN KEY (`survey_id`) REFERENCES `survey_basic_info` (`survey_id`) ON DELETE CASCADE); nested exception is java.sql.SQLIntegrityConstraintViolationException: Cannot add or update a child row: a foreign key constraint fails (`ry-vue`.`family_history_secondary`, CONSTRAINT `family_history_secondary_ibfk_1` FOREIGN KEY (`survey_id`) REFERENCES `survey_basic_info` (`survey_id`) ON DELETE CASCADE)', '2025-06-28 15:21:03', 5);
INSERT INTO `sys_oper_log` VALUES (349, '家族环境居住相似性', 1, 'com.ruoyi.EpidemSys.controller.SurveyFamilyEnvController.add()', 'POST', 1, 'admin', '研发部门', '/EpidemSys/SFenv', '127.0.0.1', '内网IP', '{\"params\":{},\"sharedSmokingExposure\":1,\"surveyId\":2}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot add or update a child row: a foreign key constraint fails (`ry-vue`.`survey_family_env`, CONSTRAINT `survey_family_env_ibfk_1` FOREIGN KEY (`survey_id`) REFERENCES `survey_basic_info` (`survey_id`) ON DELETE CASCADE)\r\n### The error may exist in file [E:\\RuoYi-Vue-master\\ruoyi-admin\\target\\classes\\mapper\\EpidemSys\\SurveyFamilyEnvMapper.xml]\r\n### The error may involve com.ruoyi.EpidemSys.mapper.SurveyFamilyEnvMapper.insertSurveyFamilyEnv-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into survey_family_env          ( survey_id,             shared_smoking_exposure )           values ( ?,             ? )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot add or update a child row: a foreign key constraint fails (`ry-vue`.`survey_family_env`, CONSTRAINT `survey_family_env_ibfk_1` FOREIGN KEY (`survey_id`) REFERENCES `survey_basic_info` (`survey_id`) ON DELETE CASCADE)\n; Cannot add or update a child row: a foreign key constraint fails (`ry-vue`.`survey_family_env`, CONSTRAINT `survey_family_env_ibfk_1` FOREIGN KEY (`survey_id`) REFERENCES `survey_basic_info` (`survey_id`) ON DELETE CASCADE); nested exception is java.sql.SQLIntegrityConstraintViolationException: Cannot add or update a child row: a foreign key constraint fails (`ry-vue`.`survey_family_env`, CONSTRAINT `survey_family_env_ibfk_1` FOREIGN KEY (`survey_id`) REFERENCES `survey_basic_info` (`survey_id`) ON DELETE CASCADE)', '2025-06-28 15:21:09', 5);
INSERT INTO `sys_oper_log` VALUES (350, '医疗调查服务者标识信息', 1, 'com.ruoyi.EpidemSys.controller.SurveyProvidersController.add()', 'POST', 1, 'admin', '研发部门', '/EpidemSys/providers', '127.0.0.1', '内网IP', '{\"name\":\"张\",\"params\":{},\"providerId\":3,\"surveyId\":1,\"title\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-28 15:21:39', 5);
INSERT INTO `sys_oper_log` VALUES (351, '医疗调查服务者标识信息', 1, 'com.ruoyi.EpidemSys.controller.SurveyProvidersController.add()', 'POST', 1, 'admin', '研发部门', '/EpidemSys/providers', '127.0.0.1', '内网IP', '{\"name\":\"1\",\"params\":{},\"surveyId\":2,\"title\":\"1\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot add or update a child row: a foreign key constraint fails (`ry-vue`.`survey_providers`, CONSTRAINT `survey_providers_ibfk_1` FOREIGN KEY (`survey_id`) REFERENCES `survey_basic_info` (`survey_id`) ON DELETE CASCADE)\r\n### The error may exist in file [E:\\RuoYi-Vue-master\\ruoyi-admin\\target\\classes\\mapper\\EpidemSys\\SurveyProvidersMapper.xml]\r\n### The error may involve com.ruoyi.EpidemSys.mapper.SurveyProvidersMapper.insertSurveyProviders-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into survey_providers          ( survey_id,             name,             title )           values ( ?,             ?,             ? )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot add or update a child row: a foreign key constraint fails (`ry-vue`.`survey_providers`, CONSTRAINT `survey_providers_ibfk_1` FOREIGN KEY (`survey_id`) REFERENCES `survey_basic_info` (`survey_id`) ON DELETE CASCADE)\n; Cannot add or update a child row: a foreign key constraint fails (`ry-vue`.`survey_providers`, CONSTRAINT `survey_providers_ibfk_1` FOREIGN KEY (`survey_id`) REFERENCES `survey_basic_info` (`survey_id`) ON DELETE CASCADE); nested exception is java.sql.SQLIntegrityConstraintViolationException: Cannot add or update a child row: a foreign key constraint fails (`ry-vue`.`survey_providers`, CONSTRAINT `survey_providers_ibfk_1` FOREIGN KEY (`survey_id`) REFERENCES `survey_basic_info` (`survey_id`) ON DELETE CASCADE)', '2025-06-28 15:22:06', 5);
INSERT INTO `sys_oper_log` VALUES (352, '患儿基本信息', 1, 'com.ruoyi.EpidemSys.controller.SurveyBasicInfoController.add()', 'POST', 1, 'admin', '研发部门', '/EpidemSys/info', '127.0.0.1', '内网IP', '{\"address\":\"1\",\"age\":1,\"allergyHistory\":1,\"childName\":\"1\",\"diagnosedAsthma\":1,\"diagnosedConjunctivitis\":1,\"diagnosedDermatitis\":1,\"diagnosedRhinitis\":1,\"diagnosedUrticaria\":1,\"gender\":\"1\",\"hasAsthma\":1,\"hasConjunctivitis\":1,\"hasDermatitis\":1,\"hasRhinitis\":1,\"hasUrticaria\":1,\"height\":1,\"params\":{},\"patientId\":\"003\",\"residenceType\":\"1\",\"residenceYears\":1,\"surveyDate\":\"2025-06-27\",\"weight\":1}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot add or update a child row: a foreign key constraint fails (`ry-vue`.`survey_basic_info`, CONSTRAINT `survey_basic_info_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`patient_id`) ON DELETE CASCADE)\r\n### The error may exist in file [E:\\RuoYi-Vue-master\\ruoyi-admin\\target\\classes\\mapper\\EpidemSys\\SurveyBasicInfoMapper.xml]\r\n### The error may involve com.ruoyi.EpidemSys.mapper.SurveyBasicInfoMapper.insertSurveyBasicInfo-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into survey_basic_info          ( patient_id,             survey_date,             child_name,             gender,             age,             residence_type,             residence_years,             address,             height,             weight,             allergy_history,             has_rhinitis,             has_asthma,             has_dermatitis,             has_conjunctivitis,             has_urticaria,             diagnosed_rhinitis,             diagnosed_asthma,             diagnosed_dermatitis,             diagnosed_conjunctivitis,             diagnosed_urticaria )           values ( ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ? )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot add or update a child row: a foreign key constraint fails (`ry-vue`.`survey_basic_info`, CONSTRAINT `survey_basic_info_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`patient_id`) ON DELETE CASCADE)\n; Cannot add or update a child row: a foreign key constraint fails (`ry-vue`.`survey_basic_info`, CONSTRAINT `survey_basic_info_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`patient_id`) ON DELETE ', '2025-06-28 15:22:28', 4);
INSERT INTO `sys_oper_log` VALUES (353, '患者基本信息', 1, 'com.ruoyi.ClinicalSys.controller.PatientsController.add()', 'POST', 1, 'admin', '研发部门', '/ClinicalSys/patients', '127.0.0.1', '内网IP', '{\"address\":\"福州\",\"age\":1,\"birthDate\":\"2025-06-05\",\"birthWeight\":1,\"gender\":\"男\",\"height\":1,\"lifestyle\":\"无\",\"name\":\"张一\",\"params\":{},\"patientId\":\"002\",\"visitTime\":\"2025-06-27\",\"weight\":1}', '{\"msg\":\"病人号 002 已存在\",\"code\":500}', 0, NULL, '2025-06-28 15:23:07', 3);
INSERT INTO `sys_oper_log` VALUES (354, '患者基本信息', 1, 'com.ruoyi.ClinicalSys.controller.PatientsController.add()', 'POST', 1, 'admin', '研发部门', '/ClinicalSys/patients', '127.0.0.1', '内网IP', '{\"address\":\"福州\",\"age\":1,\"birthDate\":\"2025-06-05\",\"birthWeight\":1,\"gender\":\"男\",\"height\":1,\"lifestyle\":\"无\",\"name\":\"张一\",\"params\":{},\"patientId\":\"003\",\"visitTime\":\"2025-06-27\",\"weight\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-28 15:23:12', 7);
INSERT INTO `sys_oper_log` VALUES (355, '患儿基本信息', 1, 'com.ruoyi.EpidemSys.controller.SurveyBasicInfoController.add()', 'POST', 1, 'admin', '研发部门', '/EpidemSys/info', '127.0.0.1', '内网IP', '{\"address\":\"1\",\"age\":1,\"allergyHistory\":1,\"childName\":\"1\",\"diagnosedAsthma\":1,\"diagnosedConjunctivitis\":1,\"diagnosedDermatitis\":1,\"diagnosedRhinitis\":1,\"diagnosedUrticaria\":1,\"gender\":\"1\",\"hasAsthma\":1,\"hasConjunctivitis\":1,\"hasDermatitis\":1,\"hasRhinitis\":1,\"hasUrticaria\":1,\"height\":1,\"params\":{},\"patientId\":\"003\",\"residenceType\":\"1\",\"residenceYears\":1,\"surveyDate\":\"2025-06-27\",\"surveyId\":3,\"weight\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-28 15:23:39', 6);
INSERT INTO `sys_oper_log` VALUES (356, '学习/工作环境信息', 1, 'com.ruoyi.EpidemSys.controller.SurveyLearningWorkEnvController.add()', 'POST', 1, 'admin', '研发部门', '/EpidemSys/StudyLearnenv', '127.0.0.1', '内网IP', '{\"formaldehydeLevelWorkplace\":1,\"hasCarpet\":1,\"hasFabricFurniture\":1,\"locationType\":\"1\",\"params\":{},\"pm25Annual\":1,\"pollenPeakConcentration\":1,\"pollenTypes\":\"1\",\"surveyId\":2,\"ventilationQuality\":\"1\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot add or update a child row: a foreign key constraint fails (`ry-vue`.`survey_learning_work_env`, CONSTRAINT `survey_learning_work_env_ibfk_1` FOREIGN KEY (`survey_id`) REFERENCES `survey_basic_info` (`survey_id`) ON DELETE CASCADE)\r\n### The error may exist in file [E:\\RuoYi-Vue-master\\ruoyi-admin\\target\\classes\\mapper\\EpidemSys\\SurveyLearningWorkEnvMapper.xml]\r\n### The error may involve com.ruoyi.EpidemSys.mapper.SurveyLearningWorkEnvMapper.insertSurveyLearningWorkEnv-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into survey_learning_work_env          ( survey_id,             location_type,             ventilation_quality,             pm25_annual,             pollen_peak_concentration,             pollen_types,             formaldehyde_level_workplace,             has_carpet,             has_fabric_furniture )           values ( ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ? )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot add or update a child row: a foreign key constraint fails (`ry-vue`.`survey_learning_work_env`, CONSTRAINT `survey_learning_work_env_ibfk_1` FOREIGN KEY (`survey_id`) REFERENCES `survey_basic_info` (`survey_id`) ON DELETE CASCADE)\n; Cannot add or update a child row: a foreign key constraint fails (`ry-vue`.`survey_learning_work_env`, CONSTRAINT `survey_learning_work_env_ibfk_1` FOREIGN KEY (`survey_id`) REFERENCES `survey_basic_info` (`survey_id`) ON DELETE CASCADE); nested exception is java.sql.SQLIntegrityConstraintViolationException: Cannot add or update a child row: a foreign key constraint fails (`ry-vue`.`survey_learning_work_env`, CONSTRAINT `survey_learning_work_env_ibfk_1` FOREIGN KEY (`survey_id`) REFERENCES `survey_basic_info` (`survey_id`) ON DELETE CASCADE)', '2025-06-28 15:24:34', 5);
INSERT INTO `sys_oper_log` VALUES (357, '学习/工作环境信息', 1, 'com.ruoyi.EpidemSys.controller.SurveyLearningWorkEnvController.add()', 'POST', 1, 'admin', '研发部门', '/EpidemSys/StudyLearnenv', '127.0.0.1', '内网IP', '{\"formaldehydeLevelWorkplace\":1,\"hasCarpet\":1,\"hasFabricFurniture\":1,\"learnEnvId\":4,\"locationType\":\"1\",\"params\":{},\"pm25Annual\":1,\"pollenPeakConcentration\":1,\"pollenTypes\":\"1\",\"surveyId\":3,\"ventilationQuality\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-28 15:25:23', 2);
INSERT INTO `sys_oper_log` VALUES (358, '患儿基本信息', 1, 'com.ruoyi.EpidemSys.controller.SurveyBasicInfoController.add()', 'POST', 1, 'admin', '研发部门', '/EpidemSys/info', '127.0.0.1', '内网IP', '{\"params\":{},\"patientId\":\"004\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot add or update a child row: a foreign key constraint fails (`ry-vue`.`survey_basic_info`, CONSTRAINT `survey_basic_info_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`patient_id`) ON DELETE CASCADE)\r\n### The error may exist in file [E:\\RuoYi-Vue-master\\ruoyi-admin\\target\\classes\\mapper\\EpidemSys\\SurveyBasicInfoMapper.xml]\r\n### The error may involve com.ruoyi.EpidemSys.mapper.SurveyBasicInfoMapper.insertSurveyBasicInfo-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into survey_basic_info          ( patient_id )           values ( ? )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot add or update a child row: a foreign key constraint fails (`ry-vue`.`survey_basic_info`, CONSTRAINT `survey_basic_info_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`patient_id`) ON DELETE CASCADE)\n; Cannot add or update a child row: a foreign key constraint fails (`ry-vue`.`survey_basic_info`, CONSTRAINT `survey_basic_info_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`patient_id`) ON DELETE CASCADE); nested exception is java.sql.SQLIntegrityConstraintViolationException: Cannot add or update a child row: a foreign key constraint fails (`ry-vue`.`survey_basic_info`, CONSTRAINT `survey_basic_info_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`patient_id`) ON DELETE CASCADE)', '2025-06-28 15:26:02', 4);
INSERT INTO `sys_oper_log` VALUES (359, '患儿基本信息', 1, 'com.ruoyi.EpidemSys.controller.SurveyBasicInfoController.add()', 'POST', 1, 'admin', '研发部门', '/EpidemSys/info', '127.0.0.1', '内网IP', '{\"params\":{},\"patientId\":\"001\",\"surveyId\":5}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-28 15:26:38', 4);
INSERT INTO `sys_oper_log` VALUES (360, '患者基本信息', 1, 'com.ruoyi.ClinicalSys.controller.PatientsController.add()', 'POST', 1, 'admin', '研发部门', '/ClinicalSys/patients', '127.0.0.1', '内网IP', '{\"params\":{},\"patientId\":\"004\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-28 15:27:02', 4);
INSERT INTO `sys_oper_log` VALUES (361, '患儿基本信息', 1, 'com.ruoyi.EpidemSys.controller.SurveyBasicInfoController.add()', 'POST', 1, 'admin', '研发部门', '/EpidemSys/info', '127.0.0.1', '内网IP', '{\"params\":{},\"patientId\":\"004\",\"surveyId\":6}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-28 15:27:09', 3);
INSERT INTO `sys_oper_log` VALUES (362, '学习/工作环境信息', 1, 'com.ruoyi.EpidemSys.controller.SurveyLearningWorkEnvController.add()', 'POST', 1, 'admin', '研发部门', '/EpidemSys/StudyLearnenv', '127.0.0.1', '内网IP', '{\"params\":{},\"surveyId\":4}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot add or update a child row: a foreign key constraint fails (`ry-vue`.`survey_learning_work_env`, CONSTRAINT `survey_learning_work_env_ibfk_1` FOREIGN KEY (`survey_id`) REFERENCES `survey_basic_info` (`survey_id`) ON DELETE CASCADE)\r\n### The error may exist in file [E:\\RuoYi-Vue-master\\ruoyi-admin\\target\\classes\\mapper\\EpidemSys\\SurveyLearningWorkEnvMapper.xml]\r\n### The error may involve com.ruoyi.EpidemSys.mapper.SurveyLearningWorkEnvMapper.insertSurveyLearningWorkEnv-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into survey_learning_work_env          ( survey_id )           values ( ? )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot add or update a child row: a foreign key constraint fails (`ry-vue`.`survey_learning_work_env`, CONSTRAINT `survey_learning_work_env_ibfk_1` FOREIGN KEY (`survey_id`) REFERENCES `survey_basic_info` (`survey_id`) ON DELETE CASCADE)\n; Cannot add or update a child row: a foreign key constraint fails (`ry-vue`.`survey_learning_work_env`, CONSTRAINT `survey_learning_work_env_ibfk_1` FOREIGN KEY (`survey_id`) REFERENCES `survey_basic_info` (`survey_id`) ON DELETE CASCADE); nested exception is java.sql.SQLIntegrityConstraintViolationException: Cannot add or update a child row: a foreign key constraint fails (`ry-vue`.`survey_learning_work_env`, CONSTRAINT `survey_learning_work_env_ibfk_1` FOREIGN KEY (`survey_id`) REFERENCES `survey_basic_info` (`survey_id`) ON DELETE CASCADE)', '2025-06-28 15:27:37', 4);
INSERT INTO `sys_oper_log` VALUES (363, '学习/工作环境信息', 1, 'com.ruoyi.EpidemSys.controller.SurveyLearningWorkEnvController.add()', 'POST', 1, 'admin', '研发部门', '/EpidemSys/StudyLearnenv', '127.0.0.1', '内网IP', '{\"learnEnvId\":6,\"params\":{},\"surveyId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-28 15:27:49', 5);
INSERT INTO `sys_oper_log` VALUES (364, '患儿基本信息', 3, 'com.ruoyi.EpidemSys.controller.SurveyBasicInfoController.remove()', 'DELETE', 1, 'admin', '研发部门', '/EpidemSys/info/6', '127.0.0.1', '内网IP', '[6]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-28 15:29:17', 7);
INSERT INTO `sys_oper_log` VALUES (365, '患儿基本信息', 3, 'com.ruoyi.EpidemSys.controller.SurveyBasicInfoController.remove()', 'DELETE', 1, 'admin', '研发部门', '/EpidemSys/info/1', '127.0.0.1', '内网IP', '[1]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-28 15:29:37', 5);
INSERT INTO `sys_oper_log` VALUES (366, '学习/工作环境信息', 3, 'com.ruoyi.EpidemSys.controller.SurveyLearningWorkEnvController.remove()', 'DELETE', 1, 'admin', '研发部门', '/EpidemSys/StudyLearnenv/4', '127.0.0.1', '内网IP', '[4]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-28 15:34:18', 5);
INSERT INTO `sys_oper_log` VALUES (367, '患儿基本信息', 3, 'com.ruoyi.EpidemSys.controller.SurveyBasicInfoController.remove()', 'DELETE', 1, 'admin', '研发部门', '/EpidemSys/info/5', '127.0.0.1', '内网IP', '[5]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-28 15:34:28', 5);
INSERT INTO `sys_oper_log` VALUES (368, '患儿基本信息', 3, 'com.ruoyi.EpidemSys.controller.SurveyBasicInfoController.remove()', 'DELETE', 1, 'admin', '研发部门', '/EpidemSys/info/3', '127.0.0.1', '内网IP', '[3]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-28 15:34:30', 5);

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '岗位信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'ceo', '董事长', 1, '0', 'admin', '2025-06-26 21:44:33', '', NULL, '');
INSERT INTO `sys_post` VALUES (2, 'se', '项目经理', 2, '0', 'admin', '2025-06-26 21:44:33', '', NULL, '');
INSERT INTO `sys_post` VALUES (3, 'hr', '人力资源', 3, '0', 'admin', '2025-06-26 21:44:33', '', NULL, '');
INSERT INTO `sys_post` VALUES (4, 'user', '普通员工', 4, '0', 'admin', '2025-06-26 21:44:33', '', NULL, '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '部门树选择项是否关联显示',
  `status` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '角色信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', 'admin', '2025-06-26 21:44:33', '', NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (2, '普通角色', 'common', 2, '2', 1, 1, '0', '0', 'admin', '2025-06-26 21:44:33', '', NULL, '普通角色');

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `dept_id` bigint NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '角色和部门关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES (2, 100);
INSERT INTO `sys_role_dept` VALUES (2, 101);
INSERT INTO `sys_role_dept` VALUES (2, 105);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `menu_id` bigint NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (2, 1);
INSERT INTO `sys_role_menu` VALUES (2, 2);
INSERT INTO `sys_role_menu` VALUES (2, 3);
INSERT INTO `sys_role_menu` VALUES (2, 4);
INSERT INTO `sys_role_menu` VALUES (2, 100);
INSERT INTO `sys_role_menu` VALUES (2, 101);
INSERT INTO `sys_role_menu` VALUES (2, 102);
INSERT INTO `sys_role_menu` VALUES (2, 103);
INSERT INTO `sys_role_menu` VALUES (2, 104);
INSERT INTO `sys_role_menu` VALUES (2, 105);
INSERT INTO `sys_role_menu` VALUES (2, 106);
INSERT INTO `sys_role_menu` VALUES (2, 107);
INSERT INTO `sys_role_menu` VALUES (2, 108);
INSERT INTO `sys_role_menu` VALUES (2, 109);
INSERT INTO `sys_role_menu` VALUES (2, 110);
INSERT INTO `sys_role_menu` VALUES (2, 111);
INSERT INTO `sys_role_menu` VALUES (2, 112);
INSERT INTO `sys_role_menu` VALUES (2, 113);
INSERT INTO `sys_role_menu` VALUES (2, 114);
INSERT INTO `sys_role_menu` VALUES (2, 115);
INSERT INTO `sys_role_menu` VALUES (2, 116);
INSERT INTO `sys_role_menu` VALUES (2, 117);
INSERT INTO `sys_role_menu` VALUES (2, 500);
INSERT INTO `sys_role_menu` VALUES (2, 501);
INSERT INTO `sys_role_menu` VALUES (2, 1000);
INSERT INTO `sys_role_menu` VALUES (2, 1001);
INSERT INTO `sys_role_menu` VALUES (2, 1002);
INSERT INTO `sys_role_menu` VALUES (2, 1003);
INSERT INTO `sys_role_menu` VALUES (2, 1004);
INSERT INTO `sys_role_menu` VALUES (2, 1005);
INSERT INTO `sys_role_menu` VALUES (2, 1006);
INSERT INTO `sys_role_menu` VALUES (2, 1007);
INSERT INTO `sys_role_menu` VALUES (2, 1008);
INSERT INTO `sys_role_menu` VALUES (2, 1009);
INSERT INTO `sys_role_menu` VALUES (2, 1010);
INSERT INTO `sys_role_menu` VALUES (2, 1011);
INSERT INTO `sys_role_menu` VALUES (2, 1012);
INSERT INTO `sys_role_menu` VALUES (2, 1013);
INSERT INTO `sys_role_menu` VALUES (2, 1014);
INSERT INTO `sys_role_menu` VALUES (2, 1015);
INSERT INTO `sys_role_menu` VALUES (2, 1016);
INSERT INTO `sys_role_menu` VALUES (2, 1017);
INSERT INTO `sys_role_menu` VALUES (2, 1018);
INSERT INTO `sys_role_menu` VALUES (2, 1019);
INSERT INTO `sys_role_menu` VALUES (2, 1020);
INSERT INTO `sys_role_menu` VALUES (2, 1021);
INSERT INTO `sys_role_menu` VALUES (2, 1022);
INSERT INTO `sys_role_menu` VALUES (2, 1023);
INSERT INTO `sys_role_menu` VALUES (2, 1024);
INSERT INTO `sys_role_menu` VALUES (2, 1025);
INSERT INTO `sys_role_menu` VALUES (2, 1026);
INSERT INTO `sys_role_menu` VALUES (2, 1027);
INSERT INTO `sys_role_menu` VALUES (2, 1028);
INSERT INTO `sys_role_menu` VALUES (2, 1029);
INSERT INTO `sys_role_menu` VALUES (2, 1030);
INSERT INTO `sys_role_menu` VALUES (2, 1031);
INSERT INTO `sys_role_menu` VALUES (2, 1032);
INSERT INTO `sys_role_menu` VALUES (2, 1033);
INSERT INTO `sys_role_menu` VALUES (2, 1034);
INSERT INTO `sys_role_menu` VALUES (2, 1035);
INSERT INTO `sys_role_menu` VALUES (2, 1036);
INSERT INTO `sys_role_menu` VALUES (2, 1037);
INSERT INTO `sys_role_menu` VALUES (2, 1038);
INSERT INTO `sys_role_menu` VALUES (2, 1039);
INSERT INTO `sys_role_menu` VALUES (2, 1040);
INSERT INTO `sys_role_menu` VALUES (2, 1041);
INSERT INTO `sys_role_menu` VALUES (2, 1042);
INSERT INTO `sys_role_menu` VALUES (2, 1043);
INSERT INTO `sys_role_menu` VALUES (2, 1044);
INSERT INTO `sys_role_menu` VALUES (2, 1045);
INSERT INTO `sys_role_menu` VALUES (2, 1046);
INSERT INTO `sys_role_menu` VALUES (2, 1047);
INSERT INTO `sys_role_menu` VALUES (2, 1048);
INSERT INTO `sys_role_menu` VALUES (2, 1049);
INSERT INTO `sys_role_menu` VALUES (2, 1050);
INSERT INTO `sys_role_menu` VALUES (2, 1051);
INSERT INTO `sys_role_menu` VALUES (2, 1052);
INSERT INTO `sys_role_menu` VALUES (2, 1053);
INSERT INTO `sys_role_menu` VALUES (2, 1054);
INSERT INTO `sys_role_menu` VALUES (2, 1055);
INSERT INTO `sys_role_menu` VALUES (2, 1056);
INSERT INTO `sys_role_menu` VALUES (2, 1057);
INSERT INTO `sys_role_menu` VALUES (2, 1058);
INSERT INTO `sys_role_menu` VALUES (2, 1059);
INSERT INTO `sys_role_menu` VALUES (2, 1060);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint NULL DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '密码',
  `status` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '0' COMMENT '账号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime NULL DEFAULT NULL COMMENT '最后登录时间',
  `pwd_update_date` datetime NULL DEFAULT NULL COMMENT '密码最后更新时间',
  `create_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 103, 'admin', '若依', '00', 'ry@163.com', '15888888888', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2025-06-28 14:18:48', '2025-06-26 21:44:33', 'admin', '2025-06-26 21:44:33', '', '2025-06-28 14:18:48', '管理员');
INSERT INTO `sys_user` VALUES (2, 105, 'ry', '若依', '00', 'ry@qq.com', '15666666666', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2025-06-26 21:44:33', '2025-06-26 21:44:33', 'admin', '2025-06-26 21:44:33', '', NULL, '测试员');

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `post_id` bigint NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (1, 1);
INSERT INTO `sys_user_post` VALUES (2, 2);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '用户和角色关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (2, 2);

SET FOREIGN_KEY_CHECKS = 1;
