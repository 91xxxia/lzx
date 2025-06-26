

-- 临床数据库
CREATE DATABASE clinical_db;
-- 专病数据库
CREATE DATABASE biobank_db;
-- 流调数据库
CREATE DATABASE epidem_db;
-- 随访数据库
CREATE DATABASE followup_db;

USE clinical_db;

-- 1. 患者基本信息
USE clinical_db;

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
USE clinical_db;

CREATE TABLE insurance_info (
	insurance_id INT AUTO_INCREMENT PRIMARY KEY,
    patient_id VARCHAR(20),
    
    insurance_type VARCHAR(50),
    insurance_number VARCHAR(50),
    
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id)
);
 
 -- 3. 联系人(方式)
 USE clinical_db;
 
 CREATE TABLE contacts (
	contact_id INT AUTO_INCREMENT PRIMARY KEY,
    patient_id VARCHAR(20),
    
    phone VARCHAR(50),
    emergency_contact VARCHAR(50),
    relationship VARCHAR(20),
    
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id)
 );
 
 -- 4. 医疗服务机构标识信息
 USE clinical_db;
 
 CREATE TABLE medical_orgs (
	org_id INT AUTO_INCREMENT PRIMARY KEY,
    patient_id VARCHAR(20),
    
    hospital_name VARCHAR(100),
    department_name VARCHAR(100),
    
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id)
 );
 
 -- 5. 医疗服务者标识信息
 USE clinical_db;
 
 CREATE TABLE providers (
	provider_id INT AUTO_INCREMENT PRIMARY KEY,
    patient_id VARCHAR(20),
    
    provider_name VARCHAR(50),
    title VARCHAR(50),
    
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id)
 );
 
 -- 6. 既往史
 USE clinical_db;
 
 CREATE TABLE history (
	history_id INT AUTO_INCREMENT PRIMARY KEY,
    patient_id VARCHAR(20),
    
    food_allergy_history TEXT,
    allergen_exposure TEXT,
    past_disease_history TEXT,
    
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id)
 );
 
 -- 7. 家族史
 USE clinical_db;
 
 CREATE TABLE family_history (
	fam_id INT AUTO_INCREMENT PRIMARY KEY,
    patient_id VARCHAR(20),
    
    relative_relation VARCHAR(50),
    allergy_disease TEXT,
    
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id)
 );
 
 -- 8. 症状及体征
 USE clinical_db;
 
 CREATE TABLE symptoms (
	symptom_id INT AUTO_INCREMENT PRIMARY KEY,
    patient_id VARCHAR(20),
    
    symptom_description TEXT,
    severity_level VARCHAR(20),
    frequency VARCHAR(20),
    onset_time DATE,
    trigger_factor TEXT,
    physical_signs TEXT,
    
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id)
 );
 
-- 9. 实验室检查
USE clinical_db;

CREATE TABLE lab_tests (
  test_id INT AUTO_INCREMENT PRIMARY KEY,
  patient_id VARCHAR(20),
  
  test_name VARCHAR(100),
  test_date DATE,
  test_result TEXT,
  
  FOREIGN KEY (patient_id) REFERENCES patients(patient_id)
);

-- 10. 肺功能检查
USE clinical_db;

CREATE TABLE lung_tests (
  lung_id INT AUTO_INCREMENT PRIMARY KEY,
  patient_id VARCHAR(20),
  
  test_name VARCHAR(100),
  test_date DATE,
  test_result TEXT,
  
  FOREIGN KEY (patient_id) REFERENCES patients(patient_id)
);

-- 11. 呼气一氧化氮检测
USE clinical_db;

CREATE TABLE feNO_tests (
  feno_id INT AUTO_INCREMENT PRIMARY KEY,
  patient_id VARCHAR(20),
  
  test_name VARCHAR(100),
  test_date DATE,
  test_result TEXT,
  
  FOREIGN KEY (patient_id) REFERENCES patients(patient_id)
);

-- 12. 影像学检查
USE clinical_db;

CREATE TABLE imaging (
  imaging_id INT AUTO_INCREMENT PRIMARY KEY,
  patient_id VARCHAR(20),
  
  imaging_type VARCHAR(100),
  imaging_date DATE,
  report TEXT,
  
  FOREIGN KEY (patient_id) REFERENCES patients(patient_id)
);

-- 13. 疾病诊断
USE clinical_db;

CREATE TABLE diagnoses (
  diagnosis_id INT AUTO_INCREMENT PRIMARY KEY,
  patient_id VARCHAR(20),
  
  disease_name VARCHAR(100),
  severity VARCHAR(50),
  diagnosis_time DATE,
  
  FOREIGN KEY (patient_id) REFERENCES patients(patient_id)
);

-- 14. 用药
USE clinical_db;

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
  
  FOREIGN KEY (patient_id) REFERENCES patients(patient_id)
);

-- 15. 既往用药史
USE clinical_db;

