package com.ruoyi.FollowSys.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.FollowSys.mapper.FollowupLabTestsMapper;
import com.ruoyi.FollowSys.domain.FollowupLabTests;
import com.ruoyi.FollowSys.service.IFollowupLabTestsService;

/**
 * 实验室检查Service业务层处理
 * 
 * @author ruoyi
 * @date 2025-06-28
 */
@Service
public class FollowupLabTestsServiceImpl implements IFollowupLabTestsService 
{
    @Autowired
    private FollowupLabTestsMapper followupLabTestsMapper;

    /**
     * 查询实验室检查
     * 
     * @param labtestId 实验室检查主键
     * @return 实验室检查
     */
    @Override
    public FollowupLabTests selectFollowupLabTestsByLabtestId(Long labtestId)
    {
        return followupLabTestsMapper.selectFollowupLabTestsByLabtestId(labtestId);
    }

    /**
     * 查询实验室检查列表
     * 
     * @param followupLabTests 实验室检查
     * @return 实验室检查
     */
    @Override
    public List<FollowupLabTests> selectFollowupLabTestsList(FollowupLabTests followupLabTests)
    {
        return followupLabTestsMapper.selectFollowupLabTestsList(followupLabTests);
    }

    /**
     * 新增实验室检查
     * 
     * @param followupLabTests 实验室检查
     * @return 结果
     */
    @Override
    public int insertFollowupLabTests(FollowupLabTests followupLabTests)
    {
        return followupLabTestsMapper.insertFollowupLabTests(followupLabTests);
    }

    /**
     * 修改实验室检查
     * 
     * @param followupLabTests 实验室检查
     * @return 结果
     */
    @Override
    public int updateFollowupLabTests(FollowupLabTests followupLabTests)
    {
        return followupLabTestsMapper.updateFollowupLabTests(followupLabTests);
    }

    /**
     * 批量删除实验室检查
     * 
     * @param labtestIds 需要删除的实验室检查主键
     * @return 结果
     */
    @Override
    public int deleteFollowupLabTestsByLabtestIds(Long[] labtestIds)
    {
        return followupLabTestsMapper.deleteFollowupLabTestsByLabtestIds(labtestIds);
    }

    /**
     * 删除实验室检查信息
     * 
     * @param labtestId 实验室检查主键
     * @return 结果
     */
    @Override
    public int deleteFollowupLabTestsByLabtestId(Long labtestId)
    {
        return followupLabTestsMapper.deleteFollowupLabTestsByLabtestId(labtestId);
    }
}
