package com.ruoyi.ClinicalSys.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 实验室检查对象 lab_tests
 * 
 * @author ruoyi
 * @date 2025-06-27
 */
public class LabTests extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 实验室检查号 */
    private Long testId;

    /** 病人号 */
    @Excel(name = "病人号")
    private String patientId;

    /** 检查项目名称 */
    @Excel(name = "检查项目名称")
    private String testName;

    /** 检查日期 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "检查日期", width = 30, dateFormat = "yyyy-MM-dd")
    private Date testDate;

    /** 检查值 */
    @Excel(name = "检查值")
    private String testResult;

    public void setTestId(Long testId) 
    {
        this.testId = testId;
    }

    public Long getTestId() 
    {
        return testId;
    }

    public void setPatientId(String patientId) 
    {
        this.patientId = patientId;
    }

    public String getPatientId() 
    {
        return patientId;
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

    public void setTestResult(String testResult) 
    {
        this.testResult = testResult;
    }

    public String getTestResult() 
    {
        return testResult;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("testId", getTestId())
            .append("patientId", getPatientId())
            .append("testName", getTestName())
            .append("testDate", getTestDate())
            .append("testResult", getTestResult())
            .toString();
    }
}
