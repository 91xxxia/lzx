package com.ruoyi.FollowSys.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.FollowSys.mapper.FollowupAdverseReactionsMapper;
import com.ruoyi.FollowSys.domain.FollowupAdverseReactions;
import com.ruoyi.FollowSys.service.IFollowupAdverseReactionsService;

/**
 * 药物不良反应Service业务层处理
 * 
 * @author ruoyi
 * @date 2025-06-28
 */
@Service
public class FollowupAdverseReactionsServiceImpl implements IFollowupAdverseReactionsService 
{
    @Autowired
    private FollowupAdverseReactionsMapper followupAdverseReactionsMapper;

    /**
     * 查询药物不良反应
     * 
     * @param reactionId 药物不良反应主键
     * @return 药物不良反应
     */
    @Override
    public FollowupAdverseReactions selectFollowupAdverseReactionsByReactionId(Long reactionId)
    {
        return followupAdverseReactionsMapper.selectFollowupAdverseReactionsByReactionId(reactionId);
    }

    /**
     * 查询药物不良反应列表
     * 
     * @param followupAdverseReactions 药物不良反应
     * @return 药物不良反应
     */
    @Override
    public List<FollowupAdverseReactions> selectFollowupAdverseReactionsList(FollowupAdverseReactions followupAdverseReactions)
    {
        return followupAdverseReactionsMapper.selectFollowupAdverseReactionsList(followupAdverseReactions);
    }

    /**
     * 新增药物不良反应
     * 
     * @param followupAdverseReactions 药物不良反应
     * @return 结果
     */
    @Override
    public int insertFollowupAdverseReactions(FollowupAdverseReactions followupAdverseReactions)
    {
        return followupAdverseReactionsMapper.insertFollowupAdverseReactions(followupAdverseReactions);
    }

    /**
     * 修改药物不良反应
     * 
     * @param followupAdverseReactions 药物不良反应
     * @return 结果
     */
    @Override
    public int updateFollowupAdverseReactions(FollowupAdverseReactions followupAdverseReactions)
    {
        return followupAdverseReactionsMapper.updateFollowupAdverseReactions(followupAdverseReactions);
    }

    /**
     * 批量删除药物不良反应
     * 
     * @param reactionIds 需要删除的药物不良反应主键
     * @return 结果
     */
    @Override
    public int deleteFollowupAdverseReactionsByReactionIds(Long[] reactionIds)
    {
        return followupAdverseReactionsMapper.deleteFollowupAdverseReactionsByReactionIds(reactionIds);
    }

    /**
     * 删除药物不良反应信息
     * 
     * @param reactionId 药物不良反应主键
     * @return 结果
     */
    @Override
    public int deleteFollowupAdverseReactionsByReactionId(Long reactionId)
    {
        return followupAdverseReactionsMapper.deleteFollowupAdverseReactionsByReactionId(reactionId);
    }
}
