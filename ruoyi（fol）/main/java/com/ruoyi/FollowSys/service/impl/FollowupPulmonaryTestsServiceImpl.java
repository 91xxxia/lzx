package com.ruoyi.FollowSys.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.FollowSys.mapper.FollowupPulmonaryTestsMapper;
import com.ruoyi.FollowSys.domain.FollowupPulmonaryTests;
import com.ruoyi.FollowSys.service.IFollowupPulmonaryTestsService;

/**
 * 肺功能检查Service业务层处理
 * 
 * @author ruoyi
 * @date 2025-06-28
 */
@Service
public class FollowupPulmonaryTestsServiceImpl implements IFollowupPulmonaryTestsService 
{
    @Autowired
    private FollowupPulmonaryTestsMapper followupPulmonaryTestsMapper;

    /**
     * 查询肺功能检查
     * 
     * @param testId 肺功能检查主键
     * @return 肺功能检查
     */
    @Override
    public FollowupPulmonaryTests selectFollowupPulmonaryTestsByTestId(Long testId)
    {
        return followupPulmonaryTestsMapper.selectFollowupPulmonaryTestsByTestId(testId);
    }

    /**
     * 查询肺功能检查列表
     * 
     * @param followupPulmonaryTests 肺功能检查
     * @return 肺功能检查
     */
    @Override
    public List<FollowupPulmonaryTests> selectFollowupPulmonaryTestsList(FollowupPulmonaryTests followupPulmonaryTests)
    {
        return followupPulmonaryTestsMapper.selectFollowupPulmonaryTestsList(followupPulmonaryTests);
    }

    /**
     * 新增肺功能检查
     * 
     * @param followupPulmonaryTests 肺功能检查
     * @return 结果
     */
    @Override
    public int insertFollowupPulmonaryTests(FollowupPulmonaryTests followupPulmonaryTests)
    {
        return followupPulmonaryTestsMapper.insertFollowupPulmonaryTests(followupPulmonaryTests);
    }

    /**
     * 修改肺功能检查
     * 
     * @param followupPulmonaryTests 肺功能检查
     * @return 结果
     */
    @Override
    public int updateFollowupPulmonaryTests(FollowupPulmonaryTests followupPulmonaryTests)
    {
        return followupPulmonaryTestsMapper.updateFollowupPulmonaryTests(followupPulmonaryTests);
    }

    /**
     * 批量删除肺功能检查
     * 
     * @param testIds 需要删除的肺功能检查主键
     * @return 结果
     */
    @Override
    public int deleteFollowupPulmonaryTestsByTestIds(Long[] testIds)
    {
        return followupPulmonaryTestsMapper.deleteFollowupPulmonaryTestsByTestIds(testIds);
    }

    /**
     * 删除肺功能检查信息
     * 
     * @param testId 肺功能检查主键
     * @return 结果
     */
    @Override
    public int deleteFollowupPulmonaryTestsByTestId(Long testId)
    {
        return followupPulmonaryTestsMapper.deleteFollowupPulmonaryTestsByTestId(testId);
    }
}
