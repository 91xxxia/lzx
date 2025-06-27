package com.ruoyi.ClinicalSys.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.ClinicalSys.mapper.DiagnosesMapper;
import com.ruoyi.ClinicalSys.domain.Diagnoses;
import com.ruoyi.ClinicalSys.service.IDiagnosesService;

/**
 * 疾病诊断Service业务层处理
 * 
 * @author ruoyi
 * @date 2025-06-27
 */
@Service
public class DiagnosesServiceImpl implements IDiagnosesService 
{
    @Autowired
    private DiagnosesMapper diagnosesMapper;

    /**
     * 查询疾病诊断
     * 
     * @param diagnosisId 疾病诊断主键
     * @return 疾病诊断
     */
    @Override
    public Diagnoses selectDiagnosesByDiagnosisId(Long diagnosisId)
    {
        return diagnosesMapper.selectDiagnosesByDiagnosisId(diagnosisId);
    }

    /**
     * 查询疾病诊断列表
     * 
     * @param diagnoses 疾病诊断
     * @return 疾病诊断
     */
    @Override
    public List<Diagnoses> selectDiagnosesList(Diagnoses diagnoses)
    {
        return diagnosesMapper.selectDiagnosesList(diagnoses);
    }

    /**
     * 新增疾病诊断
     * 
     * @param diagnoses 疾病诊断
     * @return 结果
     */
    @Override
    public int insertDiagnoses(Diagnoses diagnoses)
    {
        return diagnosesMapper.insertDiagnoses(diagnoses);
    }

    /**
     * 修改疾病诊断
     * 
     * @param diagnoses 疾病诊断
     * @return 结果
     */
    @Override
    public int updateDiagnoses(Diagnoses diagnoses)
    {
        return diagnosesMapper.updateDiagnoses(diagnoses);
    }

    /**
     * 批量删除疾病诊断
     * 
     * @param diagnosisIds 需要删除的疾病诊断主键
     * @return 结果
     */
    @Override
    public int deleteDiagnosesByDiagnosisIds(Long[] diagnosisIds)
    {
        return diagnosesMapper.deleteDiagnosesByDiagnosisIds(diagnosisIds);
    }

    /**
     * 删除疾病诊断信息
     * 
     * @param diagnosisId 疾病诊断主键
     * @return 结果
     */
    @Override
    public int deleteDiagnosesByDiagnosisId(Long diagnosisId)
    {
        return diagnosesMapper.deleteDiagnosesByDiagnosisId(diagnosisId);
    }
}
