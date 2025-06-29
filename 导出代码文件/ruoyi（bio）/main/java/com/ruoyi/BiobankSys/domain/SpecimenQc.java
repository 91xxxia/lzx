package com.ruoyi.BiobankSys.domain;

import java.math.BigDecimal;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 样本质量控制对象 specimen_qc
 * 
 * @author ruoyi
 * @date 2025-06-29
 */
public class SpecimenQc extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 质量控制号 */
    private Long qcId;

    /** 样本号 */
    @Excel(name = "样本号")
    private String specimenId;

    /** 质量控制日期 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "质量控制日期", width = 30, dateFormat = "yyyy-MM-dd")
    private Date qcDate;

    /** DNA浓度 */
    @Excel(name = "DNA浓度")
    private BigDecimal dnaConcentration;

    /** DNA质量比 */
    @Excel(name = "DNA质量比")
    private BigDecimal dnaQualityRatio;

    /** RNA完整性 */
    @Excel(name = "RNA完整性")
    private BigDecimal rnaIntegrityNumber;

    /** 蛋白质浓度 */
    @Excel(name = "蛋白质浓度")
    private BigDecimal proteinConcentration;

    /** 溶血水平 */
    @Excel(name = "溶血水平")
    private String hemolysisLevel;

    /** 污染状态 */
    @Excel(name = "污染状态")
    private Integer contaminationStatus;

    /** 质控操作 */
    @Excel(name = "质控操作")
    private String qcOperator;

    /** 质控方法 */
    @Excel(name = "质控方法")
    private String qcMethod;

    /** 质控注意事项 */
    @Excel(name = "质控注意事项")
    private String qcNotes;

    public void setQcId(Long qcId) 
    {
        this.qcId = qcId;
    }

    public Long getQcId() 
    {
        return qcId;
    }

    public void setSpecimenId(String specimenId) 
    {
        this.specimenId = specimenId;
    }

    public String getSpecimenId() 
    {
        return specimenId;
    }

    public void setQcDate(Date qcDate) 
    {
        this.qcDate = qcDate;
    }

    public Date getQcDate() 
    {
        return qcDate;
    }

    public void setDnaConcentration(BigDecimal dnaConcentration) 
    {
        this.dnaConcentration = dnaConcentration;
    }

    public BigDecimal getDnaConcentration() 
    {
        return dnaConcentration;
    }

    public void setDnaQualityRatio(BigDecimal dnaQualityRatio) 
    {
        this.dnaQualityRatio = dnaQualityRatio;
    }

    public BigDecimal getDnaQualityRatio() 
    {
        return dnaQualityRatio;
    }

    public void setRnaIntegrityNumber(BigDecimal rnaIntegrityNumber) 
    {
        this.rnaIntegrityNumber = rnaIntegrityNumber;
    }

    public BigDecimal getRnaIntegrityNumber() 
    {
        return rnaIntegrityNumber;
    }

    public void setProteinConcentration(BigDecimal proteinConcentration) 
    {
        this.proteinConcentration = proteinConcentration;
    }

    public BigDecimal getProteinConcentration() 
    {
        return proteinConcentration;
    }

    public void setHemolysisLevel(String hemolysisLevel) 
    {
        this.hemolysisLevel = hemolysisLevel;
    }

    public String getHemolysisLevel() 
    {
        return hemolysisLevel;
    }

    public void setContaminationStatus(Integer contaminationStatus) 
    {
        this.contaminationStatus = contaminationStatus;
    }

    public Integer getContaminationStatus() 
    {
        return contaminationStatus;
    }

    public void setQcOperator(String qcOperator) 
    {
        this.qcOperator = qcOperator;
    }

    public String getQcOperator() 
    {
        return qcOperator;
    }

    public void setQcMethod(String qcMethod) 
    {
        this.qcMethod = qcMethod;
    }

    public String getQcMethod() 
    {
        return qcMethod;
    }

    public void setQcNotes(String qcNotes) 
    {
        this.qcNotes = qcNotes;
    }

    public String getQcNotes() 
    {
        return qcNotes;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("qcId", getQcId())
            .append("specimenId", getSpecimenId())
            .append("qcDate", getQcDate())
            .append("dnaConcentration", getDnaConcentration())
            .append("dnaQualityRatio", getDnaQualityRatio())
            .append("rnaIntegrityNumber", getRnaIntegrityNumber())
            .append("proteinConcentration", getProteinConcentration())
            .append("hemolysisLevel", getHemolysisLevel())
            .append("contaminationStatus", getContaminationStatus())
            .append("qcOperator", getQcOperator())
            .append("qcMethod", getQcMethod())
            .append("qcNotes", getQcNotes())
            .toString();
    }
}
