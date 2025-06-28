-- 禁用外键检查
SET FOREIGN_KEY_CHECKS = 0;

-- 创建统一数据库
CREATE DATABASE IF NOT EXISTS ry-vue;
USE ry-vue;

ALTER TABLE patients

COLLATE utf8mb4_0900_ai_ci;


-- 1. 患者基本信息
DROP TABLE IF EXISTS patients;
CREATE TABLE patients (
    patient_id VARCHAR(20) PRIMARY KEY,
    visit_time DATETIME,
    name VARCHAR(50),  
    gender CHAR(1),
    birth_date DATE,
    age INT,
    address VARCHAR(255),
    height FLOAT,
    weight FLOAT,
    birth_weight FLOAT,
    lifestyle VARCHAR(100)
);

-- 2. 医保情况
DROP TABLE IF EXISTS insurance_info;
CREATE TABLE insurance_info (
    insurance_id INT AUTO_INCREMENT PRIMARY KEY,
    patient_id VARCHAR(20),
    insurance_type VARCHAR(50),
    insurance_number VARCHAR(50),
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id) ON DELETE CASCADE
);
 
-- 3. 联系人(方式)
DROP TABLE IF EXISTS contacts;
CREATE TABLE contacts (
    contact_id INT AUTO_INCREMENT PRIMARY KEY,
    patient_id VARCHAR(20),
    phone VARCHAR(50),
    emergency_contact VARCHAR(50),
    relationship VARCHAR(20),
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id) ON DELETE CASCADE
);
 
-- 4. 医疗服务机构标识信息
DROP TABLE IF EXISTS medical_orgs;
CREATE TABLE medical_orgs (
    org_id INT AUTO_INCREMENT PRIMARY KEY,
    patient_id VARCHAR(20),
    hospital_name VARCHAR(100),
    department_name VARCHAR(100),
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id) ON DELETE CASCADE
);
 
-- 5. 医疗服务者标识信息
DROP TABLE IF EXISTS providers;
CREATE TABLE providers (
    provider_id INT AUTO_INCREMENT PRIMARY KEY,
    patient_id VARCHAR(20),
    provider_name VARCHAR(50),
    title VARCHAR(50),
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id) ON DELETE CASCADE
);
 
-- 6. 既往史
DROP TABLE IF EXISTS history;
CREATE TABLE history (
    history_id INT AUTO_INCREMENT PRIMARY KEY,
    patient_id VARCHAR(20),
    food_allergy_history TEXT,
    allergen_exposure TEXT,
    past_disease_history TEXT,
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id) ON DELETE CASCADE
);
 
-- 7. 家族史
DROP TABLE IF EXISTS family_history;
CREATE TABLE family_history (
    fam_id INT AUTO_INCREMENT PRIMARY KEY,
    patient_id VARCHAR(20),
    relative_relation VARCHAR(50),
    allergy_disease TEXT,
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id) ON DELETE CASCADE
);
 
-- 8. 症状及体征
DROP TABLE IF EXISTS symptoms;
CREATE TABLE symptoms (
    symptom_id INT AUTO_INCREMENT PRIMARY KEY,
    patient_id VARCHAR(20),
    symptom_description TEXT,
    severity_level VARCHAR(20),
    frequency VARCHAR(20),
    onset_time DATE,
    trigger_factor TEXT,
    physical_signs TEXT,
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id) ON DELETE CASCADE
);
 
-- 9. 实验室检查
DROP TABLE IF EXISTS lab_tests;
CREATE TABLE lab_tests (
    test_id INT AUTO_INCREMENT PRIMARY KEY,
    patient_id VARCHAR(20),
    test_name VARCHAR(100),
    test_date DATE,
    test_result TEXT,
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id) ON DELETE CASCADE
);

-- 10. 肺功能检查
DROP TABLE IF EXISTS lung_tests;
CREATE TABLE lung_tests (
    lung_id INT AUTO_INCREMENT PRIMARY KEY,
    patient_id VARCHAR(20),
    test_name VARCHAR(100),
    test_date DATE,
    test_result TEXT,
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id) ON DELETE CASCADE
);

-- 11. 呼气一氧化氮检测
DROP TABLE IF EXISTS feNO_tests;
CREATE TABLE feNO_tests (
    feno_id INT AUTO_INCREMENT PRIMARY KEY,
    patient_id VARCHAR(20),
    test_name VARCHAR(100),
    test_date DATE,
    test_result TEXT,
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id) ON DELETE CASCADE
);

-- 12. 影像学检查
DROP TABLE IF EXISTS imaging;
CREATE TABLE imaging (
    imaging_id INT AUTO_INCREMENT PRIMARY KEY,
    patient_id VARCHAR(20),
    imaging_type VARCHAR(100),
    imaging_date DATE,
    report TEXT,
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id) ON DELETE CASCADE
);

-- 13. 疾病诊断
DROP TABLE IF EXISTS diagnoses;
CREATE TABLE diagnoses (
    diagnosis_id INT AUTO_INCREMENT PRIMARY KEY,
    patient_id VARCHAR(20),
    disease_name VARCHAR(100),
    severity VARCHAR(50),
    diagnosis_time DATE,
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id) ON DELETE CASCADE
);

