package com.ruoyi.ClinicalSys.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.ClinicalSys.mapper.ClinicalOtherTreatmentsMapper;
import com.ruoyi.ClinicalSys.domain.ClinicalOtherTreatments;
import com.ruoyi.ClinicalSys.service.IClinicalOtherTreatmentsService;

/**
 * 其他辅助治疗Service业务层处理
 * 
 * @author ruoyi
 * @date 2025-06-27
 */
@Service
public class ClinicalOtherTreatmentsServiceImpl implements IClinicalOtherTreatmentsService 
{
    @Autowired
    private ClinicalOtherTreatmentsMapper clinicalOtherTreatmentsMapper;

    /**
     * 查询其他辅助治疗
     * 
     * @param treatmentId 其他辅助治疗主键
     * @return 其他辅助治疗
     */
    @Override
    public ClinicalOtherTreatments selectClinicalOtherTreatmentsByTreatmentId(Long treatmentId)
    {
        return clinicalOtherTreatmentsMapper.selectClinicalOtherTreatmentsByTreatmentId(treatmentId);
    }

    /**
     * 查询其他辅助治疗列表
     * 
     * @param clinicalOtherTreatments 其他辅助治疗
     * @return 其他辅助治疗
     */
    @Override
    public List<ClinicalOtherTreatments> selectClinicalOtherTreatmentsList(ClinicalOtherTreatments clinicalOtherTreatments)
    {
        return clinicalOtherTreatmentsMapper.selectClinicalOtherTreatmentsList(clinicalOtherTreatments);
    }

    /**
     * 新增其他辅助治疗
     * 
     * @param clinicalOtherTreatments 其他辅助治疗
     * @return 结果
     */
    @Override
    public int insertClinicalOtherTreatments(ClinicalOtherTreatments clinicalOtherTreatments)
    {
        return clinicalOtherTreatmentsMapper.insertClinicalOtherTreatments(clinicalOtherTreatments);
    }

    /**
     * 修改其他辅助治疗
     * 
     * @param clinicalOtherTreatments 其他辅助治疗
     * @return 结果
     */
    @Override
    public int updateClinicalOtherTreatments(ClinicalOtherTreatments clinicalOtherTreatments)
    {
        return clinicalOtherTreatmentsMapper.updateClinicalOtherTreatments(clinicalOtherTreatments);
    }

    /**
     * 批量删除其他辅助治疗
     * 
     * @param treatmentIds 需要删除的其他辅助治疗主键
     * @return 结果
     */
    @Override
    public int deleteClinicalOtherTreatmentsByTreatmentIds(Long[] treatmentIds)
    {
        return clinicalOtherTreatmentsMapper.deleteClinicalOtherTreatmentsByTreatmentIds(treatmentIds);
    }

    /**
     * 删除其他辅助治疗信息
     * 
     * @param treatmentId 其他辅助治疗主键
     * @return 结果
     */
    @Override
    public int deleteClinicalOtherTreatmentsByTreatmentId(Long treatmentId)
    {
        return clinicalOtherTreatmentsMapper.deleteClinicalOtherTreatmentsByTreatmentId(treatmentId);
    }
}
