package com.ruoyi.BiobankSys.domain;

import java.math.BigDecimal;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * CRF表格对象 crf_sample_collection
 * 
 * @author ruoyi
 * @date 2025-06-29
 */
public class CrfSampleCollection extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** CRF号 */
    private Long crfId;

    /** 样本号 */
    @Excel(name = "样本号")
    private String specimenId;

    /** 表格填写人 */
    @Excel(name = "表格填写人")
    private String formCompletedBy;

    /** 表格填写日期 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "表格填写日期", width = 30, dateFormat = "yyyy-MM-dd")
    private Date formCompletionDate;

    /** 是否空腹 */
    @Excel(name = "是否空腹")
    private Integer patientFasting;

    /** 最后进食时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "最后进食时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date lastMealTime;

    /** 停药情况 */
    @Excel(name = "停药情况")
    private String medicationHold;

    /** 采集时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "采集时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date collectionTime;

    /** 采集并发症 */
    @Excel(name = "采集并发症")
    private String collectionComplications;

    /** 处理延迟时间 */
    @Excel(name = "处理延迟时间")
    private Long processingDelayMinutes;

    /** 试样体积 */
    @Excel(name = "试样体积")
    private BigDecimal aliquotVolume;

    /** 试样类型 */
    @Excel(name = "试样类型")
    private String additiveType;

    /** 采集者签名 */
    @Excel(name = "采集者签名")
    private String collectorSignature;

    /** 监督者签名 */
    @Excel(name = "监督者签名")
    private String supervisorSignature;

    public void setCrfId(Long crfId) 
    {
        this.crfId = crfId;
    }

    public Long getCrfId() 
    {
        return crfId;
    }

    public void setSpecimenId(String specimenId) 
    {
        this.specimenId = specimenId;
    }

    public String getSpecimenId() 
    {
        return specimenId;
    }

    public void setFormCompletedBy(String formCompletedBy) 
    {
        this.formCompletedBy = formCompletedBy;
    }

    public String getFormCompletedBy() 
    {
        return formCompletedBy;
    }

    public void setFormCompletionDate(Date formCompletionDate) 
    {
        this.formCompletionDate = formCompletionDate;
    }

    public Date getFormCompletionDate() 
    {
        return formCompletionDate;
    }

    public void setPatientFasting(Integer patientFasting) 
    {
        this.patientFasting = patientFasting;
    }

    public Integer getPatientFasting() 
    {
        return patientFasting;
    }

    public void setLastMealTime(Date lastMealTime) 
    {
        this.lastMealTime = lastMealTime;
    }

    public Date getLastMealTime() 
    {
        return lastMealTime;
    }

    public void setMedicationHold(String medicationHold) 
    {
        this.medicationHold = medicationHold;
    }

    public String getMedicationHold() 
    {
        return medicationHold;
    }

    public void setCollectionTime(Date collectionTime) 
    {
        this.collectionTime = collectionTime;
    }

    public Date getCollectionTime() 
    {
        return collectionTime;
    }

    public void setCollectionComplications(String collectionComplications) 
    {
        this.collectionComplications = collectionComplications;
    }

    public String getCollectionComplications() 
    {
        return collectionComplications;
    }

    public void setProcessingDelayMinutes(Long processingDelayMinutes) 
    {
        this.processingDelayMinutes = processingDelayMinutes;
    }

    public Long getProcessingDelayMinutes() 
    {
        return processingDelayMinutes;
    }

    public void setAliquotVolume(BigDecimal aliquotVolume) 
    {
        this.aliquotVolume = aliquotVolume;
    }

    public BigDecimal getAliquotVolume() 
    {
        return aliquotVolume;
    }

    public void setAdditiveType(String additiveType) 
    {
        this.additiveType = additiveType;
    }

    public String getAdditiveType() 
    {
        return additiveType;
    }

    public void setCollectorSignature(String collectorSignature) 
    {
        this.collectorSignature = collectorSignature;
    }

    public String getCollectorSignature() 
    {
        return collectorSignature;
    }

    public void setSupervisorSignature(String supervisorSignature) 
    {
        this.supervisorSignature = supervisorSignature;
    }

    public String getSupervisorSignature() 
    {
        return supervisorSignature;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("crfId", getCrfId())
            .append("specimenId", getSpecimenId())
            .append("formCompletedBy", getFormCompletedBy())
            .append("formCompletionDate", getFormCompletionDate())
            .append("patientFasting", getPatientFasting())
            .append("lastMealTime", getLastMealTime())
            .append("medicationHold", getMedicationHold())
            .append("collectionTime", getCollectionTime())
            .append("collectionComplications", getCollectionComplications())
            .append("processingDelayMinutes", getProcessingDelayMinutes())
            .append("aliquotVolume", getAliquotVolume())
            .append("additiveType", getAdditiveType())
            .append("collectorSignature", getCollectorSignature())
            .append("supervisorSignature", getSupervisorSignature())
            .toString();
    }
}
