package com.ruoyi.FollowSys.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 既往用药史对象 followup_medication_history
 * 
 * @author ruoyi
 * @date 2025-06-28
 */
public class FollowupMedicationHistory extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 既往用药号 */
    private Long medHistId;

    /** 病人号 */
    @Excel(name = "病人号")
    private String patientId;

    /** 头孢类使用天数 */
    @Excel(name = "头孢类使用天数")
    private Long cephalosporinsDays;

    /** 大环内酯类使用天数 */
    @Excel(name = "大环内酯类使用天数")
    private Long macrolidesDays;

    /** 糖皮质使用天数 */
    @Excel(name = "糖皮质使用天数")
    private Long corticosteroidsDays;

    /** 抗组胺药使用天数 */
    @Excel(name = "抗组胺药使用天数")
    private Long antihistaminesDays;

    /** 白三烯受体使用天数 */
    @Excel(name = "白三烯受体使用天数")
    private Long ltraDays;

    /** 祛痰药使用天数 */
    @Excel(name = "祛痰药使用天数")
    private Long expectorantsDays;

    /** 环孢素使用天数 */
    @Excel(name = "环孢素使用天数")
    private Long cyclosporineDays;

    /** 阿布希替尼使用天数 */
    @Excel(name = "阿布希替尼使用天数")
    private Long abrocitinibDays;

    /** 乌帕替尼使用天数 */
    @Excel(name = "乌帕替尼使用天数")
    private Long upadacitinibDays;

    public void setMedHistId(Long medHistId) 
    {
        this.medHistId = medHistId;
    }

    public Long getMedHistId() 
    {
        return medHistId;
    }

    public void setPatientId(String patientId) 
    {
        this.patientId = patientId;
    }

    public String getPatientId() 
    {
        return patientId;
    }

    public void setCephalosporinsDays(Long cephalosporinsDays) 
    {
        this.cephalosporinsDays = cephalosporinsDays;
    }

    public Long getCephalosporinsDays() 
    {
        return cephalosporinsDays;
    }

    public void setMacrolidesDays(Long macrolidesDays) 
    {
        this.macrolidesDays = macrolidesDays;
    }

    public Long getMacrolidesDays() 
    {
        return macrolidesDays;
    }

    public void setCorticosteroidsDays(Long corticosteroidsDays) 
    {
        this.corticosteroidsDays = corticosteroidsDays;
    }

    public Long getCorticosteroidsDays() 
    {
        return corticosteroidsDays;
    }

    public void setAntihistaminesDays(Long antihistaminesDays) 
    {
        this.antihistaminesDays = antihistaminesDays;
    }

    public Long getAntihistaminesDays() 
    {
        return antihistaminesDays;
    }

    public void setLtraDays(Long ltraDays) 
    {
        this.ltraDays = ltraDays;
    }

    public Long getLtraDays() 
    {
        return ltraDays;
    }

    public void setExpectorantsDays(Long expectorantsDays) 
    {
        this.expectorantsDays = expectorantsDays;
    }

    public Long getExpectorantsDays() 
    {
        return expectorantsDays;
    }

    public void setCyclosporineDays(Long cyclosporineDays) 
    {
        this.cyclosporineDays = cyclosporineDays;
    }

    public Long getCyclosporineDays() 
    {
        return cyclosporineDays;
    }

    public void setAbrocitinibDays(Long abrocitinibDays) 
    {
        this.abrocitinibDays = abrocitinibDays;
    }

    public Long getAbrocitinibDays() 
    {
        return abrocitinibDays;
    }

    public void setUpadacitinibDays(Long upadacitinibDays) 
    {
        this.upadacitinibDays = upadacitinibDays;
    }

    public Long getUpadacitinibDays() 
    {
        return upadacitinibDays;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("medHistId", getMedHistId())
            .append("patientId", getPatientId())
            .append("cephalosporinsDays", getCephalosporinsDays())
            .append("macrolidesDays", getMacrolidesDays())
            .append("corticosteroidsDays", getCorticosteroidsDays())
            .append("antihistaminesDays", getAntihistaminesDays())
            .append("ltraDays", getLtraDays())
            .append("expectorantsDays", getExpectorantsDays())
            .append("cyclosporineDays", getCyclosporineDays())
            .append("abrocitinibDays", getAbrocitinibDays())
            .append("upadacitinibDays", getUpadacitinibDays())
            .toString();
    }
}
