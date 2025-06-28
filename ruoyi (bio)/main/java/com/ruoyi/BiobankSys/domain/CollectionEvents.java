package com.ruoyi.BiobankSys.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 样本采集事件对象 collection_events
 * 
 * @author ruoyi
 * @date 2025-06-27
 */
public class CollectionEvents extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 事件号 */
    private Long eventId;

    /** 病人编号 */
    @Excel(name = "病人编号")
    private String patientId;

    /** 关联临床就诊记录 */
    @Excel(name = "关联临床就诊记录")
    private String clinicalVisitId;

    /** 事件名 */
    @Excel(name = "事件名")
    private String eventName;

    /** 采集日期 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "采集日期", width = 30, dateFormat = "yyyy-MM-dd")
    private Date eventDate;

    /** 协议版本 */
    @Excel(name = "协议版本")
    private String protocolVersion;

    /** 记录者编号 */
    @Excel(name = "记录者编号")
    private Long collectorId;

    public void setEventId(Long eventId) 
    {
        this.eventId = eventId;
    }

    public Long getEventId() 
    {
        return eventId;
    }

    public void setPatientId(String patientId) 
    {
        this.patientId = patientId;
    }

    public String getPatientId() 
    {
        return patientId;
    }

    public void setClinicalVisitId(String clinicalVisitId) 
    {
        this.clinicalVisitId = clinicalVisitId;
    }

    public String getClinicalVisitId() 
    {
        return clinicalVisitId;
    }

    public void setEventName(String eventName) 
    {
        this.eventName = eventName;
    }

    public String getEventName() 
    {
        return eventName;
    }

    public void setEventDate(Date eventDate) 
    {
        this.eventDate = eventDate;
    }

    public Date getEventDate() 
    {
        return eventDate;
    }

    public void setProtocolVersion(String protocolVersion) 
    {
        this.protocolVersion = protocolVersion;
    }

    public String getProtocolVersion() 
    {
        return protocolVersion;
    }

    public void setCollectorId(Long collectorId) 
    {
        this.collectorId = collectorId;
    }

    public Long getCollectorId() 
    {
        return collectorId;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("eventId", getEventId())
            .append("patientId", getPatientId())
            .append("clinicalVisitId", getClinicalVisitId())
            .append("eventName", getEventName())
            .append("eventDate", getEventDate())
            .append("protocolVersion", getProtocolVersion())
            .append("collectorId", getCollectorId())
            .toString();
    }
}
