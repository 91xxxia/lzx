package com.ruoyi.ClinicalSys.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 医保情况对象 insurance_info
 * 
 * @author ruoyi
 * @date 2025-06-27
 */
public class InsuranceInfo extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 医保情况号 */
    private Long insuranceId;

    /** 病人号 */
    @Excel(name = "病人号")
    private String patientId;

    /** 医保类型 */
    @Excel(name = "医保类型")
    private String insuranceType;

    /** 医保号 */
    @Excel(name = "医保号")
    private String insuranceNumber;

    public void setInsuranceId(Long insuranceId) 
    {
        this.insuranceId = insuranceId;
    }

    public Long getInsuranceId() 
    {
        return insuranceId;
    }

    public void setPatientId(String patientId) 
    {
        this.patientId = patientId;
    }

    public String getPatientId() 
    {
        return patientId;
    }

    public void setInsuranceType(String insuranceType) 
    {
        this.insuranceType = insuranceType;
    }

    public String getInsuranceType() 
    {
        return insuranceType;
    }

    public void setInsuranceNumber(String insuranceNumber) 
    {
        this.insuranceNumber = insuranceNumber;
    }

    public String getInsuranceNumber() 
    {
        return insuranceNumber;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("insuranceId", getInsuranceId())
            .append("patientId", getPatientId())
            .append("insuranceType", getInsuranceType())
            .append("insuranceNumber", getInsuranceNumber())
            .toString();
    }
}
