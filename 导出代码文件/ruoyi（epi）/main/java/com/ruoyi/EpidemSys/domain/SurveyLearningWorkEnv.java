package com.ruoyi.EpidemSys.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 学习/工作环境信息对象 survey_learning_work_env
 * 
 * @author ruoyi
 * @date 2025-06-28
 */
public class SurveyLearningWorkEnv extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 学习/工作环境号 */
    private Long learnEnvId;

    /** 患者号 */
    @Excel(name = "患者号")
    private Long surveyId;

    /** 单位位置 */
    @Excel(name = "单位位置")
    private String locationType;

    /** 通风情况 */
    @Excel(name = "通风情况")
    private String ventilationQuality;

    /** PM2.5年均值 */
    @Excel(name = "PM2.5年均值")
    private Long pm25Annual;

    /** 花粉季节性峰值浓度 */
    @Excel(name = "花粉季节性峰值浓度")
    private Long pollenPeakConcentration;

    /** 花粉类型 */
    @Excel(name = "花粉类型")
    private String pollenTypes;

    /** 甲醛检测值 */
    @Excel(name = "甲醛检测值")
    private Long formaldehydeLevelWorkplace;

    /** 有无地毯 */
    @Excel(name = "有无地毯")
    private Integer hasCarpet;

    /** 有无布艺家具 */
    @Excel(name = "有无布艺家具")
    private Integer hasFabricFurniture;

    public void setLearnEnvId(Long learnEnvId) 
    {
        this.learnEnvId = learnEnvId;
    }

    public Long getLearnEnvId() 
    {
        return learnEnvId;
    }

    public void setSurveyId(Long surveyId) 
    {
        this.surveyId = surveyId;
    }

    public Long getSurveyId() 
    {
        return surveyId;
    }

    public void setLocationType(String locationType) 
    {
        this.locationType = locationType;
    }

    public String getLocationType() 
    {
        return locationType;
    }

    public void setVentilationQuality(String ventilationQuality) 
    {
        this.ventilationQuality = ventilationQuality;
    }

    public String getVentilationQuality() 
    {
        return ventilationQuality;
    }

    public void setPm25Annual(Long pm25Annual) 
    {
        this.pm25Annual = pm25Annual;
    }

    public Long getPm25Annual() 
    {
        return pm25Annual;
    }

    public void setPollenPeakConcentration(Long pollenPeakConcentration) 
    {
        this.pollenPeakConcentration = pollenPeakConcentration;
    }

    public Long getPollenPeakConcentration() 
    {
        return pollenPeakConcentration;
    }

    public void setPollenTypes(String pollenTypes) 
    {
        this.pollenTypes = pollenTypes;
    }

    public String getPollenTypes() 
    {
        return pollenTypes;
    }

    public void setFormaldehydeLevelWorkplace(Long formaldehydeLevelWorkplace) 
    {
        this.formaldehydeLevelWorkplace = formaldehydeLevelWorkplace;
    }

    public Long getFormaldehydeLevelWorkplace() 
    {
        return formaldehydeLevelWorkplace;
    }

    public void setHasCarpet(Integer hasCarpet) 
    {
        this.hasCarpet = hasCarpet;
    }

    public Integer getHasCarpet() 
    {
        return hasCarpet;
    }

    public void setHasFabricFurniture(Integer hasFabricFurniture) 
    {
        this.hasFabricFurniture = hasFabricFurniture;
    }

    public Integer getHasFabricFurniture() 
    {
        return hasFabricFurniture;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("learnEnvId", getLearnEnvId())
            .append("surveyId", getSurveyId())
            .append("locationType", getLocationType())
            .append("ventilationQuality", getVentilationQuality())
            .append("pm25Annual", getPm25Annual())
            .append("pollenPeakConcentration", getPollenPeakConcentration())
            .append("pollenTypes", getPollenTypes())
            .append("formaldehydeLevelWorkplace", getFormaldehydeLevelWorkplace())
            .append("hasCarpet", getHasCarpet())
            .append("hasFabricFurniture", getHasFabricFurniture())
            .toString();
    }
}
