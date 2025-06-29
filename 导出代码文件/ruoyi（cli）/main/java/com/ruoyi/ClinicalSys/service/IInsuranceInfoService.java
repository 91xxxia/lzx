package com.ruoyi.ClinicalSys.service;

import java.util.List;
import com.ruoyi.ClinicalSys.domain.InsuranceInfo;

/**
 * 医保情况Service接口
 * 
 * @author ruoyi
 * @date 2025-06-27
 */
public interface IInsuranceInfoService 
{
    /**
     * 查询医保情况
     * 
     * @param insuranceId 医保情况主键
     * @return 医保情况
     */
    public InsuranceInfo selectInsuranceInfoByInsuranceId(Long insuranceId);

    /**
     * 查询医保情况列表
     * 
     * @param insuranceInfo 医保情况
     * @return 医保情况集合
     */
    public List<InsuranceInfo> selectInsuranceInfoList(InsuranceInfo insuranceInfo);

    /**
     * 新增医保情况
     * 
     * @param insuranceInfo 医保情况
     * @return 结果
     */
    public int insertInsuranceInfo(InsuranceInfo insuranceInfo);

    /**
     * 修改医保情况
     * 
     * @param insuranceInfo 医保情况
     * @return 结果
     */
    public int updateInsuranceInfo(InsuranceInfo insuranceInfo);

    /**
     * 批量删除医保情况
     * 
     * @param insuranceIds 需要删除的医保情况主键集合
     * @return 结果
     */
    public int deleteInsuranceInfoByInsuranceIds(Long[] insuranceIds);

    /**
     * 删除医保情况信息
     * 
     * @param insuranceId 医保情况主键
     * @return 结果
     */
    public int deleteInsuranceInfoByInsuranceId(Long insuranceId);
}
