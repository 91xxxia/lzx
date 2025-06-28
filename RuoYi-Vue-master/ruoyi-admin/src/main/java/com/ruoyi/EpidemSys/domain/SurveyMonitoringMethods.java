package com.ruoyi.EpidemSys.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 环境监测方法对象 survey_monitoring_methods
 * 
 * @author ruoyi
 * @date 2025-06-28
 */
public class SurveyMonitoringMethods extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 检测方法号 */
    private Long methodId;

    /** 患者号 */
    @Excel(name = "患者号")
    private Long surveyId;

    /** PM2.5监测异型号 */
    @Excel(name = "PM2.5监测异型号")
    private String pm25DetectorModel;

    /** 重力沉降法 */
    @Excel(name = "重力沉降法")
    private Integer pollenGravitySettle;

    /** 体积采样法 */
    @Excel(name = "体积采样法")
    private Integer pollenVolumeSampling;

    /** 分子检测 */
    @Excel(name = "分子检测")
    private Integer pollenMolecularDetection;

    /** 过敏源蛋白检测法 */
    @Excel(name = "过敏源蛋白检测法")
    private Integer miteProteinDetection;

    /** 显微镜直接计数法 */
    @Excel(name = "显微镜直接计数法")
    private Integer miteMicroscopeCount;

    /** PCR分子检测法 */
    @Excel(name = "PCR分子检测法")
    private Integer mitePcr;

    /** 尘螨代谢产物检测法 */
    @Excel(name = "尘螨代谢产物检测法")
    private Integer miteMetabolite;

    /** 空气采样法 */
    @Excel(name = "空气采样法")
    private Integer miteAirSampling;

    /** 环境传感器技术 */
    @Excel(name = "环境传感器技术")
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
