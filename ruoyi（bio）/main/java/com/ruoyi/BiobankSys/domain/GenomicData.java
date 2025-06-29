package com.ruoyi.BiobankSys.domain;

import java.math.BigDecimal;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 基因组数据对象 genomic_data
 * 
 * @author ruoyi
 * @date 2025-06-29
 */
public class GenomicData extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 基因号 */
    private Long genomicId;

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

    /** iL4基因型 */
    @Excel(name = "iL4基因型")
    private String il4Genotype;

    /** iL3基因型 */
    @Excel(name = "iL3基因型")
    private String il13Genotype;

    /** 丝聚蛋白基因突变 */
    @Excel(name = "丝聚蛋白基因突变")
    private Integer filaggrinMutation;

    /** TSLP基因突变 */
    @Excel(name = "TSLP基因突变")
    private String tslpVariant;

    /** 其他SNP */
    @Excel(name = "其他SNP")
    private String otherSnpData;

    /** 覆盖顺序 */
    @Excel(name = "覆盖顺序")
    private BigDecimal sequencingCoverage;

    /** 日期文件路径 */
    @Excel(name = "日期文件路径")
    private String dataFilePath;

    /** 分析协议 */
    @Excel(name = "分析协议")
    private String analysisProtocol;

    public void setGenomicId(Long genomicId) 
    {
        this.genomicId = genomicId;
    }

    public Long getGenomicId() 
    {
        return genomicId;
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

    public void setIl4Genotype(String il4Genotype) 
    {
        this.il4Genotype = il4Genotype;
    }

    public String getIl4Genotype() 
    {
        return il4Genotype;
    }

    public void setIl13Genotype(String il13Genotype) 
    {
        this.il13Genotype = il13Genotype;
    }

    public String getIl13Genotype() 
    {
        return il13Genotype;
    }

    public void setFilaggrinMutation(Integer filaggrinMutation) 
    {
        this.filaggrinMutation = filaggrinMutation;
    }

    public Integer getFilaggrinMutation() 
    {
        return filaggrinMutation;
    }

    public void setTslpVariant(String tslpVariant) 
    {
        this.tslpVariant = tslpVariant;
    }

    public String getTslpVariant() 
    {
        return tslpVariant;
    }

    public void setOtherSnpData(String otherSnpData) 
    {
        this.otherSnpData = otherSnpData;
    }

    public String getOtherSnpData() 
    {
        return otherSnpData;
    }

    public void setSequencingCoverage(BigDecimal sequencingCoverage) 
    {
        this.sequencingCoverage = sequencingCoverage;
    }

    public BigDecimal getSequencingCoverage() 
    {
        return sequencingCoverage;
    }

    public void setDataFilePath(String dataFilePath) 
    {
        this.dataFilePath = dataFilePath;
    }

    public String getDataFilePath() 
    {
        return dataFilePath;
    }

    public void setAnalysisProtocol(String analysisProtocol) 
    {
        this.analysisProtocol = analysisProtocol;
    }

    public String getAnalysisProtocol() 
    {
        return analysisProtocol;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("genomicId", getGenomicId())
            .append("specimenId", getSpecimenId())
            .append("analysisDate", getAnalysisDate())
            .append("analysisPlatform", getAnalysisPlatform())
            .append("il4Genotype", getIl4Genotype())
            .append("il13Genotype", getIl13Genotype())
            .append("filaggrinMutation", getFilaggrinMutation())
            .append("tslpVariant", getTslpVariant())
            .append("otherSnpData", getOtherSnpData())
            .append("sequencingCoverage", getSequencingCoverage())
            .append("dataFilePath", getDataFilePath())
            .append("analysisProtocol", getAnalysisProtocol())
            .toString();
    }
}
