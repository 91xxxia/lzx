package com.ruoyi.ClinicalSys.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.ClinicalSys.mapper.FamilyHistoryMapper;
import com.ruoyi.ClinicalSys.domain.FamilyHistory;
import com.ruoyi.ClinicalSys.service.IFamilyHistoryService;

/**
 * 家族史Service业务层处理
 * 
 * @author ruoyi
 * @date 2025-06-27
 */
@Service
public class FamilyHistoryServiceImpl implements IFamilyHistoryService 
{
    @Autowired
    private FamilyHistoryMapper familyHistoryMapper;

    /**
     * 查询家族史
     * 
     * @param famId 家族史主键
     * @return 家族史
     */
    @Override
    public FamilyHistory selectFamilyHistoryByFamId(Long famId)
    {
        return familyHistoryMapper.selectFamilyHistoryByFamId(famId);
    }

    /**
     * 查询家族史列表
     * 
     * @param familyHistory 家族史
     * @return 家族史
     */
    @Override
    public List<FamilyHistory> selectFamilyHistoryList(FamilyHistory familyHistory)
    {
        return familyHistoryMapper.selectFamilyHistoryList(familyHistory);
    }

    /**
     * 新增家族史
     * 
     * @param familyHistory 家族史
     * @return 结果
     */
    @Override
    public int insertFamilyHistory(FamilyHistory familyHistory)
    {
        return familyHistoryMapper.insertFamilyHistory(familyHistory);
    }

    /**
     * 修改家族史
     * 
     * @param familyHistory 家族史
     * @return 结果
     */
    @Override
    public int updateFamilyHistory(FamilyHistory familyHistory)
    {
        return familyHistoryMapper.updateFamilyHistory(familyHistory);
    }

    /**
     * 批量删除家族史
     * 
     * @param famIds 需要删除的家族史主键
     * @return 结果
     */
    @Override
    public int deleteFamilyHistoryByFamIds(Long[] famIds)
    {
        return familyHistoryMapper.deleteFamilyHistoryByFamIds(famIds);
    }

    /**
     * 删除家族史信息
     * 
     * @param famId 家族史主键
     * @return 结果
     */
    @Override
    public int deleteFamilyHistoryByFamId(Long famId)
    {
        return familyHistoryMapper.deleteFamilyHistoryByFamId(famId);
    }
}
