package com.ruoyi.ClinicalSys.service;

import java.util.List;
import com.ruoyi.ClinicalSys.domain.FenoTests;

/**
 * 呼出气一氧化氮检测Service接口
 * 
 * @author ruoyi
 * @date 2025-06-27
 */
public interface IFenoTestsService 
{
    /**
     * 查询呼出气一氧化氮检测
     * 
     * @param fenoId 呼出气一氧化氮检测主键
     * @return 呼出气一氧化氮检测
     */
    public FenoTests selectFenoTestsByFenoId(Long fenoId);

    /**
     * 查询呼出气一氧化氮检测列表
     * 
     * @param fenoTests 呼出气一氧化氮检测
     * @return 呼出气一氧化氮检测集合
     */
    public List<FenoTests> selectFenoTestsList(FenoTests fenoTests);

    /**
     * 新增呼出气一氧化氮检测
     * 
     * @param fenoTests 呼出气一氧化氮检测
     * @return 结果
     */
    public int insertFenoTests(FenoTests fenoTests);

    /**
     * 修改呼出气一氧化氮检测
     * 
     * @param fenoTests 呼出气一氧化氮检测
     * @return 结果
     */
    public int updateFenoTests(FenoTests fenoTests);

    /**
     * 批量删除呼出气一氧化氮检测
     * 
     * @param fenoIds 需要删除的呼出气一氧化氮检测主键集合
     * @return 结果
     */
    public int deleteFenoTestsByFenoIds(Long[] fenoIds);

    /**
     * 删除呼出气一氧化氮检测信息
     * 
     * @param fenoId 呼出气一氧化氮检测主键
     * @return 结果
     */
    public int deleteFenoTestsByFenoId(Long fenoId);
}
