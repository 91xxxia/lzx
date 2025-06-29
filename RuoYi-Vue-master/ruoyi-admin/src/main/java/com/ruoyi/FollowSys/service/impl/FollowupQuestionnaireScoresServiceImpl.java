package com.ruoyi.FollowSys.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.FollowSys.mapper.FollowupQuestionnaireScoresMapper;
import com.ruoyi.FollowSys.domain.FollowupQuestionnaireScores;
import com.ruoyi.FollowSys.service.IFollowupQuestionnaireScoresService;

/**
 * 调查问卷Service业务层处理
 * 
 * @author ruoyi
 * @date 2025-06-28
 */
@Service
public class FollowupQuestionnaireScoresServiceImpl implements IFollowupQuestionnaireScoresService 
{
    @Autowired
    private FollowupQuestionnaireScoresMapper followupQuestionnaireScoresMapper;

    /**
     * 查询调查问卷
     * 
     * @param questionnaireId 调查问卷主键
     * @return 调查问卷
     */
    @Override
    public FollowupQuestionnaireScores selectFollowupQuestionnaireScoresByQuestionnaireId(Long questionnaireId)
    {
        return followupQuestionnaireScoresMapper.selectFollowupQuestionnaireScoresByQuestionnaireId(questionnaireId);
    }

    /**
     * 查询调查问卷列表
     * 
     * @param followupQuestionnaireScores 调查问卷
     * @return 调查问卷
     */
    @Override
    public List<FollowupQuestionnaireScores> selectFollowupQuestionnaireScoresList(FollowupQuestionnaireScores followupQuestionnaireScores)
    {
        return followupQuestionnaireScoresMapper.selectFollowupQuestionnaireScoresList(followupQuestionnaireScores);
    }

    /**
     * 新增调查问卷
     * 
     * @param followupQuestionnaireScores 调查问卷
     * @return 结果
     */
    @Override
    public int insertFollowupQuestionnaireScores(FollowupQuestionnaireScores followupQuestionnaireScores)
    {
        return followupQuestionnaireScoresMapper.insertFollowupQuestionnaireScores(followupQuestionnaireScores);
    }

    /**
     * 修改调查问卷
     * 
     * @param followupQuestionnaireScores 调查问卷
     * @return 结果
     */
    @Override
    public int updateFollowupQuestionnaireScores(FollowupQuestionnaireScores followupQuestionnaireScores)
    {
        return followupQuestionnaireScoresMapper.updateFollowupQuestionnaireScores(followupQuestionnaireScores);
    }

    /**
     * 批量删除调查问卷
     * 
     * @param questionnaireIds 需要删除的调查问卷主键
     * @return 结果
     */
    @Override
    public int deleteFollowupQuestionnaireScoresByQuestionnaireIds(Long[] questionnaireIds)
    {
        return followupQuestionnaireScoresMapper.deleteFollowupQuestionnaireScoresByQuestionnaireIds(questionnaireIds);
    }

    /**
     * 删除调查问卷信息
     * 
     * @param questionnaireId 调查问卷主键
     * @return 结果
     */
    @Override
    public int deleteFollowupQuestionnaireScoresByQuestionnaireId(Long questionnaireId)
    {
        return followupQuestionnaireScoresMapper.deleteFollowupQuestionnaireScoresByQuestionnaireId(questionnaireId);
    }
}
