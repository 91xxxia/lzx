package com.ruoyi.EpidemSys.service;

import java.util.List;
import com.ruoyi.EpidemSys.domain.SurveyProviders;

/**
 * 医疗调查服务者标识信息Service接口
 * 
 * @author ruoyi
 * @date 2025-06-28
 */
public interface ISurveyProvidersService 
{
    /**
     * 查询医疗调查服务者标识信息
     * 
     * @param providerId 医疗调查服务者标识信息主键
     * @return 医疗调查服务者标识信息
     */
    public SurveyProviders selectSurveyProvidersByProviderId(Long providerId);

    /**
     * 查询医疗调查服务者标识信息列表
     * 
     * @param surveyProviders 医疗调查服务者标识信息
     * @return 医疗调查服务者标识信息集合
     */
    public List<SurveyProviders> selectSurveyProvidersList(SurveyProviders surveyProviders);

    /**
     * 新增医疗调查服务者标识信息
     * 
     * @param surveyProviders 医疗调查服务者标识信息
     * @return 结果
     */
    public int insertSurveyProviders(SurveyProviders surveyProviders);

    /**
     * 修改医疗调查服务者标识信息
     * 
     * @param surveyProviders 医疗调查服务者标识信息
     * @return 结果
     */
    public int updateSurveyProviders(SurveyProviders surveyProviders);

    /**
     * 批量删除医疗调查服务者标识信息
     * 
     * @param providerIds 需要删除的医疗调查服务者标识信息主键集合
     * @return 结果
     */
    public int deleteSurveyProvidersByProviderIds(Long[] providerIds);

    /**
     * 删除医疗调查服务者标识信息信息
     * 
     * @param providerId 医疗调查服务者标识信息主键
     * @return 结果
     */
    public int deleteSurveyProvidersByProviderId(Long providerId);
}
