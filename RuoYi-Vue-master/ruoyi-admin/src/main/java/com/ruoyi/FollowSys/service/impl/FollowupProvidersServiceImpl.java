package com.ruoyi.FollowSys.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.FollowSys.mapper.FollowupProvidersMapper;
import com.ruoyi.FollowSys.domain.FollowupProviders;
import com.ruoyi.FollowSys.service.IFollowupProvidersService;

/**
 * 医疗服务者标识信息Service业务层处理
 * 
 * @author ruoyi
 * @date 2025-06-28
 */
@Service
public class FollowupProvidersServiceImpl implements IFollowupProvidersService 
{
    @Autowired
    private FollowupProvidersMapper followupProvidersMapper;

    /**
     * 查询医疗服务者标识信息
     * 
     * @param providerId 医疗服务者标识信息主键
     * @return 医疗服务者标识信息
     */
    @Override
    public FollowupProviders selectFollowupProvidersByProviderId(Long providerId)
    {
        return followupProvidersMapper.selectFollowupProvidersByProviderId(providerId);
    }

    /**
     * 查询医疗服务者标识信息列表
     * 
     * @param followupProviders 医疗服务者标识信息
     * @return 医疗服务者标识信息
     */
    @Override
    public List<FollowupProviders> selectFollowupProvidersList(FollowupProviders followupProviders)
    {
        return followupProvidersMapper.selectFollowupProvidersList(followupProviders);
    }

    /**
     * 新增医疗服务者标识信息
     * 
     * @param followupProviders 医疗服务者标识信息
     * @return 结果
     */
    @Override
    public int insertFollowupProviders(FollowupProviders followupProviders)
    {
        return followupProvidersMapper.insertFollowupProviders(followupProviders);
    }

    /**
     * 修改医疗服务者标识信息
     * 
     * @param followupProviders 医疗服务者标识信息
     * @return 结果
     */
    @Override
    public int updateFollowupProviders(FollowupProviders followupProviders)
    {
        return followupProvidersMapper.updateFollowupProviders(followupProviders);
    }

    /**
     * 批量删除医疗服务者标识信息
     * 
     * @param providerIds 需要删除的医疗服务者标识信息主键
     * @return 结果
     */
    @Override
    public int deleteFollowupProvidersByProviderIds(Long[] providerIds)
    {
        return followupProvidersMapper.deleteFollowupProvidersByProviderIds(providerIds);
    }

    /**
     * 删除医疗服务者标识信息信息
     * 
     * @param providerId 医疗服务者标识信息主键
     * @return 结果
     */
    @Override
    public int deleteFollowupProvidersByProviderId(Long providerId)
    {
        return followupProvidersMapper.deleteFollowupProvidersByProviderId(providerId);
    }
}
