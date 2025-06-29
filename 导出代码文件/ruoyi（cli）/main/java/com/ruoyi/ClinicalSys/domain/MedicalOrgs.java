package com.ruoyi.ClinicalSys.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 医疗服务机构标识信息对象 medical_orgs
 * 
 * @author ruoyi
 * @date 2025-06-27
 */
public class MedicalOrgs extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 机构号 */
    private Long orgId;

    /** 病人号 */
    @Excel(name = "病人号")
    private String patientId;

    /** 机构名称 */
    @Excel(name = "机构名称")
    private String hospitalName;

    /** 机构地址 */
    @Excel(name = "机构地址")
    private String departmentName;

    public void setOrgId(Long orgId) 
    {
        this.orgId = orgId;
    }

    public Long getOrgId() 
    {
        return orgId;
    }

    public void setPatientId(String patientId) 
    {
        this.patientId = patientId;
    }

    public String getPatientId() 
    {
        return patientId;
    }

    public void setHospitalName(String hospitalName) 
    {
        this.hospitalName = hospitalName;
    }

    public String getHospitalName() 
    {
        return hospitalName;
    }

    public void setDepartmentName(String departmentName) 
    {
        this.departmentName = departmentName;
    }

    public String getDepartmentName() 
    {
        return departmentName;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("orgId", getOrgId())
            .append("patientId", getPatientId())
            .append("hospitalName", getHospitalName())
            .append("departmentName", getDepartmentName())
            .toString();
    }
}
