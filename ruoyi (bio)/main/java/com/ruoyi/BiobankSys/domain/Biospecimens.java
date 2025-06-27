package com.ruoyi.BiobankSys.domain;

import java.math.BigDecimal;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 生物样本主表对象 biospecimens
 * 
 * @author ruoyi
 * @date 2025-06-27
 */
public class Biospecimens extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 样本号 */
    private String specimenId;

    /** 关联临床数据库患者ID */
    @Excel(name = "关联临床数据库患者ID")
    private String patientId;

    /** 样本类型 */
    @Excel(name = "样本类型")
    private String specimenType;

    /** 收集日期 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "收集日期", width = 30, dateFormat = "yyyy-MM-dd")
    private Date collectionDate;

    /** 收集地点 */
    @Excel(name = "收集地点")
    private String collectionSite;

    /** 收集方法 */
    @Excel(name = "收集方法")
    private String collectionMethod;

    /** 收集浓度 */
    @Excel(name = "收集浓度")
    private BigDecimal collectionVolume;

    /** 收集管类型 */
    @Excel(name = "收集管类型")
    private String collectionTubeType;

    /** 加工方式 */
    @Excel(name = "加工方式")
    private String processingMethod;

    /** $column.columnComment */
    @Excel(name = "${comment}", readConverterExp = "$column.readConverterExp()")
    private Date initialProcessingTime;

    /** $column.columnComment */
    @Excel(name = "${comment}", readConverterExp = "$column.readConverterExp()")
    private Long aliquotCount;

    /** 采集时的临床背景 */
    @Excel(name = "采集时的临床背景")
    private String clinicalContext;

    public void setSpecimenId(String specimenId) 
    {
        this.specimenId = specimenId;
    }

    public String getSpecimenId() 
    {
        return specimenId;
    }

    public void setPatientId(String patientId) 
    {
        this.patientId = patientId;
    }

    public String getPatientId() 
    {
        return patientId;
    }

    public void setSpecimenType(String specimenType) 
    {
        this.specimenType = specimenType;
    }

    public String getSpecimenType() 
    {
        return specimenType;
    }

    public void setCollectionDate(Date collectionDate) 
    {
        this.collectionDate = collectionDate;
    }

    public Date getCollectionDate() 
    {
        return collectionDate;
    }

    public void setCollectionSite(String collectionSite) 
    {
        this.collectionSite = collectionSite;
    }

    public String getCollectionSite() 
    {
        return collectionSite;
    }

    public void setCollectionMethod(String collectionMethod) 
    {
        this.collectionMethod = collectionMethod;
    }

    public String getCollectionMethod() 
    {
        return collectionMethod;
    }

    public void setCollectionVolume(BigDecimal collectionVolume) 
    {
        this.collectionVolume = collectionVolume;
    }

    public BigDecimal getCollectionVolume() 
    {
        return collectionVolume;
    }

    public void setCollectionTubeType(String collectionTubeType) 
    {
        this.collectionTubeType = collectionTubeType;
    }

    public String getCollectionTubeType() 
    {
        return collectionTubeType;
    }

    public void setProcessingMethod(String processingMethod) 
    {
        this.processingMethod = processingMethod;
    }

    public String getProcessingMethod() 
    {
        return processingMethod;
    }

    public void setInitialProcessingTime(Date initialProcessingTime) 
    {
        this.initialProcessingTime = initialProcessingTime;
    }

    public Date getInitialProcessingTime() 
    {
        return initialProcessingTime;
    }

    public void setAliquotCount(Long aliquotCount) 
    {
        this.aliquotCount = aliquotCount;
    }

    public Long getAliquotCount() 
    {
        return aliquotCount;
    }

    public void setClinicalContext(String clinicalContext) 
    {
        this.clinicalContext = clinicalContext;
    }

    public String getClinicalContext() 
    {
        return clinicalContext;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("specimenId", getSpecimenId())
            .append("patientId", getPatientId())
            .append("specimenType", getSpecimenType())
            .append("collectionDate", getCollectionDate())
            .append("collectionSite", getCollectionSite())
            .append("collectionMethod", getCollectionMethod())
            .append("collectionVolume", getCollectionVolume())
            .append("collectionTubeType", getCollectionTubeType())
            .append("processingMethod", getProcessingMethod())
            .append("initialProcessingTime", getInitialProcessingTime())
            .append("aliquotCount", getAliquotCount())
            .append("clinicalContext", getClinicalContext())
            .toString();
    }
}
