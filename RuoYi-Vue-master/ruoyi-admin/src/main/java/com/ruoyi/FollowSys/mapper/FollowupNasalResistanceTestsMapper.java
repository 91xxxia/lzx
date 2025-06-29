package com.ruoyi.FollowSys.mapper;

import java.util.List;
import com.ruoyi.FollowSys.domain.FollowupNasalResistanceTests;

/**
 * 鼻阻力Mapper接口
 * 
 * @author ruoyi
 * @date 2025-06-28
 */
public interface FollowupNasalResistanceTestsMapper 
{
    /**
     * 查询鼻阻力
     * 
     * @param nasalId 鼻阻力主键
     * @return 鼻阻力
     */
    public FollowupNasalResistanceTests selectFollowupNasalResistanceTestsByNasalId(Long nasalId);

    /**
     * 查询鼻阻力列表
     * 
     * @param followupNasalResistanceTests 鼻阻力
     * @return 鼻阻力集合
     */
    public List<FollowupNasalResistanceTests> selectFollowupNasalResistanceTestsList(FollowupNasalResistanceTests followupNasalResistanceTests);

    /**
     * 新增鼻阻力
     * 
     * @param followupNasalResistanceTests 鼻阻力
     * @return 结果
     */
    public int insertFollowupNasalResistanceTests(FollowupNasalResistanceTests followupNasalResistanceTests);

    /**
     * 修改鼻阻力
     * 
     * @param followupNasalResistanceTests 鼻阻力
     * @return 结果
     */
    public int updateFollowupNasalResistanceTests(FollowupNasalResistanceTests followupNasalResistanceTests);

    /**
     * 删除鼻阻力
     * 
     * @param nasalId 鼻阻力主键
     * @return 结果
     */
    public int deleteFollowupNasalResistanceTestsByNasalId(Long nasalId);

    /**
     * 批量删除鼻阻力
     * 
     * @param nasalIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteFollowupNasalResistanceTestsByNasalIds(Long[] nasalIds);
}
