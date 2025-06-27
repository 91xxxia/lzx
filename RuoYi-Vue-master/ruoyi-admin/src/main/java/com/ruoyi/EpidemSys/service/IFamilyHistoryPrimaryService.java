package com.ruoyi.EpidemSys.service;

import java.util.List;
import com.ruoyi.EpidemSys.domain.FamilyHistoryPrimary;

/**
 * 一级亲属过敏史Service接口
 * 
 * @author ruoyi
 * @date 2025-06-27
 */
public interface IFamilyHistoryPrimaryService 
{
    /**
     * 查询一级亲属过敏史
     * 
     * @param primId 一级亲属过敏史主键
     * @return 一级亲属过敏史
     */
    public FamilyHistoryPrimary selectFamilyHistoryPrimaryByPrimId(Long primId);

    /**
     * 查询一级亲属过敏史列表
     * 
     * @param familyHistoryPrimary 一级亲属过敏史
     * @return 一级亲属过敏史集合
     */
    public List<FamilyHistoryPrimary> selectFamilyHistoryPrimaryList(FamilyHistoryPrimary familyHistoryPrimary);

    /**
     * 新增一级亲属过敏史
     * 
     * @param familyHistoryPrimary 一级亲属过敏史
     * @return 结果
     */
    public int insertFamilyHistoryPrimary(FamilyHistoryPrimary familyHistoryPrimary);

    /**
     * 修改一级亲属过敏史
     * 
     * @param familyHistoryPrimary 一级亲属过敏史
     * @return 结果
     */
    public int updateFamilyHistoryPrimary(FamilyHistoryPrimary familyHistoryPrimary);

    /**
     * 批量删除一级亲属过敏史
     * 
     * @param primIds 需要删除的一级亲属过敏史主键集合
     * @return 结果
     */
    public int deleteFamilyHistoryPrimaryByPrimIds(Long[] primIds);

    /**
     * 删除一级亲属过敏史信息
     * 
     * @param primId 一级亲属过敏史主键
     * @return 结果
     */
    public int deleteFamilyHistoryPrimaryByPrimId(Long primId);
}
