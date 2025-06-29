package com.ruoyi.BiobankSys.domain;

import java.math.BigDecimal;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 样本存储对象 specimen_storage
 * 
 * @author ruoyi
 * @date 2025-06-29
 */
public class SpecimenStorage extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 存储号 */
    private Long storageId;

    /** 样本号 */
    @Excel(name = "样本号")
    private String specimenId;

    /** 冰箱编号 */
    @Excel(name = "冰箱编号")
    private String storageLocation;

    /** 具体位置 */
    @Excel(name = "具体位置")
    private String storagePosition;

    /** 存储温度 */
    @Excel(name = "存储温度")
    private BigDecimal storageTemperature;

    /** 冰冻日期 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "冰冻日期", width = 30, dateFormat = "yyyy-MM-dd")
    private Date freezeDate;

    /** 冰冻方法 */
    @Excel(name = "冰冻方法")
    private String freezeMethod;

    /** 冻融循环 */
    @Excel(name = "冻融循环")
    private Long freezeThawCycles;

    /** 存储状态 */
    @Excel(name = "存储状态")
    private String storageStatus;

    /** 最后检查日期 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "最后检查日期", width = 30, dateFormat = "yyyy-MM-dd")
    private Date lastCheckDate;

    public void setStorageId(Long storageId) 
    {
        this.storageId = storageId;
    }

    public Long getStorageId() 
    {
        return storageId;
    }

    public void setSpecimenId(String specimenId) 
    {
        this.specimenId = specimenId;
    }

    public String getSpecimenId() 
    {
        return specimenId;
    }

    public void setStorageLocation(String storageLocation) 
    {
        this.storageLocation = storageLocation;
    }

    public String getStorageLocation() 
    {
        return storageLocation;
    }

    public void setStoragePosition(String storagePosition) 
    {
        this.storagePosition = storagePosition;
    }

    public String getStoragePosition() 
    {
        return storagePosition;
    }

    public void setStorageTemperature(BigDecimal storageTemperature) 
    {
        this.storageTemperature = storageTemperature;
    }

    public BigDecimal getStorageTemperature() 
    {
        return storageTemperature;
    }

    public void setFreezeDate(Date freezeDate) 
    {
        this.freezeDate = freezeDate;
    }

    public Date getFreezeDate() 
    {
        return freezeDate;
    }

    public void setFreezeMethod(String freezeMethod) 
    {
        this.freezeMethod = freezeMethod;
    }

    public String getFreezeMethod() 
    {
        return freezeMethod;
    }

    public void setFreezeThawCycles(Long freezeThawCycles) 
    {
        this.freezeThawCycles = freezeThawCycles;
    }

    public Long getFreezeThawCycles() 
    {
        return freezeThawCycles;
    }

    public void setStorageStatus(String storageStatus) 
    {
        this.storageStatus = storageStatus;
    }

    public String getStorageStatus() 
    {
        return storageStatus;
    }

    public void setLastCheckDate(Date lastCheckDate) 
    {
        this.lastCheckDate = lastCheckDate;
    }

    public Date getLastCheckDate() 
    {
        return lastCheckDate;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("storageId", getStorageId())
            .append("specimenId", getSpecimenId())
            .append("storageLocation", getStorageLocation())
            .append("storagePosition", getStoragePosition())
            .append("storageTemperature", getStorageTemperature())
            .append("freezeDate", getFreezeDate())
            .append("freezeMethod", getFreezeMethod())
            .append("freezeThawCycles", getFreezeThawCycles())
            .append("storageStatus", getStorageStatus())
            .append("lastCheckDate", getLastCheckDate())
            .toString();
    }
}
