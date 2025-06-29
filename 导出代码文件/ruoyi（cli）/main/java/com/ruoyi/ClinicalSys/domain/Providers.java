package com.ruoyi.ClinicalSys.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 医疗服务者标识信息对象 providers
 * 
 * @author ruoyi
 * @date 2025-06-27
 */
public class Providers extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 服务者号 */
    private Long providerId;

    /** 病人号 */
    @Excel(name = "病人号")
    private String patientId;

    /** 姓名 */
    @Excel(name = "姓名")
    private String providerName;

    /** 职称 */
    @Excel(name = "职称")
    private String title;

    public void setProviderId(Long providerId) 
    {
        this.providerId = providerId;
    }

    public Long getProviderId() 
    {
        return providerId;
    }

    public void setPatientId(String patientId) 
    {
        this.patientId = patientId;
    }

    public String getPatientId() 
    {
        return patientId;
    }

    public void setProviderName(String providerName) 
    {
        this.providerName = providerName;
    }

    public String getProviderName() 
    {
        return providerName;
    }

    public void setTitle(String title) 
    {
        this.title = title;
    }

    public String getTitle() 
    {
        return title;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("providerId", getProviderId())
            .append("patientId", getPatientId())
            .append("providerName", getProviderName())
            .append("title", getTitle())
            .toString();
    }
}
