package com.ruoyi.EpidemSys.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 患儿基本信息对象 survey_basic_info
 * 
 * @author ruoyi
 * @date 2025-06-27
 */
public class SurveyBasicInfo extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 患者号 */
    private Long surveyId;

    /** 病人号 */
    @Excel(name = "病人号")
    private String patientId;

    /** 调查时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "调查时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date surveyDate;

    /** 姓名 */
    @Excel(name = "姓名")
    private String childName;

    /** 性别 */
    @Excel(name = "性别")
    private String gender;

    /** 年龄 */
    @Excel(name = "年龄")
    private Long age;

    /** 居住地类型 */
    @Excel(name = "居住地类型")
    private String residenceType;

    /** 居住时长 */
    @Excel(name = "居住时长")
    private Long residenceYears;

    /** 家庭住址 */
    @Excel(name = "家庭住址")
    private String address;

    /** 身高 */
    @Excel(name = "身高")
    private Long height;

    /** 体重 */
    @Excel(name = "体重")
    private Long weight;

    /** 既往过敏史 */
    @Excel(name = "既往过敏史")
    private Integer allergyHistory;

    /** 有无鼻炎 */
    @Excel(name = "有无鼻炎")
    private Integer hasRhinitis;

    /** 有无哮喘 */
    @Excel(name = "有无哮喘")
    private Integer hasAsthma;

    /** 有无皮炎 */
    @Excel(name = "有无皮炎")
    private Integer hasDermatitis;

    /** 有无结膜炎 */
    @Excel(name = "有无结膜炎")
    private Integer hasConjunctivitis;

    /** 有无荨麻疹 */
    @Excel(name = "有无荨麻疹")
    private Integer hasUrticaria;

    /** 诊断鼻炎 */
    @Excel(name = "诊断鼻炎")
    private Integer diagnosedRhinitis;

    /** 诊断哮喘 */
    @Excel(name = "诊断哮喘")
    private Integer diagnosedAsthma;

    /** 诊断皮炎 */
    @Excel(name = "诊断皮炎")
    private Integer diagnosedDermatitis;

    /** 诊断结膜炎 */
    @Excel(name = "诊断结膜炎")
    private Integer diagnosedConjunctivitis;

    /** 诊断荨麻疹 */
    @Excel(name = "诊断荨麻疹")
    private Integer diagnosedUrticaria;

    public void setSurveyId(Long surveyId) 
    {
        this.surveyId = surveyId;
    }

    public Long getSurveyId() 
    {
        return surveyId;
    }

    public void setPatientId(String patientId) 
    {
        this.patientId = patientId;
    }

    public String getPatientId() 
    {
        return patientId;
    }

    public void setSurveyDate(Date surveyDate) 
    {
        this.surveyDate = surveyDate;
    }

    public Date getSurveyDate() 
    {
        return surveyDate;
    }

    public void setChildName(String childName) 
    {
        this.childName = childName;
    }

    public String getChildName() 
    {
        return childName;
    }

    public void setGender(String gender) 
    {
        this.gender = gender;
    }

    public String getGender() 
    {
        return gender;
    }

    public void setAge(Long age) 
    {
        this.age = age;
    }

    public Long getAge() 
    {
        return age;
    }

    public void setResidenceType(String residenceType) 
    {
        this.residenceType = residenceType;
    }

    public String getResidenceType() 
    {
        return residenceType;
    }

    public void setResidenceYears(Long residenceYears) 
    {
        this.residenceYears = residenceYears;
    }

    public Long getResidenceYears() 
    {
        return residenceYears;
    }

    public void setAddress(String address) 
    {
        this.address = address;
    }

    public String getAddress() 
    {
        return address;
    }

    public void setHeight(Long height) 
    {
        this.height = height;
    }

    public Long getHeight() 
    {
        return height;
    }

    public void setWeight(Long weight) 
    {
        this.weight = weight;
    }

    public Long getWeight() 
    {
        return weight;
    }

    public void setAllergyHistory(Integer allergyHistory) 
    {
        this.allergyHistory = allergyHistory;
    }

    public Integer getAllergyHistory() 
    {
        return allergyHistory;
    }

    public void setHasRhinitis(Integer hasRhinitis) 
    {
        this.hasRhinitis = hasRhinitis;
    }

    public Integer getHasRhinitis() 
    {
        return hasRhinitis;
    }

    public void setHasAsthma(Integer hasAsthma) 
    {
        this.hasAsthma = hasAsthma;
    }

    public Integer getHasAsthma() 
    {
        return hasAsthma;
    }

    public void setHasDermatitis(Integer hasDermatitis) 
    {
        this.hasDermatitis = hasDermatitis;
    }

    public Integer getHasDermatitis() 
    {
        return hasDermatitis;
    }

    public void setHasConjunctivitis(Integer hasConjunctivitis) 
    {
        this.hasConjunctivitis = hasConjunctivitis;
    }

    public Integer getHasConjunctivitis() 
    {
        return hasConjunctivitis;
    }

    public void setHasUrticaria(Integer hasUrticaria) 
    {
        this.hasUrticaria = hasUrticaria;
    }

    public Integer getHasUrticaria() 
    {
        return hasUrticaria;
    }

    public void setDiagnosedRhinitis(Integer diagnosedRhinitis) 
    {
        this.diagnosedRhinitis = diagnosedRhinitis;
    }

    public Integer getDiagnosedRhinitis() 
    {
        return diagnosedRhinitis;
    }

    public void setDiagnosedAsthma(Integer diagnosedAsthma) 
    {
        this.diagnosedAsthma = diagnosedAsthma;
    }

    public Integer getDiagnosedAsthma() 
    {
        return diagnosedAsthma;
    }

    public void setDiagnosedDermatitis(Integer diagnosedDermatitis) 
    {
        this.diagnosedDermatitis = diagnosedDermatitis;
    }

    public Integer getDiagnosedDermatitis() 
    {
        return diagnosedDermatitis;
    }

    public void setDiagnosedConjunctivitis(Integer diagnosedConjunctivitis) 
    {
        this.diagnosedConjunctivitis = diagnosedConjunctivitis;
    }

    public Integer getDiagnosedConjunctivitis() 
    {
        return diagnosedConjunctivitis;
    }

    public void setDiagnosedUrticaria(Integer diagnosedUrticaria) 
    {
        this.diagnosedUrticaria = diagnosedUrticaria;
    }

    public Integer getDiagnosedUrticaria() 
    {
        return diagnosedUrticaria;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("surveyId", getSurveyId())
            .append("patientId", getPatientId())
            .append("surveyDate", getSurveyDate())
            .append("childName", getChildName())
            .append("gender", getGender())
            .append("age", getAge())
            .append("residenceType", getResidenceType())
            .append("residenceYears", getResidenceYears())
            .append("address", getAddress())
            .append("height", getHeight())
            .append("weight", getWeight())
            .append("allergyHistory", getAllergyHistory())
            .append("hasRhinitis", getHasRhinitis())
            .append("hasAsthma", getHasAsthma())
            .append("hasDermatitis", getHasDermatitis())
            .append("hasConjunctivitis", getHasConjunctivitis())
            .append("hasUrticaria", getHasUrticaria())
            .append("diagnosedRhinitis", getDiagnosedRhinitis())
            .append("diagnosedAsthma", getDiagnosedAsthma())
            .append("diagnosedDermatitis", getDiagnosedDermatitis())
            .append("diagnosedConjunctivitis", getDiagnosedConjunctivitis())
            .append("diagnosedUrticaria", getDiagnosedUrticaria())
            .toString();
    }
}
