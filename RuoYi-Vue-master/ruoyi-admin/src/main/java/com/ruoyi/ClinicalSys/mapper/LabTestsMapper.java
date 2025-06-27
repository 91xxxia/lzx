package com.ruoyi.ClinicalSys.mapper;

import java.util.List;
import com.ruoyi.ClinicalSys.domain.LabTests;

/**
 * 实验室检查Mapper接口
 * 
 * @author ruoyi
 * @date 2025-06-27
 */
public interface LabTestsMapper 
{
    /**
     * 查询实验室检查
     * 
     * @param testId 实验室检查主键
     * @return 实验室检查
     */
    public LabTests selectLabTestsByTestId(Long testId);

    /**
     * 查询实验室检查列表
     * 
     * @param labTests 实验室检查
     * @return 实验室检查集合
     */
    public List<LabTests> selectLabTestsList(LabTests labTests);

    /**
     * 新增实验室检查
     * 
     * @param labTests 实验室检查
     * @return 结果
     */
    public int insertLabTests(LabTests labTests);

    /**
     * 修改实验室检查
     * 
     * @param labTests 实验室检查
     * @return 结果
     */
    public int updateLabTests(LabTests labTests);

    /**
     * 删除实验室检查
     * 
     * @param testId 实验室检查主键
     * @return 结果
     */
    public int deleteLabTestsByTestId(Long testId);

    /**
     * 批量删除实验室检查
     * 
     * @param testIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteLabTestsByTestIds(Long[] testIds);
}
