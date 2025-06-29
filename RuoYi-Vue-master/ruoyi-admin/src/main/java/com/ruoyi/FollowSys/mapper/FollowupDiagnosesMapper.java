package com.ruoyi.FollowSys.mapper;

import java.util.List;
import com.ruoyi.FollowSys.domain.FollowupDiagnoses;

/**
 * 疾病诊断Mapper接口
 * 
 * @author ruoyi
 * @date 2025-06-28
 */
public interface FollowupDiagnosesMapper 
{
    /**
     * 查询疾病诊断
     * 
     * @param diagnosisId 疾病诊断主键
     * @return 疾病诊断
     */
    public FollowupDiagnoses selectFollowupDiagnosesByDiagnosisId(Long diagnosisId);

    /**
     * 查询疾病诊断列表
     * 
     * @param followupDiagnoses 疾病诊断
     * @return 疾病诊断集合
     */
    public List<FollowupDiagnoses> selectFollowupDiagnosesList(FollowupDiagnoses followupDiagnoses);

    /**
     * 新增疾病诊断
     * 
     * @param followupDiagnoses 疾病诊断
     * @return 结果
     */
    public int insertFollowupDiagnoses(FollowupDiagnoses followupDiagnoses);

    /**
     * 修改疾病诊断
     * 
     * @param followupDiagnoses 疾病诊断
     * @return 结果
     */
    public int updateFollowupDiagnoses(FollowupDiagnoses followupDiagnoses);

    /**
     * 删除疾病诊断
     * 
     * @param diagnosisId 疾病诊断主键
     * @return 结果
     */
    public int deleteFollowupDiagnosesByDiagnosisId(Long diagnosisId);

    /**
     * 批量删除疾病诊断
     * 
     * @param diagnosisIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteFollowupDiagnosesByDiagnosisIds(Long[] diagnosisIds);
}
