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

 Date: 27/06/2025 21:21:32
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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

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
INSERT INTO `contacts` VALUES (3, '001', '1234', '1234', '无');

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
INSERT INTO `diagnoses` VALUES (1, '001', '1', '1', '2025-06-27');

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
INSERT INTO `expenses` VALUES (2, '001', NULL, 12.00);

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

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
  CONSTRAINT `family_history_primary_ibfk_1` FOREIGN KEY (`survey_id`) REFERENCES `survey_basic_info` (`survey_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

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
  CONSTRAINT `family_history_secondary_ibfk_1` FOREIGN KEY (`survey_id`) REFERENCES `survey_basic_info` (`survey_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of feno_tests
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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of followup_notes
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
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '代码生成业务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES (11, 'clinical_other_treatments', '其他辅助治疗', NULL, NULL, 'ClinicalOtherTreatments', 'crud', 'element-ui', 'com.ruoyi.ClinicalSys', 'ClinicalSys', 'treatments', '其他辅助治疗', 'ruoyi', '0', '/', '{\"parentMenuId\":2061}', 'admin', '2025-06-27 14:25:10', '', '2025-06-27 14:32:01', NULL);
INSERT INTO `gen_table` VALUES (12, 'contacts', '联系人', '', '', 'Contacts', 'crud', 'element-ui', 'com.ruoyi.ClinicalSys', 'ClinicalSys', 'contacts', '联系人', 'ruoyi', '0', '/', '{\"parentMenuId\":2061}', 'admin', '2025-06-27 14:25:10', '', '2025-06-27 19:28:00', NULL);
INSERT INTO `gen_table` VALUES (13, 'diagnoses', '疾病诊断', NULL, NULL, 'Diagnoses', 'crud', 'element-ui', 'com.ruoyi.ClinicalSys', 'ClinicalSys', 'diagnoses', '疾病诊断', 'ruoyi', '0', '/', '{\"parentMenuId\":2061}', 'admin', '2025-06-27 14:25:10', '', '2025-06-27 14:32:11', NULL);
INSERT INTO `gen_table` VALUES (14, 'expenses', '费用', NULL, NULL, 'Expenses', 'crud', 'element-ui', 'com.ruoyi.ClinicalSys', 'ClinicalSys', 'expenses', '费用', 'ruoyi', '0', '/', '{\"parentMenuId\":2061}', 'admin', '2025-06-27 14:25:10', '', '2025-06-27 20:15:51', NULL);
INSERT INTO `gen_table` VALUES (15, 'family_history', '家族史', NULL, NULL, 'FamilyHistory', 'crud', 'element-ui', 'com.ruoyi.ClinicalSys', 'ClinicalSys', 'familyhistory', '家族史', 'ruoyi', '0', '/', '{\"parentMenuId\":2061}', 'admin', '2025-06-27 14:25:10', '', '2025-06-27 20:32:51', NULL);
INSERT INTO `gen_table` VALUES (16, 'feno_tests', '呼出气一氧化氮检测', NULL, NULL, 'FenoTests', 'crud', 'element-ui', 'com.ruoyi.ClinicalSys', 'ClinicalSys', 'tests', '呼出气一氧化氮检测', 'ruoyi', '0', '/', '{\"parentMenuId\":2061}', 'admin', '2025-06-27 14:25:10', '', '2025-06-27 20:16:06', NULL);
INSERT INTO `gen_table` VALUES (17, 'followup_notes', '随访信息', NULL, NULL, 'FollowupNotes', 'crud', 'element-ui', 'com.ruoyi.ClinicalSys', 'ClinicalSys', 'notes', '随访信息', 'ruoyi', '0', '/', '{\"parentMenuId\":2061}', 'admin', '2025-06-27 14:25:10', '', '2025-06-27 20:16:11', NULL);
INSERT INTO `gen_table` VALUES (18, 'history', '既往史', NULL, NULL, 'History', 'crud', 'element-ui', 'com.ruoyi.ClinicalSys', 'ClinicalSys', 'history', '既往史', 'ruoyi', '0', '/', '{\"parentMenuId\":2061}', 'admin', '2025-06-27 14:25:10', '', '2025-06-27 20:16:17', NULL);
INSERT INTO `gen_table` VALUES (19, 'imaging', '影像学检查', NULL, NULL, 'Imaging', 'crud', 'element-ui', 'com.ruoyi.ClinicalSys', 'ClinicalSys', 'imaging', '影像学检查', 'ruoyi', '0', '/', '{\"parentMenuId\":2061}', 'admin', '2025-06-27 14:25:10', '', '2025-06-27 20:16:23', NULL);
INSERT INTO `gen_table` VALUES (20, 'insurance_info', '医保情况', NULL, NULL, 'InsuranceInfo', 'crud', 'element-ui', 'com.ruoyi.ClinicalSys', 'ClinicalSys', 'info', '医保情况', 'ruoyi', '0', '/', '{\"parentMenuId\":2061}', 'admin', '2025-06-27 14:25:10', '', '2025-06-27 14:48:48', NULL);
INSERT INTO `gen_table` VALUES (21, 'lab_tests', '实验室检查', NULL, NULL, 'LabTests', 'crud', 'element-ui', 'com.ruoyi.ClinicalSys', 'ClinicalSys', 'labtests', '实验室检查', 'ruoyi', '0', '/', '{\"parentMenuId\":2061}', 'admin', '2025-06-27 14:25:10', '', '2025-06-27 20:33:02', NULL);
INSERT INTO `gen_table` VALUES (22, 'lung_tests', '肺功能检查', NULL, NULL, 'LungTests', 'crud', 'element-ui', 'com.ruoyi.ClinicalSys', 'ClinicalSys', 'lungtests', '肺功能检查', 'ruoyi', '0', '/', '{\"parentMenuId\":2061}', 'admin', '2025-06-27 14:25:10', '', '2025-06-27 20:33:08', NULL);
INSERT INTO `gen_table` VALUES (23, 'medical_orgs', '医疗服务机构标识信息', NULL, NULL, 'MedicalOrgs', 'crud', 'element-ui', 'com.ruoyi.ClinicalSys', 'ClinicalSys', 'orgs', '医疗服务机构标识信息', 'ruoyi', '0', '/', '{\"parentMenuId\":2061}', 'admin', '2025-06-27 14:25:10', '', '2025-06-27 15:03:52', NULL);
INSERT INTO `gen_table` VALUES (24, 'medications', '用药', NULL, NULL, 'Medications', 'crud', 'element-ui', 'com.ruoyi.ClinicalSys', 'ClinicalSys', 'medications', '用药', 'ruoyi', '0', '/', '{\"parentMenuId\":2061}', 'admin', '2025-06-27 14:25:10', '', '2025-06-27 15:08:58', NULL);
INSERT INTO `gen_table` VALUES (25, 'medications_history', '既往用药史', NULL, NULL, 'MedicationsHistory', 'crud', 'element-ui', 'com.ruoyi.ClinicalSys', 'ClinicalSys', 'medicationshistory', '既往用药史', 'ruoyi', '0', '/', '{\"parentMenuId\":2061}', 'admin', '2025-06-27 14:25:10', '', '2025-06-27 20:33:20', NULL);
INSERT INTO `gen_table` VALUES (26, 'patients', '患者基本信息', NULL, NULL, 'Patients', 'crud', 'element-ui', 'com.ruoyi.ClinicalSys', 'ClinicalSys', 'patients', '患者基本信息', 'ruoyi', '0', '/', '{\"parentMenuId\":2061}', 'admin', '2025-06-27 14:25:10', '', '2025-06-27 14:56:28', NULL);
INSERT INTO `gen_table` VALUES (27, 'providers', '医疗服务者标识信息', NULL, NULL, 'Providers', 'crud', 'element-ui', 'com.ruoyi.ClinicalSys', 'ClinicalSys', 'providers', '医疗服务者标识信息', 'ruoyi', '0', '/', '{\"parentMenuId\":2061}', 'admin', '2025-06-27 14:25:10', '', '2025-06-27 14:58:55', NULL);
INSERT INTO `gen_table` VALUES (28, 'symptoms', '症状及体征', NULL, NULL, 'Symptoms', 'crud', 'element-ui', 'com.ruoyi.ClinicalSys', 'ClinicalSys', 'symptoms', '症状及体征', 'ruoyi', '0', '/', '{\"parentMenuId\":2061}', 'admin', '2025-06-27 14:25:10', '', '2025-06-27 15:53:25', NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 232 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES (129, 11, 'treatment_id', '其他治疗号', 'int', 'Long', 'treatmentId', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2025-06-27 14:25:10', '', '2025-06-27 14:32:01');
INSERT INTO `gen_table_column` VALUES (130, 11, 'patient_id', '病人号', 'varchar(20)', 'String', 'patientId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2025-06-27 14:25:10', '', '2025-06-27 14:32:01');
INSERT INTO `gen_table_column` VALUES (131, 11, 'treatment_name', '治疗方法', 'varchar(100)', 'String', 'treatmentName', '0', '0', '0', '1', '1', '1', '0', 'LIKE', 'input', '', 3, 'admin', '2025-06-27 14:25:10', '', '2025-06-27 14:32:01');
INSERT INTO `gen_table_column` VALUES (132, 11, 'start_time', '开始时间', 'date', 'Date', 'startTime', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'datetime', '', 4, 'admin', '2025-06-27 14:25:10', '', '2025-06-27 14:32:01');
INSERT INTO `gen_table_column` VALUES (133, 11, 'end_time', '结束时间', 'date', 'Date', 'endTime', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'datetime', '', 5, 'admin', '2025-06-27 14:25:10', '', '2025-06-27 14:32:01');
INSERT INTO `gen_table_column` VALUES (134, 11, 'note', '注意事项', 'text', 'String', 'note', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'textarea', '', 6, 'admin', '2025-06-27 14:25:10', '', '2025-06-27 14:32:01');
INSERT INTO `gen_table_column` VALUES (135, 12, 'contact_id', '联系人号', 'int', 'Long', 'contactId', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2025-06-27 14:25:10', '', '2025-06-27 19:28:00');
INSERT INTO `gen_table_column` VALUES (136, 12, 'patient_id', '病人号', 'varchar(20)', 'String', 'patientId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2025-06-27 14:25:10', '', '2025-06-27 19:28:00');
INSERT INTO `gen_table_column` VALUES (137, 12, 'phone', '联系方式', 'varchar(50)', 'String', 'phone', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 3, 'admin', '2025-06-27 14:25:10', '', '2025-06-27 19:28:00');
INSERT INTO `gen_table_column` VALUES (138, 12, 'emergency_contact', '紧急联系方式', 'varchar(50)', 'String', 'emergencyContact', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 4, 'admin', '2025-06-27 14:25:10', '', '2025-06-27 19:28:00');
INSERT INTO `gen_table_column` VALUES (139, 12, 'relationship', '关系', 'varchar(20)', 'String', 'relationship', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 5, 'admin', '2025-06-27 14:25:10', '', '2025-06-27 19:28:00');
INSERT INTO `gen_table_column` VALUES (140, 13, 'diagnosis_id', '诊断号', 'int', 'Long', 'diagnosisId', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2025-06-27 14:25:10', '', '2025-06-27 14:32:11');
INSERT INTO `gen_table_column` VALUES (141, 13, 'patient_id', '病人号', 'varchar(20)', 'String', 'patientId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2025-06-27 14:25:10', '', '2025-06-27 14:32:11');
INSERT INTO `gen_table_column` VALUES (142, 13, 'disease_name', '疾病名称', 'varchar(100)', 'String', 'diseaseName', '0', '0', '0', '1', '1', '1', '0', 'LIKE', 'input', '', 3, 'admin', '2025-06-27 14:25:10', '', '2025-06-27 14:32:11');
INSERT INTO `gen_table_column` VALUES (143, 13, 'severity', '严重程度', 'varchar(50)', 'String', 'severity', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 4, 'admin', '2025-06-27 14:25:10', '', '2025-06-27 14:32:11');
INSERT INTO `gen_table_column` VALUES (144, 13, 'diagnosis_time', '诊断时间', 'date', 'Date', 'diagnosisTime', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'datetime', '', 5, 'admin', '2025-06-27 14:25:10', '', '2025-06-27 14:32:11');
INSERT INTO `gen_table_column` VALUES (145, 14, 'expense_id', '费用号', 'int', 'Long', 'expenseId', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2025-06-27 14:25:10', '', '2025-06-27 20:15:51');
INSERT INTO `gen_table_column` VALUES (146, 14, 'patient_id', '病人号', 'varchar(20)', 'String', 'patientId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2025-06-27 14:25:10', '', '2025-06-27 20:15:51');
INSERT INTO `gen_table_column` VALUES (147, 14, 'expense_type', '费用类别', 'varchar(100)', 'String', 'expenseType', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 3, 'admin', '2025-06-27 14:25:10', '', '2025-06-27 20:15:51');
INSERT INTO `gen_table_column` VALUES (148, 14, 'amount', '费用', 'decimal(10,2)', 'BigDecimal', 'amount', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 4, 'admin', '2025-06-27 14:25:10', '', '2025-06-27 20:15:51');
INSERT INTO `gen_table_column` VALUES (149, 15, 'fam_id', '家族号', 'int', 'Long', 'famId', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2025-06-27 14:25:10', '', '2025-06-27 20:32:51');
INSERT INTO `gen_table_column` VALUES (150, 15, 'patient_id', '病人号', 'varchar(20)', 'String', 'patientId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2025-06-27 14:25:10', '', '2025-06-27 20:32:51');
INSERT INTO `gen_table_column` VALUES (151, 15, 'relative_relation', '相对关系', 'varchar(50)', 'String', 'relativeRelation', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 3, 'admin', '2025-06-27 14:25:10', '', '2025-06-27 20:32:51');
INSERT INTO `gen_table_column` VALUES (152, 15, 'allergy_disease', '过敏性疾病', 'text', 'String', 'allergyDisease', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'textarea', '', 4, 'admin', '2025-06-27 14:25:10', '', '2025-06-27 20:32:51');
INSERT INTO `gen_table_column` VALUES (153, 16, 'feno_id', '检测号', 'int', 'Long', 'fenoId', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2025-06-27 14:25:10', '', '2025-06-27 20:16:06');
INSERT INTO `gen_table_column` VALUES (154, 16, 'patient_id', '病人号', 'varchar(20)', 'String', 'patientId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2025-06-27 14:25:10', '', '2025-06-27 20:16:06');
INSERT INTO `gen_table_column` VALUES (155, 16, 'test_name', '检查名称', 'varchar(100)', 'String', 'testName', '0', '0', '0', '1', '1', '1', '0', 'LIKE', 'input', '', 3, 'admin', '2025-06-27 14:25:10', '', '2025-06-27 20:16:06');
INSERT INTO `gen_table_column` VALUES (156, 16, 'test_date', '检查日期', 'date', 'Date', 'testDate', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'datetime', '', 4, 'admin', '2025-06-27 14:25:10', '', '2025-06-27 20:16:06');
INSERT INTO `gen_table_column` VALUES (157, 16, 'test_result', '检测值', 'text', 'String', 'testResult', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'textarea', '', 5, 'admin', '2025-06-27 14:25:10', '', '2025-06-27 20:16:06');
INSERT INTO `gen_table_column` VALUES (158, 17, 'followup_id', '随访号', 'int', 'Long', 'followupId', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2025-06-27 14:25:10', '', '2025-06-27 20:16:11');
INSERT INTO `gen_table_column` VALUES (159, 17, 'patient_id', '病人号', 'varchar(20)', 'String', 'patientId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2025-06-27 14:25:10', '', '2025-06-27 20:16:11');
INSERT INTO `gen_table_column` VALUES (160, 17, 'symptom_improvement', '过敏症状改善情况', 'text', 'String', 'symptomImprovement', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'textarea', '', 3, 'admin', '2025-06-27 14:25:10', '', '2025-06-27 20:16:11');
INSERT INTO `gen_table_column` VALUES (161, 17, 'physical_development', '身体发育情况', 'text', 'String', 'physicalDevelopment', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'textarea', '', 4, 'admin', '2025-06-27 14:25:10', '', '2025-06-27 20:16:11');
INSERT INTO `gen_table_column` VALUES (162, 17, 'adverse_reactions', '药物不良反应', 'text', 'String', 'adverseReactions', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'textarea', '', 5, 'admin', '2025-06-27 14:25:10', '', '2025-06-27 20:16:11');
INSERT INTO `gen_table_column` VALUES (163, 17, 'reaction_management', '不良反应处理方法', 'text', 'String', 'reactionManagement', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'textarea', '', 6, 'admin', '2025-06-27 14:25:10', '', '2025-06-27 20:16:11');
INSERT INTO `gen_table_column` VALUES (164, 18, 'history_id', '既往史名', 'int', 'Long', 'historyId', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2025-06-27 14:25:10', '', '2025-06-27 20:16:17');
INSERT INTO `gen_table_column` VALUES (165, 18, 'patient_id', '病人号', 'varchar(20)', 'String', 'patientId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2025-06-27 14:25:10', '', '2025-06-27 20:16:17');
INSERT INTO `gen_table_column` VALUES (166, 18, 'food_allergy_history', '食物过敏源阳性史', 'text', 'String', 'foodAllergyHistory', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'textarea', '', 3, 'admin', '2025-06-27 14:25:10', '', '2025-06-27 20:16:17');
INSERT INTO `gen_table_column` VALUES (167, 18, 'allergen_exposure', '吸入过敏源阳性史', 'text', 'String', 'allergenExposure', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'textarea', '', 4, 'admin', '2025-06-27 14:25:10', '', '2025-06-27 20:16:17');
INSERT INTO `gen_table_column` VALUES (168, 18, 'past_disease_history', '过敏性疾病史', 'text', 'String', 'pastDiseaseHistory', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'textarea', '', 5, 'admin', '2025-06-27 14:25:10', '', '2025-06-27 20:16:17');
INSERT INTO `gen_table_column` VALUES (169, 19, 'imaging_id', '影像学号', 'int', 'Long', 'imagingId', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2025-06-27 14:25:10', '', '2025-06-27 20:16:23');
INSERT INTO `gen_table_column` VALUES (170, 19, 'patient_id', '病人号', 'varchar(20)', 'String', 'patientId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2025-06-27 14:25:10', '', '2025-06-27 20:16:23');
INSERT INTO `gen_table_column` VALUES (171, 19, 'imaging_type', '影像学检查名称', 'varchar(100)', 'String', 'imagingType', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 3, 'admin', '2025-06-27 14:25:10', '', '2025-06-27 20:16:23');
INSERT INTO `gen_table_column` VALUES (172, 19, 'imaging_date', '检查时期', 'date', 'Date', 'imagingDate', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'datetime', '', 4, 'admin', '2025-06-27 14:25:10', '', '2025-06-27 20:16:23');
INSERT INTO `gen_table_column` VALUES (173, 19, 'report', '检查报告', 'text', 'String', 'report', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'textarea', '', 5, 'admin', '2025-06-27 14:25:10', '', '2025-06-27 20:16:23');
INSERT INTO `gen_table_column` VALUES (174, 20, 'insurance_id', '医保情况号', 'int', 'Long', 'insuranceId', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2025-06-27 14:25:10', '', '2025-06-27 14:48:48');
INSERT INTO `gen_table_column` VALUES (175, 20, 'patient_id', '病人号', 'varchar(20)', 'String', 'patientId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2025-06-27 14:25:10', '', '2025-06-27 14:48:48');
INSERT INTO `gen_table_column` VALUES (176, 20, 'insurance_type', '医保类型', 'varchar(50)', 'String', 'insuranceType', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 3, 'admin', '2025-06-27 14:25:10', '', '2025-06-27 14:48:48');
INSERT INTO `gen_table_column` VALUES (177, 20, 'insurance_number', '医保号', 'varchar(50)', 'String', 'insuranceNumber', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 4, 'admin', '2025-06-27 14:25:10', '', '2025-06-27 14:48:48');
INSERT INTO `gen_table_column` VALUES (178, 21, 'test_id', '实验室检查号', 'int', 'Long', 'testId', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2025-06-27 14:25:10', '', '2025-06-27 20:33:02');
INSERT INTO `gen_table_column` VALUES (179, 21, 'patient_id', '病人号', 'varchar(20)', 'String', 'patientId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2025-06-27 14:25:10', '', '2025-06-27 20:33:02');
INSERT INTO `gen_table_column` VALUES (180, 21, 'test_name', '检查项目名称', 'varchar(100)', 'String', 'testName', '0', '0', '0', '1', '1', '1', '0', 'LIKE', 'input', '', 3, 'admin', '2025-06-27 14:25:10', '', '2025-06-27 20:33:02');
INSERT INTO `gen_table_column` VALUES (181, 21, 'test_date', '检查日期', 'date', 'Date', 'testDate', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'datetime', '', 4, 'admin', '2025-06-27 14:25:10', '', '2025-06-27 20:33:02');
INSERT INTO `gen_table_column` VALUES (182, 21, 'test_result', '检查值', 'text', 'String', 'testResult', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'textarea', '', 5, 'admin', '2025-06-27 14:25:10', '', '2025-06-27 20:33:02');
INSERT INTO `gen_table_column` VALUES (183, 22, 'lung_id', '肺功能检查号', 'int', 'Long', 'lungId', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2025-06-27 14:25:10', '', '2025-06-27 20:33:08');
INSERT INTO `gen_table_column` VALUES (184, 22, 'patient_id', '病人号', 'varchar(20)', 'String', 'patientId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2025-06-27 14:25:10', '', '2025-06-27 20:33:08');
INSERT INTO `gen_table_column` VALUES (185, 22, 'test_name', '检查名称', 'varchar(100)', 'String', 'testName', '0', '0', '0', '1', '1', '1', '0', 'LIKE', 'input', '', 3, 'admin', '2025-06-27 14:25:10', '', '2025-06-27 20:33:08');
INSERT INTO `gen_table_column` VALUES (186, 22, 'test_date', '检查日期', 'date', 'Date', 'testDate', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'datetime', '', 4, 'admin', '2025-06-27 14:25:10', '', '2025-06-27 20:33:08');
INSERT INTO `gen_table_column` VALUES (187, 22, 'test_result', '检查值', 'text', 'String', 'testResult', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'textarea', '', 5, 'admin', '2025-06-27 14:25:10', '', '2025-06-27 20:33:08');
INSERT INTO `gen_table_column` VALUES (188, 23, 'org_id', '机构号', 'int', 'Long', 'orgId', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2025-06-27 14:25:10', '', '2025-06-27 15:03:52');
INSERT INTO `gen_table_column` VALUES (189, 23, 'patient_id', '病人号', 'varchar(20)', 'String', 'patientId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2025-06-27 14:25:10', '', '2025-06-27 15:03:52');
INSERT INTO `gen_table_column` VALUES (190, 23, 'hospital_name', '机构名称', 'varchar(100)', 'String', 'hospitalName', '0', '0', '0', '1', '1', '1', '0', 'LIKE', 'input', '', 3, 'admin', '2025-06-27 14:25:10', '', '2025-06-27 15:03:52');
INSERT INTO `gen_table_column` VALUES (191, 23, 'department_name', '机构地址', 'varchar(100)', 'String', 'departmentName', '0', '0', '0', '1', '1', '1', '0', 'LIKE', 'input', '', 4, 'admin', '2025-06-27 14:25:10', '', '2025-06-27 15:03:52');
INSERT INTO `gen_table_column` VALUES (192, 24, 'med_id', '用药号', 'int', 'Long', 'medId', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2025-06-27 14:25:10', '', '2025-06-27 15:08:58');
INSERT INTO `gen_table_column` VALUES (193, 24, 'patient_id', '病人号', 'varchar(20)', 'String', 'patientId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2025-06-27 14:25:10', '', '2025-06-27 15:08:58');
INSERT INTO `gen_table_column` VALUES (194, 24, 'medication_name', '药物名称', 'varchar(100)', 'String', 'medicationName', '0', '0', '0', '1', '1', '1', '0', 'LIKE', 'input', '', 3, 'admin', '2025-06-27 14:25:10', '', '2025-06-27 15:08:58');
INSERT INTO `gen_table_column` VALUES (195, 24, 'medication_specification', '药物规格', 'varchar(100)', 'String', 'medicationSpecification', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 4, 'admin', '2025-06-27 14:25:10', '', '2025-06-27 15:08:58');
INSERT INTO `gen_table_column` VALUES (196, 24, 'single_dose', '一次药物使用剂量', 'varchar(50)', 'String', 'singleDose', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 5, 'admin', '2025-06-27 14:25:10', '', '2025-06-27 15:08:58');
INSERT INTO `gen_table_column` VALUES (197, 24, 'usage_days', '药物使用天数', 'int', 'Long', 'usageDays', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 6, 'admin', '2025-06-27 14:25:10', '', '2025-06-27 15:08:58');
INSERT INTO `gen_table_column` VALUES (198, 24, 'frequency', '给药频率', 'varchar(50)', 'String', 'frequency', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 7, 'admin', '2025-06-27 14:25:10', '', '2025-06-27 15:08:58');
INSERT INTO `gen_table_column` VALUES (199, 24, 'administration_route', '给药途径', 'varchar(50)', 'String', 'administrationRoute', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 8, 'admin', '2025-06-27 14:25:10', '', '2025-06-27 15:08:58');
INSERT INTO `gen_table_column` VALUES (200, 24, 'administration_site', '给药部位', 'varchar(100)', 'String', 'administrationSite', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 9, 'admin', '2025-06-27 14:25:10', '', '2025-06-27 15:08:58');
INSERT INTO `gen_table_column` VALUES (201, 24, 'treatment_start', '治疗开始时间', 'date', 'Date', 'treatmentStart', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'datetime', '', 10, 'admin', '2025-06-27 14:25:10', '', '2025-06-27 15:08:58');
INSERT INTO `gen_table_column` VALUES (202, 24, 'treatment_end', '治疗终止时间', 'date', 'Date', 'treatmentEnd', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'datetime', '', 11, 'admin', '2025-06-27 14:25:10', '', '2025-06-27 15:08:58');
INSERT INTO `gen_table_column` VALUES (203, 24, 'medication_guidance', '用药指导', 'text', 'String', 'medicationGuidance', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'textarea', '', 12, 'admin', '2025-06-27 14:25:10', '', '2025-06-27 15:08:58');
INSERT INTO `gen_table_column` VALUES (204, 24, 'precautions', '用药注意事项', 'text', 'String', 'precautions', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'textarea', '', 13, 'admin', '2025-06-27 14:25:10', '', '2025-06-27 15:08:58');
INSERT INTO `gen_table_column` VALUES (205, 25, 'med_his_id', '既往用药号', 'int', 'Long', 'medHisId', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2025-06-27 14:25:10', '', '2025-06-27 20:33:20');
INSERT INTO `gen_table_column` VALUES (206, 25, 'patient_id', '病人号', 'varchar(20)', 'String', 'patientId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2025-06-27 14:25:10', '', '2025-06-27 20:33:20');
INSERT INTO `gen_table_column` VALUES (207, 25, 'medication_name', '药物名称', 'varchar(100)', 'String', 'medicationName', '0', '0', '0', '1', '1', '1', '0', 'LIKE', 'input', '', 3, 'admin', '2025-06-27 14:25:10', '', '2025-06-27 20:33:20');
INSERT INTO `gen_table_column` VALUES (208, 25, 'duration_days', '药物使用天数', 'int', 'Long', 'durationDays', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 4, 'admin', '2025-06-27 14:25:10', '', '2025-06-27 20:33:20');
INSERT INTO `gen_table_column` VALUES (209, 26, 'patient_id', '病人号', 'varchar(20)', 'String', 'patientId', '1', '0', '1', '1', NULL, NULL, '1', 'EQ', 'input', '', 1, 'admin', '2025-06-27 14:25:10', '', '2025-06-27 14:56:28');
INSERT INTO `gen_table_column` VALUES (210, 26, 'visit_time', '就诊时间', 'datetime', 'Date', 'visitTime', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'datetime', '', 2, 'admin', '2025-06-27 14:25:10', '', '2025-06-27 14:56:28');
INSERT INTO `gen_table_column` VALUES (211, 26, 'name', '姓名', 'varchar(50)', 'String', 'name', '0', '0', '0', '1', '1', '1', '1', 'LIKE', 'input', '', 3, 'admin', '2025-06-27 14:25:10', '', '2025-06-27 14:56:28');
INSERT INTO `gen_table_column` VALUES (212, 26, 'gender', '性别', 'char(1)', 'String', 'gender', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 4, 'admin', '2025-06-27 14:25:10', '', '2025-06-27 14:56:28');
INSERT INTO `gen_table_column` VALUES (213, 26, 'birth_date', '出生日期', 'date', 'Date', 'birthDate', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'datetime', '', 5, 'admin', '2025-06-27 14:25:10', '', '2025-06-27 14:56:28');
INSERT INTO `gen_table_column` VALUES (214, 26, 'age', '年龄', 'int', 'Long', 'age', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 6, 'admin', '2025-06-27 14:25:10', '', '2025-06-27 14:56:28');
INSERT INTO `gen_table_column` VALUES (215, 26, 'address', '家庭住址', 'varchar(255)', 'String', 'address', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 7, 'admin', '2025-06-27 14:25:10', '', '2025-06-27 14:56:28');
INSERT INTO `gen_table_column` VALUES (216, 26, 'height', '身高', 'float', 'Long', 'height', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 8, 'admin', '2025-06-27 14:25:10', '', '2025-06-27 14:56:28');
INSERT INTO `gen_table_column` VALUES (217, 26, 'weight', '体重', 'float', 'Long', 'weight', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 9, 'admin', '2025-06-27 14:25:10', '', '2025-06-27 14:56:28');
INSERT INTO `gen_table_column` VALUES (218, 26, 'birth_weight', '出生体重', 'float', 'Long', 'birthWeight', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 10, 'admin', '2025-06-27 14:25:10', '', '2025-06-27 14:56:28');
INSERT INTO `gen_table_column` VALUES (219, 26, 'lifestyle', '生活方式', 'varchar(100)', 'String', 'lifestyle', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 11, 'admin', '2025-06-27 14:25:10', '', '2025-06-27 14:56:28');
INSERT INTO `gen_table_column` VALUES (220, 27, 'provider_id', '服务者号', 'int', 'Long', 'providerId', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2025-06-27 14:25:10', '', '2025-06-27 14:58:55');
INSERT INTO `gen_table_column` VALUES (221, 27, 'patient_id', '病人号', 'varchar(20)', 'String', 'patientId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2025-06-27 14:25:10', '', '2025-06-27 14:58:55');
INSERT INTO `gen_table_column` VALUES (222, 27, 'provider_name', '姓名', 'varchar(50)', 'String', 'providerName', '0', '0', '0', '1', '1', '1', '0', 'LIKE', 'input', '', 3, 'admin', '2025-06-27 14:25:10', '', '2025-06-27 14:58:55');
INSERT INTO `gen_table_column` VALUES (223, 27, 'title', '职称', 'varchar(50)', 'String', 'title', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 4, 'admin', '2025-06-27 14:25:10', '', '2025-06-27 14:58:55');
INSERT INTO `gen_table_column` VALUES (224, 28, 'symptom_id', '症状号', 'int', 'Long', 'symptomId', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2025-06-27 14:25:10', '', '2025-06-27 15:53:25');
INSERT INTO `gen_table_column` VALUES (225, 28, 'patient_id', '病人号', 'varchar(20)', 'String', 'patientId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2025-06-27 14:25:10', '', '2025-06-27 15:53:25');
INSERT INTO `gen_table_column` VALUES (226, 28, 'symptom_description', '症状描述', 'text', 'String', 'symptomDescription', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'textarea', '', 3, 'admin', '2025-06-27 14:25:10', '', '2025-06-27 15:53:25');
INSERT INTO `gen_table_column` VALUES (227, 28, 'severity_level', '严重程度', 'varchar(20)', 'String', 'severityLevel', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 4, 'admin', '2025-06-27 14:25:10', '', '2025-06-27 15:53:25');
INSERT INTO `gen_table_column` VALUES (228, 28, 'frequency', '症状频率', 'varchar(20)', 'String', 'frequency', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 5, 'admin', '2025-06-27 14:25:10', '', '2025-06-27 15:53:25');
INSERT INTO `gen_table_column` VALUES (229, 28, 'onset_time', '症状开始时间', 'date', 'Date', 'onsetTime', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'datetime', '', 6, 'admin', '2025-06-27 14:25:10', '', '2025-06-27 15:53:25');
INSERT INTO `gen_table_column` VALUES (230, 28, 'trigger_factor', '诱因', 'text', 'String', 'triggerFactor', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'textarea', '', 7, 'admin', '2025-06-27 14:25:10', '', '2025-06-27 15:53:25');
INSERT INTO `gen_table_column` VALUES (231, 28, 'physical_signs', '体征描述', 'text', 'String', 'physicalSigns', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'textarea', '', 8, 'admin', '2025-06-27 14:25:10', '', '2025-06-27 15:53:25');

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
INSERT INTO `history` VALUES (1, '001', '无无', '无', '无');

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
INSERT INTO `imaging` VALUES (1, '001', 'x', '2025-06-27', '无');

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
INSERT INTO `insurance_info` VALUES (1, '001', '无', '001');

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

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
INSERT INTO `patients` VALUES ('001', '2025-06-27 00:00:00', '张三', '男', '2025-06-01', 1, '福州', 2, 1, 1, '无');
INSERT INTO `patients` VALUES ('002', '2025-06-27 00:00:00', '李四', '男', '2025-06-27', 1, '福州', 1, 1, 1, '无');

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

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
  CONSTRAINT `survey_area_environment_ibfk_1` FOREIGN KEY (`survey_id`) REFERENCES `survey_basic_info` (`survey_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

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
  CONSTRAINT `survey_basic_info_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `clinical_db`.`patients` (`patient_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

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
  CONSTRAINT `survey_confounding_factors_ibfk_1` FOREIGN KEY (`survey_id`) REFERENCES `survey_basic_info` (`survey_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
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
  CONSTRAINT `survey_environment_exposure_ibfk_1` FOREIGN KEY (`survey_id`) REFERENCES `survey_basic_info` (`survey_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
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
  CONSTRAINT `survey_family_env_ibfk_1` FOREIGN KEY (`survey_id`) REFERENCES `survey_basic_info` (`survey_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
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
  CONSTRAINT `survey_learning_work_env_ibfk_1` FOREIGN KEY (`survey_id`) REFERENCES `survey_basic_info` (`survey_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

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
  CONSTRAINT `survey_monitoring_methods_ibfk_1` FOREIGN KEY (`survey_id`) REFERENCES `survey_basic_info` (`survey_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

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
  CONSTRAINT `survey_providers_ibfk_1` FOREIGN KEY (`survey_id`) REFERENCES `survey_basic_info` (`survey_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '定时任务调度日志表' ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 108 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '系统访问记录' ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 2386 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '菜单权限表' ROW_FORMAT = Dynamic;

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
INSERT INTO `sys_menu` VALUES (2001, '城乡环境监测', 2000, 1, 'environment', 'EpidemSys/environment/index', NULL, '', 1, 0, 'C', '0', '0', 'EpidemSys:environment:list', '#', 'admin', '2025-06-27 10:06:44', '', NULL, '城乡环境监测菜单');
INSERT INTO `sys_menu` VALUES (2002, '城乡环境监测查询', 2001, 1, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'EpidemSys:environment:query', '#', 'admin', '2025-06-27 10:06:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2003, '城乡环境监测新增', 2001, 2, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'EpidemSys:environment:add', '#', 'admin', '2025-06-27 10:06:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2004, '城乡环境监测修改', 2001, 3, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'EpidemSys:environment:edit', '#', 'admin', '2025-06-27 10:06:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2005, '城乡环境监测删除', 2001, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'EpidemSys:environment:remove', '#', 'admin', '2025-06-27 10:06:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2006, '城乡环境监测导出', 2001, 5, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'EpidemSys:environment:export', '#', 'admin', '2025-06-27 10:06:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2007, '家族环境', 2000, 1, 'env', 'EpidemSys/env/index', NULL, '', 1, 0, 'C', '0', '0', 'EpidemSys:env:list', '#', 'admin', '2025-06-27 10:06:50', '', NULL, '家族环境菜单');
INSERT INTO `sys_menu` VALUES (2008, '家族环境查询', 2007, 1, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'EpidemSys:env:query', '#', 'admin', '2025-06-27 10:06:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2009, '家族环境新增', 2007, 2, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'EpidemSys:env:add', '#', 'admin', '2025-06-27 10:06:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2010, '家族环境修改', 2007, 3, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'EpidemSys:env:edit', '#', 'admin', '2025-06-27 10:06:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2011, '家族环境删除', 2007, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'EpidemSys:env:remove', '#', 'admin', '2025-06-27 10:06:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2012, '家族环境导出', 2007, 5, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'EpidemSys:env:export', '#', 'admin', '2025-06-27 10:06:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2013, '家庭环境暴露信息', 2000, 1, 'exposure', 'EpidemSys/exposure/index', NULL, '', 1, 0, 'C', '0', '0', 'EpidemSys:exposure:list', '#', 'admin', '2025-06-27 10:06:59', '', NULL, '家庭环境暴露信息菜单');
INSERT INTO `sys_menu` VALUES (2014, '家庭环境暴露信息查询', 2013, 1, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'EpidemSys:exposure:query', '#', 'admin', '2025-06-27 10:06:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2015, '家庭环境暴露信息新增', 2013, 2, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'EpidemSys:exposure:add', '#', 'admin', '2025-06-27 10:06:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2016, '家庭环境暴露信息修改', 2013, 3, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'EpidemSys:exposure:edit', '#', 'admin', '2025-06-27 10:06:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2017, '家庭环境暴露信息删除', 2013, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'EpidemSys:exposure:remove', '#', 'admin', '2025-06-27 10:06:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2018, '家庭环境暴露信息导出', 2013, 5, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'EpidemSys:exposure:export', '#', 'admin', '2025-06-27 10:06:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2019, '其他潜在混杂因素', 2000, 1, 'factors', 'EpidemSys/factors/index', NULL, '', 1, 0, 'C', '0', '0', 'EpidemSys:factors:list', '#', 'admin', '2025-06-27 10:07:06', '', NULL, '其他潜在混杂因素菜单');
INSERT INTO `sys_menu` VALUES (2020, '其他潜在混杂因素查询', 2019, 1, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'EpidemSys:factors:query', '#', 'admin', '2025-06-27 10:07:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2021, '其他潜在混杂因素新增', 2019, 2, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'EpidemSys:factors:add', '#', 'admin', '2025-06-27 10:07:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2022, '其他潜在混杂因素修改', 2019, 3, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'EpidemSys:factors:edit', '#', 'admin', '2025-06-27 10:07:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2023, '其他潜在混杂因素删除', 2019, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'EpidemSys:factors:remove', '#', 'admin', '2025-06-27 10:07:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2024, '其他潜在混杂因素导出', 2019, 5, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'EpidemSys:factors:export', '#', 'admin', '2025-06-27 10:07:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2025, '患儿基本信息', 2000, 1, 'info', 'EpidemSys/info/index', NULL, '', 1, 0, 'C', '0', '0', 'EpidemSys:info:list', '#', 'admin', '2025-06-27 10:07:11', '', NULL, '患儿基本信息菜单');
INSERT INTO `sys_menu` VALUES (2026, '患儿基本信息查询', 2025, 1, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'EpidemSys:info:query', '#', 'admin', '2025-06-27 10:07:11', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2027, '患儿基本信息新增', 2025, 2, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'EpidemSys:info:add', '#', 'admin', '2025-06-27 10:07:11', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2028, '患儿基本信息修改', 2025, 3, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'EpidemSys:info:edit', '#', 'admin', '2025-06-27 10:07:11', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2029, '患儿基本信息删除', 2025, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'EpidemSys:info:remove', '#', 'admin', '2025-06-27 10:07:11', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2030, '患儿基本信息导出', 2025, 5, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'EpidemSys:info:export', '#', 'admin', '2025-06-27 10:07:11', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2031, '环境监测方法', 2000, 1, 'methods', 'EpidemSys/methods/index', NULL, '', 1, 0, 'C', '0', '0', 'EpidemSys:methods:list', '#', 'admin', '2025-06-27 10:07:16', '', NULL, '环境监测方法菜单');
INSERT INTO `sys_menu` VALUES (2032, '环境监测方法查询', 2031, 1, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'EpidemSys:methods:query', '#', 'admin', '2025-06-27 10:07:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2033, '环境监测方法新增', 2031, 2, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'EpidemSys:methods:add', '#', 'admin', '2025-06-27 10:07:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2034, '环境监测方法修改', 2031, 3, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'EpidemSys:methods:edit', '#', 'admin', '2025-06-27 10:07:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2035, '环境监测方法删除', 2031, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'EpidemSys:methods:remove', '#', 'admin', '2025-06-27 10:07:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2036, '环境监测方法导出', 2031, 5, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'EpidemSys:methods:export', '#', 'admin', '2025-06-27 10:07:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2037, '一级亲属过敏史', 2000, 1, 'primary', 'EpidemSys/primary/index', NULL, '', 1, 0, 'C', '0', '0', 'EpidemSys:primary:list', '#', 'admin', '2025-06-27 10:07:23', '', NULL, '一级亲属过敏史菜单');
INSERT INTO `sys_menu` VALUES (2038, '一级亲属过敏史查询', 2037, 1, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'EpidemSys:primary:query', '#', 'admin', '2025-06-27 10:07:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2039, '一级亲属过敏史新增', 2037, 2, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'EpidemSys:primary:add', '#', 'admin', '2025-06-27 10:07:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2040, '一级亲属过敏史修改', 2037, 3, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'EpidemSys:primary:edit', '#', 'admin', '2025-06-27 10:07:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2041, '一级亲属过敏史删除', 2037, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'EpidemSys:primary:remove', '#', 'admin', '2025-06-27 10:07:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2042, '一级亲属过敏史导出', 2037, 5, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'EpidemSys:primary:export', '#', 'admin', '2025-06-27 10:07:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2043, '医疗调查服务者标识信息', 2000, 1, 'providers', 'EpidemSys/providers/index', NULL, '', 1, 0, 'C', '0', '0', 'EpidemSys:providers:list', '#', 'admin', '2025-06-27 10:07:29', '', NULL, '医疗调查服务者标识信息菜单');
INSERT INTO `sys_menu` VALUES (2044, '医疗调查服务者标识信息查询', 2043, 1, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'EpidemSys:providers:query', '#', 'admin', '2025-06-27 10:07:29', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2045, '医疗调查服务者标识信息新增', 2043, 2, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'EpidemSys:providers:add', '#', 'admin', '2025-06-27 10:07:29', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2046, '医疗调查服务者标识信息修改', 2043, 3, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'EpidemSys:providers:edit', '#', 'admin', '2025-06-27 10:07:29', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2047, '医疗调查服务者标识信息删除', 2043, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'EpidemSys:providers:remove', '#', 'admin', '2025-06-27 10:07:29', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2048, '医疗调查服务者标识信息导出', 2043, 5, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'EpidemSys:providers:export', '#', 'admin', '2025-06-27 10:07:29', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2049, '二级亲属过敏史', 2000, 1, 'secondary', 'EpidemSys/secondary/index', NULL, '', 1, 0, 'C', '0', '0', 'EpidemSys:secondary:list', '#', 'admin', '2025-06-27 10:07:33', '', NULL, '二级亲属过敏史菜单');
INSERT INTO `sys_menu` VALUES (2050, '二级亲属过敏史查询', 2049, 1, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'EpidemSys:secondary:query', '#', 'admin', '2025-06-27 10:07:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2051, '二级亲属过敏史新增', 2049, 2, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'EpidemSys:secondary:add', '#', 'admin', '2025-06-27 10:07:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2052, '二级亲属过敏史修改', 2049, 3, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'EpidemSys:secondary:edit', '#', 'admin', '2025-06-27 10:07:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2053, '二级亲属过敏史删除', 2049, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'EpidemSys:secondary:remove', '#', 'admin', '2025-06-27 10:07:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2054, '二级亲属过敏史导出', 2049, 5, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'EpidemSys:secondary:export', '#', 'admin', '2025-06-27 10:07:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2055, '学习/工作环境号', 2000, 1, 'SLenv', 'EpidemSys/SLenv/index', NULL, '', 1, 0, 'C', '0', '0', 'EpidemSys:SLenv:list', '#', 'admin', '2025-06-27 10:07:38', '', NULL, '学习/工作环境号菜单');
INSERT INTO `sys_menu` VALUES (2056, '学习/工作环境号查询', 2055, 1, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'EpidemSys:SLenv:query', '#', 'admin', '2025-06-27 10:07:38', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2057, '学习/工作环境号新增', 2055, 2, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'EpidemSys:SLenv:add', '#', 'admin', '2025-06-27 10:07:38', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2058, '学习/工作环境号修改', 2055, 3, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'EpidemSys:SLenv:edit', '#', 'admin', '2025-06-27 10:07:38', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2059, '学习/工作环境号删除', 2055, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'EpidemSys:SLenv:remove', '#', 'admin', '2025-06-27 10:07:38', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2060, '学习/工作环境号导出', 2055, 5, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'EpidemSys:SLenv:export', '#', 'admin', '2025-06-27 10:07:38', '', NULL, '');
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
) ENGINE = InnoDB AUTO_INCREMENT = 251 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '操作日志记录' ROW_FORMAT = Dynamic;

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
INSERT INTO `sys_user` VALUES (1, 103, 'admin', '若依', '00', 'ry@163.com', '15888888888', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2025-06-27 19:23:20', '2025-06-26 21:44:33', 'admin', '2025-06-26 21:44:33', '', '2025-06-27 19:23:20', '管理员');
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
