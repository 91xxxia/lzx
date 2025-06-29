package com.ruoyi.ClinicalSys.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 家族史对象 family_history
 * 
 * @author ruoyi
 * @date 2025-06-27
 */
public class FamilyHistory extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 家族号 */
    private Long famId;

    /** 病人号 */
    @Excel(name = "病人号")
    private String patientId;

    /** 相对关系 */
    @Excel(name = "相对关系")
    private String relativeRelation;

    /** 过敏性疾病 */
    @Excel(name = "过敏性疾病")
    private String allergyDisease;

    public void setFamId(Long famId) 
    {
        this.famId = famId;
    }

    public Long getFamId() 
    {
        return famId;
    }

    public void setPatientId(String patientId) 
    {
        this.patientId = patientId;
    }

    public String getPatientId() 
    {
        return patientId;
    }

    public void setRelativeRelation(String relativeRelation) 
    {
        this.relativeRelation = relativeRelation;
    }

    public String getRelativeRelation() 
    {
        return relativeRelation;
    }

    public void setAllergyDisease(String allergyDisease) 
    {
        this.allergyDisease = allergyDisease;
    }

    public String getAllergyDisease() 
    {
        return allergyDisease;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("famId", getFamId())
            .append("patientId", getPatientId())
            .append("relativeRelation", getRelativeRelation())
            .append("allergyDisease", getAllergyDisease())
            .toString();
    }
}
