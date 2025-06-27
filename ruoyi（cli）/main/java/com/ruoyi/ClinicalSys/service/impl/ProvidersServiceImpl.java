package com.ruoyi.ClinicalSys.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.ClinicalSys.mapper.ProvidersMapper;
import com.ruoyi.ClinicalSys.domain.Providers;
import com.ruoyi.ClinicalSys.service.IProvidersService;

/**
 * 医疗服务者标识信息Service业务层处理
 * 
 * @author ruoyi
 * @date 2025-06-27
 */
@Service
public class ProvidersServiceImpl implements IProvidersService 
{
    @Autowired
    private ProvidersMapper providersMapper;

    /**
     * 查询医疗服务者标识信息
     * 
     * @param providerId 医疗服务者标识信息主键
     * @return 医疗服务者标识信息
     */
    @Override
    public Providers selectProvidersByProviderId(Long providerId)
    {
        return providersMapper.selectProvidersByProviderId(providerId);
    }

    /**
     * 查询医疗服务者标识信息列表
     * 
     * @param providers 医疗服务者标识信息
     * @return 医疗服务者标识信息
     */
    @Override
    public List<Providers> selectProvidersList(Providers providers)
    {
        return providersMapper.selectProvidersList(providers);
    }

    /**
     * 新增医疗服务者标识信息
     * 
     * @param providers 医疗服务者标识信息
     * @return 结果
     */
    @Override
    public int insertProviders(Providers providers)
    {
        return providersMapper.insertProviders(providers);
    }

    /**
     * 修改医疗服务者标识信息
     * 
     * @param providers 医疗服务者标识信息
     * @return 结果
     */
    @Override
    public int updateProviders(Providers providers)
    {
        return providersMapper.updateProviders(providers);
    }

    /**
     * 批量删除医疗服务者标识信息
     * 
     * @param providerIds 需要删除的医疗服务者标识信息主键
     * @return 结果
     */
    @Override
    public int deleteProvidersByProviderIds(Long[] providerIds)
    {
        return providersMapper.deleteProvidersByProviderIds(providerIds);
    }

    /**
     * 删除医疗服务者标识信息信息
     * 
     * @param providerId 医疗服务者标识信息主键
     * @return 结果
     */
    @Override
    public int deleteProvidersByProviderId(Long providerId)
    {
        return providersMapper.deleteProvidersByProviderId(providerId);
    }
}
