package com.ruoyi.FollowSys.service;

import java.util.List;
import com.ruoyi.FollowSys.domain.FollowupFenoTests;

/**
 * 呼出气一氧化氮检测Service接口
 * 
 * @author ruoyi
 * @date 2025-06-28
 */
public interface IFollowupFenoTestsService 
{
    /**
     * 查询呼出气一氧化氮检测
     * 
     * @param fenoId 呼出气一氧化氮检测主键
     * @return 呼出气一氧化氮检测
     */
    public FollowupFenoTests selectFollowupFenoTestsByFenoId(Long fenoId);

    /**
     * 查询呼出气一氧化氮检测列表
     * 
     * @param followupFenoTests 呼出气一氧化氮检测
     * @return 呼出气一氧化氮检测集合
     */
    public List<FollowupFenoTests> selectFollowupFenoTestsList(FollowupFenoTests followupFenoTests);

    /**
     * 新增呼出气一氧化氮检测
     * 
     * @param followupFenoTests 呼出气一氧化氮检测
     * @return 结果
     */
    public int insertFollowupFenoTests(FollowupFenoTests followupFenoTests);

    /**
     * 修改呼出气一氧化氮检测
     * 
     * @param followupFenoTests 呼出气一氧化氮检测
     * @return 结果
     */
    public int updateFollowupFenoTests(FollowupFenoTests followupFenoTests);

    /**
     * 批量删除呼出气一氧化氮检测
     * 
     * @param fenoIds 需要删除的呼出气一氧化氮检测主键集合
     * @return 结果
     */
    public int deleteFollowupFenoTestsByFenoIds(Long[] fenoIds);

    /**
     * 删除呼出气一氧化氮检测信息
     * 
     * @param fenoId 呼出气一氧化氮检测主键
     * @return 结果
     */
    public int deleteFollowupFenoTestsByFenoId(Long fenoId);
}
