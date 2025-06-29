package com.ruoyi.FollowSys.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 影像学检查对象 followup_imaging
 * 
 * @author ruoyi
 * @date 2025-06-28
 */
public class FollowupImaging extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 影像号 */
    private Long imagingId;

    /** 随访号 */
    @Excel(name = "随访号")
    private Long followupId;

    /** 检查名称 */
    @Excel(name = "检查名称")
    private String testName;

    /** 检查日期 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "检查日期", width = 30, dateFormat = "yyyy-MM-dd")
    private Date testDate;

    /** 检查报告 */
    @Excel(name = "检查报告")
    private String imagePath;

    /** 结论 */
    @Excel(name = "结论")
    private String conclusion;

    public void setImagingId(Long imagingId) 
    {
        this.imagingId = imagingId;
    }

    public Long getImagingId() 
    {
        return imagingId;
    }

    public void setFollowupId(Long followupId) 
    {
        this.followupId = followupId;
    }

    public Long getFollowupId() 
    {
        return followupId;
    }

    public void setTestName(String testName) 
    {
        this.testName = testName;
    }

    public String getTestName() 
    {
        return testName;
    }

    public void setTestDate(Date testDate) 
    {
        this.testDate = testDate;
    }

    public Date getTestDate() 
    {
        return testDate;
    }

    public void setImagePath(String imagePath) 
    {
        this.imagePath = imagePath;
    }

    public String getImagePath() 
    {
        return imagePath;
    }

    public void setConclusion(String conclusion) 
    {
        this.conclusion = conclusion;
    }

    public String getConclusion() 
    {
        return conclusion;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("imagingId", getImagingId())
            .append("followupId", getFollowupId())
            .append("testName", getTestName())
            .append("testDate", getTestDate())
            .append("imagePath", getImagePath())
            .append("conclusion", getConclusion())
            .toString();
    }
}
