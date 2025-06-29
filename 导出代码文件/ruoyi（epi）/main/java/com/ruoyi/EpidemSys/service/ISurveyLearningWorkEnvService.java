package com.ruoyi.EpidemSys.service;

import java.util.List;
import com.ruoyi.EpidemSys.domain.SurveyLearningWorkEnv;

/**
 * 学习/工作环境信息Service接口
 * 
 * @author ruoyi
 * @date 2025-06-28
 */
public interface ISurveyLearningWorkEnvService 
{
    /**
     * 查询学习/工作环境信息
     * 
     * @param learnEnvId 学习/工作环境信息主键
     * @return 学习/工作环境信息
     */
    public SurveyLearningWorkEnv selectSurveyLearningWorkEnvByLearnEnvId(Long learnEnvId);

    /**
     * 查询学习/工作环境信息列表
     * 
     * @param surveyLearningWorkEnv 学习/工作环境信息
     * @return 学习/工作环境信息集合
     */
    public List<SurveyLearningWorkEnv> selectSurveyLearningWorkEnvList(SurveyLearningWorkEnv surveyLearningWorkEnv);

    /**
     * 新增学习/工作环境信息
     * 
     * @param surveyLearningWorkEnv 学习/工作环境信息
     * @return 结果
     */
    public int insertSurveyLearningWorkEnv(SurveyLearningWorkEnv surveyLearningWorkEnv);

    /**
     * 修改学习/工作环境信息
     * 
     * @param surveyLearningWorkEnv 学习/工作环境信息
     * @return 结果
     */
    public int updateSurveyLearningWorkEnv(SurveyLearningWorkEnv surveyLearningWorkEnv);

    /**
     * 批量删除学习/工作环境信息
     * 
     * @param learnEnvIds 需要删除的学习/工作环境信息主键集合
     * @return 结果
     */
    public int deleteSurveyLearningWorkEnvByLearnEnvIds(Long[] learnEnvIds);

    /**
     * 删除学习/工作环境信息信息
     * 
     * @param learnEnvId 学习/工作环境信息主键
     * @return 结果
     */
    public int deleteSurveyLearningWorkEnvByLearnEnvId(Long learnEnvId);
}
