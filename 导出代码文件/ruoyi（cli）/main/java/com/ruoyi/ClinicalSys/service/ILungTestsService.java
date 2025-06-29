package com.ruoyi.ClinicalSys.service;

import java.util.List;
import com.ruoyi.ClinicalSys.domain.LungTests;

/**
 * 肺功能检查Service接口
 * 
 * @author ruoyi
 * @date 2025-06-27
 */
public interface ILungTestsService 
{
    /**
     * 查询肺功能检查
     * 
     * @param lungId 肺功能检查主键
     * @return 肺功能检查
     */
    public LungTests selectLungTestsByLungId(Long lungId);

    /**
     * 查询肺功能检查列表
     * 
     * @param lungTests 肺功能检查
     * @return 肺功能检查集合
     */
    public List<LungTests> selectLungTestsList(LungTests lungTests);

    /**
     * 新增肺功能检查
     * 
     * @param lungTests 肺功能检查
     * @return 结果
     */
    public int insertLungTests(LungTests lungTests);

    /**
     * 修改肺功能检查
     * 
     * @param lungTests 肺功能检查
     * @return 结果
     */
    public int updateLungTests(LungTests lungTests);

    /**
     * 批量删除肺功能检查
     * 
     * @param lungIds 需要删除的肺功能检查主键集合
     * @return 结果
     */
    public int deleteLungTestsByLungIds(Long[] lungIds);

    /**
     * 删除肺功能检查信息
     * 
     * @param lungId 肺功能检查主键
     * @return 结果
     */
    public int deleteLungTestsByLungId(Long lungId);
}
