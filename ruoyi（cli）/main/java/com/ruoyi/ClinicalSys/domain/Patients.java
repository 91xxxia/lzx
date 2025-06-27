package com.ruoyi.ClinicalSys.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 患者基本信息对象 patients
 * 
 * @author ruoyi
 * @date 2025-06-27
 */
public class Patients extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 病人号 */
    private String patientId;

    /** 就诊时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "就诊时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date visitTime;

    /** 姓名 */
    @Excel(name = "姓名")
    private String name;

    /** 性别 */
    @Excel(name = "性别")
    private String gender;

    /** 出生日期 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "出生日期", width = 30, dateFormat = "yyyy-MM-dd")
    private Date birthDate;

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

    /** 出生体重 */
    @Excel(name = "出生体重")
    private Long birthWeight;

    /** 生活方式 */
    @Excel(name = "生活方式")
    private String lifestyle;

    public void setPatientId(String patientId) 
    {
        this.patientId = patientId;
    }

    public String getPatientId() 
    {
        return patientId;
    }

    public void setVisitTime(Date visitTime) 
    {
        this.visitTime = visitTime;
    }

    public Date getVisitTime() 
    {
        return visitTime;
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

    public void setBirthDate(Date birthDate) 
    {
        this.birthDate = birthDate;
    }

    public Date getBirthDate() 
    {
        return birthDate;
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

    public void setBirthWeight(Long birthWeight) 
    {
        this.birthWeight = birthWeight;
    }

    public Long getBirthWeight() 
    {
        return birthWeight;
    }

    public void setLifestyle(String lifestyle) 
    {
        this.lifestyle = lifestyle;
    }

    public String getLifestyle() 
    {
        return lifestyle;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("patientId", getPatientId())
            .append("visitTime", getVisitTime())
            .append("name", getName())
            .append("gender", getGender())
            .append("birthDate", getBirthDate())
            .append("age", getAge())
            .append("address", getAddress())
            .append("height", getHeight())
            .append("weight", getWeight())
            .append("birthWeight", getBirthWeight())
            .append("lifestyle", getLifestyle())
            .toString();
    }
}
