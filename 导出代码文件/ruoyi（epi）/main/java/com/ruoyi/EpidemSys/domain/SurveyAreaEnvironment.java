package com.ruoyi.EpidemSys.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 城乡环境监测数据对象 survey_area_environment
 * 
 * @author ruoyi
 * @date 2025-06-28
 */
public class SurveyAreaEnvironment extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 城乡环境号 */
    private Long envAreaId;

    /** 患者号 */
    @Excel(name = "患者号")
    private Long surveyId;

    /** 城市PM2.5年均浓度 */
    @Excel(name = "城市PM2.5年均浓度")
    private Long urbanPm25Avg;

    /** 城市PM2.5季节性变化 */
    @Excel(name = "城市PM2.5季节性变化")
    private String urbanPm25Seasonal;

    /** 城市花粉类型 */
    @Excel(name = "城市花粉类型")
    private String urbanPollenTypes;

    /** 城市花粉月度分布 */
    @Excel(name = "城市花粉月度分布")
    private String urbanPollenDistribution;

    /** 城市花粉峰值浓度 */
    @Excel(name = "城市花粉峰值浓度")
    private Long urbanPollenPeak;

    /** 城市其他污染物 */
    @Excel(name = "城市其他污染物")
    private String urbanPollutants;

    /** 城市监测点 */
    @Excel(name = "城市监测点")
    private String urbanMonitorLocation;

    /** 农村PM2.5燃烧期浓度 */
    @Excel(name = "农村PM2.5燃烧期浓度")
    private Long ruralPm25Burning;

    /** 农村Pm2.5年均值 */
    @Excel(name = "农村Pm2.5年均值")
    private Long ruralPm25Avg;

    /** 农村花粉类型 */
    @Excel(name = "农村花粉类型")
    private String ruralPollenTypes;

    /** 农村生物质燃料导致室内污染 */
    @Excel(name = "农村生物质燃料导致室内污染")
    private Integer ruralBiomassPollution;

    /** 农村饮用水类型 */
    @Excel(name = "农村饮用水类型")
    private String ruralWaterSource;

    public void setEnvAreaId(Long envAreaId) 
    {
        this.envAreaId = envAreaId;
    }

    public Long getEnvAreaId() 
    {
        return envAreaId;
    }

    public void setSurveyId(Long surveyId) 
    {
        this.surveyId = surveyId;
    }

    public Long getSurveyId() 
    {
        return surveyId;
    }

    public void setUrbanPm25Avg(Long urbanPm25Avg) 
    {
        this.urbanPm25Avg = urbanPm25Avg;
    }

    public Long getUrbanPm25Avg() 
    {
        return urbanPm25Avg;
    }

    public void setUrbanPm25Seasonal(String urbanPm25Seasonal) 
    {
        this.urbanPm25Seasonal = urbanPm25Seasonal;
    }

    public String getUrbanPm25Seasonal() 
    {
        return urbanPm25Seasonal;
    }

    public void setUrbanPollenTypes(String urbanPollenTypes) 
    {
        this.urbanPollenTypes = urbanPollenTypes;
    }

    public String getUrbanPollenTypes() 
    {
        return urbanPollenTypes;
    }

    public void setUrbanPollenDistribution(String urbanPollenDistribution) 
    {
        this.urbanPollenDistribution = urbanPollenDistribution;
    }

    public String getUrbanPollenDistribution() 
    {
        return urbanPollenDistribution;
    }

    public void setUrbanPollenPeak(Long urbanPollenPeak) 
    {
        this.urbanPollenPeak = urbanPollenPeak;
    }

    public Long getUrbanPollenPeak() 
    {
        return urbanPollenPeak;
    }

    public void setUrbanPollutants(String urbanPollutants) 
    {
        this.urbanPollutants = urbanPollutants;
    }

    public String getUrbanPollutants() 
    {
        return urbanPollutants;
    }

    public void setUrbanMonitorLocation(String urbanMonitorLocation) 
    {
        this.urbanMonitorLocation = urbanMonitorLocation;
    }

    public String getUrbanMonitorLocation() 
    {
        return urbanMonitorLocation;
    }

    public void setRuralPm25Burning(Long ruralPm25Burning) 
    {
        this.ruralPm25Burning = ruralPm25Burning;
    }

    public Long getRuralPm25Burning() 
    {
        return ruralPm25Burning;
    }

    public void setRuralPm25Avg(Long ruralPm25Avg) 
    {
        this.ruralPm25Avg = ruralPm25Avg;
    }

    public Long getRuralPm25Avg() 
    {
        return ruralPm25Avg;
    }

    public void setRuralPollenTypes(String ruralPollenTypes) 
    {
        this.ruralPollenTypes = ruralPollenTypes;
    }

    public String getRuralPollenTypes() 
    {
        return ruralPollenTypes;
    }

    public void setRuralBiomassPollution(Integer ruralBiomassPollution) 
    {
        this.ruralBiomassPollution = ruralBiomassPollution;
    }

    public Integer getRuralBiomassPollution() 
    {
        return ruralBiomassPollution;
    }

    public void setRuralWaterSource(String ruralWaterSource) 
    {
        this.ruralWaterSource = ruralWaterSource;
    }

    public String getRuralWaterSource() 
    {
        return ruralWaterSource;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("envAreaId", getEnvAreaId())
            .append("surveyId", getSurveyId())
            .append("urbanPm25Avg", getUrbanPm25Avg())
            .append("urbanPm25Seasonal", getUrbanPm25Seasonal())
            .append("urbanPollenTypes", getUrbanPollenTypes())
            .append("urbanPollenDistribution", getUrbanPollenDistribution())
            .append("urbanPollenPeak", getUrbanPollenPeak())
            .append("urbanPollutants", getUrbanPollutants())
            .append("urbanMonitorLocation", getUrbanMonitorLocation())
            .append("ruralPm25Burning", getRuralPm25Burning())
            .append("ruralPm25Avg", getRuralPm25Avg())
            .append("ruralPollenTypes", getRuralPollenTypes())
            .append("ruralBiomassPollution", getRuralBiomassPollution())
            .append("ruralWaterSource", getRuralWaterSource())
            .toString();
    }
}
