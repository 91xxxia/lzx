package com.ruoyi.EpidemSys.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.EpidemSys.mapper.FamilyHistoryPrimaryMapper;
import com.ruoyi.EpidemSys.domain.FamilyHistoryPrimary;
import com.ruoyi.EpidemSys.service.IFamilyHistoryPrimaryService;

/**
 * 一级亲属过敏史Service业务层处理
 * 
 * @author ruoyi
 * @date 2025-06-27
 */
@Service
public class FamilyHistoryPrimaryServiceImpl implements IFamilyHistoryPrimaryService 
{
    @Autowired
    private FamilyHistoryPrimaryMapper familyHistoryPrimaryMapper;

    /**
     * 查询一级亲属过敏史
     * 
     * @param primId 一级亲属过敏史主键
     * @return 一级亲属过敏史
     */
    @Override
    public FamilyHistoryPrimary selectFamilyHistoryPrimaryByPrimId(Long primId)
    {
        return familyHistoryPrimaryMapper.selectFamilyHistoryPrimaryByPrimId(primId);
    }

    /**
     * 查询一级亲属过敏史列表
     * 
     * @param familyHistoryPrimary 一级亲属过敏史
     * @return 一级亲属过敏史
     */
    @Override
    public List<FamilyHistoryPrimary> selectFamilyHistoryPrimaryList(FamilyHistoryPrimary familyHistoryPrimary)
    {
        return familyHistoryPrimaryMapper.selectFamilyHistoryPrimaryList(familyHistoryPrimary);
    }

    /**
     * 新增一级亲属过敏史
     * 
     * @param familyHistoryPrimary 一级亲属过敏史
     * @return 结果
     */
    @Override
    public int insertFamilyHistoryPrimary(FamilyHistoryPrimary familyHistoryPrimary)
    {
        return familyHistoryPrimaryMapper.insertFamilyHistoryPrimary(familyHistoryPrimary);
    }

    /**
     * 修改一级亲属过敏史
     * 
     * @param familyHistoryPrimary 一级亲属过敏史
     * @return 结果
     */
    @Override
    public int updateFamilyHistoryPrimary(FamilyHistoryPrimary familyHistoryPrimary)
    {
        return familyHistoryPrimaryMapper.updateFamilyHistoryPrimary(familyHistoryPrimary);
    }

    /**
     * 批量删除一级亲属过敏史
     * 
     * @param primIds 需要删除的一级亲属过敏史主键
     * @return 结果
     */
    @Override
    public int deleteFamilyHistoryPrimaryByPrimIds(Long[] primIds)
    {
        return familyHistoryPrimaryMapper.deleteFamilyHistoryPrimaryByPrimIds(primIds);
    }

    /**
     * 删除一级亲属过敏史信息
     * 
     * @param primId 一级亲属过敏史主键
     * @return 结果
     */
    @Override
    public int deleteFamilyHistoryPrimaryByPrimId(Long primId)
    {
        return familyHistoryPrimaryMapper.deleteFamilyHistoryPrimaryByPrimId(primId);
    }
}
