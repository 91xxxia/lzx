package com.ruoyi.EpidemSys.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.EpidemSys.mapper.SurveyMonitoringMethodsMapper;
import com.ruoyi.EpidemSys.domain.SurveyMonitoringMethods;
import com.ruoyi.EpidemSys.service.ISurveyMonitoringMethodsService;

/**
 * 环境监测方法Service业务层处理
 * 
 * @author ruoyi
 * @date 2025-06-27
 */
@Service
public class SurveyMonitoringMethodsServiceImpl implements ISurveyMonitoringMethodsService 
{
    @Autowired
    private SurveyMonitoringMethodsMapper surveyMonitoringMethodsMapper;

    /**
     * 查询环境监测方法
     * 
     * @param methodId 环境监测方法主键
     * @return 环境监测方法
     */
    @Override
    public SurveyMonitoringMethods selectSurveyMonitoringMethodsByMethodId(Long methodId)
    {
        return surveyMonitoringMethodsMapper.selectSurveyMonitoringMethodsByMethodId(methodId);
    }

    /**
     * 查询环境监测方法列表
     * 
     * @param surveyMonitoringMethods 环境监测方法
     * @return 环境监测方法
     */
    @Override
    public List<SurveyMonitoringMethods> selectSurveyMonitoringMethodsList(SurveyMonitoringMethods surveyMonitoringMethods)
    {
        return surveyMonitoringMethodsMapper.selectSurveyMonitoringMethodsList(surveyMonitoringMethods);
    }

    /**
     * 新增环境监测方法
     * 
     * @param surveyMonitoringMethods 环境监测方法
     * @return 结果
     */
    @Override
    public int insertSurveyMonitoringMethods(SurveyMonitoringMethods surveyMonitoringMethods)
    {
        return surveyMonitoringMethodsMapper.insertSurveyMonitoringMethods(surveyMonitoringMethods);
    }

    /**
     * 修改环境监测方法
     * 
     * @param surveyMonitoringMethods 环境监测方法
     * @return 结果
     */
    @Override
    public int updateSurveyMonitoringMethods(SurveyMonitoringMethods surveyMonitoringMethods)
    {
        return surveyMonitoringMethodsMapper.updateSurveyMonitoringMethods(surveyMonitoringMethods);
    }

    /**
     * 批量删除环境监测方法
     * 
     * @param methodIds 需要删除的环境监测方法主键
     * @return 结果
     */
    @Override
    public int deleteSurveyMonitoringMethodsByMethodIds(Long[] methodIds)
    {
        return surveyMonitoringMethodsMapper.deleteSurveyMonitoringMethodsByMethodIds(methodIds);
    }

    /**
     * 删除环境监测方法信息
     * 
     * @param methodId 环境监测方法主键
     * @return 结果
     */
    @Override
    public int deleteSurveyMonitoringMethodsByMethodId(Long methodId)
    {
        return surveyMonitoringMethodsMapper.deleteSurveyMonitoringMethodsByMethodId(methodId);
    }
}
