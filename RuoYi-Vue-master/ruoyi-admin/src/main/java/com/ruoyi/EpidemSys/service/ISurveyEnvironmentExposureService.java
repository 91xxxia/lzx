package com.ruoyi.EpidemSys.service;

import java.util.List;
import com.ruoyi.EpidemSys.domain.SurveyEnvironmentExposure;

/**
 * 家庭环境暴露信息Service接口
 * 
 * @author ruoyi
 * @date 2025-06-28
 */
public interface ISurveyEnvironmentExposureService 
{
    /**
     * 查询家庭环境暴露信息
     * 
     * @param envId 家庭环境暴露信息主键
     * @return 家庭环境暴露信息
     */
    public SurveyEnvironmentExposure selectSurveyEnvironmentExposureByEnvId(Long envId);

    /**
     * 查询家庭环境暴露信息列表
     * 
     * @param surveyEnvironmentExposure 家庭环境暴露信息
     * @return 家庭环境暴露信息集合
     */
    public List<SurveyEnvironmentExposure> selectSurveyEnvironmentExposureList(SurveyEnvironmentExposure surveyEnvironmentExposure);

    /**
     * 新增家庭环境暴露信息
     * 
     * @param surveyEnvironmentExposure 家庭环境暴露信息
     * @return 结果
     */
    public int insertSurveyEnvironmentExposure(SurveyEnvironmentExposure surveyEnvironmentExposure);

    /**
     * 修改家庭环境暴露信息
     * 
     * @param surveyEnvironmentExposure 家庭环境暴露信息
     * @return 结果
     */
    public int updateSurveyEnvironmentExposure(SurveyEnvironmentExposure surveyEnvironmentExposure);

    /**
     * 批量删除家庭环境暴露信息
     * 
     * @param envIds 需要删除的家庭环境暴露信息主键集合
     * @return 结果
     */
    public int deleteSurveyEnvironmentExposureByEnvIds(Long[] envIds);

    /**
     * 删除家庭环境暴露信息信息
     * 
     * @param envId 家庭环境暴露信息主键
     * @return 结果
     */
    public int deleteSurveyEnvironmentExposureByEnvId(Long envId);
}
