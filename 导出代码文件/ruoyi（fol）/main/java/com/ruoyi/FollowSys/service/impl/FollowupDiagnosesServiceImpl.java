package com.ruoyi.FollowSys.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.FollowSys.mapper.FollowupDiagnosesMapper;
import com.ruoyi.FollowSys.domain.FollowupDiagnoses;
import com.ruoyi.FollowSys.service.IFollowupDiagnosesService;

/**
 * 疾病诊断Service业务层处理
 * 
 * @author ruoyi
 * @date 2025-06-28
 */
@Service
public class FollowupDiagnosesServiceImpl implements IFollowupDiagnosesService 
{
    @Autowired
    private FollowupDiagnosesMapper followupDiagnosesMapper;

    /**
     * 查询疾病诊断
     * 
     * @param diagnosisId 疾病诊断主键
     * @return 疾病诊断
     */
    @Override
    public FollowupDiagnoses selectFollowupDiagnosesByDiagnosisId(Long diagnosisId)
    {
        return followupDiagnosesMapper.selectFollowupDiagnosesByDiagnosisId(diagnosisId);
    }

    /**
     * 查询疾病诊断列表
     * 
     * @param followupDiagnoses 疾病诊断
     * @return 疾病诊断
     */
    @Override
    public List<FollowupDiagnoses> selectFollowupDiagnosesList(FollowupDiagnoses followupDiagnoses)
    {
        return followupDiagnosesMapper.selectFollowupDiagnosesList(followupDiagnoses);
    }

    /**
     * 新增疾病诊断
     * 
     * @param followupDiagnoses 疾病诊断
     * @return 结果
     */
    @Override
    public int insertFollowupDiagnoses(FollowupDiagnoses followupDiagnoses)
    {
        return followupDiagnosesMapper.insertFollowupDiagnoses(followupDiagnoses);
    }

    /**
     * 修改疾病诊断
     * 
     * @param followupDiagnoses 疾病诊断
     * @return 结果
     */
    @Override
    public int updateFollowupDiagnoses(FollowupDiagnoses followupDiagnoses)
    {
        return followupDiagnosesMapper.updateFollowupDiagnoses(followupDiagnoses);
    }

    /**
     * 批量删除疾病诊断
     * 
     * @param diagnosisIds 需要删除的疾病诊断主键
     * @return 结果
     */
    @Override
    public int deleteFollowupDiagnosesByDiagnosisIds(Long[] diagnosisIds)
    {
        return followupDiagnosesMapper.deleteFollowupDiagnosesByDiagnosisIds(diagnosisIds);
    }

    /**
     * 删除疾病诊断信息
     * 
     * @param diagnosisId 疾病诊断主键
     * @return 结果
     */
    @Override
    public int deleteFollowupDiagnosesByDiagnosisId(Long diagnosisId)
    {
        return followupDiagnosesMapper.deleteFollowupDiagnosesByDiagnosisId(diagnosisId);
    }
}