CREATE TABLE medications_history (
  med_his_id INT AUTO_INCREMENT PRIMARY KEY,
  patient_id VARCHAR(20),
  
  medication_name VARCHAR(100),
  duration_days INT,
  
  FOREIGN KEY (patient_id) REFERENCES patients(patient_id)
);

-- 16. 其他辅助治疗
USE clinical_db;

CREATE TABLE clinical_other_treatments (
  treatment_id INT AUTO_INCREMENT PRIMARY KEY,
  patient_id VARCHAR(20),
  
  treatment_name VARCHAR(100),
  start_time DATE,
  end_time DATE,
  note TEXT,
  
  FOREIGN KEY (patient_id) REFERENCES patients(patient_id)
);

-- 17. 随访信息
USE clinical_db;

CREATE TABLE followup_notes (
  followup_id INT AUTO_INCREMENT PRIMARY KEY,
  patient_id VARCHAR(20),
  
  symptom_improvement TEXT,                   
  physical_development TEXT,                  
  adverse_reactions TEXT,                     
  reaction_management TEXT,  
  
  FOREIGN KEY (patient_id) REFERENCES patients(patient_id)
);

-- 18. 费用
USE clinical_db;

CREATE TABLE expenses (
  expense_id INT AUTO_INCREMENT PRIMARY KEY,
  patient_id VARCHAR(20),
  
  expense_type VARCHAR(100),
  amount DECIMAL(10,2),
  
  FOREIGN KEY (patient_id) REFERENCES patients(patient_id)
);


USE biobank_db;

-- 1.1 哮喘症状
USE biobank_db;

CREATE TABLE asthma_symptoms (
  asthma_id INT AUTO_INCREMENT PRIMARY KEY,
  patient_id VARCHAR(20),
  
  -- 具体症状表现
  wheezing BOOLEAN,                  -- 喘息
  cough BOOLEAN,                     -- 咳嗽
  dyspnea BOOLEAN,                   -- 呼吸困难
  activity_limitation BOOLEAN,       -- 活动受限
  nocturnal_awakening BOOLEAN,       -- 夜间觉醒
  chest_tightness BOOLEAN,           -- 胸闷
  morning_or_night_exacerbation BOOLEAN,  -- 夜间或晨间加重

  -- 诱因触发项（可单选、多选）
  virus_trigger BOOLEAN,             -- 病毒感染
  exercise_trigger BOOLEAN,          -- 锻炼
  allergen_trigger BOOLEAN,          -- 过敏原暴露
  climate_change_trigger BOOLEAN,    -- 气候改变
  laughter_trigger BOOLEAN,          -- 大笑
  irritant_trigger BOOLEAN,          -- 刺激物触发

  -- 听诊体征
  auscultation_wheezing BOOLEAN,     -- 听诊闻哮鸣音

  -- 外键关联患者
  FOREIGN KEY (patient_id) REFERENCES clinical_db.patients(patient_id)
);

-- 1.2 过敏性鼻炎
USE biobank_db;

CREATE TABLE rhinitis_symptoms (
  rhinitis_id INT AUTO_INCREMENT PRIMARY KEY,
  patient_id VARCHAR(20) NOT NULL,

  clear_discharge BOOLEAN,                 -- 清水样鼻涕
  nasal_itching BOOLEAN,                   -- 鼻痒
  nasal_congestion BOOLEAN,                -- 鼻塞
  paroxysmal_sneeze BOOLEAN,               -- 阵发性喷嚏
  olfactory_loss BOOLEAN,                  -- 嗅觉减退
  throat_clearing BOOLEAN,                 -- 清咽喉
  nose_sniffing BOOLEAN,                   -- 吸鼻子
  dry_cough BOOLEAN,                       -- 刺激性干咳
  foreign_body_throat BOOLEAN,             -- 咽异物感
  itchy_eyes BOOLEAN,                      -- 眼痒
  frequent_blinking BOOLEAN,               -- 眨眼
  nasal_mucosa_swelling BOOLEAN,           -- 鼻腔黏膜肿胀
  nasal_mucosa_color_change BOOLEAN,       -- 黏膜苍白或充血
  nasal_discharge_present BOOLEAN,         -- 鼻道分泌物
  turbinate_hypertrophy BOOLEAN,           -- 鼻甲肥大
  dark_circles BOOLEAN,                    -- 黑眼圈
  allergic_salute BOOLEAN,                 -- 过敏性敬礼
  nasal_fold BOOLEAN,                      -- 过敏性鼻皱褶
  sleep_disorder BOOLEAN,                  -- 睡眠障碍
  activity_limitation BOOLEAN,             -- 日常活动受限
  attention_decline BOOLEAN,               -- 在校表现/工作能力下降

  FOREIGN KEY (patient_id) REFERENCES clinical_db.patients(patient_id)
);

-- 1.3 湿疹/特应性皮炎
USE biobank_db;

