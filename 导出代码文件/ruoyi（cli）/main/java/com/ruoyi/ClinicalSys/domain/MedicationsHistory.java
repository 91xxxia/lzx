package com.ruoyi.ClinicalSys.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 既往用药史对象 medications_history
 * 
 * @author ruoyi
 * @date 2025-06-27
 */
public class MedicationsHistory extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 既往用药号 */
    private Long medHisId;

    /** 病人号 */
    @Excel(name = "病人号")
    private String patientId;

    /** 药物名称 */
    @Excel(name = "药物名称")
    private String medicationName;

    /** 药物使用天数 */
    @Excel(name = "药物使用天数")
    private Long durationDays;

    public void setMedHisId(Long medHisId) 
    {
        this.medHisId = medHisId;
    }

    public Long getMedHisId() 
    {
        return medHisId;
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

    public void setDurationDays(Long durationDays) 
    {
        this.durationDays = durationDays;
    }

    public Long getDurationDays() 
    {
        return durationDays;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("medHisId", getMedHisId())
            .append("patientId", getPatientId())
            .append("medicationName", getMedicationName())
            .append("durationDays", getDurationDays())
            .toString();
    }
}
