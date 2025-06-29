package com.ruoyi.FollowSys.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.FollowSys.mapper.FollowupNasalResistanceTestsMapper;
import com.ruoyi.FollowSys.domain.FollowupNasalResistanceTests;
import com.ruoyi.FollowSys.service.IFollowupNasalResistanceTestsService;

/**
 * 鼻阻力Service业务层处理
 * 
 * @author ruoyi
 * @date 2025-06-28
 */
@Service
public class FollowupNasalResistanceTestsServiceImpl implements IFollowupNasalResistanceTestsService 
{
    @Autowired
    private FollowupNasalResistanceTestsMapper followupNasalResistanceTestsMapper;

    /**
     * 查询鼻阻力
     * 
     * @param nasalId 鼻阻力主键
     * @return 鼻阻力
     */
    @Override
    public FollowupNasalResistanceTests selectFollowupNasalResistanceTestsByNasalId(Long nasalId)
    {
        return followupNasalResistanceTestsMapper.selectFollowupNasalResistanceTestsByNasalId(nasalId);
    }

    /**
     * 查询鼻阻力列表
     * 
     * @param followupNasalResistanceTests 鼻阻力
     * @return 鼻阻力
     */
    @Override
    public List<FollowupNasalResistanceTests> selectFollowupNasalResistanceTestsList(FollowupNasalResistanceTests followupNasalResistanceTests)
    {
        return followupNasalResistanceTestsMapper.selectFollowupNasalResistanceTestsList(followupNasalResistanceTests);
    }

    /**
     * 新增鼻阻力
     * 
     * @param followupNasalResistanceTests 鼻阻力
     * @return 结果
     */
    @Override
    public int insertFollowupNasalResistanceTests(FollowupNasalResistanceTests followupNasalResistanceTests)
    {
        return followupNasalResistanceTestsMapper.insertFollowupNasalResistanceTests(followupNasalResistanceTests);
    }

    /**
     * 修改鼻阻力
     * 
     * @param followupNasalResistanceTests 鼻阻力
     * @return 结果
     */
    @Override
    public int updateFollowupNasalResistanceTests(FollowupNasalResistanceTests followupNasalResistanceTests)
    {
        return followupNasalResistanceTestsMapper.updateFollowupNasalResistanceTests(followupNasalResistanceTests);
    }

    /**
     * 批量删除鼻阻力
     * 
     * @param nasalIds 需要删除的鼻阻力主键
     * @return 结果
     */
    @Override
    public int deleteFollowupNasalResistanceTestsByNasalIds(Long[] nasalIds)
    {
        return followupNasalResistanceTestsMapper.deleteFollowupNasalResistanceTestsByNasalIds(nasalIds);
    }

    /**
     * 删除鼻阻力信息
     * 
     * @param nasalId 鼻阻力主键
     * @return 结果
     */
    @Override
    public int deleteFollowupNasalResistanceTestsByNasalId(Long nasalId)
    {
        return followupNasalResistanceTestsMapper.deleteFollowupNasalResistanceTestsByNasalId(nasalId);
    }
}