CREATE TABLE eczema_symptoms (
  eczema_id INT AUTO_INCREMENT PRIMARY KEY,
  patient_id VARCHAR(20) NOT NULL,

  chronic_itchy_rash BOOLEAN,                      -- 慢性复发性瘙痒性皮疹
  flexural_or_facial_dermatitis_history BOOLEAN,   -- 屈侧或面颊部皮炎史
  dry_skin BOOLEAN,                                -- 皮肤干燥
  xerosis BOOLEAN,                                 -- 干皮症
  ear_fissures BOOLEAN,                            -- 耳根裂纹
  ichthyosis BOOLEAN,                              -- 鱼鳞病
  palmar_hyperlinearity BOOLEAN,                   -- 掌纹症
  keratosis_pilaris BOOLEAN,                       -- 毛周角化症
  skin_infection_prone BOOLEAN,                    -- 皮肤感染倾向
  staph_infection_prone BOOLEAN,                   -- 金葡菌感染倾向
  herpes_infection_prone BOOLEAN,                  -- 疱疹病毒感染倾向
  dennie_morgan_folds BOOLEAN,                     -- 旦尼-莫根眶下褶痕
  periorbital_darkening BOOLEAN,                   -- 眶周黑晕
  pale_face BOOLEAN,                               -- 苍白脸
  pityriasis_alba BOOLEAN,                         -- 白色糠疹
  anterior_neck_folds BOOLEAN,                     -- 颈前皱褶

  FOREIGN KEY (patient_id) REFERENCES clinical_db.patients(patient_id)
);

-- 2.1 过敏检查
USE biobank_db;

CREATE TABLE allergy_basic_tests (
  alle_bas_id INT AUTO_INCREMENT PRIMARY KEY,
  patient_id VARCHAR(20) NOT NULL,

  skin_prick_test_result TEXT,     -- 皮肤点刺试验
  serum_specific_IgE TEXT,         -- 血清特异性IgE
  serum_total_IgE_level FLOAT,     -- 血清总IgE
  eosinophil_count INT,            -- 嗜酸性粒细胞计数

  FOREIGN KEY (patient_id) REFERENCES clinical_db.patients(patient_id)
);

-- 2.2 哮喘专项检查
USE biobank_db;

CREATE TABLE asthma_special_tests (
  ast_spe_id INT AUTO_INCREMENT PRIMARY KEY,
  patient_id VARCHAR(20) NOT NULL,

  chest_xray_result TEXT,                -- 胸部X线
  lung_function_result TEXT,             -- 肺功能
  feNO_level FLOAT,                      -- 呼出气一氧化氮
  bronchodilation_test TEXT,             -- 支气管舒张试验
  peak_flow_variability FLOAT,           -- 呼气峰值流量变异率
  exercise_challenge_result TEXT,        -- 锻炼激发试验
  bronchial_challenge_result TEXT,       -- 支气管激发试验

  FOREIGN KEY (patient_id) REFERENCES clinical_db.patients(patient_id)
);

-- 2.3 过敏性鼻炎专项检查
USE biobank_db;

CREATE TABLE rhinitis_special_tests (
  rhi_spe_id INT AUTO_INCREMENT PRIMARY KEY,
  patient_id VARCHAR(20) NOT NULL,

  nasal_challenge_result TEXT,       -- 鼻黏膜激发试验
  t_reg_cell_count INT,              -- 调节性T细胞计数
  igG4_level FLOAT,                  -- IgG4水平
  th1_cell_count INT,                -- 辅助性T细胞1计数
  th2_cell_count INT,                -- 辅助性T细胞2计数
  ecp_level FLOAT,                   -- ECP（嗜酸性粒细胞阳离子蛋白）

  FOREIGN KEY (patient_id) REFERENCES clinical_db.patients(patient_id)
);


-- 3.1 哮喘治疗
USE biobank_db;

CREATE TABLE asthma_treatments (
  ast_tre_id INT AUTO_INCREMENT PRIMARY KEY,
  patient_id VARCHAR(20) NOT NULL,

  inhaled_corticosteroids BOOLEAN,    -- 吸入性糖皮质激素
  laba BOOLEAN,                       -- 长效β2受体激动剂
  ltra BOOLEAN,                       -- 白三烯受体拮抗剂
  theophylline BOOLEAN,               -- 茶碱
  saba BOOLEAN,                       -- 短效β2受体激动剂

  FOREIGN KEY (patient_id) REFERENCES clinical_db.patients(patient_id)
);

-- 3.2 过敏性鼻炎治疗
USE biobank_db;

CREATE TABLE rhinitis_treatments (
  rhi_tre_id INT AUTO_INCREMENT PRIMARY KEY,
  patient_id VARCHAR(20) NOT NULL,

  antihistamines BOOLEAN,               -- 抗组胺药
  corticosteroids BOOLEAN,              -- 糖皮质激素（可用于鼻喷）
  ltra BOOLEAN,                         -- 白三烯受体拮抗剂
  mast_cell_stabilizers BOOLEAN,        -- 肥大细胞膜稳定剂
  anticholinergics BOOLEAN,             -- 抗胆碱能药

  FOREIGN KEY (patient_id) REFERENCES clinical_db.patients(patient_id)
);

-- 3.3 湿疹治疗
USE biobank_db;

