package com.ruoyi.FollowSys.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.FollowSys.mapper.FollowupFenoTestsMapper;
import com.ruoyi.FollowSys.domain.FollowupFenoTests;
import com.ruoyi.FollowSys.service.IFollowupFenoTestsService;

/**
 * 呼出气一氧化氮检测Service业务层处理
 * 
 * @author ruoyi
 * @date 2025-06-28
 */
@Service
public class FollowupFenoTestsServiceImpl implements IFollowupFenoTestsService 
{
    @Autowired
    private FollowupFenoTestsMapper followupFenoTestsMapper;

    /**
     * 查询呼出气一氧化氮检测
     * 
     * @param fenoId 呼出气一氧化氮检测主键
     * @return 呼出气一氧化氮检测
     */
    @Override
    public FollowupFenoTests selectFollowupFenoTestsByFenoId(Long fenoId)
    {
        return followupFenoTestsMapper.selectFollowupFenoTestsByFenoId(fenoId);
    }

    /**
     * 查询呼出气一氧化氮检测列表
     * 
     * @param followupFenoTests 呼出气一氧化氮检测
     * @return 呼出气一氧化氮检测
     */
    @Override
    public List<FollowupFenoTests> selectFollowupFenoTestsList(FollowupFenoTests followupFenoTests)
    {
        return followupFenoTestsMapper.selectFollowupFenoTestsList(followupFenoTests);
    }

    /**
     * 新增呼出气一氧化氮检测
     * 
     * @param followupFenoTests 呼出气一氧化氮检测
     * @return 结果
     */
    @Override
    public int insertFollowupFenoTests(FollowupFenoTests followupFenoTests)
    {
        return followupFenoTestsMapper.insertFollowupFenoTests(followupFenoTests);
    }

    /**
     * 修改呼出气一氧化氮检测
     * 
     * @param followupFenoTests 呼出气一氧化氮检测
     * @return 结果
     */
    @Override
    public int updateFollowupFenoTests(FollowupFenoTests followupFenoTests)
    {
        return followupFenoTestsMapper.updateFollowupFenoTests(followupFenoTests);
    }

    /**
     * 批量删除呼出气一氧化氮检测
     * 
     * @param fenoIds 需要删除的呼出气一氧化氮检测主键
     * @return 结果
     */
    @Override
    public int deleteFollowupFenoTestsByFenoIds(Long[] fenoIds)
    {
        return followupFenoTestsMapper.deleteFollowupFenoTestsByFenoIds(fenoIds);
    }

    /**
     * 删除呼出气一氧化氮检测信息
     * 
     * @param fenoId 呼出气一氧化氮检测主键
     * @return 结果
     */
    @Override
    public int deleteFollowupFenoTestsByFenoId(Long fenoId)
    {
        return followupFenoTestsMapper.deleteFollowupFenoTestsByFenoId(fenoId);
    }
}
