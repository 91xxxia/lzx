package com.ruoyi.FollowSys.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 药物不良反应对象 followup_adverse_reactions
 * 
 * @author ruoyi
 * @date 2025-06-28
 */
public class FollowupAdverseReactions extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 不良反应号 */
    private Long reactionId;

    /** 病人号 */
    @Excel(name = "病人号")
    private String patientId;

    /** 药品名称 */
    @Excel(name = "药品名称")
    private String medicationName;

    /** 不良反应发生时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "不良反应发生时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date reactionOnsetDate;

    /** 药物用量用法 */
    @Excel(name = "药物用量用法")
    private String usageMethod;

    /** 复用天数 */
    @Excel(name = "复用天数")
    private Long durationDays;

    /** 皮瘆 */
    @Excel(name = "皮瘆")
    private Integer rash;

    /** 瘙痒 */
    @Excel(name = "瘙痒")
    private Integer itching;

    /** 腹痛 */
    @Excel(name = "腹痛")
    private Integer abdominalPain;

    /** 恶心 */
    @Excel(name = "恶心")
    private Integer nausea;

    /** 呕吐 */
    @Excel(name = "呕吐")
    private Integer vomiting;

    /** 胸闷 */
    @Excel(name = "胸闷")
    private Integer chestTightness;

    /** 心悸 */
    @Excel(name = "心悸")
    private Integer palpitations;

    /** 呼吸困难 */
    @Excel(name = "呼吸困难")
    private Integer dyspnea;

    /** 其他 */
    @Excel(name = "其他")
    private String otherReaction;

    /** 严重程度 */
    @Excel(name = "严重程度")
    private String severityLevel;

    public void setReactionId(Long reactionId) 
    {
        this.reactionId = reactionId;
    }

    public Long getReactionId() 
    {
        return reactionId;
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

    public void setReactionOnsetDate(Date reactionOnsetDate) 
    {
        this.reactionOnsetDate = reactionOnsetDate;
    }

    public Date getReactionOnsetDate() 
    {
        return reactionOnsetDate;
    }

    public void setUsageMethod(String usageMethod) 
    {
        this.usageMethod = usageMethod;
    }

    public String getUsageMethod() 
    {
        return usageMethod;
    }

    public void setDurationDays(Long durationDays) 
    {
        this.durationDays = durationDays;
    }

    public Long getDurationDays() 
    {
        return durationDays;
    }

    public void setRash(Integer rash) 
    {
        this.rash = rash;
    }

    public Integer getRash() 
    {
        return rash;
    }

    public void setItching(Integer itching) 
    {
        this.itching = itching;
    }

    public Integer getItching() 
    {
        return itching;
    }

    public void setAbdominalPain(Integer abdominalPain) 
    {
        this.abdominalPain = abdominalPain;
    }

    public Integer getAbdominalPain() 
    {
        return abdominalPain;
    }

    public void setNausea(Integer nausea) 
    {
        this.nausea = nausea;
    }

    public Integer getNausea() 
    {
        return nausea;
    }

    public void setVomiting(Integer vomiting) 
    {
        this.vomiting = vomiting;
    }

    public Integer getVomiting() 
    {
        return vomiting;
    }

    public void setChestTightness(Integer chestTightness) 
    {
        this.chestTightness = chestTightness;
    }

    public Integer getChestTightness() 
    {
        return chestTightness;
    }

    public void setPalpitations(Integer palpitations) 
    {
        this.palpitations = palpitations;
    }

    public Integer getPalpitations() 
    {
        return palpitations;
    }

    public void setDyspnea(Integer dyspnea) 
    {
        this.dyspnea = dyspnea;
    }

    public Integer getDyspnea() 
    {
        return dyspnea;
    }

    public void setOtherReaction(String otherReaction) 
    {
        this.otherReaction = otherReaction;
    }

    public String getOtherReaction() 
    {
        return otherReaction;
    }

    public void setSeverityLevel(String severityLevel) 
    {
        this.severityLevel = severityLevel;
    }

    public String getSeverityLevel() 
    {
        return severityLevel;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("reactionId", getReactionId())
            .append("patientId", getPatientId())
            .append("medicationName", getMedicationName())
            .append("reactionOnsetDate", getReactionOnsetDate())
            .append("usageMethod", getUsageMethod())
            .append("durationDays", getDurationDays())
            .append("rash", getRash())
            .append("itching", getItching())
            .append("abdominalPain", getAbdominalPain())
            .append("nausea", getNausea())
            .append("vomiting", getVomiting())
            .append("chestTightness", getChestTightness())
            .append("palpitations", getPalpitations())
            .append("dyspnea", getDyspnea())
            .append("otherReaction", getOtherReaction())
            .append("severityLevel", getSeverityLevel())
            .toString();
    }
}
