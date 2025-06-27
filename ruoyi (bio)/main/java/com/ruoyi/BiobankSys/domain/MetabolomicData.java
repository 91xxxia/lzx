package com.ruoyi.BiobankSys.domain;

import java.math.BigDecimal;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 代谢组数据对象 metabolomic_data
 * 
 * @author ruoyi
 * @date 2025-06-27
 */
public class MetabolomicData extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 代谢组号 */
    private Long metabolomicId;

    /** 样本号 */
    @Excel(name = "样本号")
    private String specimenId;

    /** 分析日期 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "分析日期", width = 30, dateFormat = "yyyy-MM-dd")
    private Date analysisDate;

    /** 分析平台 */
    @Excel(name = "分析平台")
    private String analysisPlatform;

    /** 组胺水平 */
    @Excel(name = "组胺水平")
    private BigDecimal histamineLevel;

    /** 白三烯水平 */
    @Excel(name = "白三烯水平")
    private BigDecimal leukotrienesLevel;

    /** 前列腺素水平 */
    @Excel(name = "前列腺素水平")
    private BigDecimal prostaglandinsLevel;

    /** 其他代谢物数据 */
    @Excel(name = "其他代谢物数据")
    private String otherMetabolites;

    /** 日期文件路径 */
    @Excel(name = "日期文件路径")
    private String dataFilePath;

    public void setMetabolomicId(Long metabolomicId) 
    {
        this.metabolomicId = metabolomicId;
    }

    public Long getMetabolomicId() 
    {
        return metabolomicId;
    }

    public void setSpecimenId(String specimenId) 
    {
        this.specimenId = specimenId;
    }

    public String getSpecimenId() 
    {
        return specimenId;
    }

    public void setAnalysisDate(Date analysisDate) 
    {
        this.analysisDate = analysisDate;
    }

    public Date getAnalysisDate() 
    {
        return analysisDate;
    }

    public void setAnalysisPlatform(String analysisPlatform) 
    {
        this.analysisPlatform = analysisPlatform;
    }

    public String getAnalysisPlatform() 
    {
        return analysisPlatform;
    }

    public void setHistamineLevel(BigDecimal histamineLevel) 
    {
        this.histamineLevel = histamineLevel;
    }

    public BigDecimal getHistamineLevel() 
    {
        return histamineLevel;
    }

    public void setLeukotrienesLevel(BigDecimal leukotrienesLevel) 
    {
        this.leukotrienesLevel = leukotrienesLevel;
    }

    public BigDecimal getLeukotrienesLevel() 
    {
        return leukotrienesLevel;
    }

    public void setProstaglandinsLevel(BigDecimal prostaglandinsLevel) 
    {
        this.prostaglandinsLevel = prostaglandinsLevel;
    }

    public BigDecimal getProstaglandinsLevel() 
    {
        return prostaglandinsLevel;
    }

    public void setOtherMetabolites(String otherMetabolites) 
    {
        this.otherMetabolites = otherMetabolites;
    }

    public String getOtherMetabolites() 
    {
        return otherMetabolites;
    }

    public void setDataFilePath(String dataFilePath) 
    {
        this.dataFilePath = dataFilePath;
    }

    public String getDataFilePath() 
    {
        return dataFilePath;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("metabolomicId", getMetabolomicId())
            .append("specimenId", getSpecimenId())
            .append("analysisDate", getAnalysisDate())
            .append("analysisPlatform", getAnalysisPlatform())
            .append("histamineLevel", getHistamineLevel())
            .append("leukotrienesLevel", getLeukotrienesLevel())
            .append("prostaglandinsLevel", getProstaglandinsLevel())
            .append("otherMetabolites", getOtherMetabolites())
            .append("dataFilePath", getDataFilePath())
            .toString();
    }
}
