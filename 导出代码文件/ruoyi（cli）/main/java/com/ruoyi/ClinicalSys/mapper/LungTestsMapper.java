package com.ruoyi.ClinicalSys.mapper;

import java.util.List;
import com.ruoyi.ClinicalSys.domain.LungTests;

/**
 * 肺功能检查Mapper接口
 * 
 * @author ruoyi
 * @date 2025-06-27
 */
public interface LungTestsMapper 
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
     * 删除肺功能检查
     * 
     * @param lungId 肺功能检查主键
     * @return 结果
     */
    public int deleteLungTestsByLungId(Long lungId);

    /**
     * 批量删除肺功能检查
     * 
     * @param lungIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteLungTestsByLungIds(Long[] lungIds);
}
