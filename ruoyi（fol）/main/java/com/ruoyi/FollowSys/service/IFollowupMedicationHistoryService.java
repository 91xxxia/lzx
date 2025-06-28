package com.ruoyi.FollowSys.service;

import java.util.List;
import com.ruoyi.FollowSys.domain.FollowupMedicationHistory;

/**
 * 既往用药史Service接口
 * 
 * @author ruoyi
 * @date 2025-06-28
 */
public interface IFollowupMedicationHistoryService 
{
    /**
     * 查询既往用药史
     * 
     * @param medHistId 既往用药史主键
     * @return 既往用药史
     */
    public FollowupMedicationHistory selectFollowupMedicationHistoryByMedHistId(Long medHistId);

    /**
     * 查询既往用药史列表
     * 
     * @param followupMedicationHistory 既往用药史
     * @return 既往用药史集合
     */
    public List<FollowupMedicationHistory> selectFollowupMedicationHistoryList(FollowupMedicationHistory followupMedicationHistory);

    /**
     * 新增既往用药史
     * 
     * @param followupMedicationHistory 既往用药史
     * @return 结果
     */
    public int insertFollowupMedicationHistory(FollowupMedicationHistory followupMedicationHistory);

    /**
     * 修改既往用药史
     * 
     * @param followupMedicationHistory 既往用药史
     * @return 结果
     */
    public int updateFollowupMedicationHistory(FollowupMedicationHistory followupMedicationHistory);

    /**
     * 批量删除既往用药史
     * 
     * @param medHistIds 需要删除的既往用药史主键集合
     * @return 结果
     */
    public int deleteFollowupMedicationHistoryByMedHistIds(Long[] medHistIds);

    /**
     * 删除既往用药史信息
     * 
     * @param medHistId 既往用药史主键
     * @return 结果
     */
    public int deleteFollowupMedicationHistoryByMedHistId(Long medHistId);
}
