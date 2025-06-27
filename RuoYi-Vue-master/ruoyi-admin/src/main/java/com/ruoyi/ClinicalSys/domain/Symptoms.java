package com.ruoyi.ClinicalSys.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 症状及体征对象 symptoms
 * 
 * @author ruoyi
 * @date 2025-06-27
 */
public class Symptoms extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 症状号 */
    private Long symptomId;

    /** 病人号 */
    @Excel(name = "病人号")
    private String patientId;

    /** 症状描述 */
    @Excel(name = "症状描述")
    private String symptomDescription;

    /** 严重程度 */
    @Excel(name = "严重程度")
    private String severityLevel;

    /** 症状频率 */
    @Excel(name = "症状频率")
    private String frequency;

    /** 症状开始时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "症状开始时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date onsetTime;

    /** 诱因 */
    @Excel(name = "诱因")
    private String triggerFactor;

    /** 体征描述 */
    @Excel(name = "体征描述")
    private String physicalSigns;

    public void setSymptomId(Long symptomId) 
    {
        this.symptomId = symptomId;
    }

    public Long getSymptomId() 
    {
        return symptomId;
    }

    public void setPatientId(String patientId) 
    {
        this.patientId = patientId;
    }

    public String getPatientId() 
    {
        return patientId;
    }

    public void setSymptomDescription(String symptomDescription) 
    {
        this.symptomDescription = symptomDescription;
    }

    public String getSymptomDescription() 
    {
        return symptomDescription;
    }

    public void setSeverityLevel(String severityLevel) 
    {
        this.severityLevel = severityLevel;
    }

    public String getSeverityLevel() 
    {
        return severityLevel;
    }

    public void setFrequency(String frequency) 
    {
        this.frequency = frequency;
    }

    public String getFrequency() 
    {
        return frequency;
    }

    public void setOnsetTime(Date onsetTime) 
    {
        this.onsetTime = onsetTime;
    }

    public Date getOnsetTime() 
    {
        return onsetTime;
    }

    public void setTriggerFactor(String triggerFactor) 
    {
        this.triggerFactor = triggerFactor;
    }

    public String getTriggerFactor() 
    {
        return triggerFactor;
    }

    public void setPhysicalSigns(String physicalSigns) 
    {
        this.physicalSigns = physicalSigns;
    }

    public String getPhysicalSigns() 
    {
        return physicalSigns;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("symptomId", getSymptomId())
            .append("patientId", getPatientId())
            .append("symptomDescription", getSymptomDescription())
            .append("severityLevel", getSeverityLevel())
            .append("frequency", getFrequency())
            .append("onsetTime", getOnsetTime())
            .append("triggerFactor", getTriggerFactor())
            .append("physicalSigns", getPhysicalSigns())
            .toString();
    }
}
