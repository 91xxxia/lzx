package com.ruoyi.ClinicalSys.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 影像学检查对象 imaging
 * 
 * @author ruoyi
 * @date 2025-06-27
 */
public class Imaging extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 影像学号 */
    private Long imagingId;

    /** 病人号 */
    @Excel(name = "病人号")
    private String patientId;

    /** 影像学检查名称 */
    @Excel(name = "影像学检查名称")
    private String imagingType;

    /** 检查时期 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "检查时期", width = 30, dateFormat = "yyyy-MM-dd")
    private Date imagingDate;

    /** 检查报告 */
    @Excel(name = "检查报告")
    private String report;

    public void setImagingId(Long imagingId) 
    {
        this.imagingId = imagingId;
    }

    public Long getImagingId() 
    {
        return imagingId;
    }

    public void setPatientId(String patientId) 
    {
        this.patientId = patientId;
    }

    public String getPatientId() 
    {
        return patientId;
    }

    public void setImagingType(String imagingType) 
    {
        this.imagingType = imagingType;
    }

    public String getImagingType() 
    {
        return imagingType;
    }

    public void setImagingDate(Date imagingDate) 
    {
        this.imagingDate = imagingDate;
    }

    public Date getImagingDate() 
    {
        return imagingDate;
    }

    public void setReport(String report) 
    {
        this.report = report;
    }

    public String getReport() 
    {
        return report;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("imagingId", getImagingId())
            .append("patientId", getPatientId())
            .append("imagingType", getImagingType())
            .append("imagingDate", getImagingDate())
            .append("report", getReport())
            .toString();
    }
}
