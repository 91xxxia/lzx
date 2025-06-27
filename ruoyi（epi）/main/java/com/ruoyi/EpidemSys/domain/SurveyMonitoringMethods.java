package com.ruoyi.EpidemSys.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 环境监测方法对象 survey_monitoring_methods
 * 
 * @author ruoyi
 * @date 2025-06-27
 */
public class SurveyMonitoringMethods extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 方法号 */
    private Long methodId;

    /** 患者号 */
    @Excel(name = "患者号")
    private Long surveyId;

    /** pm2.5监测仪器号 */
    @Excel(name = "pm2.5监测仪器号")
    private String pm25DetectorModel;

    /** 花粉重力沉降法 */
    @Excel(name = "花粉重力沉降法")
    private Integer pollenGravitySettle;

    /** 花粉体积采样法 */
    @Excel(name = "花粉体积采样法")
    private Integer pollenVolumeSampling;

    /** 花粉分子检测法 */
    @Excel(name = "花粉分子检测法")
    private Integer pollenMolecularDetection;

    /** 尘螨过敏原蛋白检测法 */
    @Excel(name = "尘螨过敏原蛋白检测法")
    private Integer miteProteinDetection;

    /** 尘螨显微镜直接计数法 */
    @Excel(name = "尘螨显微镜直接计数法")
    private Integer miteMicroscopeCount;

    /** 尘螨PCR分子检测法 */
    @Excel(name = "尘螨PCR分子检测法")
    private Integer mitePcr;

    /** 尘螨代谢产物检测法 */
    @Excel(name = "尘螨代谢产物检测法")
    private Integer miteMetabolite;

    /** 尘螨空气采样法 */
    @Excel(name = "尘螨空气采样法")
    private Integer miteAirSampling;

    /** 尘螨环境传感器技术 */
    @Excel(name = "尘螨环境传感器技术")
    private Integer miteSensorTech;

    public void setMethodId(Long methodId) 
    {
        this.methodId = methodId;
    }

    public Long getMethodId() 
    {
        return methodId;
    }

    public void setSurveyId(Long surveyId) 
    {
        this.surveyId = surveyId;
    }

    public Long getSurveyId() 
    {
        return surveyId;
    }

    public void setPm25DetectorModel(String pm25DetectorModel) 
    {
        this.pm25DetectorModel = pm25DetectorModel;
    }

    public String getPm25DetectorModel() 
    {
        return pm25DetectorModel;
    }

    public void setPollenGravitySettle(Integer pollenGravitySettle) 
    {
        this.pollenGravitySettle = pollenGravitySettle;
    }

    public Integer getPollenGravitySettle() 
    {
        return pollenGravitySettle;
    }

    public void setPollenVolumeSampling(Integer pollenVolumeSampling) 
    {
        this.pollenVolumeSampling = pollenVolumeSampling;
    }

    public Integer getPollenVolumeSampling() 
    {
        return pollenVolumeSampling;
    }

    public void setPollenMolecularDetection(Integer pollenMolecularDetection) 
    {
        this.pollenMolecularDetection = pollenMolecularDetection;
    }

    public Integer getPollenMolecularDetection() 
    {
        return pollenMolecularDetection;
    }

    public void setMiteProteinDetection(Integer miteProteinDetection) 
    {
        this.miteProteinDetection = miteProteinDetection;
    }

    public Integer getMiteProteinDetection() 
    {
        return miteProteinDetection;
    }

    public void setMiteMicroscopeCount(Integer miteMicroscopeCount) 
    {
        this.miteMicroscopeCount = miteMicroscopeCount;
    }

    public Integer getMiteMicroscopeCount() 
    {
        return miteMicroscopeCount;
    }

    public void setMitePcr(Integer mitePcr) 
    {
        this.mitePcr = mitePcr;
    }

    public Integer getMitePcr() 
    {
        return mitePcr;
    }

    public void setMiteMetabolite(Integer miteMetabolite) 
    {
        this.miteMetabolite = miteMetabolite;
    }

    public Integer getMiteMetabolite() 
    {
        return miteMetabolite;
    }

    public void setMiteAirSampling(Integer miteAirSampling) 
    {
        this.miteAirSampling = miteAirSampling;
    }

    public Integer getMiteAirSampling() 
    {
        return miteAirSampling;
    }

    public void setMiteSensorTech(Integer miteSensorTech) 
    {
        this.miteSensorTech = miteSensorTech;
    }

    public Integer getMiteSensorTech() 
    {
        return miteSensorTech;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("methodId", getMethodId())
            .append("surveyId", getSurveyId())
            .append("pm25DetectorModel", getPm25DetectorModel())
            .append("pollenGravitySettle", getPollenGravitySettle())
            .append("pollenVolumeSampling", getPollenVolumeSampling())
            .append("pollenMolecularDetection", getPollenMolecularDetection())
            .append("miteProteinDetection", getMiteProteinDetection())
            .append("miteMicroscopeCount", getMiteMicroscopeCount())
            .append("mitePcr", getMitePcr())
            .append("miteMetabolite", getMiteMetabolite())
            .append("miteAirSampling", getMiteAirSampling())
            .append("miteSensorTech", getMiteSensorTech())
            .toString();
    }
}
