package com.ruoyi.BiobankSys.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 数据变更日志对象 data_change_log
 * 
 * @author ruoyi
 * @date 2025-06-29
 */
public class DataChangeLog extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 日志号 */
    private Long logId;

    /** 表名 */
    @Excel(name = "表名")
    private String tableName;

    /** 记录编号 */
    @Excel(name = "记录编号")
    private String recordId;

    /** 更改类型 */
    @Excel(name = "更改类型")
    private String changeType;

    /** 更改者 */
    @Excel(name = "更改者")
    private String changedBy;

    /** 更改时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "更改时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date changeTime;

    /** 变更前数据 */
    @Excel(name = "变更前数据")
    private String previousData;

    /** 变更理由 */
    @Excel(name = "变更理由")
    private String changeReason;

    public void setLogId(Long logId) 
    {
        this.logId = logId;
    }

    public Long getLogId() 
    {
        return logId;
    }

    public void setTableName(String tableName) 
    {
        this.tableName = tableName;
    }

    public String getTableName() 
    {
        return tableName;
    }

    public void setRecordId(String recordId) 
    {
        this.recordId = recordId;
    }

    public String getRecordId() 
    {
        return recordId;
    }

    public void setChangeType(String changeType) 
    {
        this.changeType = changeType;
    }

    public String getChangeType() 
    {
        return changeType;
    }

    public void setChangedBy(String changedBy) 
    {
        this.changedBy = changedBy;
    }

    public String getChangedBy() 
    {
        return changedBy;
    }

    public void setChangeTime(Date changeTime) 
    {
        this.changeTime = changeTime;
    }

    public Date getChangeTime() 
    {
        return changeTime;
    }

    public void setPreviousData(String previousData) 
    {
        this.previousData = previousData;
    }

    public String getPreviousData() 
    {
        return previousData;
    }

    public void setChangeReason(String changeReason) 
    {
        this.changeReason = changeReason;
    }

    public String getChangeReason() 
    {
        return changeReason;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("logId", getLogId())
            .append("tableName", getTableName())
            .append("recordId", getRecordId())
            .append("changeType", getChangeType())
            .append("changedBy", getChangedBy())
            .append("changeTime", getChangeTime())
            .append("previousData", getPreviousData())
            .append("changeReason", getChangeReason())
            .toString();
    }
}
