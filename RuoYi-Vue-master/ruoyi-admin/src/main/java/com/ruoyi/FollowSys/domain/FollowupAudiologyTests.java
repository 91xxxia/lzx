package com.ruoyi.FollowSys.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 听力检查对象 followup_audiology_tests
 * 
 * @author ruoyi
 * @date 2025-06-28
 */
public class FollowupAudiologyTests extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 听力检查号 */
    private Long audioId;

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

    /** 声导抗 */
    @Excel(name = "声导抗")
    private Integer tympanometry;

    /** 纯音听阈测定 */
    @Excel(name = "纯音听阈测定")
    private Integer pureToneAudiometry;

    /** 结果 */
    @Excel(name = "结果")
    private String result;

    public void setAudioId(Long audioId) 
    {
        this.audioId = audioId;
    }

    public Long getAudioId() 
    {
        return audioId;
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

    public void setTympanometry(Integer tympanometry) 
    {
        this.tympanometry = tympanometry;
    }

    public Integer getTympanometry() 
    {
        return tympanometry;
    }

    public void setPureToneAudiometry(Integer pureToneAudiometry) 
    {
        this.pureToneAudiometry = pureToneAudiometry;
    }

    public Integer getPureToneAudiometry() 
    {
        return pureToneAudiometry;
    }

    public void setResult(String result) 
    {
        this.result = result;
    }

    public String getResult() 
    {
        return result;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("audioId", getAudioId())
            .append("followupId", getFollowupId())
            .append("testName", getTestName())
            .append("testDate", getTestDate())
            .append("tympanometry", getTympanometry())
            .append("pureToneAudiometry", getPureToneAudiometry())
            .append("result", getResult())
            .toString();
    }
}
