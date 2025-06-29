package com.ruoyi.ClinicalSys.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 联系人对象 contacts
 * 
 * @author ruoyi
 * @date 2025-06-27
 */
public class Contacts extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 联系人号 */
    private Long contactId;

    /** 病人号 */
    @Excel(name = "病人号")
    private String patientId;

    /** 联系方式 */
    @Excel(name = "联系方式")
    private String phone;

    /** 紧急联系方式 */
    @Excel(name = "紧急联系方式")
    private String emergencyContact;

    /** 关系 */
    @Excel(name = "关系")
    private String relationship;

    public void setContactId(Long contactId) 
    {
        this.contactId = contactId;
    }

    public Long getContactId() 
    {
        return contactId;
    }

    public void setPatientId(String patientId) 
    {
        this.patientId = patientId;
    }

    public String getPatientId() 
    {
        return patientId;
    }

    public void setPhone(String phone) 
    {
        this.phone = phone;
    }

    public String getPhone() 
    {
        return phone;
    }

    public void setEmergencyContact(String emergencyContact) 
    {
        this.emergencyContact = emergencyContact;
    }

    public String getEmergencyContact() 
    {
        return emergencyContact;
    }

    public void setRelationship(String relationship) 
    {
        this.relationship = relationship;
    }

    public String getRelationship() 
    {
        return relationship;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("contactId", getContactId())
            .append("patientId", getPatientId())
            .append("phone", getPhone())
            .append("emergencyContact", getEmergencyContact())
            .append("relationship", getRelationship())
            .toString();
    }
}
