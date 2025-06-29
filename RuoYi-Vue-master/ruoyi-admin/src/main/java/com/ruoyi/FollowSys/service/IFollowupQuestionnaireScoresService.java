package com.ruoyi.FollowSys.service;

import java.util.List;
import com.ruoyi.FollowSys.domain.FollowupQuestionnaireScores;

/**
 * 调查问卷Service接口
 * 
 * @author ruoyi
 * @date 2025-06-28
 */
public interface IFollowupQuestionnaireScoresService 
{
    /**
     * 查询调查问卷
     * 
     * @param questionnaireId 调查问卷主键
     * @return 调查问卷
     */
    public FollowupQuestionnaireScores selectFollowupQuestionnaireScoresByQuestionnaireId(Long questionnaireId);

    /**
     * 查询调查问卷列表
     * 
     * @param followupQuestionnaireScores 调查问卷
     * @return 调查问卷集合
     */
    public List<FollowupQuestionnaireScores> selectFollowupQuestionnaireScoresList(FollowupQuestionnaireScores followupQuestionnaireScores);

    /**
     * 新增调查问卷
     * 
     * @param followupQuestionnaireScores 调查问卷
     * @return 结果
     */
    public int insertFollowupQuestionnaireScores(FollowupQuestionnaireScores followupQuestionnaireScores);

    /**
     * 修改调查问卷
     * 
     * @param followupQuestionnaireScores 调查问卷
     * @return 结果
     */
    public int updateFollowupQuestionnaireScores(FollowupQuestionnaireScores followupQuestionnaireScores);

    /**
     * 批量删除调查问卷
     * 
     * @param questionnaireIds 需要删除的调查问卷主键集合
     * @return 结果
     */
    public int deleteFollowupQuestionnaireScoresByQuestionnaireIds(Long[] questionnaireIds);

    /**
     * 删除调查问卷信息
     * 
     * @param questionnaireId 调查问卷主键
     * @return 结果
     */
    public int deleteFollowupQuestionnaireScoresByQuestionnaireId(Long questionnaireId);
}
