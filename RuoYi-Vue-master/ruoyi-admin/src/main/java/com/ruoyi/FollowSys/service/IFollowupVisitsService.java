package com.ruoyi.FollowSys.service;

import java.util.List;
import com.ruoyi.FollowSys.domain.FollowupVisits;

/**
 * 随访记录Service接口
 * 
 * @author ruoyi
 * @date 2025-06-28
 */
public interface IFollowupVisitsService 
{
    /**
     * 查询随访记录
     * 
     * @param followupId 随访记录主键
     * @return 随访记录
     */
    public FollowupVisits selectFollowupVisitsByFollowupId(Long followupId);

    /**
     * 查询随访记录列表
     * 
     * @param followupVisits 随访记录
     * @return 随访记录集合
     */
    public List<FollowupVisits> selectFollowupVisitsList(FollowupVisits followupVisits);

    /**
     * 新增随访记录
     * 
     * @param followupVisits 随访记录
     * @return 结果
     */
    public int insertFollowupVisits(FollowupVisits followupVisits);

    /**
     * 修改随访记录
     * 
     * @param followupVisits 随访记录
     * @return 结果
     */
    public int updateFollowupVisits(FollowupVisits followupVisits);

    /**
     * 批量删除随访记录
     * 
     * @param followupIds 需要删除的随访记录主键集合
     * @return 结果
     */
    public int deleteFollowupVisitsByFollowupIds(Long[] followupIds);

    /**
     * 删除随访记录信息
     * 
     * @param followupId 随访记录主键
     * @return 结果
     */
    public int deleteFollowupVisitsByFollowupId(Long followupId);
}