CREATE TABLE eczema_treatments (
  ecz_tre_id INT AUTO_INCREMENT PRIMARY KEY,
  patient_id VARCHAR(20) NOT NULL,

  corticosteroids BOOLEAN,              -- 外用糖皮质激素
  calcineurin_inhibitors BOOLEAN,       -- 钙调神经磷酸酶抑制剂

  FOREIGN KEY (patient_id) REFERENCES clinical_db.patients(patient_id)
);

-- 3.4 食物过敏治疗
USE biobank_db;

CREATE TABLE food_allergy_treatments (
  food_alle_tre_id INT AUTO_INCREMENT PRIMARY KEY,
  patient_id VARCHAR(20) NOT NULL,

  corticosteroids BOOLEAN,              -- 糖皮质激素
  antihistamines BOOLEAN,               -- 抗组胺药

  FOREIGN KEY (patient_id) REFERENCES clinical_db.patients(patient_id)
);

-- 4. 其他辅助治疗
USE biobank_db;

CREATE TABLE biobank_other_treatments (
	other_tre_id INT AUTO_INCREMENT PRIMARY KEY,
    patient_id VARCHAR(20) NOT NULL,
    
	allergen_immunotherapy BOOLEAN,     -- 过敏原特异性免疫治疗
    anti_IgE_therapy BOOLEAN,           -- 抗免疫球蛋白E抗体治疗

    FOREIGN KEY (patient_id) REFERENCES clinical_db.patients(patient_id)    
);


-- 1、患儿基本信息
USE epidem_db;

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
  
  FOREIGN KEY (patient_id) REFERENCES clinical_db.patients(patient_id)
);

-- 2、医疗调查服务者标识信息
USE epidem_db;

CREATE TABLE survey_providers (
  provider_id INT AUTO_INCREMENT PRIMARY KEY,
  survey_id INT NOT NULL,
  
  name VARCHAR(50),
  title ENUM('住院医师', '主治医师', '副主任医师', '主任医师'),
  
  FOREIGN KEY (survey_id) REFERENCES survey_basic_info(survey_id)
);

-- 3、家庭环境暴露信息（过去一年）
USE epidem_db;

CREATE TABLE survey_environment_exposure (
  env_id INT AUTO_INCREMENT PRIMARY KEY,
  survey_id INT NOT NULL,

  -- 居住信息
  house_type ENUM('平房','楼房','别墅','其他'),
  building_material ENUM('木质','混凝土','其他'),
  ventilation_freq ENUM('每日','每周','偶尔'),

  -- 空调使用
  ac_usage_season ENUM('几乎不用','夏季每日','全年高频'),
  ac_usage_freq ENUM('每日','每周3-5天','偶尔'),
  ac_temp_setting ENUM('＜24℃','24-26℃','＞26℃'),
  ac_modes TEXT,
  ac_filter_cleaning_freq ENUM('每月','每季度','每年','从未清洁'),

  -- 暖气使用
  heating_type TEXT,
  heating_temp_range ENUM('＜18℃','18-22℃','＞22℃'),

  -- 室内物品
  has_carpet BOOLEAN,
  has_soft_toys BOOLEAN,

  -- 室内过敏原检测
  pm25_avg FLOAT,
  pollen_info TEXT,
  formaldehyde_level FLOAT,
  formaldehyde_test_time DATE,
  dust_mite_level TEXT,
  other_allergens TEXT,

  -- 生活习惯
  exercise_frequency INT,
  exercise_duration INT,
  exercise_intensity ENUM('轻','中','重'),
  swimming BOOLEAN,
  sleep_hours FLOAT,
  insomnia BOOLEAN,
  circadian_disruption BOOLEAN,
  smoke_exposure_type ENUM('主动','被动暴露','无'),
  cleaning_freq ENUM('每日','每周','每月'),

  -- 宠物及环境暴露
  has_pets BOOLEAN,
  pet_types TEXT,
  pet_count INT,
  lives_with_smoker BOOLEAN,

  cooking_fuel ENUM('天然气','煤气','生物质燃料'),
  uses_air_purifier BOOLEAN,
  uses_vacuum_cleaner BOOLEAN,

  -- 回避措施执行
  avoidance_quality ENUM('优','良','差'),

  FOREIGN KEY (survey_id) REFERENCES survey_basic_info(survey_id)
);

-- 4、学习/工作环境信息（过去一年）
USE epidem_db;

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

  FOREIGN KEY (survey_id) REFERENCES survey_basic_info(survey_id)
);

-- 5、城乡环境监测数据（过去一年）
USE epidem_db;

CREATE TABLE survey_area_environment (
  env_area_id INT AUTO_INCREMENT PRIMARY KEY,
  survey_id INT NOT NULL,

  -- 城市环境
  urban_pm25_avg FLOAT,
  urban_pm25_seasonal TEXT,
  urban_pollen_types TEXT,
  urban_pollen_distribution TEXT,
  urban_pollen_peak FLOAT,
  urban_pollutants TEXT,
  urban_monitor_location ENUM('交通区','工业区','居民区'),

  -- 农村环境
  rural_pm25_burning FLOAT,
  rural_pm25_avg FLOAT,
  rural_pollen_types TEXT,
  rural_biomass_pollution BOOLEAN,
  rural_water_source ENUM('自来水','纯净水','井水','其他'),

  FOREIGN KEY (survey_id) REFERENCES survey_basic_info(survey_id)
);

