package com.ruoyi.FollowSys.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 用药对象 followup_medications
 * 
 * @author ruoyi
 * @date 2025-06-28
 */
public class FollowupMedications extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 用号 */
    private Long medId;

    /** 随访号 */
    @Excel(name = "随访号")
    private Long followupId;

    /** 药物号 */
    @Excel(name = "药物号")
    private Long drugId;

    /** 剂量 */
    @Excel(name = "剂量")
    private String dose;

    /** 给药频率 */
    @Excel(name = "给药频率")
    private String frequency;

    /** 给药途径 */
    @Excel(name = "给药途径")
    private String route;

    /** 给药部位 */
    @Excel(name = "给药部位")
    private String site;

    /** 治疗开始时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "治疗开始时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date startDate;

    /** 治疗终止时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "治疗终止时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date endDate;

    /** 用药指导 */
    @Excel(name = "用药指导")
    private String guidance;

    /** 用药注意事项 */
    @Excel(name = "用药注意事项")
    private String precautions;

    public void setMedId(Long medId) 
    {
        this.medId = medId;
    }

    public Long getMedId() 
    {
        return medId;
    }

    public void setFollowupId(Long followupId) 
    {
        this.followupId = followupId;
    }

    public Long getFollowupId() 
    {
        return followupId;
    }

    public void setDrugId(Long drugId) 
    {
        this.drugId = drugId;
    }

    public Long getDrugId() 
    {
        return drugId;
    }

    public void setDose(String dose) 
    {
        this.dose = dose;
    }

    public String getDose() 
    {
        return dose;
    }

    public void setFrequency(String frequency) 
    {
        this.frequency = frequency;
    }

    public String getFrequency() 
    {
        return frequency;
    }

    public void setRoute(String route) 
    {
        this.route = route;
    }

    public String getRoute() 
    {
        return route;
    }

    public void setSite(String site) 
    {
        this.site = site;
    }

    public String getSite() 
    {
        return site;
    }

    public void setStartDate(Date startDate) 
    {
        this.startDate = startDate;
    }

    public Date getStartDate() 
    {
        return startDate;
    }

    public void setEndDate(Date endDate) 
    {
        this.endDate = endDate;
    }

    public Date getEndDate() 
    {
        return endDate;
    }

    public void setGuidance(String guidance) 
    {
        this.guidance = guidance;
    }

    public String getGuidance() 
    {
        return guidance;
    }

    public void setPrecautions(String precautions) 
    {
        this.precautions = precautions;
    }

    public String getPrecautions() 
    {
        return precautions;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("medId", getMedId())
            .append("followupId", getFollowupId())
            .append("drugId", getDrugId())
            .append("dose", getDose())
            .append("frequency", getFrequency())
            .append("route", getRoute())
            .append("site", getSite())
            .append("startDate", getStartDate())
            .append("endDate", getEndDate())
            .append("guidance", getGuidance())
            .append("precautions", getPrecautions())
            .toString();
    }
}
