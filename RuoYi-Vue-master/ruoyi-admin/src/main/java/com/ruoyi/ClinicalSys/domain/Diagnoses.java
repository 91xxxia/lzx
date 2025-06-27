package com.ruoyi.ClinicalSys.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 疾病诊断对象 diagnoses
 * 
 * @author ruoyi
 * @date 2025-06-27
 */
public class Diagnoses extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 诊断号 */
    private Long diagnosisId;

    /** 病人号 */
    @Excel(name = "病人号")
    private String patientId;

    /** 疾病名称 */
    @Excel(name = "疾病名称")
    private String diseaseName;

    /** 严重程度 */
    @Excel(name = "严重程度")
    private String severity;

    /** 诊断时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "诊断时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date diagnosisTime;

    public void setDiagnosisId(Long diagnosisId) 
    {
        this.diagnosisId = diagnosisId;
    }

    public Long getDiagnosisId() 
    {
        return diagnosisId;
    }

    public void setPatientId(String patientId) 
    {
        this.patientId = patientId;
    }

    public String getPatientId() 
    {
        return patientId;
    }

    public void setDiseaseName(String diseaseName) 
    {
        this.diseaseName = diseaseName;
    }

    public String getDiseaseName() 
    {
        return diseaseName;
    }

    public void setSeverity(String severity) 
    {
        this.severity = severity;
    }

    public String getSeverity() 
    {
        return severity;
    }

    public void setDiagnosisTime(Date diagnosisTime) 
    {
        this.diagnosisTime = diagnosisTime;
    }

    public Date getDiagnosisTime() 
    {
        return diagnosisTime;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("diagnosisId", getDiagnosisId())
            .append("patientId", getPatientId())
            .append("diseaseName", getDiseaseName())
            .append("severity", getSeverity())
            .append("diagnosisTime", getDiagnosisTime())
            .toString();
    }
}