-- 6、家族史 （因为一个调查者可能有多个亲属记录（例如既有母亲患哮喘，又有哥哥患鼻炎），
-- 所以建议将一级亲属与二级亲属分别作为两个子表，每条记录对应一个亲属。）
-- 主表：家族环境概况（仅暴露项）
CREATE TABLE survey_family_env (
  family_env_id INT AUTO_INCREMENT PRIMARY KEY,
  survey_id INT NOT NULL,
  shared_smoking_exposure BOOLEAN,
  FOREIGN KEY (survey_id) REFERENCES survey_basic_info(survey_id)
);

-- 子表 1：一级亲属过敏史
CREATE TABLE family_history_primary (
  prim_id INT AUTO_INCREMENT PRIMARY KEY,
  survey_id INT NOT NULL,
  relation VARCHAR(20),
  diseases TEXT,
  FOREIGN KEY (survey_id) REFERENCES survey_basic_info(survey_id)
);

-- 子表 2：二级亲属过敏史
CREATE TABLE family_history_secondary (
  sec_id INT AUTO_INCREMENT PRIMARY KEY,
  survey_id INT NOT NULL,
  relation VARCHAR(20),
  diseases TEXT,
  FOREIGN KEY (survey_id) REFERENCES survey_basic_info(survey_id)
);

-- 7、其他潜在混杂因素
USE epidem_db;

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

  FOREIGN KEY (survey_id) REFERENCES survey_basic_info(survey_id)
);

-- 8、环境监测方法
USE epidem_db;

CREATE TABLE survey_monitoring_methods (
  method_id INT AUTO_INCREMENT PRIMARY KEY,
  survey_id INT NOT NULL,

  pm25_detector_model VARCHAR(100),

  -- 花粉采样方法（多选）
  pollen_gravity_settle BOOLEAN,
  pollen_volume_sampling BOOLEAN,
  pollen_molecular_detection BOOLEAN,

  -- 尘螨检测方法（多选）
  mite_protein_detection BOOLEAN,
  mite_microscope_count BOOLEAN,
  mite_pcr BOOLEAN,
  mite_metabolite BOOLEAN,
  mite_air_sampling BOOLEAN,
  mite_sensor_tech BOOLEAN,

  FOREIGN KEY (survey_id) REFERENCES survey_basic_info(survey_id)
);


-- 1、患儿基本信息
USE followup_db;

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

  FOREIGN KEY (patient_id) REFERENCES clinical_db.patients(patient_id)
);

-- 2、随访医疗服务者
USE followup_db;

CREATE TABLE followup_providers (
  provider_id INT AUTO_INCREMENT PRIMARY KEY,
  followup_id INT NOT NULL,
  provider_name VARCHAR(50),
  title ENUM('住院医师','主治医师','副主任医师','主任医师'),

  FOREIGN KEY (followup_id) REFERENCES followup_info(followup_id)
);

-- 3、症状
CREATE TABLE followup_symptoms (
  symptom_id INT AUTO_INCREMENT PRIMARY KEY,
  followup_id INT NOT NULL,

  -- 多项症状（BOOLEAN）
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

  -- 症状严重程度
  severity ENUM('轻度','中度','重度','极重度'),

  -- 频率与发作情况
  frequency_pattern TEXT,  -- 例如："每日2次，反复，月发作5次"

  -- 起始时间
  start_date DATE,

  -- ✅ 多项诱因（BOOLEAN）
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

  FOREIGN KEY (followup_id) REFERENCES followup_info(followup_id)
);

-- 4、体征
USE followup_db;

