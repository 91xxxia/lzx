package com.ruoyi.ClinicalSys.mapper;

import java.util.List;
import com.ruoyi.ClinicalSys.domain.Diagnoses;

/**
 * 疾病诊断Mapper接口
 * 
 * @author ruoyi
 * @date 2025-06-27
 */
public interface DiagnosesMapper 
{
    /**
     * 查询疾病诊断
     * 
     * @param diagnosisId 疾病诊断主键
     * @return 疾病诊断
     */
    public Diagnoses selectDiagnosesByDiagnosisId(Long diagnosisId);

    /**
     * 查询疾病诊断列表
     * 
     * @param diagnoses 疾病诊断
     * @return 疾病诊断集合
     */
    public List<Diagnoses> selectDiagnosesList(Diagnoses diagnoses);

    /**
     * 新增疾病诊断
     * 
     * @param diagnoses 疾病诊断
     * @return 结果
     */
    public int insertDiagnoses(Diagnoses diagnoses);

    /**
     * 修改疾病诊断
     * 
     * @param diagnoses 疾病诊断
     * @return 结果
     */
    public int updateDiagnoses(Diagnoses diagnoses);

    /**
     * 删除疾病诊断
     * 
     * @param diagnosisId 疾病诊断主键
     * @return 结果
     */
    public int deleteDiagnosesByDiagnosisId(Long diagnosisId);

    /**
     * 批量删除疾病诊断
     * 
     * @param diagnosisIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteDiagnosesByDiagnosisIds(Long[] diagnosisIds);
}
