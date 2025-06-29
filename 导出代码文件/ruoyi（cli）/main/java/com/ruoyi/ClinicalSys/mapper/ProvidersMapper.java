package com.ruoyi.ClinicalSys.mapper;

import java.util.List;
import com.ruoyi.ClinicalSys.domain.Providers;

/**
 * 医疗服务者标识信息Mapper接口
 * 
 * @author ruoyi
 * @date 2025-06-27
 */
public interface ProvidersMapper 
{
    /**
     * 查询医疗服务者标识信息
     * 
     * @param providerId 医疗服务者标识信息主键
     * @return 医疗服务者标识信息
     */
    public Providers selectProvidersByProviderId(Long providerId);

    /**
     * 查询医疗服务者标识信息列表
     * 
     * @param providers 医疗服务者标识信息
     * @return 医疗服务者标识信息集合
     */
    public List<Providers> selectProvidersList(Providers providers);

    /**
     * 新增医疗服务者标识信息
     * 
     * @param providers 医疗服务者标识信息
     * @return 结果
     */
    public int insertProviders(Providers providers);

    /**
     * 修改医疗服务者标识信息
     * 
     * @param providers 医疗服务者标识信息
     * @return 结果
     */
    public int updateProviders(Providers providers);

    /**
     * 删除医疗服务者标识信息
     * 
     * @param providerId 医疗服务者标识信息主键
     * @return 结果
     */
    public int deleteProvidersByProviderId(Long providerId);

    /**
     * 批量删除医疗服务者标识信息
     * 
     * @param providerIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteProvidersByProviderIds(Long[] providerIds);
}
