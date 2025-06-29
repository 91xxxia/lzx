package com.ruoyi.FollowSys.mapper;

import java.util.List;
import com.ruoyi.FollowSys.domain.FollowupOtherTreatments;

/**
 * 其他辅助治疗Mapper接口
 * 
 * @author ruoyi
 * @date 2025-06-28
 */
public interface FollowupOtherTreatmentsMapper 
{
    /**
     * 查询其他辅助治疗
     * 
     * @param treatmentId 其他辅助治疗主键
     * @return 其他辅助治疗
     */
    public FollowupOtherTreatments selectFollowupOtherTreatmentsByTreatmentId(Long treatmentId);

    /**
     * 查询其他辅助治疗列表
     * 
     * @param followupOtherTreatments 其他辅助治疗
     * @return 其他辅助治疗集合
     */
    public List<FollowupOtherTreatments> selectFollowupOtherTreatmentsList(FollowupOtherTreatments followupOtherTreatments);

    /**
     * 新增其他辅助治疗
     * 
     * @param followupOtherTreatments 其他辅助治疗
     * @return 结果
     */
    public int insertFollowupOtherTreatments(FollowupOtherTreatments followupOtherTreatments);

    /**
     * 修改其他辅助治疗
     * 
     * @param followupOtherTreatments 其他辅助治疗
     * @return 结果
     */
    public int updateFollowupOtherTreatments(FollowupOtherTreatments followupOtherTreatments);

    /**
     * 删除其他辅助治疗
     * 
     * @param treatmentId 其他辅助治疗主键
     * @return 结果
     */
    public int deleteFollowupOtherTreatmentsByTreatmentId(Long treatmentId);

    /**
     * 批量删除其他辅助治疗
     * 
     * @param treatmentIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteFollowupOtherTreatmentsByTreatmentIds(Long[] treatmentIds);
}
