package com.ruoyi.FollowSys.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 随访基本信息对象 followup_info
 * 
 * @author ruoyi
 * @date 2025-06-28
 */
public class FollowupInfo extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 随访号 */
    private Long followupId;

    /** 病人号 */
    @Excel(name = "病人号")
    private String patientId;

    /** 门诊号 */
    @Excel(name = "门诊号")
    private String visitNumber;

    /** 就诊时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "就诊时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date visitDate;

    /** 姓名 */
    @Excel(name = "姓名")
    private String name;

    /** 性别 */
    @Excel(name = "性别")
    private String gender;

    /** 年龄 */
    @Excel(name = "年龄")
    private Long age;

    /** 家庭住址 */
    @Excel(name = "家庭住址")
    private String address;

    /** 身高 */
    @Excel(name = "身高")
    private Long height;

    /** 体重 */
    @Excel(name = "体重")
    private Long weight;

    /** 随访类别 */
    @Excel(name = "随访类别")
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

    public void setVisitNumber(String visitNumber) 
    {
        this.visitNumber = visitNumber;
    }

    public String getVisitNumber() 
    {
        return visitNumber;
    }

    public void setVisitDate(Date visitDate) 
    {
        this.visitDate = visitDate;
    }

    public Date getVisitDate() 
    {
        return visitDate;
    }

    public void setName(String name) 
    {
        this.name = name;
    }

    public String getName() 
    {
        return name;
    }

    public void setGender(String gender) 
    {
        this.gender = gender;
    }

    public String getGender() 
    {
        return gender;
    }

    public void setAge(Long age) 
    {
        this.age = age;
    }

    public Long getAge() 
    {
        return age;
    }

    public void setAddress(String address) 
    {
        this.address = address;
    }

    public String getAddress() 
    {
        return address;
    }

    public void setHeight(Long height) 
    {
        this.height = height;
    }

    public Long getHeight() 
    {
        return height;
    }

    public void setWeight(Long weight) 
    {
        this.weight = weight;
    }

    public Long getWeight() 
    {
        return weight;
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
            .append("visitNumber", getVisitNumber())
            .append("visitDate", getVisitDate())
            .append("name", getName())
            .append("gender", getGender())
            .append("age", getAge())
            .append("address", getAddress())
            .append("height", getHeight())
            .append("weight", getWeight())
            .append("visitType", getVisitType())
            .toString();
    }
}
