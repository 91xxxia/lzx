package com.ruoyi.BiobankSys.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 样本-临床关联对象 specimen_clinical_link
 * 
 * @author ruoyi
 * @date 2025-06-27
 */
public class SpecimenClinicalLink extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 关联号 */
    private Long linkId;

    /** 样本号 */
    @Excel(name = "样本号")
    private String specimenId;

    /** 关联临床诊断ID */
    @Excel(name = "关联临床诊断ID")
    private Long clinicalDiagnosisId;

    /** 关联临床症状ID */
    @Excel(name = "关联临床症状ID")
    private Long clinicalSymptomId;

    /** 关联临床用药ID */
    @Excel(name = "关联临床用药ID")
    private Long clinicalMedicationId;

    /** 关联临床检查ID */
    @Excel(name = "关联临床检查ID")
    private Long clinicalTestId;

    /** 关联类型 */
    @Excel(name = "关联类型")
    private String linkType;

    /** 临床记录 */
    @Excel(name = "临床记录")
    private String clinicalNotes;

    public void setLinkId(Long linkId) 
    {
        this.linkId = linkId;
    }

    public Long getLinkId() 
    {
        return linkId;
    }

    public void setSpecimenId(String specimenId) 
    {
        this.specimenId = specimenId;
    }

    public String getSpecimenId() 
    {
        return specimenId;
    }

    public void setClinicalDiagnosisId(Long clinicalDiagnosisId) 
    {
        this.clinicalDiagnosisId = clinicalDiagnosisId;
    }

    public Long getClinicalDiagnosisId() 
    {
        return clinicalDiagnosisId;
    }

    public void setClinicalSymptomId(Long clinicalSymptomId) 
    {
        this.clinicalSymptomId = clinicalSymptomId;
    }

    public Long getClinicalSymptomId() 
    {
        return clinicalSymptomId;
    }

    public void setClinicalMedicationId(Long clinicalMedicationId) 
    {
        this.clinicalMedicationId = clinicalMedicationId;
    }

    public Long getClinicalMedicationId() 
    {
        return clinicalMedicationId;
    }

    public void setClinicalTestId(Long clinicalTestId) 
    {
        this.clinicalTestId = clinicalTestId;
    }

    public Long getClinicalTestId() 
    {
        return clinicalTestId;
    }

    public void setLinkType(String linkType) 
    {
        this.linkType = linkType;
    }

    public String getLinkType() 
    {
        return linkType;
    }

    public void setClinicalNotes(String clinicalNotes) 
    {
        this.clinicalNotes = clinicalNotes;
    }

    public String getClinicalNotes() 
    {
        return clinicalNotes;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("linkId", getLinkId())
            .append("specimenId", getSpecimenId())
            .append("clinicalDiagnosisId", getClinicalDiagnosisId())
            .append("clinicalSymptomId", getClinicalSymptomId())
            .append("clinicalMedicationId", getClinicalMedicationId())
            .append("clinicalTestId", getClinicalTestId())
            .append("linkType", getLinkType())
            .append("clinicalNotes", getClinicalNotes())
            .toString();
    }
}
