package com.ruoyi.EpidemSys.service;

import java.util.List;
import com.ruoyi.EpidemSys.domain.FamilyHistorySecondary;

/**
 * 二级亲属过敏史Service接口
 * 
 * @author ruoyi
 * @date 2025-06-27
 */
public interface IFamilyHistorySecondaryService 
{
    /**
     * 查询二级亲属过敏史
     * 
     * @param secId 二级亲属过敏史主键
     * @return 二级亲属过敏史
     */
    public FamilyHistorySecondary selectFamilyHistorySecondaryBySecId(Long secId);

    /**
     * 查询二级亲属过敏史列表
     * 
     * @param familyHistorySecondary 二级亲属过敏史
     * @return 二级亲属过敏史集合
     */
    public List<FamilyHistorySecondary> selectFamilyHistorySecondaryList(FamilyHistorySecondary familyHistorySecondary);

    /**
     * 新增二级亲属过敏史
     * 
     * @param familyHistorySecondary 二级亲属过敏史
     * @return 结果
     */
    public int insertFamilyHistorySecondary(FamilyHistorySecondary familyHistorySecondary);

    /**
     * 修改二级亲属过敏史
     * 
     * @param familyHistorySecondary 二级亲属过敏史
     * @return 结果
     */
    public int updateFamilyHistorySecondary(FamilyHistorySecondary familyHistorySecondary);

    /**
     * 批量删除二级亲属过敏史
     * 
     * @param secIds 需要删除的二级亲属过敏史主键集合
     * @return 结果
     */
    public int deleteFamilyHistorySecondaryBySecIds(Long[] secIds);

    /**
     * 删除二级亲属过敏史信息
     * 
     * @param secId 二级亲属过敏史主键
     * @return 结果
     */
    public int deleteFamilyHistorySecondaryBySecId(Long secId);
}
