package com.ruoyi.ClinicalSys.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.ClinicalSys.mapper.InsuranceInfoMapper;
import com.ruoyi.ClinicalSys.domain.InsuranceInfo;
import com.ruoyi.ClinicalSys.service.IInsuranceInfoService;

/**
 * 医保情况Service业务层处理
 * 
 * @author ruoyi
 * @date 2025-06-27
 */
@Service
public class InsuranceInfoServiceImpl implements IInsuranceInfoService 
{
    @Autowired
    private InsuranceInfoMapper insuranceInfoMapper;

    /**
     * 查询医保情况
     * 
     * @param insuranceId 医保情况主键
     * @return 医保情况
     */
    @Override
    public InsuranceInfo selectInsuranceInfoByInsuranceId(Long insuranceId)
    {
        return insuranceInfoMapper.selectInsuranceInfoByInsuranceId(insuranceId);
    }

    /**
     * 查询医保情况列表
     * 
     * @param insuranceInfo 医保情况
     * @return 医保情况
     */
    @Override
    public List<InsuranceInfo> selectInsuranceInfoList(InsuranceInfo insuranceInfo)
    {
        return insuranceInfoMapper.selectInsuranceInfoList(insuranceInfo);
    }

    /**
     * 新增医保情况
     * 
     * @param insuranceInfo 医保情况
     * @return 结果
     */
    @Override
    public int insertInsuranceInfo(InsuranceInfo insuranceInfo)
    {
        return insuranceInfoMapper.insertInsuranceInfo(insuranceInfo);
    }

    /**
     * 修改医保情况
     * 
     * @param insuranceInfo 医保情况
     * @return 结果
     */
    @Override
    public int updateInsuranceInfo(InsuranceInfo insuranceInfo)
    {
        return insuranceInfoMapper.updateInsuranceInfo(insuranceInfo);
    }

    /**
     * 批量删除医保情况
     * 
     * @param insuranceIds 需要删除的医保情况主键
     * @return 结果
     */
    @Override
    public int deleteInsuranceInfoByInsuranceIds(Long[] insuranceIds)
    {
        return insuranceInfoMapper.deleteInsuranceInfoByInsuranceIds(insuranceIds);
    }

    /**
     * 删除医保情况信息
     * 
     * @param insuranceId 医保情况主键
     * @return 结果
     */
    @Override
    public int deleteInsuranceInfoByInsuranceId(Long insuranceId)
    {
        return insuranceInfoMapper.deleteInsuranceInfoByInsuranceId(insuranceId);
    }
}
