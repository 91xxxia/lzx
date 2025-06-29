package com.ruoyi.EpidemSys.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 家族环境居住相似性对象 survey_family_env
 * 
 * @author ruoyi
 * @date 2025-06-28
 */
public class SurveyFamilyEnv extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 家族环境号 */
    private Long familyEnvId;

    /** 患者号 */
    @Excel(name = "患者号")
    private Long surveyId;

    /** 共同暴露吸烟环境 */
    @Excel(name = "共同暴露吸烟环境")
    private Integer sharedSmokingExposure;

    public void setFamilyEnvId(Long familyEnvId) 
    {
        this.familyEnvId = familyEnvId;
    }

    public Long getFamilyEnvId() 
    {
        return familyEnvId;
    }

    public void setSurveyId(Long surveyId) 
    {
        this.surveyId = surveyId;
    }

    public Long getSurveyId() 
    {
        return surveyId;
    }

    public void setSharedSmokingExposure(Integer sharedSmokingExposure) 
    {
        this.sharedSmokingExposure = sharedSmokingExposure;
    }

    public Integer getSharedSmokingExposure() 
    {
        return sharedSmokingExposure;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("familyEnvId", getFamilyEnvId())
            .append("surveyId", getSurveyId())
            .append("sharedSmokingExposure", getSharedSmokingExposure())
            .toString();
    }
}
