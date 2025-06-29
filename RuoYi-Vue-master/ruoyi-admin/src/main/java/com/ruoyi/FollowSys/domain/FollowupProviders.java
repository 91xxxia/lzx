package com.ruoyi.FollowSys.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 医疗服务者标识信息对象 followup_providers
 * 
 * @author ruoyi
 * @date 2025-06-28
 */
public class FollowupProviders extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 服务者号 */
    private Long providerId;

    /** 随访号 */
    @Excel(name = "随访号")
    private Long followupId;

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

    public void setFollowupId(Long followupId) 
    {
        this.followupId = followupId;
    }

    public Long getFollowupId() 
    {
        return followupId;
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
            .append("followupId", getFollowupId())
            .append("providerName", getProviderName())
            .append("title", getTitle())
            .toString();
    }
}
