package com.ruoyi.ClinicalSys.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 既往史对象 history
 * 
 * @author ruoyi
 * @date 2025-06-27
 */
public class History extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 既往史名 */
    private Long historyId;

    /** 病人号 */
    @Excel(name = "病人号")
    private String patientId;

    /** 食物过敏源阳性史 */
    @Excel(name = "食物过敏源阳性史")
    private String foodAllergyHistory;

    /** 吸入过敏源阳性史 */
    @Excel(name = "吸入过敏源阳性史")
    private String allergenExposure;

    /** 过敏性疾病史 */
    @Excel(name = "过敏性疾病史")
    private String pastDiseaseHistory;

    public void setHistoryId(Long historyId) 
    {
        this.historyId = historyId;
    }

    public Long getHistoryId() 
    {
        return historyId;
    }

    public void setPatientId(String patientId) 
    {
        this.patientId = patientId;
    }

    public String getPatientId() 
    {
        return patientId;
    }

    public void setFoodAllergyHistory(String foodAllergyHistory) 
    {
        this.foodAllergyHistory = foodAllergyHistory;
    }

    public String getFoodAllergyHistory() 
    {
        return foodAllergyHistory;
    }

    public void setAllergenExposure(String allergenExposure) 
    {
        this.allergenExposure = allergenExposure;
    }

    public String getAllergenExposure() 
    {
        return allergenExposure;
    }

    public void setPastDiseaseHistory(String pastDiseaseHistory) 
    {
        this.pastDiseaseHistory = pastDiseaseHistory;
    }

    public String getPastDiseaseHistory() 
    {
        return pastDiseaseHistory;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("historyId", getHistoryId())
            .append("patientId", getPatientId())
            .append("foodAllergyHistory", getFoodAllergyHistory())
            .append("allergenExposure", getAllergenExposure())
            .append("pastDiseaseHistory", getPastDiseaseHistory())
            .toString();
    }
}
