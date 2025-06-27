package com.ruoyi.EpidemSys.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.EpidemSys.mapper.SurveyLearningWorkEnvMapper;
import com.ruoyi.EpidemSys.domain.SurveyLearningWorkEnv;
import com.ruoyi.EpidemSys.service.ISurveyLearningWorkEnvService;

/**
 * 学习/工作环境号Service业务层处理
 * 
 * @author ruoyi
 * @date 2025-06-27
 */
@Service
public class SurveyLearningWorkEnvServiceImpl implements ISurveyLearningWorkEnvService 
{
    @Autowired
    private SurveyLearningWorkEnvMapper surveyLearningWorkEnvMapper;

    /**
     * 查询学习/工作环境号
     * 
     * @param learnEnvId 学习/工作环境号主键
     * @return 学习/工作环境号
     */
    @Override
    public SurveyLearningWorkEnv selectSurveyLearningWorkEnvByLearnEnvId(Long learnEnvId)
    {
        return surveyLearningWorkEnvMapper.selectSurveyLearningWorkEnvByLearnEnvId(learnEnvId);
    }

    /**
     * 查询学习/工作环境号列表
     * 
     * @param surveyLearningWorkEnv 学习/工作环境号
     * @return 学习/工作环境号
     */
    @Override
    public List<SurveyLearningWorkEnv> selectSurveyLearningWorkEnvList(SurveyLearningWorkEnv surveyLearningWorkEnv)
    {
        return surveyLearningWorkEnvMapper.selectSurveyLearningWorkEnvList(surveyLearningWorkEnv);
    }

    /**
     * 新增学习/工作环境号
     * 
     * @param surveyLearningWorkEnv 学习/工作环境号
     * @return 结果
     */
    @Override
    public int insertSurveyLearningWorkEnv(SurveyLearningWorkEnv surveyLearningWorkEnv)
    {
        return surveyLearningWorkEnvMapper.insertSurveyLearningWorkEnv(surveyLearningWorkEnv);
    }

    /**
     * 修改学习/工作环境号
     * 
     * @param surveyLearningWorkEnv 学习/工作环境号
     * @return 结果
     */
    @Override
    public int updateSurveyLearningWorkEnv(SurveyLearningWorkEnv surveyLearningWorkEnv)
    {
        return surveyLearningWorkEnvMapper.updateSurveyLearningWorkEnv(surveyLearningWorkEnv);
    }

    /**
     * 批量删除学习/工作环境号
     * 
     * @param learnEnvIds 需要删除的学习/工作环境号主键
     * @return 结果
     */
    @Override
    public int deleteSurveyLearningWorkEnvByLearnEnvIds(Long[] learnEnvIds)
    {
        return surveyLearningWorkEnvMapper.deleteSurveyLearningWorkEnvByLearnEnvIds(learnEnvIds);
    }

    /**
     * 删除学习/工作环境号信息
     * 
     * @param learnEnvId 学习/工作环境号主键
     * @return 结果
     */
    @Override
    public int deleteSurveyLearningWorkEnvByLearnEnvId(Long learnEnvId)
    {
        return surveyLearningWorkEnvMapper.deleteSurveyLearningWorkEnvByLearnEnvId(learnEnvId);
    }
}