CREATE TABLE followup_physical_exam (
  exam_id INT AUTO_INCREMENT PRIMARY KEY,
  followup_id INT NOT NULL,

  -- 生命体征
  temperature_c FLOAT,
  pulse_bpm INT,
  spo2_percent INT,
  oxygen_used BOOLEAN,

  -- 意识与外观
  consciousness ENUM('清醒', '谵妄', '昏睡', '昏迷'),
  mental_state ENUM('良好', '倦怠'),
  breathing_pattern ENUM('匀称', '急促', '不规则'),
  appearance ENUM('消瘦', '正常', '肥胖'),

  -- 鼻腔检查
  nasal_mucosa_pale BOOLEAN,
  nasal_mucosa_edema BOOLEAN,
  nasal_mucosa_swelling BOOLEAN,
  nasal_mucosa_clear_discharge BOOLEAN,
  nasal_score INT,

  -- 三凹征
  three_depression_sign BOOLEAN,

  -- 左肺听诊
  left_lung_sound ENUM('清', '粗'),
  left_dry_rales_present BOOLEAN,
  left_dry_rales_distribution ENUM('无', '散在', '满布'),
  left_wet_rales_present BOOLEAN,
  left_wet_rales_distribution ENUM('无', '散在', '满布'),

  -- 右肺听诊
  right_lung_sound ENUM('清', '粗'),
  right_dry_rales_present BOOLEAN,
  right_dry_rales_distribution ENUM('无', '散在', '满布'),
  right_wet_rales_present BOOLEAN,
  right_wet_rales_distribution ENUM('无', '散在', '满布'),

  -- 心脏
  heart_rate INT,
  heart_rhythm ENUM('整齐', '不齐'),
  heart_murmur_present BOOLEAN,
  heart_murmur_type ENUM('无', '收缩期', '舒张期'),

  -- 腹部
  abdomen_shape ENUM('平坦', '隆起', '凹陷'),
  abdomen_tenderness BOOLEAN,
  rebound_tenderness BOOLEAN,

  -- 皮疹：头颈
  head_neck_erythema BOOLEAN,
  head_neck_papule BOOLEAN,
  head_neck_exudation BOOLEAN,
  head_neck_desquamation BOOLEAN,
  head_neck_lichenification BOOLEAN,
  head_neck_dryness BOOLEAN,
  head_neck_other TEXT,

  -- 上肢
  upper_limb_erythema BOOLEAN,
  upper_limb_papule BOOLEAN,
  upper_limb_exudation BOOLEAN,
  upper_limb_desquamation BOOLEAN,
  upper_limb_lichenification BOOLEAN,
  upper_limb_dryness BOOLEAN,
  upper_limb_other TEXT,

  -- 躯干
  trunk_erythema BOOLEAN,
  trunk_papule BOOLEAN,
  trunk_exudation BOOLEAN,
  trunk_desquamation BOOLEAN,
  trunk_lichenification BOOLEAN,
  trunk_dryness BOOLEAN,
  trunk_other TEXT,

  -- 下肢
  lower_limb_erythema BOOLEAN,
  lower_limb_papule BOOLEAN,
  lower_limb_exudation BOOLEAN,
  lower_limb_desquamation BOOLEAN,
  lower_limb_lichenification BOOLEAN,
  lower_limb_dryness BOOLEAN,
  lower_limb_other TEXT,

  -- 生殖器
  genital_erythema BOOLEAN,
  genital_papule BOOLEAN,
  genital_exudation BOOLEAN,
  genital_desquamation BOOLEAN,
  genital_lichenification BOOLEAN,
  genital_dryness BOOLEAN,
  genital_other TEXT,

  -- 呼吸音（电子）
  electronic_breath_sound_path TEXT,

  FOREIGN KEY (followup_id) REFERENCES followup_info(followup_id)
);

-- 5、实验室检查
USE followup_db;

CREATE Table followup_lab_tests (
  labtest_id INT AUTO_INCREMENT PRIMARY KEY,
  followup_id INT NOT NULL,

  -- 血常规
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

  -- 过敏原组合
  allergen_combo_test_date DATE,
  total_IgE FLOAT,
  dust_mite_combo BOOLEAN,
  mold_combo BOOLEAN,
  pet_dander_combo BOOLEAN,
  food_combo BOOLEAN,
  nut_combo BOOLEAN,

  -- 过敏原单项
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

  -- 皮肤点刺试验
  skin_prick_test_date DATE,
  prick_house_dust_mite BOOLEAN,
  prick_dust_mite BOOLEAN,

  -- 痰嗜酸检测
  sputum_eosinophil_test_date DATE,
  sputum_eosinophil_count FLOAT,

  -- 总IgE独立记录
  total_IgE_repeat_test_date DATE,
  total_IgE_repeat_value FLOAT,

  FOREIGN KEY (followup_id) REFERENCES followup_info(followup_id)
);

-- 6、肺功能检查
USE followup_db;

CREATE TABLE followup_pulmonary_tests (
  test_id INT AUTO_INCREMENT PRIMARY KEY,
  followup_id INT NOT NULL,

  -- 肺功能测试
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

  -- 支气管舒张试验
  bronchodilation_test_date DATE,
  bronchodilation_result ENUM('阳性', '阴性'),

  -- 支气管激发试验
  bronchial_challenge_test_date DATE,
  bronchial_challenge_result ENUM('阳性', '阴性'),

  -- 潮气肺功能检查
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

  FOREIGN KEY (followup_id) REFERENCES followup_info(followup_id)
);

-- 7、呼出气一氧化氮检测
USE followup_db;

CREATE TABLE followup_feno_tests (
  feno_id INT AUTO_INCREMENT PRIMARY KEY,
  followup_id INT NOT NULL,

  test_date DATE,
  feno50 FLOAT,
  feno200 FLOAT,
  cano FLOAT,

  FOREIGN KEY (followup_id) REFERENCES followup_info(followup_id)
);

-- 8、电子鼻咽喉镜
USE followup_db;

