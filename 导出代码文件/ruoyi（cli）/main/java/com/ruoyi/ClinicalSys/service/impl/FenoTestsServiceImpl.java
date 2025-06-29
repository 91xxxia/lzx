package com.ruoyi.ClinicalSys.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.ClinicalSys.mapper.FenoTestsMapper;
import com.ruoyi.ClinicalSys.domain.FenoTests;
import com.ruoyi.ClinicalSys.service.IFenoTestsService;

/**
 * 呼出气一氧化氮检测Service业务层处理
 * 
 * @author ruoyi
 * @date 2025-06-27
 */
@Service
public class FenoTestsServiceImpl implements IFenoTestsService 
{
    @Autowired
    private FenoTestsMapper fenoTestsMapper;

    /**
     * 查询呼出气一氧化氮检测
     * 
     * @param fenoId 呼出气一氧化氮检测主键
     * @return 呼出气一氧化氮检测
     */
    @Override
    public FenoTests selectFenoTestsByFenoId(Long fenoId)
    {
        return fenoTestsMapper.selectFenoTestsByFenoId(fenoId);
    }

    /**
     * 查询呼出气一氧化氮检测列表
     * 
     * @param fenoTests 呼出气一氧化氮检测
     * @return 呼出气一氧化氮检测
     */
    @Override
    public List<FenoTests> selectFenoTestsList(FenoTests fenoTests)
    {
        return fenoTestsMapper.selectFenoTestsList(fenoTests);
    }

    /**
     * 新增呼出气一氧化氮检测
     * 
     * @param fenoTests 呼出气一氧化氮检测
     * @return 结果
     */
    @Override
    public int insertFenoTests(FenoTests fenoTests)
    {
        return fenoTestsMapper.insertFenoTests(fenoTests);
    }

    /**
     * 修改呼出气一氧化氮检测
     * 
     * @param fenoTests 呼出气一氧化氮检测
     * @return 结果
     */
    @Override
    public int updateFenoTests(FenoTests fenoTests)
    {
        return fenoTestsMapper.updateFenoTests(fenoTests);
    }

    /**
     * 批量删除呼出气一氧化氮检测
     * 
     * @param fenoIds 需要删除的呼出气一氧化氮检测主键
     * @return 结果
     */
    @Override
    public int deleteFenoTestsByFenoIds(Long[] fenoIds)
    {
        return fenoTestsMapper.deleteFenoTestsByFenoIds(fenoIds);
    }

    /**
     * 删除呼出气一氧化氮检测信息
     * 
     * @param fenoId 呼出气一氧化氮检测主键
     * @return 结果
     */
    @Override
    public int deleteFenoTestsByFenoId(Long fenoId)
    {
        return fenoTestsMapper.deleteFenoTestsByFenoId(fenoId);
    }
}
