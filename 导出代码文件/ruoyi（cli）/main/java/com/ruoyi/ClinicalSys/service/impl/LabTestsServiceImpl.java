package com.ruoyi.ClinicalSys.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.ClinicalSys.mapper.LabTestsMapper;
import com.ruoyi.ClinicalSys.domain.LabTests;
import com.ruoyi.ClinicalSys.service.ILabTestsService;

/**
 * 实验室检查Service业务层处理
 * 
 * @author ruoyi
 * @date 2025-06-27
 */
@Service
public class LabTestsServiceImpl implements ILabTestsService 
{
    @Autowired
    private LabTestsMapper labTestsMapper;

    /**
     * 查询实验室检查
     * 
     * @param testId 实验室检查主键
     * @return 实验室检查
     */
    @Override
    public LabTests selectLabTestsByTestId(Long testId)
    {
        return labTestsMapper.selectLabTestsByTestId(testId);
    }

    /**
     * 查询实验室检查列表
     * 
     * @param labTests 实验室检查
     * @return 实验室检查
     */
    @Override
    public List<LabTests> selectLabTestsList(LabTests labTests)
    {
        return labTestsMapper.selectLabTestsList(labTests);
    }

    /**
     * 新增实验室检查
     * 
     * @param labTests 实验室检查
     * @return 结果
     */
    @Override
    public int insertLabTests(LabTests labTests)
    {
        return labTestsMapper.insertLabTests(labTests);
    }

    /**
     * 修改实验室检查
     * 
     * @param labTests 实验室检查
     * @return 结果
     */
    @Override
    public int updateLabTests(LabTests labTests)
    {
        return labTestsMapper.updateLabTests(labTests);
    }

    /**
     * 批量删除实验室检查
     * 
     * @param testIds 需要删除的实验室检查主键
     * @return 结果
     */
    @Override
    public int deleteLabTestsByTestIds(Long[] testIds)
    {
        return labTestsMapper.deleteLabTestsByTestIds(testIds);
    }

    /**
     * 删除实验室检查信息
     * 
     * @param testId 实验室检查主键
     * @return 结果
     */
    @Override
    public int deleteLabTestsByTestId(Long testId)
    {
        return labTestsMapper.deleteLabTestsByTestId(testId);
    }
}
