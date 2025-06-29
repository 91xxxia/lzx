package com.ruoyi.FollowSys.service;

import java.util.List;
import com.ruoyi.FollowSys.domain.FollowupLabTests;

/**
 * 实验室检查Service接口
 * 
 * @author ruoyi
 * @date 2025-06-28
 */
public interface IFollowupLabTestsService 
{
    /**
     * 查询实验室检查
     * 
     * @param labtestId 实验室检查主键
     * @return 实验室检查
     */
    public FollowupLabTests selectFollowupLabTestsByLabtestId(Long labtestId);

    /**
     * 查询实验室检查列表
     * 
     * @param followupLabTests 实验室检查
     * @return 实验室检查集合
     */
    public List<FollowupLabTests> selectFollowupLabTestsList(FollowupLabTests followupLabTests);

    /**
     * 新增实验室检查
     * 
     * @param followupLabTests 实验室检查
     * @return 结果
     */
    public int insertFollowupLabTests(FollowupLabTests followupLabTests);

    /**
     * 修改实验室检查
     * 
     * @param followupLabTests 实验室检查
     * @return 结果
     */
    public int updateFollowupLabTests(FollowupLabTests followupLabTests);

    /**
     * 批量删除实验室检查
     * 
     * @param labtestIds 需要删除的实验室检查主键集合
     * @return 结果
     */
    public int deleteFollowupLabTestsByLabtestIds(Long[] labtestIds);

    /**
     * 删除实验室检查信息
     * 
     * @param labtestId 实验室检查主键
     * @return 结果
     */
    public int deleteFollowupLabTestsByLabtestId(Long labtestId);
}
