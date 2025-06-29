package com.ruoyi.FollowSys.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 呼出气一氧化氮检测对象 followup_feno_tests
 * 
 * @author ruoyi
 * @date 2025-06-28
 */
public class FollowupFenoTests extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 检测号 */
    private Long fenoId;

    /** 随访号 */
    @Excel(name = "随访号")
    private Long followupId;

    /** 检查日期 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "检查日期", width = 30, dateFormat = "yyyy-MM-dd")
    private Date testDate;

    /** FeNO50值 */
    @Excel(name = "FeNO50值")
    private Long feno50;

    /** FeNO200值 */
    @Excel(name = "FeNO200值")
    private Long feno200;

    /** CaNO值 */
    @Excel(name = "CaNO值")
    private Long cano;

    public void setFenoId(Long fenoId) 
    {
        this.fenoId = fenoId;
    }

    public Long getFenoId() 
    {
        return fenoId;
    }

    public void setFollowupId(Long followupId) 
    {
        this.followupId = followupId;
    }

    public Long getFollowupId() 
    {
        return followupId;
    }

    public void setTestDate(Date testDate) 
    {
        this.testDate = testDate;
    }

    public Date getTestDate() 
    {
        return testDate;
    }

    public void setFeno50(Long feno50) 
    {
        this.feno50 = feno50;
    }

    public Long getFeno50() 
    {
        return feno50;
    }

    public void setFeno200(Long feno200) 
    {
        this.feno200 = feno200;
    }

    public Long getFeno200() 
    {
        return feno200;
    }

    public void setCano(Long cano) 
    {
        this.cano = cano;
    }

    public Long getCano() 
    {
        return cano;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("fenoId", getFenoId())
            .append("followupId", getFollowupId())
            .append("testDate", getTestDate())
            .append("feno50", getFeno50())
            .append("feno200", getFeno200())
            .append("cano", getCano())
            .toString();
    }
}
