package com.ruoyi.EpidemSys.domain;

import java.math.BigDecimal;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 其他潜在混杂因素对象 survey_confounding_factors
 * 
 * @author ruoyi
 * @date 2025-06-28
 */
public class SurveyConfoundingFactors extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 其他因素号 */
    private Long confoundId;

    /** 患者号 */
    @Excel(name = "患者号")
    private Long surveyId;

    /** 饮食习惯 */
    @Excel(name = "饮食习惯")
    private String dietType;

    /** 每日摄入维生素D400u */
    @Excel(name = "每日摄入维生素D400u")
    private Integer vitaminD400u;

    /** 口服周期 */
    @Excel(name = "口服周期")
    private Long vitaminDYears;

    /** Omega-3摄入量 */
    @Excel(name = "Omega-3摄入量")
    private String omega3Intake;

    /** 长期压力水平 */
    @Excel(name = "长期压力水平")
    private Long stressLevelPss10;

    /** 焦虑或抑郁状态 */
    @Excel(name = "焦虑或抑郁状态")
    private String mentalStatePhq9Gad7;

    /** 按计划接种 */
    @Excel(name = "按计划接种")
    private Integer vaccineOnSchedule;

    /** 抗生素使用频率 */
    @Excel(name = "抗生素使用频率")
    private String antibioticFreq;

    /** 母乳喂养 */
    @Excel(name = "母乳喂养")
    private Integer breastfeeding;

    /** 具体月数 */
    @Excel(name = "具体月数")
    private Long breastfeedingMonths;

    /** 分娩情况 */
    @Excel(name = "分娩情况")
    private String deliveryType;

    /** 宠物接触年龄 */
    @Excel(name = "宠物接触年龄")
    private String petExposureStage;

    /** 农场环境暴露 */
    @Excel(name = "农场环境暴露")
    private Integer farmExposure;

    /** 具体月数 */
    @Excel(name = "具体月数")
    private Long farmExposureMonths;

    /** 缺课天数 */
    @Excel(name = "缺课天数")
    private Long absentDaysAllergy;

    /** 每年人均医疗费用支出 */
    @Excel(name = "每年人均医疗费用支出")
    private BigDecimal annualMedicalCost;

    public void setConfoundId(Long confoundId) 
    {
        this.confoundId = confoundId;
    }

    public Long getConfoundId() 
    {
        return confoundId;
    }

    public void setSurveyId(Long surveyId) 
    {
        this.surveyId = surveyId;
    }

    public Long getSurveyId() 
    {
        return surveyId;
    }

    public void setDietType(String dietType) 
    {
        this.dietType = dietType;
    }

    public String getDietType() 
    {
        return dietType;
    }

    public void setVitaminD400u(Integer vitaminD400u) 
    {
        this.vitaminD400u = vitaminD400u;
    }

    public Integer getVitaminD400u() 
    {
        return vitaminD400u;
    }

    public void setVitaminDYears(Long vitaminDYears) 
    {
        this.vitaminDYears = vitaminDYears;
    }

    public Long getVitaminDYears() 
    {
        return vitaminDYears;
    }

    public void setOmega3Intake(String omega3Intake) 
    {
        this.omega3Intake = omega3Intake;
    }

    public String getOmega3Intake() 
    {
        return omega3Intake;
    }

    public void setStressLevelPss10(Long stressLevelPss10) 
    {
        this.stressLevelPss10 = stressLevelPss10;
    }

    public Long getStressLevelPss10() 
    {
        return stressLevelPss10;
    }

    public void setMentalStatePhq9Gad7(String mentalStatePhq9Gad7) 
    {
        this.mentalStatePhq9Gad7 = mentalStatePhq9Gad7;
    }

    public String getMentalStatePhq9Gad7() 
    {
        return mentalStatePhq9Gad7;
    }

    public void setVaccineOnSchedule(Integer vaccineOnSchedule) 
    {
        this.vaccineOnSchedule = vaccineOnSchedule;
    }

    public Integer getVaccineOnSchedule() 
    {
        return vaccineOnSchedule;
    }

    public void setAntibioticFreq(String antibioticFreq) 
    {
        this.antibioticFreq = antibioticFreq;
    }

    public String getAntibioticFreq() 
    {
        return antibioticFreq;
    }

    public void setBreastfeeding(Integer breastfeeding) 
    {
        this.breastfeeding = breastfeeding;
    }

    public Integer getBreastfeeding() 
    {
        return breastfeeding;
    }

    public void setBreastfeedingMonths(Long breastfeedingMonths) 
    {
        this.breastfeedingMonths = breastfeedingMonths;
    }

    public Long getBreastfeedingMonths() 
    {
        return breastfeedingMonths;
    }

    public void setDeliveryType(String deliveryType) 
    {
        this.deliveryType = deliveryType;
    }

    public String getDeliveryType() 
    {
        return deliveryType;
    }

    public void setPetExposureStage(String petExposureStage) 
    {
        this.petExposureStage = petExposureStage;
    }

    public String getPetExposureStage() 
    {
        return petExposureStage;
    }

    public void setFarmExposure(Integer farmExposure) 
    {
        this.farmExposure = farmExposure;
    }

    public Integer getFarmExposure() 
    {
        return farmExposure;
    }

    public void setFarmExposureMonths(Long farmExposureMonths) 
    {
        this.farmExposureMonths = farmExposureMonths;
    }

    public Long getFarmExposureMonths() 
    {
        return farmExposureMonths;
    }

    public void setAbsentDaysAllergy(Long absentDaysAllergy) 
    {
        this.absentDaysAllergy = absentDaysAllergy;
    }

    public Long getAbsentDaysAllergy() 
    {
        return absentDaysAllergy;
    }

    public void setAnnualMedicalCost(BigDecimal annualMedicalCost) 
    {
        this.annualMedicalCost = annualMedicalCost;
    }

    public BigDecimal getAnnualMedicalCost() 
    {
        return annualMedicalCost;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("confoundId", getConfoundId())
            .append("surveyId", getSurveyId())
            .append("dietType", getDietType())
            .append("vitaminD400u", getVitaminD400u())
            .append("vitaminDYears", getVitaminDYears())
            .append("omega3Intake", getOmega3Intake())
            .append("stressLevelPss10", getStressLevelPss10())
            .append("mentalStatePhq9Gad7", getMentalStatePhq9Gad7())
            .append("vaccineOnSchedule", getVaccineOnSchedule())
            .append("antibioticFreq", getAntibioticFreq())
            .append("breastfeeding", getBreastfeeding())
            .append("breastfeedingMonths", getBreastfeedingMonths())
            .append("deliveryType", getDeliveryType())
            .append("petExposureStage", getPetExposureStage())
            .append("farmExposure", getFarmExposure())
            .append("farmExposureMonths", getFarmExposureMonths())
            .append("absentDaysAllergy", getAbsentDaysAllergy())
            .append("annualMedicalCost", getAnnualMedicalCost())
            .toString();
    }
}
