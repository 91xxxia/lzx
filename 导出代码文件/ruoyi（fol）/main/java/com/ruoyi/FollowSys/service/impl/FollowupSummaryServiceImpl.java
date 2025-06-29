package com.ruoyi.FollowSys.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.FollowSys.mapper.FollowupSummaryMapper;
import com.ruoyi.FollowSys.domain.FollowupSummary;
import com.ruoyi.FollowSys.service.IFollowupSummaryService;

/**
 * 随访信息Service业务层处理
 * 
 * @author ruoyi
 * @date 2025-06-28
 */
@Service
public class FollowupSummaryServiceImpl implements IFollowupSummaryService 
{
    @Autowired
    private FollowupSummaryMapper followupSummaryMapper;

    /**
     * 查询随访信息
     * 
     * @param summaryId 随访信息主键
     * @return 随访信息
     */
    @Override
    public FollowupSummary selectFollowupSummaryBySummaryId(Long summaryId)
    {
        return followupSummaryMapper.selectFollowupSummaryBySummaryId(summaryId);
    }

    /**
     * 查询随访信息列表
     * 
     * @param followupSummary 随访信息
     * @return 随访信息
     */
    @Override
    public List<FollowupSummary> selectFollowupSummaryList(FollowupSummary followupSummary)
    {
        return followupSummaryMapper.selectFollowupSummaryList(followupSummary);
    }

    /**
     * 新增随访信息
     * 
     * @param followupSummary 随访信息
     * @return 结果
     */
    @Override
    public int insertFollowupSummary(FollowupSummary followupSummary)
    {
        return followupSummaryMapper.insertFollowupSummary(followupSummary);
    }

    /**
     * 修改随访信息
     * 
     * @param followupSummary 随访信息
     * @return 结果
     */
    @Override
    public int updateFollowupSummary(FollowupSummary followupSummary)
    {
        return followupSummaryMapper.updateFollowupSummary(followupSummary);
    }

    /**
     * 批量删除随访信息
     * 
     * @param summaryIds 需要删除的随访信息主键
     * @return 结果
     */
    @Override
    public int deleteFollowupSummaryBySummaryIds(Long[] summaryIds)
    {
        return followupSummaryMapper.deleteFollowupSummaryBySummaryIds(summaryIds);
    }

    /**
     * 删除随访信息信息
     * 
     * @param summaryId 随访信息主键
     * @return 结果
     */
    @Override
    public int deleteFollowupSummaryBySummaryId(Long summaryId)
    {
        return followupSummaryMapper.deleteFollowupSummaryBySummaryId(summaryId);
    }
}
