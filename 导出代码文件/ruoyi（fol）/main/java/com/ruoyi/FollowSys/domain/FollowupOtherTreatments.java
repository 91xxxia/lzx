package com.ruoyi.FollowSys.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 其他辅助治疗对象 followup_other_treatments
 * 
 * @author ruoyi
 * @date 2025-06-28
 */
public class FollowupOtherTreatments extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 辅助治疗号 */
    private Long treatmentId;

    /** 病人号 */
    @Excel(name = "病人号")
    private String patientId;

    /** 治疗方法 */
    @Excel(name = "治疗方法")
    private String treatmentMethod;

    /** 开始时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "开始时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date startDate;

    /** 终止时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "终止时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date endDate;

    /** 注意事项 */
    @Excel(name = "注意事项")
    private String notes;

    /** 支气管镜检查日期 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "支气管镜检查日期", width = 30, dateFormat = "yyyy-MM-dd")
    private Date bronchoscopyDate;

    /** 支气管镜检查结论 */
    @Excel(name = "支气管镜检查结论")
    private String bronchoscopyConclusion;

    /** 支气管镜图片路径 */
    @Excel(name = "支气管镜图片路径")
    private String bronchoscopyImagePath;

    /** 鼻导管 */
    @Excel(name = "鼻导管")
    private Integer oxygenNasalCatheter;

    /** 面罩 */
    @Excel(name = "面罩")
    private Integer oxygenMask;

    /** 高流量给氧 */
    @Excel(name = "高流量给氧")
    private Integer oxygenHighFlow;

    /** 机械通气 */
    @Excel(name = "机械通气")
    private Integer mechanicalVentilation;

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

    public void setTreatmentMethod(String treatmentMethod) 
    {
        this.treatmentMethod = treatmentMethod;
    }

    public String getTreatmentMethod() 
    {
        return treatmentMethod;
    }

    public void setStartDate(Date startDate) 
    {
        this.startDate = startDate;
    }

    public Date getStartDate() 
    {
        return startDate;
    }

    public void setEndDate(Date endDate) 
    {
        this.endDate = endDate;
    }

    public Date getEndDate() 
    {
        return endDate;
    }

    public void setNotes(String notes) 
    {
        this.notes = notes;
    }

    public String getNotes() 
    {
        return notes;
    }

    public void setBronchoscopyDate(Date bronchoscopyDate) 
    {
        this.bronchoscopyDate = bronchoscopyDate;
    }

    public Date getBronchoscopyDate() 
    {
        return bronchoscopyDate;
    }

    public void setBronchoscopyConclusion(String bronchoscopyConclusion) 
    {
        this.bronchoscopyConclusion = bronchoscopyConclusion;
    }

    public String getBronchoscopyConclusion() 
    {
        return bronchoscopyConclusion;
    }

    public void setBronchoscopyImagePath(String bronchoscopyImagePath) 
    {
        this.bronchoscopyImagePath = bronchoscopyImagePath;
    }

    public String getBronchoscopyImagePath() 
    {
        return bronchoscopyImagePath;
    }

    public void setOxygenNasalCatheter(Integer oxygenNasalCatheter) 
    {
        this.oxygenNasalCatheter = oxygenNasalCatheter;
    }

    public Integer getOxygenNasalCatheter() 
    {
        return oxygenNasalCatheter;
    }

    public void setOxygenMask(Integer oxygenMask) 
    {
        this.oxygenMask = oxygenMask;
    }

    public Integer getOxygenMask() 
    {
        return oxygenMask;
    }

    public void setOxygenHighFlow(Integer oxygenHighFlow) 
    {
        this.oxygenHighFlow = oxygenHighFlow;
    }

    public Integer getOxygenHighFlow() 
    {
        return oxygenHighFlow;
    }

    public void setMechanicalVentilation(Integer mechanicalVentilation) 
    {
        this.mechanicalVentilation = mechanicalVentilation;
    }

    public Integer getMechanicalVentilation() 
    {
        return mechanicalVentilation;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("treatmentId", getTreatmentId())
            .append("patientId", getPatientId())
            .append("treatmentMethod", getTreatmentMethod())
            .append("startDate", getStartDate())
            .append("endDate", getEndDate())
            .append("notes", getNotes())
            .append("bronchoscopyDate", getBronchoscopyDate())
            .append("bronchoscopyConclusion", getBronchoscopyConclusion())
            .append("bronchoscopyImagePath", getBronchoscopyImagePath())
            .append("oxygenNasalCatheter", getOxygenNasalCatheter())
            .append("oxygenMask", getOxygenMask())
            .append("oxygenHighFlow", getOxygenHighFlow())
            .append("mechanicalVentilation", getMechanicalVentilation())
            .toString();
    }
}
