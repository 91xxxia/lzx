package com.ruoyi.EpidemSys.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.EpidemSys.mapper.FamilyHistorySecondaryMapper;
import com.ruoyi.EpidemSys.domain.FamilyHistorySecondary;
import com.ruoyi.EpidemSys.service.IFamilyHistorySecondaryService;

/**
 * 二级亲属过敏史Service业务层处理
 * 
 * @author ruoyi
 * @date 2025-06-27
 */
@Service
public class FamilyHistorySecondaryServiceImpl implements IFamilyHistorySecondaryService 
{
    @Autowired
    private FamilyHistorySecondaryMapper familyHistorySecondaryMapper;

    /**
     * 查询二级亲属过敏史
     * 
     * @param secId 二级亲属过敏史主键
     * @return 二级亲属过敏史
     */
    @Override
    public FamilyHistorySecondary selectFamilyHistorySecondaryBySecId(Long secId)
    {
        return familyHistorySecondaryMapper.selectFamilyHistorySecondaryBySecId(secId);
    }

    /**
     * 查询二级亲属过敏史列表
     * 
     * @param familyHistorySecondary 二级亲属过敏史
     * @return 二级亲属过敏史
     */
    @Override
    public List<FamilyHistorySecondary> selectFamilyHistorySecondaryList(FamilyHistorySecondary familyHistorySecondary)
    {
        return familyHistorySecondaryMapper.selectFamilyHistorySecondaryList(familyHistorySecondary);
    }

    /**
     * 新增二级亲属过敏史
     * 
     * @param familyHistorySecondary 二级亲属过敏史
     * @return 结果
     */
    @Override
    public int insertFamilyHistorySecondary(FamilyHistorySecondary familyHistorySecondary)
    {
        return familyHistorySecondaryMapper.insertFamilyHistorySecondary(familyHistorySecondary);
    }

    /**
     * 修改二级亲属过敏史
     * 
     * @param familyHistorySecondary 二级亲属过敏史
     * @return 结果
     */
    @Override
    public int updateFamilyHistorySecondary(FamilyHistorySecondary familyHistorySecondary)
    {
        return familyHistorySecondaryMapper.updateFamilyHistorySecondary(familyHistorySecondary);
    }

    /**
     * 批量删除二级亲属过敏史
     * 
     * @param secIds 需要删除的二级亲属过敏史主键
     * @return 结果
     */
    @Override
    public int deleteFamilyHistorySecondaryBySecIds(Long[] secIds)
    {
        return familyHistorySecondaryMapper.deleteFamilyHistorySecondaryBySecIds(secIds);
    }

    /**
     * 删除二级亲属过敏史信息
     * 
     * @param secId 二级亲属过敏史主键
     * @return 结果
     */
    @Override
    public int deleteFamilyHistorySecondaryBySecId(Long secId)
    {
        return familyHistorySecondaryMapper.deleteFamilyHistorySecondaryBySecId(secId);
    }
}
