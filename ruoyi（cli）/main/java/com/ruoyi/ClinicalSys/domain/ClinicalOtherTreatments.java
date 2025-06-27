package com.ruoyi.ClinicalSys.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 其他辅助治疗对象 clinical_other_treatments
 * 
 * @author ruoyi
 * @date 2025-06-27
 */
public class ClinicalOtherTreatments extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 其他治疗号 */
    private Long treatmentId;

    /** 病人号 */
    @Excel(name = "病人号")
    private String patientId;

    /** 治疗方法 */
    @Excel(name = "治疗方法")
    private String treatmentName;

    /** 开始时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "开始时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date startTime;

    /** 结束时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "结束时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date endTime;

    /** 注意事项 */
    @Excel(name = "注意事项")
    private String note;

    public void setTreatmentId(Long treatmentId) 
    {
        this.treatmentId = treatmentId;
    }

    public Long getTreatmentId() 
    {
        return treatmentId;
    }

    public void setPatientId(String patientId) 
    {
        this.patientId = patientId;
    }

    public String getPatientId() 
    {
        return patientId;
    }

    public void setTreatmentName(String treatmentName) 
    {
        this.treatmentName = treatmentName;
    }

    public String getTreatmentName() 
    {
        return treatmentName;
    }

    public void setStartTime(Date startTime) 
    {
        this.startTime = startTime;
    }

    public Date getStartTime() 
    {
        return startTime;
    }

    public void setEndTime(Date endTime) 
    {
        this.endTime = endTime;
    }

    public Date getEndTime() 
    {
        return endTime;
    }

    public void setNote(String note) 
    {
        this.note = note;
    }

    public String getNote() 
    {
        return note;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("treatmentId", getTreatmentId())
            .append("patientId", getPatientId())
            .append("treatmentName", getTreatmentName())
            .append("startTime", getStartTime())
            .append("endTime", getEndTime())
            .append("note", getNote())
            .toString();
    }
}
