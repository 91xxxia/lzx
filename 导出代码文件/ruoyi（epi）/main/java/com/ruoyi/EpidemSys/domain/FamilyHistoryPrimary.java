package com.ruoyi.EpidemSys.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 一级亲属过敏史对象 family_history_primary
 * 
 * @author ruoyi
 * @date 2025-06-28
 */
public class FamilyHistoryPrimary extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 一级亲属号 */
    private Long primId;

    /** 患者号 */
    @Excel(name = "患者号")
    private Long surveyId;

    /** 关系 */
    @Excel(name = "关系")
    private String relation;

    /** 疾病名称 */
    @Excel(name = "疾病名称")
    private String diseases;

    public void setPrimId(Long primId) 
    {
        this.primId = primId;
    }

    public Long getPrimId() 
    {
        return primId;
    }

    public void setSurveyId(Long surveyId) 
    {
        this.surveyId = surveyId;
    }

    public Long getSurveyId() 
    {
        return surveyId;
    }

    public void setRelation(String relation) 
    {
        this.relation = relation;
    }

    public String getRelation() 
    {
        return relation;
    }

    public void setDiseases(String diseases) 
    {
        this.diseases = diseases;
    }

    public String getDiseases() 
    {
        return diseases;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("primId", getPrimId())
            .append("surveyId", getSurveyId())
            .append("relation", getRelation())
            .append("diseases", getDiseases())
            .toString();
    }
}
