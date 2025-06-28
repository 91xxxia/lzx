package com.ruoyi.BiobankSys.domain;

import java.math.BigDecimal;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 蛋白质组数据对象 proteomic_data
 * 
 * @author ruoyi
 * @date 2025-06-27
 */
public class ProteomicData extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 蛋白质组号 */
    private Long proteomicId;

    /** 样本号 */
    @Excel(name = "样本号")
    private String specimenId;

    /** 分析日期 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "分析日期", width = 30, dateFormat = "yyyy-MM-dd")
    private Date analysisDate;

    /** 分析方法 */
    @Excel(name = "分析方法")
    private String analysisMethod;

    /** IL-4水平 */
    @Excel(name = "IL-4水平")
    private BigDecimal il4Level;

    /** IL-5水平 */
    @Excel(name = "IL-5水平")
    private BigDecimal il5Level;

    /** IL-13水平 */
    @Excel(name = "IL-13水平")
    private BigDecimal il13Level;

    /** IgE水平 */
    @Excel(name = "IgE水平")
    private BigDecimal igeLevel;

    /** 细胞因子谱数据 */
    @Excel(name = "细胞因子谱数据")
    private String cytokineProfile;

    /** 日期文件路径 */
    @Excel(name = "日期文件路径")
    private String dataFilePath;

    public void setProteomicId(Long proteomicId) 
    {
        this.proteomicId = proteomicId;
    }

    public Long getProteomicId() 
    {
        return proteomicId;
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

    public void setAnalysisMethod(String analysisMethod) 
    {
        this.analysisMethod = analysisMethod;
    }

    public String getAnalysisMethod() 
    {
        return analysisMethod;
    }

    public void setIl4Level(BigDecimal il4Level) 
    {
        this.il4Level = il4Level;
    }

    public BigDecimal getIl4Level() 
    {
        return il4Level;
    }

    public void setIl5Level(BigDecimal il5Level) 
    {
        this.il5Level = il5Level;
    }

    public BigDecimal getIl5Level() 
    {
        return il5Level;
    }

    public void setIl13Level(BigDecimal il13Level) 
    {
        this.il13Level = il13Level;
    }

    public BigDecimal getIl13Level() 
    {
        return il13Level;
    }

    public void setIgeLevel(BigDecimal igeLevel) 
    {
        this.igeLevel = igeLevel;
    }

    public BigDecimal getIgeLevel() 
    {
        return igeLevel;
    }

    public void setCytokineProfile(String cytokineProfile) 
    {
        this.cytokineProfile = cytokineProfile;
    }

    public String getCytokineProfile() 
    {
        return cytokineProfile;
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
            .append("proteomicId", getProteomicId())
            .append("specimenId", getSpecimenId())
            .append("analysisDate", getAnalysisDate())
            .append("analysisMethod", getAnalysisMethod())
            .append("il4Level", getIl4Level())
            .append("il5Level", getIl5Level())
            .append("il13Level", getIl13Level())
            .append("igeLevel", getIgeLevel())
            .append("cytokineProfile", getCytokineProfile())
            .append("dataFilePath", getDataFilePath())
            .toString();
    }
}
