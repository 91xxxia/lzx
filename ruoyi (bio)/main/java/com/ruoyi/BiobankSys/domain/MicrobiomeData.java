package com.ruoyi.BiobankSys.domain;

import java.math.BigDecimal;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 微生物组数据对象 microbiome_data
 * 
 * @author ruoyi
 * @date 2025-06-27
 */
public class MicrobiomeData extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 微生物组号 */
    private Long microbiomeId;

    /** 样本号 */
    @Excel(name = "样本号")
    private String specimenId;

    /** 分析日期 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "分析日期", width = 30, dateFormat = "yyyy-MM-dd")
    private Date analysisDate;

    /** 排序方法 */
    @Excel(name = "排序方法")
    private String sequencingMethod;

    /** α多样性指数 */
    @Excel(name = "α多样性指数")
    private BigDecimal alphaDiversity;

    /** β多样性指标 */
    @Excel(name = "β多样性指标")
    private String betaDiversityMetrics;

    /** 优势菌门 */
    @Excel(name = "优势菌门")
    private String predominantPhylum;

    /** 优势菌属 */
    @Excel(name = "优势菌属")
    private String predominantGenus;

    /** 厚壁菌/拟杆菌比 */
    @Excel(name = "厚壁菌/拟杆菌比")
    private BigDecimal firmicutesBacteroidetesRatio;

    /** 病原体检出 */
    @Excel(name = "病原体检出")
    private Integer pathogenDetected;

    /** 完整分类学报告 */
    @Excel(name = "完整分类学报告")
    private String fullTaxonomyReport;

    /** 日期文件路径 */
    @Excel(name = "日期文件路径")
    private String dataFilePath;

    public void setMicrobiomeId(Long microbiomeId) 
    {
        this.microbiomeId = microbiomeId;
    }

    public Long getMicrobiomeId() 
    {
        return microbiomeId;
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

    public void setSequencingMethod(String sequencingMethod) 
    {
        this.sequencingMethod = sequencingMethod;
    }

    public String getSequencingMethod() 
    {
        return sequencingMethod;
    }

    public void setAlphaDiversity(BigDecimal alphaDiversity) 
    {
        this.alphaDiversity = alphaDiversity;
    }

    public BigDecimal getAlphaDiversity() 
    {
        return alphaDiversity;
    }

    public void setBetaDiversityMetrics(String betaDiversityMetrics) 
    {
        this.betaDiversityMetrics = betaDiversityMetrics;
    }

    public String getBetaDiversityMetrics() 
    {
        return betaDiversityMetrics;
    }

    public void setPredominantPhylum(String predominantPhylum) 
    {
        this.predominantPhylum = predominantPhylum;
    }

    public String getPredominantPhylum() 
    {
        return predominantPhylum;
    }

    public void setPredominantGenus(String predominantGenus) 
    {
        this.predominantGenus = predominantGenus;
    }

    public String getPredominantGenus() 
    {
        return predominantGenus;
    }

    public void setFirmicutesBacteroidetesRatio(BigDecimal firmicutesBacteroidetesRatio) 
    {
        this.firmicutesBacteroidetesRatio = firmicutesBacteroidetesRatio;
    }

    public BigDecimal getFirmicutesBacteroidetesRatio() 
    {
        return firmicutesBacteroidetesRatio;
    }

    public void setPathogenDetected(Integer pathogenDetected) 
    {
        this.pathogenDetected = pathogenDetected;
    }

    public Integer getPathogenDetected() 
    {
        return pathogenDetected;
    }

    public void setFullTaxonomyReport(String fullTaxonomyReport) 
    {
        this.fullTaxonomyReport = fullTaxonomyReport;
    }

    public String getFullTaxonomyReport() 
    {
        return fullTaxonomyReport;
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
            .append("microbiomeId", getMicrobiomeId())
            .append("specimenId", getSpecimenId())
            .append("analysisDate", getAnalysisDate())
            .append("sequencingMethod", getSequencingMethod())
            .append("alphaDiversity", getAlphaDiversity())
            .append("betaDiversityMetrics", getBetaDiversityMetrics())
            .append("predominantPhylum", getPredominantPhylum())
            .append("predominantGenus", getPredominantGenus())
            .append("firmicutesBacteroidetesRatio", getFirmicutesBacteroidetesRatio())
            .append("pathogenDetected", getPathogenDetected())
            .append("fullTaxonomyReport", getFullTaxonomyReport())
            .append("dataFilePath", getDataFilePath())
            .toString();
    }
}
