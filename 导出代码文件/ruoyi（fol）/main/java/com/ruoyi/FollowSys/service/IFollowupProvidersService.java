package com.ruoyi.FollowSys.service;

import java.util.List;
import com.ruoyi.FollowSys.domain.FollowupProviders;

/**
 * 医疗服务者标识信息Service接口
 * 
 * @author ruoyi
 * @date 2025-06-28
 */
public interface IFollowupProvidersService 
{
    /**
     * 查询医疗服务者标识信息
     * 
     * @param providerId 医疗服务者标识信息主键
     * @return 医疗服务者标识信息
     */
    public FollowupProviders selectFollowupProvidersByProviderId(Long providerId);

    /**
     * 查询医疗服务者标识信息列表
     * 
     * @param followupProviders 医疗服务者标识信息
     * @return 医疗服务者标识信息集合
     */
    public List<FollowupProviders> selectFollowupProvidersList(FollowupProviders followupProviders);

    /**
     * 新增医疗服务者标识信息
     * 
     * @param followupProviders 医疗服务者标识信息
     * @return 结果
     */
    public int insertFollowupProviders(FollowupProviders followupProviders);

    /**
     * 修改医疗服务者标识信息
     * 
     * @param followupProviders 医疗服务者标识信息
     * @return 结果
     */
    public int updateFollowupProviders(FollowupProviders followupProviders);

    /**
     * 批量删除医疗服务者标识信息
     * 
     * @param providerIds 需要删除的医疗服务者标识信息主键集合
     * @return 结果
     */
    public int deleteFollowupProvidersByProviderIds(Long[] providerIds);

    /**
     * 删除医疗服务者标识信息信息
     * 
     * @param providerId 医疗服务者标识信息主键
     * @return 结果
     */
    public int deleteFollowupProvidersByProviderId(Long providerId);
}
