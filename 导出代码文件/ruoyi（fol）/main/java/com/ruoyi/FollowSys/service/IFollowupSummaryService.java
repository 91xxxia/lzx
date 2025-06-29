package com.ruoyi.FollowSys.service;

import java.util.List;
import com.ruoyi.FollowSys.domain.FollowupSummary;

/**
 * 随访信息Service接口
 * 
 * @author ruoyi
 * @date 2025-06-28
 */
public interface IFollowupSummaryService 
{
    /**
     * 查询随访信息
     * 
     * @param summaryId 随访信息主键
     * @return 随访信息
     */
    public FollowupSummary selectFollowupSummaryBySummaryId(Long summaryId);

    /**
     * 查询随访信息列表
     * 
     * @param followupSummary 随访信息
     * @return 随访信息集合
     */
    public List<FollowupSummary> selectFollowupSummaryList(FollowupSummary followupSummary);

    /**
     * 新增随访信息
     * 
     * @param followupSummary 随访信息
     * @return 结果
     */
    public int insertFollowupSummary(FollowupSummary followupSummary);

    /**
     * 修改随访信息
     * 
     * @param followupSummary 随访信息
     * @return 结果
     */
    public int updateFollowupSummary(FollowupSummary followupSummary);

    /**
     * 批量删除随访信息
     * 
     * @param summaryIds 需要删除的随访信息主键集合
     * @return 结果
     */
    public int deleteFollowupSummaryBySummaryIds(Long[] summaryIds);

    /**
     * 删除随访信息信息
     * 
     * @param summaryId 随访信息主键
     * @return 结果
     */
    public int deleteFollowupSummaryBySummaryId(Long summaryId);
}