-- 14. 用药
DROP TABLE IF EXISTS medications;
CREATE TABLE medications (
    med_id INT AUTO_INCREMENT PRIMARY KEY,
    patient_id VARCHAR(20),
    medication_name VARCHAR(100),
    medication_specification VARCHAR(100),
    single_dose VARCHAR(50), 
    usage_days INT,
    frequency VARCHAR(50),
    administration_route VARCHAR(50),
    administration_site VARCHAR(100),
    treatment_start DATE,
    treatment_end DATE,
    medication_guidance TEXT,
    precautions TEXT,
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id) ON DELETE CASCADE
);

-- 15. 既往用药史
DROP TABLE IF EXISTS medications_history;
CREATE TABLE medications_history (
    med_his_id INT AUTO_INCREMENT PRIMARY KEY,
    patient_id VARCHAR(20),
    medication_name VARCHAR(100),
    duration_days INT,
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id) ON DELETE CASCADE
);

-- 16. 其他辅助治疗
DROP TABLE IF EXISTS clinical_other_treatments;
CREATE TABLE clinical_other_treatments (
    treatment_id INT AUTO_INCREMENT PRIMARY KEY,
    patient_id VARCHAR(20),
    treatment_name VARCHAR(100),
    start_time DATE,
    end_time DATE,
    note TEXT,
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id) ON DELETE CASCADE
);

-- 17. 随访信息
DROP TABLE IF EXISTS followup_notes;
CREATE TABLE followup_notes (
    followup_id INT AUTO_INCREMENT PRIMARY KEY,
    patient_id VARCHAR(20),
    symptom_improvement TEXT,                   
    physical_development TEXT,                  
    adverse_reactions TEXT,                     
    reaction_management TEXT,  
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id) ON DELETE CASCADE
);

-- 18. 费用
DROP TABLE IF EXISTS expenses;
CREATE TABLE expenses (
    expense_id INT AUTO_INCREMENT PRIMARY KEY,
    patient_id VARCHAR(20),
    expense_type VARCHAR(100),
    amount DECIMAL(10,2),
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id) ON DELETE CASCADE
);

