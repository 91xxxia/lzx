package com.ruoyi.EpidemSys.mapper;

import java.util.List;
import com.ruoyi.EpidemSys.domain.SurveyAreaEnvironment;

/**
 * 城乡环境监测数据Mapper接口
 * 
 * @author ruoyi
 * @date 2025-06-28
 */
public interface SurveyAreaEnvironmentMapper 
{
    /**
     * 查询城乡环境监测数据
     * 
     * @param envAreaId 城乡环境监测数据主键
     * @return 城乡环境监测数据
     */
    public SurveyAreaEnvironment selectSurveyAreaEnvironmentByEnvAreaId(Long envAreaId);

    /**
     * 查询城乡环境监测数据列表
     * 
     * @param surveyAreaEnvironment 城乡环境监测数据
     * @return 城乡环境监测数据集合
     */
    public List<SurveyAreaEnvironment> selectSurveyAreaEnvironmentList(SurveyAreaEnvironment surveyAreaEnvironment);

    /**
     * 新增城乡环境监测数据
     * 
     * @param surveyAreaEnvironment 城乡环境监测数据
     * @return 结果
     */
    public int insertSurveyAreaEnvironment(SurveyAreaEnvironment surveyAreaEnvironment);

    /**
     * 修改城乡环境监测数据
     * 
     * @param surveyAreaEnvironment 城乡环境监测数据
     * @return 结果
     */
    public int updateSurveyAreaEnvironment(SurveyAreaEnvironment surveyAreaEnvironment);

    /**
     * 删除城乡环境监测数据
     * 
     * @param envAreaId 城乡环境监测数据主键
     * @return 结果
     */
    public int deleteSurveyAreaEnvironmentByEnvAreaId(Long envAreaId);

    /**
     * 批量删除城乡环境监测数据
     * 
     * @param envAreaIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteSurveyAreaEnvironmentByEnvAreaIds(Long[] envAreaIds);
}
