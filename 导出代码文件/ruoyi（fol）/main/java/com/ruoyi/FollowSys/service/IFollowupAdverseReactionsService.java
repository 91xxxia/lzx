package com.ruoyi.FollowSys.service;

import java.util.List;
import com.ruoyi.FollowSys.domain.FollowupAdverseReactions;

/**
 * 药物不良反应Service接口
 * 
 * @author ruoyi
 * @date 2025-06-28
 */
public interface IFollowupAdverseReactionsService 
{
    /**
     * 查询药物不良反应
     * 
     * @param reactionId 药物不良反应主键
     * @return 药物不良反应
     */
    public FollowupAdverseReactions selectFollowupAdverseReactionsByReactionId(Long reactionId);

    /**
     * 查询药物不良反应列表
     * 
     * @param followupAdverseReactions 药物不良反应
     * @return 药物不良反应集合
     */
    public List<FollowupAdverseReactions> selectFollowupAdverseReactionsList(FollowupAdverseReactions followupAdverseReactions);

    /**
     * 新增药物不良反应
     * 
     * @param followupAdverseReactions 药物不良反应
     * @return 结果
     */
    public int insertFollowupAdverseReactions(FollowupAdverseReactions followupAdverseReactions);

    /**
     * 修改药物不良反应
     * 
     * @param followupAdverseReactions 药物不良反应
     * @return 结果
     */
    public int updateFollowupAdverseReactions(FollowupAdverseReactions followupAdverseReactions);

    /**
     * 批量删除药物不良反应
     * 
     * @param reactionIds 需要删除的药物不良反应主键集合
     * @return 结果
     */
    public int deleteFollowupAdverseReactionsByReactionIds(Long[] reactionIds);

    /**
     * 删除药物不良反应信息
     * 
     * @param reactionId 药物不良反应主键
     * @return 结果
     */
    public int deleteFollowupAdverseReactionsByReactionId(Long reactionId);
}
