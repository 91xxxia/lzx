package com.ruoyi.EpidemSys.mapper;

import java.util.List;
import com.ruoyi.EpidemSys.domain.SurveyLearningWorkEnv;

/**
 * 学习/工作环境号Mapper接口
 * 
 * @author ruoyi
 * @date 2025-06-27
 */
public interface SurveyLearningWorkEnvMapper 
{
    /**
     * 查询学习/工作环境号
     * 
     * @param learnEnvId 学习/工作环境号主键
     * @return 学习/工作环境号
     */
    public SurveyLearningWorkEnv selectSurveyLearningWorkEnvByLearnEnvId(Long learnEnvId);

    /**
     * 查询学习/工作环境号列表
     * 
     * @param surveyLearningWorkEnv 学习/工作环境号
     * @return 学习/工作环境号集合
     */
    public List<SurveyLearningWorkEnv> selectSurveyLearningWorkEnvList(SurveyLearningWorkEnv surveyLearningWorkEnv);

    /**
     * 新增学习/工作环境号
     * 
     * @param surveyLearningWorkEnv 学习/工作环境号
     * @return 结果
     */
    public int insertSurveyLearningWorkEnv(SurveyLearningWorkEnv surveyLearningWorkEnv);

    /**
     * 修改学习/工作环境号
     * 
     * @param surveyLearningWorkEnv 学习/工作环境号
     * @return 结果
     */
    public int updateSurveyLearningWorkEnv(SurveyLearningWorkEnv surveyLearningWorkEnv);

    /**
     * 删除学习/工作环境号
     * 
     * @param learnEnvId 学习/工作环境号主键
     * @return 结果
     */
    public int deleteSurveyLearningWorkEnvByLearnEnvId(Long learnEnvId);

    /**
     * 批量删除学习/工作环境号
     * 
     * @param learnEnvIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteSurveyLearningWorkEnvByLearnEnvIds(Long[] learnEnvIds);
}
