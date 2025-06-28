package com.ruoyi.EpidemSys.service;

import java.util.List;
import com.ruoyi.EpidemSys.domain.SurveyMonitoringMethods;

/**
 * 环境监测方法Service接口
 * 
 * @author ruoyi
 * @date 2025-06-28
 */
public interface ISurveyMonitoringMethodsService 
{
    /**
     * 查询环境监测方法
     * 
     * @param methodId 环境监测方法主键
     * @return 环境监测方法
     */
    public SurveyMonitoringMethods selectSurveyMonitoringMethodsByMethodId(Long methodId);

    /**
     * 查询环境监测方法列表
     * 
     * @param surveyMonitoringMethods 环境监测方法
     * @return 环境监测方法集合
     */
    public List<SurveyMonitoringMethods> selectSurveyMonitoringMethodsList(SurveyMonitoringMethods surveyMonitoringMethods);

    /**
     * 新增环境监测方法
     * 
     * @param surveyMonitoringMethods 环境监测方法
     * @return 结果
     */
    public int insertSurveyMonitoringMethods(SurveyMonitoringMethods surveyMonitoringMethods);

    /**
     * 修改环境监测方法
     * 
     * @param surveyMonitoringMethods 环境监测方法
     * @return 结果
     */
    public int updateSurveyMonitoringMethods(SurveyMonitoringMethods surveyMonitoringMethods);

    /**
     * 批量删除环境监测方法
     * 
     * @param methodIds 需要删除的环境监测方法主键集合
     * @return 结果
     */
    public int deleteSurveyMonitoringMethodsByMethodIds(Long[] methodIds);

    /**
     * 删除环境监测方法信息
     * 
     * @param methodId 环境监测方法主键
     * @return 结果
     */
    public int deleteSurveyMonitoringMethodsByMethodId(Long methodId);
}
