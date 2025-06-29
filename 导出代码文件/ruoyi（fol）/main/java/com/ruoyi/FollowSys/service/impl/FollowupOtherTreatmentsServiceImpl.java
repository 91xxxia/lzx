package com.ruoyi.FollowSys.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.FollowSys.mapper.FollowupOtherTreatmentsMapper;
import com.ruoyi.FollowSys.domain.FollowupOtherTreatments;
import com.ruoyi.FollowSys.service.IFollowupOtherTreatmentsService;

/**
 * 其他辅助治疗Service业务层处理
 * 
 * @author ruoyi
 * @date 2025-06-28
 */
@Service
public class FollowupOtherTreatmentsServiceImpl implements IFollowupOtherTreatmentsService 
{
    @Autowired
    private FollowupOtherTreatmentsMapper followupOtherTreatmentsMapper;

    /**
     * 查询其他辅助治疗
     * 
     * @param treatmentId 其他辅助治疗主键
     * @return 其他辅助治疗
     */
    @Override
    public FollowupOtherTreatments selectFollowupOtherTreatmentsByTreatmentId(Long treatmentId)
    {
        return followupOtherTreatmentsMapper.selectFollowupOtherTreatmentsByTreatmentId(treatmentId);
    }

    /**
     * 查询其他辅助治疗列表
     * 
     * @param followupOtherTreatments 其他辅助治疗
     * @return 其他辅助治疗
     */
    @Override
    public List<FollowupOtherTreatments> selectFollowupOtherTreatmentsList(FollowupOtherTreatments followupOtherTreatments)
    {
        return followupOtherTreatmentsMapper.selectFollowupOtherTreatmentsList(followupOtherTreatments);
    }

    /**
     * 新增其他辅助治疗
     * 
     * @param followupOtherTreatments 其他辅助治疗
     * @return 结果
     */
    @Override
    public int insertFollowupOtherTreatments(FollowupOtherTreatments followupOtherTreatments)
    {
        return followupOtherTreatmentsMapper.insertFollowupOtherTreatments(followupOtherTreatments);
    }

    /**
     * 修改其他辅助治疗
     * 
     * @param followupOtherTreatments 其他辅助治疗
     * @return 结果
     */
    @Override
    public int updateFollowupOtherTreatments(FollowupOtherTreatments followupOtherTreatments)
    {
        return followupOtherTreatmentsMapper.updateFollowupOtherTreatments(followupOtherTreatments);
    }

    /**
     * 批量删除其他辅助治疗
     * 
     * @param treatmentIds 需要删除的其他辅助治疗主键
     * @return 结果
     */
    @Override
    public int deleteFollowupOtherTreatmentsByTreatmentIds(Long[] treatmentIds)
    {
        return followupOtherTreatmentsMapper.deleteFollowupOtherTreatmentsByTreatmentIds(treatmentIds);
    }

    /**
     * 删除其他辅助治疗信息
     * 
     * @param treatmentId 其他辅助治疗主键
     * @return 结果
     */
    @Override
    public int deleteFollowupOtherTreatmentsByTreatmentId(Long treatmentId)
    {
        return followupOtherTreatmentsMapper.deleteFollowupOtherTreatmentsByTreatmentId(treatmentId);
    }
}
