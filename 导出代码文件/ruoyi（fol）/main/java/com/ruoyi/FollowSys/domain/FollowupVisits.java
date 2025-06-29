package com.ruoyi.FollowSys.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 随访记录对象 followup_visits
 * 
 * @author ruoyi
 * @date 2025-06-28
 */
public class FollowupVisits extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 随访记录号 */
    private Long followupId;

    /** 病人号 */
    @Excel(name = "病人号")
    private String patientId;

    /** 随访日期 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "随访日期", width = 30, dateFormat = "yyyy-MM-dd")
    private Date visitDate;

    /** 随访类型 */
    @Excel(name = "随访类型")
    private String visitType;

    public void setFollowupId(Long followupId) 
    {
        this.followupId = followupId;
    }

    public Long getFollowupId() 
    {
        return followupId;
    }

    public void setPatientId(String patientId) 
    {
        this.patientId = patientId;
    }

    public String getPatientId() 
    {
        return patientId;
    }

    public void setVisitDate(Date visitDate) 
    {
        this.visitDate = visitDate;
    }

    public Date getVisitDate() 
    {
        return visitDate;
    }

    public void setVisitType(String visitType) 
    {
        this.visitType = visitType;
    }

    public String getVisitType() 
    {
        return visitType;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("followupId", getFollowupId())
            .append("patientId", getPatientId())
            .append("visitDate", getVisitDate())
            .append("visitType", getVisitType())
            .toString();
    }
}
