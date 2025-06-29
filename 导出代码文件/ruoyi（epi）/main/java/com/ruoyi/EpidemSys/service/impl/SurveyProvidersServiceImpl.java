package com.ruoyi.EpidemSys.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.EpidemSys.mapper.SurveyProvidersMapper;
import com.ruoyi.EpidemSys.domain.SurveyProviders;
import com.ruoyi.EpidemSys.service.ISurveyProvidersService;

/**
 * 医疗调查服务者标识信息Service业务层处理
 * 
 * @author ruoyi
 * @date 2025-06-28
 */
@Service
public class SurveyProvidersServiceImpl implements ISurveyProvidersService 
{
    @Autowired
    private SurveyProvidersMapper surveyProvidersMapper;

    /**
     * 查询医疗调查服务者标识信息
     * 
     * @param providerId 医疗调查服务者标识信息主键
     * @return 医疗调查服务者标识信息
     */
    @Override
    public SurveyProviders selectSurveyProvidersByProviderId(Long providerId)
    {
        return surveyProvidersMapper.selectSurveyProvidersByProviderId(providerId);
    }

    /**
     * 查询医疗调查服务者标识信息列表
     * 
     * @param surveyProviders 医疗调查服务者标识信息
     * @return 医疗调查服务者标识信息
     */
    @Override
    public List<SurveyProviders> selectSurveyProvidersList(SurveyProviders surveyProviders)
    {
        return surveyProvidersMapper.selectSurveyProvidersList(surveyProviders);
    }

    /**
     * 新增医疗调查服务者标识信息
     * 
     * @param surveyProviders 医疗调查服务者标识信息
     * @return 结果
     */
    @Override
    public int insertSurveyProviders(SurveyProviders surveyProviders)
    {
        return surveyProvidersMapper.insertSurveyProviders(surveyProviders);
    }

    /**
     * 修改医疗调查服务者标识信息
     * 
     * @param surveyProviders 医疗调查服务者标识信息
     * @return 结果
     */
    @Override
    public int updateSurveyProviders(SurveyProviders surveyProviders)
    {
        return surveyProvidersMapper.updateSurveyProviders(surveyProviders);
    }

    /**
     * 批量删除医疗调查服务者标识信息
     * 
     * @param providerIds 需要删除的医疗调查服务者标识信息主键
     * @return 结果
     */
    @Override
    public int deleteSurveyProvidersByProviderIds(Long[] providerIds)
    {
        return surveyProvidersMapper.deleteSurveyProvidersByProviderIds(providerIds);
    }

    /**
     * 删除医疗调查服务者标识信息信息
     * 
     * @param providerId 医疗调查服务者标识信息主键
     * @return 结果
     */
    @Override
    public int deleteSurveyProvidersByProviderId(Long providerId)
    {
        return surveyProvidersMapper.deleteSurveyProvidersByProviderId(providerId);
    }
}
