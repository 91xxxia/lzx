package com.ruoyi.ClinicalSys.mapper;

import java.util.List;
import com.ruoyi.ClinicalSys.domain.ClinicalOtherTreatments;

/**
 * 其他辅助治疗Mapper接口
 * 
 * @author ruoyi
 * @date 2025-06-27
 */
public interface ClinicalOtherTreatmentsMapper 
{
    /**
     * 查询其他辅助治疗
     * 
     * @param treatmentId 其他辅助治疗主键
     * @return 其他辅助治疗
     */
    public ClinicalOtherTreatments selectClinicalOtherTreatmentsByTreatmentId(Long treatmentId);

    /**
     * 查询其他辅助治疗列表
     * 
     * @param clinicalOtherTreatments 其他辅助治疗
     * @return 其他辅助治疗集合
     */
    public List<ClinicalOtherTreatments> selectClinicalOtherTreatmentsList(ClinicalOtherTreatments clinicalOtherTreatments);

    /**
     * 新增其他辅助治疗
     * 
     * @param clinicalOtherTreatments 其他辅助治疗
     * @return 结果
     */
    public int insertClinicalOtherTreatments(ClinicalOtherTreatments clinicalOtherTreatments);

    /**
     * 修改其他辅助治疗
     * 
     * @param clinicalOtherTreatments 其他辅助治疗
     * @return 结果
     */
    public int updateClinicalOtherTreatments(ClinicalOtherTreatments clinicalOtherTreatments);

    /**
     * 删除其他辅助治疗
     * 
     * @param treatmentId 其他辅助治疗主键
     * @return 结果
     */
    public int deleteClinicalOtherTreatmentsByTreatmentId(Long treatmentId);

    /**
     * 批量删除其他辅助治疗
     * 
     * @param treatmentIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteClinicalOtherTreatmentsByTreatmentIds(Long[] treatmentIds);
}