-- 生物样本库表
-- 1. 样本采集主表
DROP TABLE IF EXISTS biospecimens;
CREATE TABLE biospecimens (
    specimen_id VARCHAR(20) PRIMARY KEY,
    patient_id VARCHAR(20) NOT NULL,
    specimen_type ENUM('血液','血清','血浆','唾液','尿液','粪便','组织','其他') NOT NULL,
    collection_date DATETIME NOT NULL,
    collection_site VARCHAR(100),
    collection_method VARCHAR(100),
    collection_volume DECIMAL(6,2),
    collection_tube_type VARCHAR(50),
    processing_method TEXT,
    initial_processing_time TIME,
    aliquot_count INT,
    clinical_context TEXT,
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id) ON DELETE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 2. 样本采集事件表
DROP TABLE IF EXISTS collection_events;
CREATE TABLE collection_events (
    event_id INT AUTO_INCREMENT PRIMARY KEY,
    patient_id VARCHAR(20) NOT NULL,
    clinical_visit_id VARCHAR(50),
    event_name VARCHAR(100),
    event_date DATE NOT NULL,
    protocol_version VARCHAR(20),
    collector_id INT,
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id) ON DELETE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 3. 样本存储表
DROP TABLE IF EXISTS specimen_storage;
CREATE TABLE specimen_storage (
    storage_id INT AUTO_INCREMENT PRIMARY KEY,
    specimen_id VARCHAR(20) NOT NULL,
    storage_location VARCHAR(50) NOT NULL,
    storage_position VARCHAR(50),
    storage_temperature DECIMAL(5,2) NOT NULL,
    freeze_date DATETIME NOT NULL,
    freeze_method VARCHAR(100),
    freeze_thaw_cycles INT DEFAULT 0,
    storage_status ENUM('可用','已用完','销毁','转移') DEFAULT '可用',
    last_check_date DATE,
    FOREIGN KEY (specimen_id) REFERENCES biospecimens(specimen_id) ON DELETE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 4. 样本质量控制表
DROP TABLE IF EXISTS specimen_qc;
CREATE TABLE specimen_qc (
    qc_id INT AUTO_INCREMENT PRIMARY KEY,
    specimen_id VARCHAR(20) NOT NULL,
    qc_date DATE NOT NULL,
    dna_concentration DECIMAL(8,2),
    dna_quality_ratio DECIMAL(5,2),
    rna_integrity_number DECIMAL(4,2),
    protein_concentration DECIMAL(8,2),
    hemolysis_level ENUM('无','轻度','中度','重度'),
    contamination_status BOOLEAN,
    qc_operator VARCHAR(50),
    qc_method VARCHAR(100),
    qc_notes TEXT,
    FOREIGN KEY (specimen_id) REFERENCES biospecimens(specimen_id) ON DELETE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 5. 基因组数据表
DROP TABLE IF EXISTS genomic_data;
CREATE TABLE genomic_data (
    genomic_id INT AUTO_INCREMENT PRIMARY KEY,
    specimen_id VARCHAR(20) NOT NULL,
    analysis_date DATE NOT NULL,
    analysis_platform VARCHAR(100),
    il4_genotype VARCHAR(50),
    il13_genotype VARCHAR(50),
    filaggrin_mutation BOOLEAN,
    tslp_variant VARCHAR(50),
    other_snp_data JSON,
    sequencing_coverage DECIMAL(6,2),
    data_file_path VARCHAR(255),
    analysis_protocol VARCHAR(100),
    FOREIGN KEY (specimen_id) REFERENCES biospecimens(specimen_id) ON DELETE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 6. 蛋白质组数据表
DROP TABLE IF EXISTS proteomic_data;
CREATE TABLE proteomic_data (
    proteomic_id INT AUTO_INCREMENT PRIMARY KEY,
    specimen_id VARCHAR(20) NOT NULL,
    analysis_date DATE NOT NULL,
    analysis_method VARCHAR(100),
    il4_level DECIMAL(8,2),
    il5_level DECIMAL(8,2),
    il13_level DECIMAL(8,2),
    ige_level DECIMAL(8,2),
    cytokine_profile JSON,
    data_file_path VARCHAR(255),
    FOREIGN KEY (specimen_id) REFERENCES biospecimens(specimen_id) ON DELETE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 7. 代谢组数据表
DROP TABLE IF EXISTS metabolomic_data;
CREATE TABLE metabolomic_data (
    metabolomic_id INT AUTO_INCREMENT PRIMARY KEY,
    specimen_id VARCHAR(20) NOT NULL,
    analysis_date DATE NOT NULL,
    analysis_platform VARCHAR(100),
    histamine_level DECIMAL(10,2),
    leukotrienes_level DECIMAL(10,2),
    prostaglandins_level DECIMAL(10,2),
    other_metabolites JSON,
    data_file_path VARCHAR(255),
    FOREIGN KEY (specimen_id) REFERENCES biospecimens(specimen_id) ON DELETE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 8. 微生物组数据表
DROP TABLE IF EXISTS microbiome_data;
CREATE TABLE microbiome_data (
    microbiome_id INT AUTO_INCREMENT PRIMARY KEY,
    specimen_id VARCHAR(20) NOT NULL,
    analysis_date DATE NOT NULL,
    sequencing_method VARCHAR(100),
    alpha_diversity DECIMAL(6,3),
    beta_diversity_metrics JSON,
    predominant_phylum VARCHAR(100),
    predominant_genus VARCHAR(100),
    firmicutes_bacteroidetes_ratio DECIMAL(6,2),
    pathogen_detected BOOLEAN,
    full_taxonomy_report JSON,
    data_file_path VARCHAR(255),
    FOREIGN KEY (specimen_id) REFERENCES biospecimens(specimen_id) ON DELETE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 9. 样本-临床关联表
DROP TABLE IF EXISTS specimen_clinical_link;
CREATE TABLE specimen_clinical_link (
    link_id INT AUTO_INCREMENT PRIMARY KEY,
    specimen_id VARCHAR(20) NOT NULL,
    clinical_diagnosis_id INT,
    clinical_symptom_id INT,
    clinical_medication_id INT,
    clinical_test_id INT,
    link_type ENUM('诊断时','治疗前','治疗后','随访期','急性发作期','缓解期'),
    clinical_notes TEXT,
    FOREIGN KEY (specimen_id) REFERENCES biospecimens(specimen_id) ON DELETE CASCADE,
    FOREIGN KEY (clinical_diagnosis_id) REFERENCES diagnoses(diagnosis_id) ON DELETE SET NULL,
    FOREIGN KEY (clinical_symptom_id) REFERENCES symptoms(symptom_id) ON DELETE SET NULL,
    FOREIGN KEY (clinical_medication_id) REFERENCES medications(med_id) ON DELETE SET NULL,
    FOREIGN KEY (clinical_test_id) REFERENCES lab_tests(test_id) ON DELETE SET NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 10. 电子CRF表格
DROP TABLE IF EXISTS crf_sample_collection;
CREATE TABLE crf_sample_collection (
    crf_id INT AUTO_INCREMENT PRIMARY KEY,
    specimen_id VARCHAR(20) NOT NULL,
    form_completed_by VARCHAR(50),
    form_completion_date DATE,
    patient_fasting BOOLEAN,
    last_meal_time TIME,
    medication_hold TEXT,
    collection_time TIME,
    collection_complications TEXT,
    processing_delay_minutes INT,
    aliquot_volume DECIMAL(6,2),
    additive_type VARCHAR(50),
    collector_signature VARCHAR(50),
    supervisor_signature VARCHAR(50),
    FOREIGN KEY (specimen_id) REFERENCES biospecimens(specimen_id) ON DELETE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 11. 动态更新日志表
DROP TABLE IF EXISTS data_change_log;
CREATE TABLE data_change_log (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    table_name VARCHAR(50) NOT NULL,
    record_id VARCHAR(20) NOT NULL,
    change_type ENUM('INSERT','UPDATE','DELETE'),
    changed_by VARCHAR(50) NOT NULL,
    change_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    previous_data JSON,
    change_reason TEXT
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ====== 流调数据库表 - 调整删除顺序 ======
-- 先删除依赖survey_basic_info的子表
DROP TABLE IF EXISTS family_history_primary;
DROP TABLE IF EXISTS family_history_secondary;
DROP TABLE IF EXISTS survey_providers;
DROP TABLE IF EXISTS survey_environment_exposure;
DROP TABLE IF EXISTS survey_learning_work_env;
DROP TABLE IF EXISTS survey_area_environment;
DROP TABLE IF EXISTS survey_family_env;
DROP TABLE IF EXISTS survey_confounding_factors;
DROP TABLE IF EXISTS survey_monitoring_methods;

-- 最后删除父表
DROP TABLE IF EXISTS survey_basic_info;

-- 重新创建流调表
CREATE TABLE survey_basic_info (
    survey_id INT AUTO_INCREMENT PRIMARY KEY,
    patient_id VARCHAR(20) NOT NULL,
    survey_date DATE,
    child_name VARCHAR(50),
    gender CHAR(1),
    age INT,
    residence_type ENUM('城市', '农村'),
    residence_years INT,
    address VARCHAR(255),
    height FLOAT,
    weight FLOAT,
    allergy_history BOOLEAN,
    has_rhinitis BOOLEAN,
    has_asthma BOOLEAN,
    has_dermatitis BOOLEAN,
    has_conjunctivitis BOOLEAN,
    has_urticaria BOOLEAN,
    diagnosed_rhinitis BOOLEAN,
    diagnosed_asthma BOOLEAN,
    diagnosed_dermatitis BOOLEAN,
    diagnosed_conjunctivitis BOOLEAN,
    diagnosed_urticaria BOOLEAN,
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id) ON DELETE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE survey_providers (
    provider_id INT AUTO_INCREMENT PRIMARY KEY,
    survey_id INT NOT NULL,
    name VARCHAR(50),
    title ENUM('住院医师', '主治医师', '副主任医师', '主任医师'),
    FOREIGN KEY (survey_id) REFERENCES survey_basic_info(survey_id) ON DELETE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE survey_environment_exposure (
    env_id INT AUTO_INCREMENT PRIMARY KEY,
    survey_id INT NOT NULL,
    house_type ENUM('平房','楼房','别墅','其他'),
    building_material ENUM('木质','混凝土','其他'),
    ventilation_freq ENUM('每日','每周','偶尔'),
    ac_usage_season ENUM('几乎不用','夏季每日','全年高频'),
    ac_usage_freq ENUM('每日','每周3-5天','偶尔'),
    ac_temp_setting ENUM('＜24℃','24-26℃','＞26℃'),
    ac_modes TEXT,
    ac_filter_cleaning_freq ENUM('每月','每季度','每年','从未清洁'),
    heating_type TEXT,
    heating_temp_range ENUM('＜18℃','18-22℃','＞22℃'),
    has_carpet BOOLEAN,
    has_soft_toys BOOLEAN,
    pm25_avg FLOAT,
    pollen_info TEXT,
    formaldehyde_level FLOAT,
    formaldehyde_test_time DATE,
    dust_mite_level TEXT,
    other_allergens TEXT,
    exercise_frequency INT,
    exercise_duration INT,
    exercise_intensity ENUM('轻','中','重'),
    swimming BOOLEAN,
    sleep_hours FLOAT,
    insomnia BOOLEAN,
    circadian_disruption BOOLEAN,
    smoke_exposure_type ENUM('主动','被动暴露','无'),
    cleaning_freq ENUM('每日','每周','每月'),
    has_pets BOOLEAN,
    pet_types TEXT,
    pet_count INT,
    lives_with_smoker BOOLEAN,
    cooking_fuel ENUM('天然气','煤气','生物质燃料'),
    uses_air_purifier BOOLEAN,
    uses_vacuum_cleaner BOOLEAN,
    avoidance_quality ENUM('优','良','差'),
    FOREIGN KEY (survey_id) REFERENCES survey_basic_info(survey_id) ON DELETE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE survey_learning_work_env (
    learn_env_id INT AUTO_INCREMENT PRIMARY KEY,
    survey_id INT NOT NULL,
    location_type ENUM('城市中心','郊区','农村'),
    ventilation_quality ENUM('良好','一般','差'),
    pm25_annual FLOAT,
    pollen_peak_concentration FLOAT,
    pollen_types TEXT,
    formaldehyde_level_workplace FLOAT,
    has_carpet BOOLEAN,
    has_fabric_furniture BOOLEAN,
    FOREIGN KEY (survey_id) REFERENCES survey_basic_info(survey_id) ON DELETE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE survey_area_environment (
    env_area_id INT AUTO_INCREMENT PRIMARY KEY,
    survey_id INT NOT NULL,
    urban_pm25_avg FLOAT,
    urban_pm25_seasonal TEXT,
    urban_pollen_types TEXT,
    urban_pollen_distribution TEXT,
    urban_pollen_peak FLOAT,
    urban_pollutants TEXT,
    urban_monitor_location ENUM('交通区','工业区','居民区'),
    rural_pm25_burning FLOAT,
    rural_pm25_avg FLOAT,
    rural_pollen_types TEXT,
    rural_biomass_pollution BOOLEAN,
    rural_water_source ENUM('自来水','纯净水','井水','其他'),
    FOREIGN KEY (survey_id) REFERENCES survey_basic_info(survey_id) ON DELETE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE survey_family_env (
    family_env_id INT AUTO_INCREMENT PRIMARY KEY,
    survey_id INT NOT NULL,
    shared_smoking_exposure BOOLEAN,
    FOREIGN KEY (survey_id) REFERENCES survey_basic_info(survey_id) ON DELETE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE family_history_primary (
    prim_id INT AUTO_INCREMENT PRIMARY KEY,
    survey_id INT NOT NULL,
    relation VARCHAR(20),
    diseases TEXT,
    FOREIGN KEY (survey_id) REFERENCES survey_basic_info(survey_id) ON DELETE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE family_history_secondary (
    sec_id INT AUTO_INCREMENT PRIMARY KEY,
    survey_id INT NOT NULL,
    relation VARCHAR(20),
    diseases TEXT,
    FOREIGN KEY (survey_id) REFERENCES survey_basic_info(survey_id) ON DELETE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE survey_confounding_factors (
    confound_id INT AUTO_INCREMENT PRIMARY KEY,
    survey_id INT NOT NULL,
    diet_type ENUM('高加工食品','传统饮食'),
    vitamin_d_400u BOOLEAN,
    vitamin_d_years FLOAT,
    omega3_intake TEXT,
    stress_level_pss10 INT,
    mental_state_phq9_gad7 TEXT,
    vaccine_on_schedule BOOLEAN,
    antibiotic_freq ENUM('每月','每季度','每年'),
    breastfeeding BOOLEAN,
    breastfeeding_months INT,
    delivery_type ENUM('自然分娩','剖宫产'),
    pet_exposure_stage ENUM('婴儿期','幼儿期','学龄前期','学龄期'),
    farm_exposure BOOLEAN,
    farm_exposure_months INT,
    absent_days_allergy INT,
    annual_medical_cost DECIMAL(10,2),
    FOREIGN KEY (survey_id) REFERENCES survey_basic_info(survey_id) ON DELETE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE survey_monitoring_methods (
    method_id INT AUTO_INCREMENT PRIMARY KEY,
    survey_id INT NOT NULL,
    pm25_detector_model VARCHAR(100),
    pollen_gravity_settle BOOLEAN,
    pollen_volume_sampling BOOLEAN,
    pollen_molecular_detection BOOLEAN,
    mite_protein_detection BOOLEAN,
    mite_microscope_count BOOLEAN,
    mite_pcr BOOLEAN,
    mite_metabolite BOOLEAN,
    mite_air_sampling BOOLEAN,
    mite_sensor_tech BOOLEAN,
    FOREIGN KEY (survey_id) REFERENCES survey_basic_info(survey_id) ON DELETE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ====== 随访数据库表 ======
-- 先删除依赖followup_info的子表
DROP TABLE IF EXISTS followup_providers;
DROP TABLE IF EXISTS followup_symptoms;
DROP TABLE IF EXISTS followup_physical_exam;
DROP TABLE IF EXISTS followup_lab_tests;
DROP TABLE IF EXISTS followup_pulmonary_tests;
DROP TABLE IF EXISTS followup_feno_tests;
DROP TABLE IF EXISTS followup_endoscopy;
DROP TABLE IF EXISTS followup_audiology_tests;
DROP TABLE IF EXISTS followup_nasal_resistance_tests;
DROP TABLE IF EXISTS followup_imaging;
DROP TABLE IF EXISTS followup_diagnoses;
DROP TABLE IF EXISTS followup_medications;
DROP TABLE IF EXISTS followup_visits;

-- 最后删除父表
DROP TABLE IF EXISTS followup_info;

-- 重新创建随访表
CREATE TABLE followup_info (
    followup_id INT AUTO_INCREMENT PRIMARY KEY,
    patient_id VARCHAR(20) NOT NULL,
    visit_number VARCHAR(50),
    visit_date DATETIME,
    name VARCHAR(50),
    gender CHAR(1),
    age INT,
    address VARCHAR(255),
    height FLOAT,
    weight FLOAT,
    visit_type ENUM('初诊','复诊'),
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id) ON DELETE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE followup_providers (
    provider_id INT AUTO_INCREMENT PRIMARY KEY,
    followup_id INT NOT NULL,
    provider_name VARCHAR(50),
    title ENUM('住院医师','主治医师','副主任医师','主任医师'),
    FOREIGN KEY (followup_id) REFERENCES followup_info(followup_id) ON DELETE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE followup_symptoms (
    symptom_id INT AUTO_INCREMENT PRIMARY KEY,
    followup_id INT NOT NULL,
    itchy_nose BOOLEAN,
    sneezing BOOLEAN,
    clear_discharge BOOLEAN,
    nasal_congestion BOOLEAN,
    itchy_eyes BOOLEAN,
    tearing BOOLEAN,
    red_eyes BOOLEAN,
    eye_burning BOOLEAN,
    itchy_throat BOOLEAN,
    fever BOOLEAN,
    mouth_breathing BOOLEAN,
    snoring BOOLEAN,
    cough BOOLEAN,
    wheezing BOOLEAN,
    dyspnea BOOLEAN,
    chest_tightness BOOLEAN,
    sighing BOOLEAN,
    activity_limitation BOOLEAN,
    nighttime_awake BOOLEAN,
    morning_night_worse BOOLEAN,
    rash BOOLEAN,
    itching BOOLEAN,
    pain BOOLEAN,
    sleep_disorder BOOLEAN,
    severity ENUM('轻度','中度','重度','极重度'),
    frequency_pattern TEXT,
    start_date DATE,
    trigger_smoke BOOLEAN,
    trigger_dust_mite BOOLEAN,
    trigger_pollen BOOLEAN,
    trigger_virus BOOLEAN,
    trigger_mold BOOLEAN,
    trigger_cold_air BOOLEAN,
    trigger_weather_change BOOLEAN,
    trigger_exercise BOOLEAN,
    trigger_crying BOOLEAN,
    trigger_food BOOLEAN,
    trigger_medication BOOLEAN,
    trigger_other BOOLEAN,
    FOREIGN KEY (followup_id) REFERENCES followup_info(followup_id) ON DELETE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE followup_physical_exam (
    exam_id INT AUTO_INCREMENT PRIMARY KEY,
    followup_id INT NOT NULL,
    temperature_c FLOAT,
    pulse_bpm INT,
    spo2_percent INT,
    oxygen_used BOOLEAN,
    consciousness ENUM('清醒', '谵妄', '昏睡', '昏迷'),
    mental_state ENUM('良好', '倦怠'),
    breathing_pattern ENUM('匀称', '急促', '不规则'),
    appearance ENUM('消瘦', '正常', '肥胖'),
    nasal_mucosa_pale BOOLEAN,
    nasal_mucosa_edema BOOLEAN,
    nasal_mucosa_swelling BOOLEAN,
    nasal_mucosa_clear_discharge BOOLEAN,
    nasal_score INT,
    three_depression_sign BOOLEAN,
    left_lung_sound ENUM('清', '粗'),
    left_dry_rales_present BOOLEAN,
    left_dry_rales_distribution ENUM('无', '散在', '满布'),
    left_wet_rales_present BOOLEAN,
    left_wet_rales_distribution ENUM('无', '散在', '满布'),
    right_lung_sound ENUM('清', '粗'),
    right_dry_rales_present BOOLEAN,
    right_dry_rales_distribution ENUM('无', '散在', '满布'),
    right_wet_rales_present BOOLEAN,
    right_wet_rales_distribution ENUM('无', '散在', '满布'),
    heart_rate INT,
    heart_rhythm ENUM('整齐', '不齐'),
    heart_murmur_present BOOLEAN,
    heart_murmur_type ENUM('无', '收缩期', '舒张期'),
    abdomen_shape ENUM('平坦', '隆起', '凹陷'),
    abdomen_tenderness BOOLEAN,
    rebound_tenderness BOOLEAN,
    head_neck_erythema BOOLEAN,
    head_neck_papule BOOLEAN,
    head_neck_exudation BOOLEAN,
    head_neck_desquamation BOOLEAN,
    head_neck_lichenification BOOLEAN,
    head_neck_dryness BOOLEAN,
    head_neck_other TEXT,
    upper_limb_erythema BOOLEAN,
    upper_limb_papule BOOLEAN,
    upper_limb_exudation BOOLEAN,
    upper_limb_desquamation BOOLEAN,
    upper_limb_lichenification BOOLEAN,
    upper_limb_dryness BOOLEAN,
    upper_limb_other TEXT,
    trunk_erythema BOOLEAN,
    trunk_papule BOOLEAN,
    trunk_exudation BOOLEAN,
    trunk_desquamation BOOLEAN,
    trunk_lichenification BOOLEAN,
    trunk_dryness BOOLEAN,
    trunk_other TEXT,
    lower_limb_erythema BOOLEAN,
    lower_limb_papule BOOLEAN,
    lower_limb_exudation BOOLEAN,
    lower_limb_desquamation BOOLEAN,
    lower_limb_lichenification BOOLEAN,
    lower_limb_dryness BOOLEAN,
    lower_limb_other TEXT,
    genital_erythema BOOLEAN,
    genital_papule BOOLEAN,
    genital_exudation BOOLEAN,
    genital_desquamation BOOLEAN,
    genital_lichenification BOOLEAN,
    genital_dryness BOOLEAN,
    genital_other TEXT,
    electronic_breath_sound_path TEXT,
    FOREIGN KEY (followup_id) REFERENCES followup_info(followup_id) ON DELETE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE followup_lab_tests (
    labtest_id INT AUTO_INCREMENT PRIMARY KEY,
    followup_id INT NOT NULL,
    blood_test_date DATE,
    wbc_count FLOAT,
    neutrophil_count FLOAT,
    lymphocyte_count FLOAT,
    eosinophil_count FLOAT,
    neutrophil_percent FLOAT,
    lymphocyte_percent FLOAT,
    eosinophil_percent FLOAT,
    hemoglobin FLOAT,
    rbc_count FLOAT,
    platelet_count FLOAT,
    c_reactive_protein FLOAT,
    allergen_combo_test_date DATE,
    total_IgE FLOAT,
    dust_mite_combo BOOLEAN,
    mold_combo BOOLEAN,
    pet_dander_combo BOOLEAN,
    food_combo BOOLEAN,
    nut_combo BOOLEAN,
    single_allergen_test_date DATE,
    house_dust_mite BOOLEAN,
    dust_mite BOOLEAN,
    pollen BOOLEAN,
    weed BOOLEAN,
    aspergillus BOOLEAN,
    alternaria BOOLEAN,
    cockroach BOOLEAN,
    cat_dander BOOLEAN,
    dog_dander BOOLEAN,
    egg_white BOOLEAN,
    milk BOOLEAN,
    shrimp BOOLEAN,
    crab BOOLEAN,
    soybean BOOLEAN,
    sesame BOOLEAN,
    wheat BOOLEAN,
    nuts BOOLEAN,
    allergen_other TEXT,
    skin_prick_test_date DATE,
    prick_house_dust_mite BOOLEAN,
    prick_dust_mite BOOLEAN,
    sputum_eosinophil_test_date DATE,
    sputum_eosinophil_count FLOAT,
    total_IgE_repeat_test_date DATE,
    total_IgE_repeat_value FLOAT,
    FOREIGN KEY (followup_id) REFERENCES followup_info(followup_id) ON DELETE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE followup_pulmonary_tests (
    test_id INT AUTO_INCREMENT PRIMARY KEY,
    followup_id INT NOT NULL,
    lung_test_date DATE,
    ic FLOAT,
    mef50 FLOAT,
    fev1 FLOAT,
    fvc FLOAT,
    mmef75_25 FLOAT,
    fev1_fvc_ratio FLOAT,
    mef25 FLOAT,
    mef75 FLOAT,
    mvv FLOAT,
    fev1_vcmax_ratio FLOAT,
    vcmax FLOAT,
    lung_function_conclusion TEXT,
    bronchodilation_test_date DATE,
    bronchodilation_result ENUM('阳性', '阴性'),
    bronchial_challenge_test_date DATE,
    bronchial_challenge_result ENUM('阳性', '阴性'),
    tidal_test_date DATE,
    wt_per_kg FLOAT,
    rr INT,
    ti FLOAT,
    te FLOAT,
    ti_te_ratio FLOAT,
    tptef FLOAT,
    vptef FLOAT,
    tptef_te_ratio FLOAT,
    vpef_ve_ratio FLOAT,
    ptef FLOAT,
    tef50_tif50_ratio FLOAT,
    tef50 FLOAT,
    tef25 FLOAT,
    tef25_75 FLOAT,
    FOREIGN KEY (followup_id) REFERENCES followup_info(followup_id) ON DELETE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE followup_feno_tests (
    feno_id INT AUTO_INCREMENT PRIMARY KEY,
    followup_id INT NOT NULL,
    test_date DATE,
    feno50 FLOAT,
    feno200 FLOAT,
    cano FLOAT,
    FOREIGN KEY (followup_id) REFERENCES followup_info(followup_id) ON DELETE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE followup_endoscopy (
    endoscopy_id INT AUTO_INCREMENT PRIMARY KEY,
    followup_id INT NOT NULL,
    test_name VARCHAR(100),
    test_date DATE,
    result TEXT,
    conclusion TEXT,
    FOREIGN KEY (followup_id) REFERENCES followup_info(followup_id) ON DELETE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE followup_audiology_tests (
    audio_id INT AUTO_INCREMENT PRIMARY KEY,
    followup_id INT NOT NULL,
    test_name VARCHAR(100),
    test_date DATE,
    tympanometry BOOLEAN,
    pure_tone_audiometry BOOLEAN,
    result TEXT,
    FOREIGN KEY (followup_id) REFERENCES followup_info(followup_id) ON DELETE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE followup_nasal_resistance_tests (
    nasal_id INT AUTO_INCREMENT PRIMARY KEY,
    followup_id INT NOT NULL,
    test_name VARCHAR(100),
    test_date DATE,
    result TEXT,
    conclusion TEXT,
    FOREIGN KEY (followup_id) REFERENCES followup_info(followup_id) ON DELETE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE followup_imaging (
    imaging_id INT AUTO_INCREMENT PRIMARY KEY,
    followup_id INT NOT NULL,
    test_name VARCHAR(100),
    test_date DATE,
    image_path TEXT,
    conclusion TEXT,
    FOREIGN KEY (followup_id) REFERENCES followup_info(followup_id) ON DELETE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE followup_diagnoses (
    diagnosis_id INT AUTO_INCREMENT PRIMARY KEY,
    followup_id INT NOT NULL,
    diagnosis_date DATE,
    asthma_phase ENUM('无', '急性发作期', '临床缓解期', '慢性持续期'),
    asthma_severity ENUM('无', '轻度', '中度', '重度', '极重度'),
    rhinitis_severity ENUM('无', '轻度', '中-重度'),
    rhinitis_type ENUM('无', '季节性', '常年性'),
    rhinitis_duration ENUM('无', '间歇性', '持续性'),
    dermatitis_present BOOLEAN,
    dermatitis_severity ENUM('无', '轻度', '中重度'),
    sinusitis_phase ENUM('无', '急性', '慢性'),
    adenoid_hypertrophy BOOLEAN,
    tonsil_hypertrophy BOOLEAN,
    snoring BOOLEAN,
    osa_hypopnea_syndrome BOOLEAN,
    allergic_conjunctivitis BOOLEAN,
    other_diagnoses TEXT,
    FOREIGN KEY (followup_id) REFERENCES followup_info(followup_id) ON DELETE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 13. 用药目录
DROP TABLE IF EXISTS drug_catalog;
CREATE TABLE drug_catalog (
    drug_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    brand VARCHAR(100),
    type VARCHAR(50),
    is_steroid BOOLEAN DEFAULT FALSE,
    is_antihistamine BOOLEAN DEFAULT FALSE,
    is_ltra BOOLEAN DEFAULT FALSE,
    is_bronchodilator BOOLEAN DEFAULT FALSE,
    is_antibiotic BOOLEAN DEFAULT FALSE,
    is_topical BOOLEAN DEFAULT FALSE,
    is_nasal BOOLEAN DEFAULT FALSE,
    is_expectorant BOOLEAN DEFAULT FALSE,
    is_immunotherapy BOOLEAN DEFAULT FALSE,
    is_anti_IgE BOOLEAN DEFAULT FALSE,
    is_targeted BOOLEAN DEFAULT FALSE
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 用药记录
DROP TABLE IF EXISTS followup_medications;
CREATE TABLE followup_medications (
    med_id INT AUTO_INCREMENT PRIMARY KEY,
    followup_id INT NOT NULL,
    drug_id INT NOT NULL,
    dose VARCHAR(50),
    frequency VARCHAR(50),
    route VARCHAR(50),
    site VARCHAR(100),
    start_date DATE,
    end_date DATE,
    guidance TEXT,
    precautions TEXT,
    FOREIGN KEY (followup_id) REFERENCES followup_info(followup_id) ON DELETE CASCADE,
    FOREIGN KEY (drug_id) REFERENCES drug_catalog(drug_id) ON DELETE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 补充之前遗漏的表
-- 14. 既往用药史
DROP TABLE IF EXISTS followup_medication_history;
CREATE TABLE followup_medication_history (
    med_hist_id INT AUTO_INCREMENT PRIMARY KEY,
    patient_id VARCHAR(20) NOT NULL,
    cephalosporins_days INT,
    macrolides_days INT,
    corticosteroids_days INT,
    antihistamines_days INT,
    ltra_days INT,
    expectorants_days INT,
    cyclosporine_days INT,
    abrocitinib_days INT,
    upadacitinib_days INT,
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id) ON DELETE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 15. 其他辅助治疗
DROP TABLE IF EXISTS followup_other_treatments;
CREATE TABLE followup_other_treatments (
    treatment_id INT AUTO_INCREMENT PRIMARY KEY,
    patient_id VARCHAR(20) NOT NULL,
    treatment_method VARCHAR(100),
    start_date DATE,
    end_date DATE,
    notes TEXT,
    bronchoscopy_date DATE,
    bronchoscopy_conclusion TEXT,
    bronchoscopy_image_path VARCHAR(255),
    oxygen_nasal_catheter BOOLEAN DEFAULT FALSE,
    oxygen_mask BOOLEAN DEFAULT FALSE,
    oxygen_high_flow BOOLEAN DEFAULT FALSE,
    mechanical_ventilation BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id) ON DELETE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 16. 调查问卷
DROP TABLE IF EXISTS followup_questionnaire_scores;
CREATE TABLE followup_questionnaire_scores (
    questionnaire_id INT AUTO_INCREMENT PRIMARY KEY,
    patient_id VARCHAR(20) NOT NULL,
    score_date DATE,
    act_score INT,
    c_act_score INT,
    track_score INT,
    symptom_medication_score INT,
    cdlqi_score INT,
    scoard_score INT,
    idqol_score INT,
    rhinitis_vas_score INT,
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id) ON DELETE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 17. 随访信息
DROP TABLE IF EXISTS followup_summary;
CREATE TABLE followup_summary (
    summary_id INT AUTO_INCREMENT PRIMARY KEY,
    patient_id VARCHAR(20) NOT NULL,
    symptom_improvement TEXT,
    physical_development TEXT,
    adverse_reaction TEXT,
    reaction_management TEXT,
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id) ON DELETE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 18. 费用
DROP TABLE IF EXISTS followup_expenses;
CREATE TABLE followup_expenses (
    expense_id INT AUTO_INCREMENT PRIMARY KEY,
    patient_id VARCHAR(20) NOT NULL,
    expense_type VARCHAR(100),
    amount DECIMAL(10,2),
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id) ON DELETE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 19. 药物不良反应
DROP TABLE IF EXISTS followup_adverse_reactions;
CREATE TABLE followup_adverse_reactions (
    reaction_id INT AUTO_INCREMENT PRIMARY KEY,
    patient_id VARCHAR(20) NOT NULL,
    medication_name VARCHAR(100),
    reaction_onset_date DATE,
    usage_method TEXT,
    duration_days INT,
    rash BOOLEAN,
    itching BOOLEAN,
    abdominal_pain BOOLEAN,
    nausea BOOLEAN,
    vomiting BOOLEAN,
    chest_tightness BOOLEAN,
    palpitations BOOLEAN,
    dyspnea BOOLEAN,
    other_reaction TEXT,
    severity_level ENUM('轻度', '中度', '重度'),
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id) ON DELETE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 重新启用外键检查
SET FOREIGN_KEY_CHECKS = 1;