package com.ruoyi.EpidemSys.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 家庭环境暴露信息对象 survey_environment_exposure
 * 
 * @author ruoyi
 * @date 2025-06-28
 */
public class SurveyEnvironmentExposure extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 家庭环境号 */
    private Long envId;

    /** 患者号 */
    @Excel(name = "患者号")
    private Long surveyId;

    /** 房屋类型 */
    @Excel(name = "房屋类型")
    private String houseType;

    /** 建筑材料 */
    @Excel(name = "建筑材料")
    private String buildingMaterial;

    /** 通风频率 */
    @Excel(name = "通风频率")
    private String ventilationFreq;

    /** 空调使用季节 */
    @Excel(name = "空调使用季节")
    private String acUsageSeason;

    /** 空调使用频率 */
    @Excel(name = "空调使用频率")
    private String acUsageFreq;

    /** 空调温度设定 */
    @Excel(name = "空调温度设定")
    private String acTempSetting;

    /** 空调模式 */
    @Excel(name = "空调模式")
    private String acModes;

    /** 空调滤网清洁频率 */
    @Excel(name = "空调滤网清洁频率")
    private String acFilterCleaningFreq;

    /** 暖气使用频率 */
    @Excel(name = "暖气使用频率")
    private String heatingType;

    /** 室温范围 */
    @Excel(name = "室温范围")
    private String heatingTempRange;

    /** 有无地毯 */
    @Excel(name = "有无地毯")
    private Integer hasCarpet;

    /** 有无毛绒玩具 */
    @Excel(name = "有无毛绒玩具")
    private Integer hasSoftToys;

    /** PM2.5家庭年均浓度 */
    @Excel(name = "PM2.5家庭年均浓度")
    private Long pm25Avg;

    /** 花粉信息 */
    @Excel(name = "花粉信息")
    private String pollenInfo;

    /** 甲醛浓度 */
    @Excel(name = "甲醛浓度")
    private Long formaldehydeLevel;

    /** 甲醛检测时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "甲醛检测时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date formaldehydeTestTime;

    /** 尘螨浓度 */
    @Excel(name = "尘螨浓度")
    private String dustMiteLevel;

    /** 其他过敏源 */
    @Excel(name = "其他过敏源")
    private String otherAllergens;

    /** 运动频率 */
    @Excel(name = "运动频率")
    private Long exerciseFrequency;

    /** 运动时间 */
    @Excel(name = "运动时间")
    private Long exerciseDuration;

    /** 运动强度 */
    @Excel(name = "运动强度")
    private String exerciseIntensity;

    /** 有无游泳 */
    @Excel(name = "有无游泳")
    private Integer swimming;

    /** 睡眠时长 */
    @Excel(name = "睡眠时长")
    private Long sleepHours;

    /** 有无失眠 */
    @Excel(name = "有无失眠")
    private Integer insomnia;

    /** 昼夜节律紊乱 */
    @Excel(name = "昼夜节律紊乱")
    private Integer circadianDisruption;

    /** 烟酒暴露情况 */
    @Excel(name = "烟酒暴露情况")
    private String smokeExposureType;

    /** 清洁频率 */
    @Excel(name = "清洁频率")
    private String cleaningFreq;

    /** 有无宠物 */
    @Excel(name = "有无宠物")
    private Integer hasPets;

    /** 宠物类型 */
    @Excel(name = "宠物类型")
    private String petTypes;

    /** 宠物数量 */
    @Excel(name = "宠物数量")
    private Long petCount;

    /** 吸烟者同居情况 */
    @Excel(name = "吸烟者同居情况")
    private Integer livesWithSmoker;

    /** 烹饪燃料 */
    @Excel(name = "烹饪燃料")
    private String cookingFuel;

    /** 空气净化器使用 */
    @Excel(name = "空气净化器使用")
    private Integer usesAirPurifier;

    /** 吸尘器使用 */
    @Excel(name = "吸尘器使用")
    private Integer usesVacuumCleaner;

    /** 过敏源回避措施执行情况 */
    @Excel(name = "过敏源回避措施执行情况")
    private String avoidanceQuality;

    public void setEnvId(Long envId) 
    {
        this.envId = envId;
    }

    public Long getEnvId() 
    {
        return envId;
    }

    public void setSurveyId(Long surveyId) 
    {
        this.surveyId = surveyId;
    }

    public Long getSurveyId() 
    {
        return surveyId;
    }

    public void setHouseType(String houseType) 
    {
        this.houseType = houseType;
    }

    public String getHouseType() 
    {
        return houseType;
    }

    public void setBuildingMaterial(String buildingMaterial) 
    {
        this.buildingMaterial = buildingMaterial;
    }

    public String getBuildingMaterial() 
    {
        return buildingMaterial;
    }

    public void setVentilationFreq(String ventilationFreq) 
    {
        this.ventilationFreq = ventilationFreq;
    }

    public String getVentilationFreq() 
    {
        return ventilationFreq;
    }

    public void setAcUsageSeason(String acUsageSeason) 
    {
        this.acUsageSeason = acUsageSeason;
    }

    public String getAcUsageSeason() 
    {
        return acUsageSeason;
    }

    public void setAcUsageFreq(String acUsageFreq) 
    {
        this.acUsageFreq = acUsageFreq;
    }

    public String getAcUsageFreq() 
    {
        return acUsageFreq;
    }

    public void setAcTempSetting(String acTempSetting) 
    {
        this.acTempSetting = acTempSetting;
    }

    public String getAcTempSetting() 
    {
        return acTempSetting;
    }

    public void setAcModes(String acModes) 
    {
        this.acModes = acModes;
    }

    public String getAcModes() 
    {
        return acModes;
    }

    public void setAcFilterCleaningFreq(String acFilterCleaningFreq) 
    {
        this.acFilterCleaningFreq = acFilterCleaningFreq;
    }

    public String getAcFilterCleaningFreq() 
    {
        return acFilterCleaningFreq;
    }

    public void setHeatingType(String heatingType) 
    {
        this.heatingType = heatingType;
    }

    public String getHeatingType() 
    {
        return heatingType;
    }

    public void setHeatingTempRange(String heatingTempRange) 
    {
        this.heatingTempRange = heatingTempRange;
    }

    public String getHeatingTempRange() 
    {
        return heatingTempRange;
    }

    public void setHasCarpet(Integer hasCarpet) 
    {
        this.hasCarpet = hasCarpet;
    }

    public Integer getHasCarpet() 
    {
        return hasCarpet;
    }

    public void setHasSoftToys(Integer hasSoftToys) 
    {
        this.hasSoftToys = hasSoftToys;
    }

    public Integer getHasSoftToys() 
    {
        return hasSoftToys;
    }

    public void setPm25Avg(Long pm25Avg) 
    {
        this.pm25Avg = pm25Avg;
    }

    public Long getPm25Avg() 
    {
        return pm25Avg;
    }

    public void setPollenInfo(String pollenInfo) 
    {
        this.pollenInfo = pollenInfo;
    }

    public String getPollenInfo() 
    {
        return pollenInfo;
    }

    public void setFormaldehydeLevel(Long formaldehydeLevel) 
    {
        this.formaldehydeLevel = formaldehydeLevel;
    }

    public Long getFormaldehydeLevel() 
    {
        return formaldehydeLevel;
    }

    public void setFormaldehydeTestTime(Date formaldehydeTestTime) 
    {
        this.formaldehydeTestTime = formaldehydeTestTime;
    }

    public Date getFormaldehydeTestTime() 
    {
        return formaldehydeTestTime;
    }

    public void setDustMiteLevel(String dustMiteLevel) 
    {
        this.dustMiteLevel = dustMiteLevel;
    }

    public String getDustMiteLevel() 
    {
        return dustMiteLevel;
    }

    public void setOtherAllergens(String otherAllergens) 
    {
        this.otherAllergens = otherAllergens;
    }

    public String getOtherAllergens() 
    {
        return otherAllergens;
    }

    public void setExerciseFrequency(Long exerciseFrequency) 
    {
        this.exerciseFrequency = exerciseFrequency;
    }

    public Long getExerciseFrequency() 
    {
        return exerciseFrequency;
    }

    public void setExerciseDuration(Long exerciseDuration) 
    {
        this.exerciseDuration = exerciseDuration;
    }

    public Long getExerciseDuration() 
    {
        return exerciseDuration;
    }

    public void setExerciseIntensity(String exerciseIntensity) 
    {
        this.exerciseIntensity = exerciseIntensity;
    }

    public String getExerciseIntensity() 
    {
        return exerciseIntensity;
    }

    public void setSwimming(Integer swimming) 
    {
        this.swimming = swimming;
    }

    public Integer getSwimming() 
    {
        return swimming;
    }

    public void setSleepHours(Long sleepHours) 
    {
        this.sleepHours = sleepHours;
    }

    public Long getSleepHours() 
    {
        return sleepHours;
    }

    public void setInsomnia(Integer insomnia) 
    {
        this.insomnia = insomnia;
    }

    public Integer getInsomnia() 
    {
        return insomnia;
    }

    public void setCircadianDisruption(Integer circadianDisruption) 
    {
        this.circadianDisruption = circadianDisruption;
    }

    public Integer getCircadianDisruption() 
    {
        return circadianDisruption;
    }

    public void setSmokeExposureType(String smokeExposureType) 
    {
        this.smokeExposureType = smokeExposureType;
    }

    public String getSmokeExposureType() 
    {
        return smokeExposureType;
    }

    public void setCleaningFreq(String cleaningFreq) 
    {
        this.cleaningFreq = cleaningFreq;
    }

    public String getCleaningFreq() 
    {
        return cleaningFreq;
    }

    public void setHasPets(Integer hasPets) 
    {
        this.hasPets = hasPets;
    }

    public Integer getHasPets() 
    {
        return hasPets;
    }

    public void setPetTypes(String petTypes) 
    {
        this.petTypes = petTypes;
    }

    public String getPetTypes() 
    {
        return petTypes;
    }

    public void setPetCount(Long petCount) 
    {
        this.petCount = petCount;
    }

    public Long getPetCount() 
    {
        return petCount;
    }

    public void setLivesWithSmoker(Integer livesWithSmoker) 
    {
        this.livesWithSmoker = livesWithSmoker;
    }

    public Integer getLivesWithSmoker() 
    {
        return livesWithSmoker;
    }

    public void setCookingFuel(String cookingFuel) 
    {
        this.cookingFuel = cookingFuel;
    }

    public String getCookingFuel() 
    {
        return cookingFuel;
    }

    public void setUsesAirPurifier(Integer usesAirPurifier) 
    {
        this.usesAirPurifier = usesAirPurifier;
    }

    public Integer getUsesAirPurifier() 
    {
        return usesAirPurifier;
    }

    public void setUsesVacuumCleaner(Integer usesVacuumCleaner) 
    {
        this.usesVacuumCleaner = usesVacuumCleaner;
    }

    public Integer getUsesVacuumCleaner() 
    {
        return usesVacuumCleaner;
    }

    public void setAvoidanceQuality(String avoidanceQuality) 
    {
        this.avoidanceQuality = avoidanceQuality;
    }

    public String getAvoidanceQuality() 
    {
        return avoidanceQuality;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("envId", getEnvId())
            .append("surveyId", getSurveyId())
            .append("houseType", getHouseType())
            .append("buildingMaterial", getBuildingMaterial())
            .append("ventilationFreq", getVentilationFreq())
            .append("acUsageSeason", getAcUsageSeason())
            .append("acUsageFreq", getAcUsageFreq())
            .append("acTempSetting", getAcTempSetting())
            .append("acModes", getAcModes())
            .append("acFilterCleaningFreq", getAcFilterCleaningFreq())
            .append("heatingType", getHeatingType())
            .append("heatingTempRange", getHeatingTempRange())
            .append("hasCarpet", getHasCarpet())
            .append("hasSoftToys", getHasSoftToys())
            .append("pm25Avg", getPm25Avg())
            .append("pollenInfo", getPollenInfo())
            .append("formaldehydeLevel", getFormaldehydeLevel())
            .append("formaldehydeTestTime", getFormaldehydeTestTime())
            .append("dustMiteLevel", getDustMiteLevel())
            .append("otherAllergens", getOtherAllergens())
            .append("exerciseFrequency", getExerciseFrequency())
            .append("exerciseDuration", getExerciseDuration())
            .append("exerciseIntensity", getExerciseIntensity())
            .append("swimming", getSwimming())
            .append("sleepHours", getSleepHours())
            .append("insomnia", getInsomnia())
            .append("circadianDisruption", getCircadianDisruption())
            .append("smokeExposureType", getSmokeExposureType())
            .append("cleaningFreq", getCleaningFreq())
            .append("hasPets", getHasPets())
            .append("petTypes", getPetTypes())
            .append("petCount", getPetCount())
            .append("livesWithSmoker", getLivesWithSmoker())
            .append("cookingFuel", getCookingFuel())
            .append("usesAirPurifier", getUsesAirPurifier())
            .append("usesVacuumCleaner", getUsesVacuumCleaner())
            .append("avoidanceQuality", getAvoidanceQuality())
            .toString();
    }
}
