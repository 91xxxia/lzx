package com.ruoyi.EpidemSys.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.EpidemSys.mapper.SurveyEnvironmentExposureMapper;
import com.ruoyi.EpidemSys.domain.SurveyEnvironmentExposure;
import com.ruoyi.EpidemSys.service.ISurveyEnvironmentExposureService;

/**
 * 家庭环境暴露信息Service业务层处理
 * 
 * @author ruoyi
 * @date 2025-06-27
 */
@Service
public class SurveyEnvironmentExposureServiceImpl implements ISurveyEnvironmentExposureService 
{
    @Autowired
    private SurveyEnvironmentExposureMapper surveyEnvironmentExposureMapper;

    /**
     * 查询家庭环境暴露信息
     * 
     * @param envId 家庭环境暴露信息主键
     * @return 家庭环境暴露信息
     */
    @Override
    public SurveyEnvironmentExposure selectSurveyEnvironmentExposureByEnvId(Long envId)
    {
        return surveyEnvironmentExposureMapper.selectSurveyEnvironmentExposureByEnvId(envId);
    }

    /**
     * 查询家庭环境暴露信息列表
     * 
     * @param surveyEnvironmentExposure 家庭环境暴露信息
     * @return 家庭环境暴露信息
     */
    @Override
    public List<SurveyEnvironmentExposure> selectSurveyEnvironmentExposureList(SurveyEnvironmentExposure surveyEnvironmentExposure)
    {
        return surveyEnvironmentExposureMapper.selectSurveyEnvironmentExposureList(surveyEnvironmentExposure);
    }

    /**
     * 新增家庭环境暴露信息
     * 
     * @param surveyEnvironmentExposure 家庭环境暴露信息
     * @return 结果
     */
    @Override
    public int insertSurveyEnvironmentExposure(SurveyEnvironmentExposure surveyEnvironmentExposure)
    {
        return surveyEnvironmentExposureMapper.insertSurveyEnvironmentExposure(surveyEnvironmentExposure);
    }

    /**
     * 修改家庭环境暴露信息
     * 
     * @param surveyEnvironmentExposure 家庭环境暴露信息
     * @return 结果
     */
    @Override
    public int updateSurveyEnvironmentExposure(SurveyEnvironmentExposure surveyEnvironmentExposure)
    {
        return surveyEnvironmentExposureMapper.updateSurveyEnvironmentExposure(surveyEnvironmentExposure);
    }

    /**
     * 批量删除家庭环境暴露信息
     * 
     * @param envIds 需要删除的家庭环境暴露信息主键
     * @return 结果
     */
    @Override
    public int deleteSurveyEnvironmentExposureByEnvIds(Long[] envIds)
    {
        return surveyEnvironmentExposureMapper.deleteSurveyEnvironmentExposureByEnvIds(envIds);
    }

    /**
     * 删除家庭环境暴露信息信息
     * 
     * @param envId 家庭环境暴露信息主键
     * @return 结果
     */
    @Override
    public int deleteSurveyEnvironmentExposureByEnvId(Long envId)
    {
        return surveyEnvironmentExposureMapper.deleteSurveyEnvironmentExposureByEnvId(envId);
    }
}
