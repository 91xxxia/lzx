package com.ruoyi.ClinicalSys.mapper;

import java.util.List;
import com.ruoyi.ClinicalSys.domain.FamilyHistory;

/**
 * 家族史Mapper接口
 * 
 * @author ruoyi
 * @date 2025-06-27
 */
public interface FamilyHistoryMapper 
{
    /**
     * 查询家族史
     * 
     * @param famId 家族史主键
     * @return 家族史
     */
    public FamilyHistory selectFamilyHistoryByFamId(Long famId);

    /**
     * 查询家族史列表
     * 
     * @param familyHistory 家族史
     * @return 家族史集合
     */
    public List<FamilyHistory> selectFamilyHistoryList(FamilyHistory familyHistory);

    /**
     * 新增家族史
     * 
     * @param familyHistory 家族史
     * @return 结果
     */
    public int insertFamilyHistory(FamilyHistory familyHistory);

    /**
     * 修改家族史
     * 
     * @param familyHistory 家族史
     * @return 结果
     */
    public int updateFamilyHistory(FamilyHistory familyHistory);

    /**
     * 删除家族史
     * 
     * @param famId 家族史主键
     * @return 结果
     */
    public int deleteFamilyHistoryByFamId(Long famId);

    /**
     * 批量删除家族史
     * 
     * @param famIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteFamilyHistoryByFamIds(Long[] famIds);
}
