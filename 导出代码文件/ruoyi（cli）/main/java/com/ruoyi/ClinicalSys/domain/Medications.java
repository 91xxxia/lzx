package com.ruoyi.ClinicalSys.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 用药对象 medications
 * 
 * @author ruoyi
 * @date 2025-06-27
 */
public class Medications extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 用药号 */
    private Long medId;

    /** 病人号 */
    @Excel(name = "病人号")
    private String patientId;

    /** 药物名称 */
    @Excel(name = "药物名称")
    private String medicationName;

    /** 药物规格 */
    @Excel(name = "药物规格")
    private String medicationSpecification;

    /** 一次药物使用剂量 */
    @Excel(name = "一次药物使用剂量")
    private String singleDose;

    /** 药物使用天数 */
    @Excel(name = "药物使用天数")
    private Long usageDays;

    /** 给药频率 */
    @Excel(name = "给药频率")
    private String frequency;

    /** 给药途径 */
    @Excel(name = "给药途径")
    private String administrationRoute;

    /** 给药部位 */
    @Excel(name = "给药部位")
    private String administrationSite;

    /** 治疗开始时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "治疗开始时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date treatmentStart;

    /** 治疗终止时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "治疗终止时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date treatmentEnd;

    /** 用药指导 */
    @Excel(name = "用药指导")
    private String medicationGuidance;

    /** 用药注意事项 */
    @Excel(name = "用药注意事项")
    private String precautions;

    public void setMedId(Long medId) 
    {
        this.medId = medId;
    }

    public Long getMedId() 
    {
        return medId;
    }

    public void setPatientId(String patientId) 
    {
        this.patientId = patientId;
    }

    public String getPatientId() 
    {
        return patientId;
    }

    public void setMedicationName(String medicationName) 
    {
        this.medicationName = medicationName;
    }

    public String getMedicationName() 
    {
        return medicationName;
    }

    public void setMedicationSpecification(String medicationSpecification) 
    {
        this.medicationSpecification = medicationSpecification;
    }

    public String getMedicationSpecification() 
    {
        return medicationSpecification;
    }

    public void setSingleDose(String singleDose) 
    {
        this.singleDose = singleDose;
    }

    public String getSingleDose() 
    {
        return singleDose;
    }

    public void setUsageDays(Long usageDays) 
    {
        this.usageDays = usageDays;
    }

    public Long getUsageDays() 
    {
        return usageDays;
    }

    public void setFrequency(String frequency) 
    {
        this.frequency = frequency;
    }

    public String getFrequency() 
    {
        return frequency;
    }

    public void setAdministrationRoute(String administrationRoute) 
    {
        this.administrationRoute = administrationRoute;
    }

    public String getAdministrationRoute() 
    {
        return administrationRoute;
    }

    public void setAdministrationSite(String administrationSite) 
    {
        this.administrationSite = administrationSite;
    }

    public String getAdministrationSite() 
    {
        return administrationSite;
    }

    public void setTreatmentStart(Date treatmentStart) 
    {
        this.treatmentStart = treatmentStart;
    }

    public Date getTreatmentStart() 
    {
        return treatmentStart;
    }

    public void setTreatmentEnd(Date treatmentEnd) 
    {
        this.treatmentEnd = treatmentEnd;
    }

    public Date getTreatmentEnd() 
    {
        return treatmentEnd;
    }

    public void setMedicationGuidance(String medicationGuidance) 
    {
        this.medicationGuidance = medicationGuidance;
    }

    public String getMedicationGuidance() 
    {
        return medicationGuidance;
    }

    public void setPrecautions(String precautions) 
    {
        this.precautions = precautions;
    }

    public String getPrecautions() 
    {
        return precautions;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("medId", getMedId())
            .append("patientId", getPatientId())
            .append("medicationName", getMedicationName())
            .append("medicationSpecification", getMedicationSpecification())
            .append("singleDose", getSingleDose())
            .append("usageDays", getUsageDays())
            .append("frequency", getFrequency())
            .append("administrationRoute", getAdministrationRoute())
            .append("administrationSite", getAdministrationSite())
            .append("treatmentStart", getTreatmentStart())
            .append("treatmentEnd", getTreatmentEnd())
            .append("medicationGuidance", getMedicationGuidance())
            .append("precautions", getPrecautions())
            .toString();
    }
}
