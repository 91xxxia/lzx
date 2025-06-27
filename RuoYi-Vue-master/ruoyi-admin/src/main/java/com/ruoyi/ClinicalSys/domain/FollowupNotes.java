package com.ruoyi.ClinicalSys.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 随访信息对象 followup_notes
 * 
 * @author ruoyi
 * @date 2025-06-27
 */
public class FollowupNotes extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 随访号 */
    private Long followupId;

    /** 病人号 */
    @Excel(name = "病人号")
    private String patientId;

    /** 过敏症状改善情况 */
    @Excel(name = "过敏症状改善情况")
    private String symptomImprovement;

    /** 身体发育情况 */
    @Excel(name = "身体发育情况")
    private String physicalDevelopment;

    /** 药物不良反应 */
    @Excel(name = "药物不良反应")
    private String adverseReactions;

    /** 不良反应处理方法 */
    @Excel(name = "不良反应处理方法")
    private String reactionManagement;

    public void setFollowupId(Long followupId) 
    {
        this.followupId = followupId;
    }

    public Long getFollowupId() 
    {
        return followupId;
    }

    public void setPatientId(String patientId) 
    {
        this.patientId = patientId;
    }

    public String getPatientId() 
    {
        return patientId;
    }

    public void setSymptomImprovement(String symptomImprovement) 
    {
        this.symptomImprovement = symptomImprovement;
    }

    public String getSymptomImprovement() 
    {
        return symptomImprovement;
    }

    public void setPhysicalDevelopment(String physicalDevelopment) 
    {
        this.physicalDevelopment = physicalDevelopment;
    }

    public String getPhysicalDevelopment() 
    {
        return physicalDevelopment;
    }

    public void setAdverseReactions(String adverseReactions) 
    {
        this.adverseReactions = adverseReactions;
    }

    public String getAdverseReactions() 
    {
        return adverseReactions;
    }

    public void setReactionManagement(String reactionManagement) 
    {
        this.reactionManagement = reactionManagement;
    }

    public String getReactionManagement() 
    {
        return reactionManagement;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("followupId", getFollowupId())
            .append("patientId", getPatientId())
            .append("symptomImprovement", getSymptomImprovement())
            .append("physicalDevelopment", getPhysicalDevelopment())
            .append("adverseReactions", getAdverseReactions())
            .append("reactionManagement", getReactionManagement())
            .toString();
    }
}
