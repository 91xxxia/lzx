package com.ruoyi.ClinicalSys.service;

import java.util.List;
import com.ruoyi.ClinicalSys.domain.Symptoms;

/**
 * 症状及体征Service接口
 * 
 * @author ruoyi
 * @date 2025-06-27
 */
public interface ISymptomsService 
{
    /**
     * 查询症状及体征
     * 
     * @param symptomId 症状及体征主键
     * @return 症状及体征
     */
    public Symptoms selectSymptomsBySymptomId(Long symptomId);

    /**
     * 查询症状及体征列表
     * 
     * @param symptoms 症状及体征
     * @return 症状及体征集合
     */
    public List<Symptoms> selectSymptomsList(Symptoms symptoms);

    /**
     * 新增症状及体征
     * 
     * @param symptoms 症状及体征
     * @return 结果
     */
    public int insertSymptoms(Symptoms symptoms);

    /**
     * 修改症状及体征
     * 
     * @param symptoms 症状及体征
     * @return 结果
     */
    public int updateSymptoms(Symptoms symptoms);

    /**
     * 批量删除症状及体征
     * 
     * @param symptomIds 需要删除的症状及体征主键集合
     * @return 结果
     */
    public int deleteSymptomsBySymptomIds(Long[] symptomIds);

    /**
     * 删除症状及体征信息
     * 
     * @param symptomId 症状及体征主键
     * @return 结果
     */
    public int deleteSymptomsBySymptomId(Long symptomId);
}
