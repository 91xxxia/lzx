package com.ruoyi.FollowSys.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.FollowSys.mapper.FollowupMedicationHistoryMapper;
import com.ruoyi.FollowSys.domain.FollowupMedicationHistory;
import com.ruoyi.FollowSys.service.IFollowupMedicationHistoryService;

/**
 * 既往用药史Service业务层处理
 * 
 * @author ruoyi
 * @date 2025-06-28
 */
@Service
public class FollowupMedicationHistoryServiceImpl implements IFollowupMedicationHistoryService 
{
    @Autowired
    private FollowupMedicationHistoryMapper followupMedicationHistoryMapper;

    /**
     * 查询既往用药史
     * 
     * @param medHistId 既往用药史主键
     * @return 既往用药史
     */
    @Override
    public FollowupMedicationHistory selectFollowupMedicationHistoryByMedHistId(Long medHistId)
    {
        return followupMedicationHistoryMapper.selectFollowupMedicationHistoryByMedHistId(medHistId);
    }

    /**
     * 查询既往用药史列表
     * 
     * @param followupMedicationHistory 既往用药史
     * @return 既往用药史
     */
    @Override
    public List<FollowupMedicationHistory> selectFollowupMedicationHistoryList(FollowupMedicationHistory followupMedicationHistory)
    {
        return followupMedicationHistoryMapper.selectFollowupMedicationHistoryList(followupMedicationHistory);
    }

    /**
     * 新增既往用药史
     * 
     * @param followupMedicationHistory 既往用药史
     * @return 结果
     */
    @Override
    public int insertFollowupMedicationHistory(FollowupMedicationHistory followupMedicationHistory)
    {
        return followupMedicationHistoryMapper.insertFollowupMedicationHistory(followupMedicationHistory);
    }

    /**
     * 修改既往用药史
     * 
     * @param followupMedicationHistory 既往用药史
     * @return 结果
     */
    @Override
    public int updateFollowupMedicationHistory(FollowupMedicationHistory followupMedicationHistory)
    {
        return followupMedicationHistoryMapper.updateFollowupMedicationHistory(followupMedicationHistory);
    }

    /**
     * 批量删除既往用药史
     * 
     * @param medHistIds 需要删除的既往用药史主键
     * @return 结果
     */
    @Override
    public int deleteFollowupMedicationHistoryByMedHistIds(Long[] medHistIds)
    {
        return followupMedicationHistoryMapper.deleteFollowupMedicationHistoryByMedHistIds(medHistIds);
    }

    /**
     * 删除既往用药史信息
     * 
     * @param medHistId 既往用药史主键
     * @return 结果
     */
    @Override
    public int deleteFollowupMedicationHistoryByMedHistId(Long medHistId)
    {
        return followupMedicationHistoryMapper.deleteFollowupMedicationHistoryByMedHistId(medHistId);
    }
}
