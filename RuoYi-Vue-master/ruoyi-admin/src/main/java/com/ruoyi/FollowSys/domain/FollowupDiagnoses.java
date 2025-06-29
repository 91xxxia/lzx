package com.ruoyi.FollowSys.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 疾病诊断对象 followup_diagnoses
 * 
 * @author ruoyi
 * @date 2025-06-28
 */
public class FollowupDiagnoses extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 诊断号 */
    private Long diagnosisId;

    /** 随访号 */
    @Excel(name = "随访号")
    private Long followupId;

    /** 诊断日期 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "诊断日期", width = 30, dateFormat = "yyyy-MM-dd")
    private Date diagnosisDate;

    /** 哮喘阶段 */
    @Excel(name = "哮喘阶段")
    private String asthmaPhase;

    /** 哮喘严重程度 */
    @Excel(name = "哮喘严重程度")
    private String asthmaSeverity;

    /** 鼻炎严重程度 */
    @Excel(name = "鼻炎严重程度")
    private String rhinitisSeverity;

    /** 鼻炎类型 */
    @Excel(name = "鼻炎类型")
    private String rhinitisType;

    /** 鼻炎持续时间 */
    @Excel(name = "鼻炎持续时间")
    private String rhinitisDuration;

    /** 特应性皮炎 */
    @Excel(name = "特应性皮炎")
    private Integer dermatitisPresent;

    /** 皮炎严重程度 */
    @Excel(name = "皮炎严重程度")
    private String dermatitisSeverity;

    /** 鼻窦炎阶段 */
    @Excel(name = "鼻窦炎阶段")
    private String sinusitisPhase;

    /** 腺样体肥大 */
    @Excel(name = "腺样体肥大")
    private Integer adenoidHypertrophy;

    /** 扁桃体肥大 */
    @Excel(name = "扁桃体肥大")
    private Integer tonsilHypertrophy;

    /** 鼾症 */
    @Excel(name = "鼾症")
    private Integer snoring;

    /** 阻塞性呼吸睡眠暂停低通气综合征 */
    @Excel(name = "阻塞性呼吸睡眠暂停低通气综合征")
    private Integer osaHypopneaSyndrome;

    /** 过敏性结膜炎 */
    @Excel(name = "过敏性结膜炎")
    private Integer allergicConjunctivitis;

    /** 其他 */
    @Excel(name = "其他")
    private String otherDiagnoses;

    public void setDiagnosisId(Long diagnosisId) 
    {
        this.diagnosisId = diagnosisId;
    }

    public Long getDiagnosisId() 
    {
        return diagnosisId;
    }

    public void setFollowupId(Long followupId) 
    {
        this.followupId = followupId;
    }

    public Long getFollowupId() 
    {
        return followupId;
    }

    public void setDiagnosisDate(Date diagnosisDate) 
    {
        this.diagnosisDate = diagnosisDate;
    }

    public Date getDiagnosisDate() 
    {
        return diagnosisDate;
    }

    public void setAsthmaPhase(String asthmaPhase) 
    {
        this.asthmaPhase = asthmaPhase;
    }

    public String getAsthmaPhase() 
    {
        return asthmaPhase;
    }

    public void setAsthmaSeverity(String asthmaSeverity) 
    {
        this.asthmaSeverity = asthmaSeverity;
    }

    public String getAsthmaSeverity() 
    {
        return asthmaSeverity;
    }

    public void setRhinitisSeverity(String rhinitisSeverity) 
    {
        this.rhinitisSeverity = rhinitisSeverity;
    }

    public String getRhinitisSeverity() 
    {
        return rhinitisSeverity;
    }

    public void setRhinitisType(String rhinitisType) 
    {
        this.rhinitisType = rhinitisType;
    }

    public String getRhinitisType() 
    {
        return rhinitisType;
    }

    public void setRhinitisDuration(String rhinitisDuration) 
    {
        this.rhinitisDuration = rhinitisDuration;
    }

    public String getRhinitisDuration() 
    {
        return rhinitisDuration;
    }

    public void setDermatitisPresent(Integer dermatitisPresent) 
    {
        this.dermatitisPresent = dermatitisPresent;
    }

    public Integer getDermatitisPresent() 
    {
        return dermatitisPresent;
    }

    public void setDermatitisSeverity(String dermatitisSeverity) 
    {
        this.dermatitisSeverity = dermatitisSeverity;
    }

    public String getDermatitisSeverity() 
    {
        return dermatitisSeverity;
    }

    public void setSinusitisPhase(String sinusitisPhase) 
    {
        this.sinusitisPhase = sinusitisPhase;
    }

    public String getSinusitisPhase() 
    {
        return sinusitisPhase;
    }

    public void setAdenoidHypertrophy(Integer adenoidHypertrophy) 
    {
        this.adenoidHypertrophy = adenoidHypertrophy;
    }

    public Integer getAdenoidHypertrophy() 
    {
        return adenoidHypertrophy;
    }

    public void setTonsilHypertrophy(Integer tonsilHypertrophy) 
    {
        this.tonsilHypertrophy = tonsilHypertrophy;
    }

    public Integer getTonsilHypertrophy() 
    {
        return tonsilHypertrophy;
    }

    public void setSnoring(Integer snoring) 
    {
        this.snoring = snoring;
    }

    public Integer getSnoring() 
    {
        return snoring;
    }

    public void setOsaHypopneaSyndrome(Integer osaHypopneaSyndrome) 
    {
        this.osaHypopneaSyndrome = osaHypopneaSyndrome;
    }

    public Integer getOsaHypopneaSyndrome() 
    {
        return osaHypopneaSyndrome;
    }

    public void setAllergicConjunctivitis(Integer allergicConjunctivitis) 
    {
        this.allergicConjunctivitis = allergicConjunctivitis;
    }

    public Integer getAllergicConjunctivitis() 
    {
        return allergicConjunctivitis;
    }

    public void setOtherDiagnoses(String otherDiagnoses) 
    {
        this.otherDiagnoses = otherDiagnoses;
    }

    public String getOtherDiagnoses() 
    {
        return otherDiagnoses;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("diagnosisId", getDiagnosisId())
            .append("followupId", getFollowupId())
            .append("diagnosisDate", getDiagnosisDate())
            .append("asthmaPhase", getAsthmaPhase())
            .append("asthmaSeverity", getAsthmaSeverity())
            .append("rhinitisSeverity", getRhinitisSeverity())
            .append("rhinitisType", getRhinitisType())
            .append("rhinitisDuration", getRhinitisDuration())
            .append("dermatitisPresent", getDermatitisPresent())
            .append("dermatitisSeverity", getDermatitisSeverity())
            .append("sinusitisPhase", getSinusitisPhase())
            .append("adenoidHypertrophy", getAdenoidHypertrophy())
            .append("tonsilHypertrophy", getTonsilHypertrophy())
            .append("snoring", getSnoring())
            .append("osaHypopneaSyndrome", getOsaHypopneaSyndrome())
            .append("allergicConjunctivitis", getAllergicConjunctivitis())
            .append("otherDiagnoses", getOtherDiagnoses())
            .toString();
    }
}
