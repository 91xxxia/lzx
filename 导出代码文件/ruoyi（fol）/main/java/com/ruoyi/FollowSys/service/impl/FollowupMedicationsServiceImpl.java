package com.ruoyi.FollowSys.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.FollowSys.mapper.FollowupMedicationsMapper;
import com.ruoyi.FollowSys.domain.FollowupMedications;
import com.ruoyi.FollowSys.service.IFollowupMedicationsService;

/**
 * 用药Service业务层处理
 * 
 * @author ruoyi
 * @date 2025-06-28
 */
@Service
public class FollowupMedicationsServiceImpl implements IFollowupMedicationsService 
{
    @Autowired
    private FollowupMedicationsMapper followupMedicationsMapper;

    /**
     * 查询用药
     * 
     * @param medId 用药主键
     * @return 用药
     */
    @Override
    public FollowupMedications selectFollowupMedicationsByMedId(Long medId)
    {
        return followupMedicationsMapper.selectFollowupMedicationsByMedId(medId);
    }

    /**
     * 查询用药列表
     * 
     * @param followupMedications 用药
     * @return 用药
     */
    @Override
    public List<FollowupMedications> selectFollowupMedicationsList(FollowupMedications followupMedications)
    {
        return followupMedicationsMapper.selectFollowupMedicationsList(followupMedications);
    }

    /**
     * 新增用药
     * 
     * @param followupMedications 用药
     * @return 结果
     */
    @Override
    public int insertFollowupMedications(FollowupMedications followupMedications)
    {
        return followupMedicationsMapper.insertFollowupMedications(followupMedications);
    }

    /**
     * 修改用药
     * 
     * @param followupMedications 用药
     * @return 结果
     */
    @Override
    public int updateFollowupMedications(FollowupMedications followupMedications)
    {
        return followupMedicationsMapper.updateFollowupMedications(followupMedications);
    }

    /**
     * 批量删除用药
     * 
     * @param medIds 需要删除的用药主键
     * @return 结果
     */
    @Override
    public int deleteFollowupMedicationsByMedIds(Long[] medIds)
    {
        return followupMedicationsMapper.deleteFollowupMedicationsByMedIds(medIds);
    }

    /**
     * 删除用药信息
     * 
     * @param medId 用药主键
     * @return 结果
     */
    @Override
    public int deleteFollowupMedicationsByMedId(Long medId)
    {
        return followupMedicationsMapper.deleteFollowupMedicationsByMedId(medId);
    }
}
