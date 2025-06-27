package com.ruoyi.EpidemSys.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 二级亲属过敏史对象 family_history_secondary
 * 
 * @author ruoyi
 * @date 2025-06-27
 */
public class FamilyHistorySecondary extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 二级亲属号 */
    private Long secId;

    /** 患者号 */
    @Excel(name = "患者号")
    private Long surveyId;

    /** 关系 */
    @Excel(name = "关系")
    private String relation;

    /** 疾病 */
    @Excel(name = "疾病")
    private String diseases;

    public void setSecId(Long secId) 
    {
        this.secId = secId;
    }

    public Long getSecId() 
    {
        return secId;
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
            .append("secId", getSecId())
            .append("surveyId", getSurveyId())
            .append("relation", getRelation())
            .append("diseases", getDiseases())
            .toString();
    }
}