CREATE TABLE followup_endoscopy (
  endoscopy_id INT AUTO_INCREMENT PRIMARY KEY,
  followup_id INT NOT NULL,

  test_name VARCHAR(100),
  test_date DATE,
  result TEXT,
  conclusion TEXT,

  FOREIGN KEY (followup_id) REFERENCES followup_info(followup_id)
);

-- 9、听力检查
USE followup_db;
 
CREATE TABLE followup_audiology_tests (
  audio_id INT AUTO_INCREMENT PRIMARY KEY,
  followup_id INT NOT NULL,

  test_name VARCHAR(100),
  test_date DATE,
  tympanometry BOOLEAN,
  pure_tone_audiometry BOOLEAN,
  result TEXT,

  FOREIGN KEY (followup_id) REFERENCES followup_info(followup_id)
);

-- 10、鼻阻力
USE followup_db;

CREATE TABLE followup_nasal_resistance_tests (
  nasal_id INT AUTO_INCREMENT PRIMARY KEY,
  followup_id INT NOT NULL,

  test_name VARCHAR(100),
  test_date DATE,
  result TEXT,
  conclusion TEXT,

  FOREIGN KEY (followup_id) REFERENCES followup_info(followup_id)
);

-- 11、影像学检查
USE followup_db;

CREATE TABLE followup_imaging (
  imaging_id INT AUTO_INCREMENT PRIMARY KEY,
  followup_id INT NOT NULL,

  test_name VARCHAR(100),
  test_date DATE,
  image_path TEXT,         -- 影像导入，可为文件路径或链接
  conclusion TEXT,

  FOREIGN KEY (followup_id) REFERENCES followup_info(followup_id)
);

-- 12、疾病诊断
USE followup_db;

CREATE TABLE followup_diagnoses (
  diagnosis_id INT AUTO_INCREMENT PRIMARY KEY,
  followup_id INT NOT NULL,

  diagnosis_date DATE,

  -- 支气管哮喘
  asthma_phase ENUM('无', '急性发作期', '临床缓解期', '慢性持续期'),
  asthma_severity ENUM('无', '轻度', '中度', '重度', '极重度'),

  -- 过敏性鼻炎
  rhinitis_severity ENUM('无', '轻度', '中-重度'),
  rhinitis_type ENUM('无', '季节性', '常年性'),
  rhinitis_duration ENUM('无', '间歇性', '持续性'),

  -- 特应性皮炎
  dermatitis_present BOOLEAN,
  dermatitis_severity ENUM('无', '轻度', '中重度'),

  -- 鼻窦炎
  sinusitis_phase ENUM('无', '急性', '慢性'),

  -- 其它诊断
  adenoid_hypertrophy BOOLEAN,
  tonsil_hypertrophy BOOLEAN,
  snoring BOOLEAN,
  osa_hypopnea_syndrome BOOLEAN,
  allergic_conjunctivitis BOOLEAN,

  other_diagnoses TEXT,

  FOREIGN KEY (followup_id) REFERENCES followup_info(followup_id)
);

-- 13、用药
USE followup_db;

CREATE TABLE drug_catalog (
  drug_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL,              -- 药品名称，如“布地奈德”
  brand VARCHAR(100),                      -- 品牌或厂家
  type VARCHAR(50),                        -- 剂型，如“吸入剂”、“片剂”、“软膏”

  -- 分类标签
  is_steroid BOOLEAN DEFAULT FALSE,        -- 是否为糖皮质激素类
  is_antihistamine BOOLEAN DEFAULT FALSE,  -- 是否为抗组胺药
  is_ltra BOOLEAN DEFAULT FALSE,           -- 白三烯受体拮抗剂
  is_bronchodilator BOOLEAN DEFAULT FALSE, -- 支气管扩张剂
  is_antibiotic BOOLEAN DEFAULT FALSE,     -- 抗生素
  is_topical BOOLEAN DEFAULT FALSE,        -- 是否为外用药
  is_nasal BOOLEAN DEFAULT FALSE,          -- 鼻喷剂
  is_expectorant BOOLEAN DEFAULT FALSE,    -- 祛痰药
  is_immunotherapy BOOLEAN DEFAULT FALSE,  -- 是否为免疫治疗药
  is_anti_IgE BOOLEAN DEFAULT FALSE,       -- 抗IgE药物
  is_targeted BOOLEAN DEFAULT FALSE        -- 靶向治疗药物
);

USE followup_db;

CREATE TABLE followup_visits (
  followup_id INT AUTO_INCREMENT PRIMARY KEY,
  patient_id VARCHAR(20) NOT NULL,
  visit_date DATE,
  visit_type VARCHAR(20)                  -- 初诊/复诊等

  
);

USE followup_db;

CREATE TABLE followup_medications (
  med_id INT AUTO_INCREMENT PRIMARY KEY,
  followup_id INT NOT NULL,
  drug_id INT NOT NULL,

  dose VARCHAR(50),                        -- 每次剂量
  frequency VARCHAR(50),                   -- 给药频率
  route VARCHAR(50),                       -- 给药途径
  site VARCHAR(100),                       -- 给药部位
  start_date DATE,                         -- 开始时间
  end_date DATE,                           -- 终止时间
  guidance TEXT,                           -- 用药指导
  precautions TEXT,                        -- 注意事项

  FOREIGN KEY (followup_id) REFERENCES followup_info(followup_id),
  FOREIGN KEY (drug_id) REFERENCES drug_catalog(drug_id)
);

