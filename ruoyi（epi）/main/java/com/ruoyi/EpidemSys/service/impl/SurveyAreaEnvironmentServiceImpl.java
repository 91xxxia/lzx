package com.ruoyi.EpidemSys.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.EpidemSys.mapper.SurveyAreaEnvironmentMapper;
import com.ruoyi.EpidemSys.domain.SurveyAreaEnvironment;
import com.ruoyi.EpidemSys.service.ISurveyAreaEnvironmentService;

/**
 * 城乡环境监测Service业务层处理
 * 
 * @author ruoyi
 * @date 2025-06-27
 */
@Service
public class SurveyAreaEnvironmentServiceImpl implements ISurveyAreaEnvironmentService 
{
    @Autowired
    private SurveyAreaEnvironmentMapper surveyAreaEnvironmentMapper;

    /**
     * 查询城乡环境监测
     * 
     * @param envAreaId 城乡环境监测主键
     * @return 城乡环境监测
     */
    @Override
    public SurveyAreaEnvironment selectSurveyAreaEnvironmentByEnvAreaId(Long envAreaId)
    {
        return surveyAreaEnvironmentMapper.selectSurveyAreaEnvironmentByEnvAreaId(envAreaId);
    }

    /**
     * 查询城乡环境监测列表
     * 
     * @param surveyAreaEnvironment 城乡环境监测
     * @return 城乡环境监测
     */
    @Override
    public List<SurveyAreaEnvironment> selectSurveyAreaEnvironmentList(SurveyAreaEnvironment surveyAreaEnvironment)
    {
        return surveyAreaEnvironmentMapper.selectSurveyAreaEnvironmentList(surveyAreaEnvironment);
    }

    /**
     * 新增城乡环境监测
     * 
     * @param surveyAreaEnvironment 城乡环境监测
     * @return 结果
     */
    @Override
    public int insertSurveyAreaEnvironment(SurveyAreaEnvironment surveyAreaEnvironment)
    {
        return surveyAreaEnvironmentMapper.insertSurveyAreaEnvironment(surveyAreaEnvironment);
    }

    /**
     * 修改城乡环境监测
     * 
     * @param surveyAreaEnvironment 城乡环境监测
     * @return 结果
     */
    @Override
    public int updateSurveyAreaEnvironment(SurveyAreaEnvironment surveyAreaEnvironment)
    {
        return surveyAreaEnvironmentMapper.updateSurveyAreaEnvironment(surveyAreaEnvironment);
    }

    /**
     * 批量删除城乡环境监测
     * 
     * @param envAreaIds 需要删除的城乡环境监测主键
     * @return 结果
     */
    @Override
    public int deleteSurveyAreaEnvironmentByEnvAreaIds(Long[] envAreaIds)
    {
        return surveyAreaEnvironmentMapper.deleteSurveyAreaEnvironmentByEnvAreaIds(envAreaIds);
    }

    /**
     * 删除城乡环境监测信息
     * 
     * @param envAreaId 城乡环境监测主键
     * @return 结果
     */
    @Override
    public int deleteSurveyAreaEnvironmentByEnvAreaId(Long envAreaId)
    {
        return surveyAreaEnvironmentMapper.deleteSurveyAreaEnvironmentByEnvAreaId(envAreaId);
    }
}