-- 14、既往用药史
USE followup_db;

CREATE TABLE followup_medication_history (
  med_hist_id INT AUTO_INCREMENT PRIMARY KEY,
  patient_id VARCHAR(20) NOT NULL,

  cephalosporins_days INT,       -- 头孢类抗生素使用天数
  macrolides_days INT,           -- 大环内酯类抗生素使用天数
  corticosteroids_days INT,      -- 糖皮质激素使用天数
  antihistamines_days INT,       -- 抗组胺药使用天数
  ltra_days INT,                 -- 白三烯受体拮抗剂使用天数
  expectorants_days INT,         -- 祛痰药使用天数
  cyclosporine_days INT,         -- 环孢素使用天数
  abrocitinib_days INT,          -- 阿布希替尼使用天数
  upadacitinib_days INT         -- 乌帕替尼使用天数

  
);

-- 15、其他辅助治疗
USE followup_db;

CREATE TABLE followup_other_treatments (
  treatment_id INT AUTO_INCREMENT PRIMARY KEY,
  patient_id VARCHAR(20) NOT NULL,

  treatment_method VARCHAR(100),      -- 治疗方法名称，如“支气管镜检查”、“吸氧”
  start_date DATE,
  end_date DATE,
  notes TEXT,                         -- 注意事项或备注

  -- 可选字段，适用于支气管镜等特殊情况
  bronchoscopy_date DATE,
  bronchoscopy_conclusion TEXT,
  bronchoscopy_image_path VARCHAR(255), -- 图片导入路径，可用于文件系统或云存储引用

  -- 吸氧方式（多选场景可拆为多个 BOOLEAN）
  oxygen_nasal_catheter BOOLEAN DEFAULT FALSE,
  oxygen_mask BOOLEAN DEFAULT FALSE,
  oxygen_high_flow BOOLEAN DEFAULT FALSE,
  mechanical_ventilation BOOLEAN DEFAULT FALSE

  
);

-- 16、调查问卷
USE followup_db;

CREATE TABLE followup_questionnaire_scores (
  questionnaire_id INT AUTO_INCREMENT PRIMARY KEY,
  patient_id VARCHAR(20) NOT NULL,

  score_date DATE,

  act_score INT,                         -- ACT评分问卷（≥12岁）
  c_act_score INT,                       -- C-ACT评分（4-11岁）
  track_score INT,                       -- TRACK评分（≤5岁）

  symptom_medication_score INT,          -- 症状药物评分
  cdlqi_score INT,                       -- 儿童皮肤病生活治疗指数
  scoard_score INT,                      -- 儿童特应性皮炎Scoard评分
  idqol_score INT,                       -- 婴儿皮肤病生活质量指数
  rhinitis_vas_score INT                -- 鼻炎VAS评分

  
);

-- 17、随访信息
USE followup_db;

CREATE TABLE followup_summary (
  summary_id INT AUTO_INCREMENT PRIMARY KEY,
  patient_id VARCHAR(20) NOT NULL,

  symptom_improvement TEXT,              -- 过敏症状改善情况
  physical_development TEXT,             -- 身体发育情况
  adverse_reaction TEXT,                 -- 药物不良反应总结
  reaction_management TEXT              -- 不良反应处理方法

  
);

-- 18、费用
USE followup_db;

CREATE TABLE followup_expenses (
  expense_id INT AUTO_INCREMENT PRIMARY KEY,
  patient_id VARCHAR(20) NOT NULL,

  expense_type VARCHAR(100),             -- 费用类别（如药品费、检查费）
  amount DECIMAL(10,2)                  -- 金额，精确两位小数

  
);

-- 19、药物不良反应
USE followup_db;

CREATE TABLE followup_adverse_reactions (
  reaction_id INT AUTO_INCREMENT PRIMARY KEY,
  patient_id VARCHAR(20) NOT NULL,

  medication_name VARCHAR(100),          -- 药品名称
  reaction_onset_date DATE,              -- 不良反应发生时间
  usage_method TEXT,                     -- 药物用法用量
  duration_days INT,                     -- 服用天数

  rash BOOLEAN,                          -- 皮疹
  itching BOOLEAN,                       -- 瘙痒
  abdominal_pain BOOLEAN,                -- 腹痛
  nausea BOOLEAN,                        -- 恶心
  vomiting BOOLEAN,                      -- 呕吐
  chest_tightness BOOLEAN,               -- 胸闷
  palpitations BOOLEAN,                  -- 心悸
  dyspnea BOOLEAN,                       -- 呼吸困难
  other_reaction TEXT,                   -- 其它症状描述

  severity_level ENUM('轻度', '中度', '重度')  -- 严重程度

  
);

