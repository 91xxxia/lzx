package com.ruoyi.ClinicalSys.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.ClinicalSys.mapper.SymptomsMapper;
import com.ruoyi.ClinicalSys.domain.Symptoms;
import com.ruoyi.ClinicalSys.service.ISymptomsService;

/**
 * 症状及体征Service业务层处理
 * 
 * @author ruoyi
 * @date 2025-06-27
 */
@Service
public class SymptomsServiceImpl implements ISymptomsService 
{
    @Autowired
    private SymptomsMapper symptomsMapper;

    /**
     * 查询症状及体征
     * 
     * @param symptomId 症状及体征主键
     * @return 症状及体征
     */
    @Override
    public Symptoms selectSymptomsBySymptomId(Long symptomId)
    {
        return symptomsMapper.selectSymptomsBySymptomId(symptomId);
    }

    /**
     * 查询症状及体征列表
     * 
     * @param symptoms 症状及体征
     * @return 症状及体征
     */
    @Override
    public List<Symptoms> selectSymptomsList(Symptoms symptoms)
    {
        return symptomsMapper.selectSymptomsList(symptoms);
    }

    /**
     * 新增症状及体征
     * 
     * @param symptoms 症状及体征
     * @return 结果
     */
    @Override
    public int insertSymptoms(Symptoms symptoms)
    {
        return symptomsMapper.insertSymptoms(symptoms);
    }

    /**
     * 修改症状及体征
     * 
     * @param symptoms 症状及体征
     * @return 结果
     */
    @Override
    public int updateSymptoms(Symptoms symptoms)
    {
        return symptomsMapper.updateSymptoms(symptoms);
    }

    /**
     * 批量删除症状及体征
     * 
     * @param symptomIds 需要删除的症状及体征主键
     * @return 结果
     */
    @Override
    public int deleteSymptomsBySymptomIds(Long[] symptomIds)
    {
        return symptomsMapper.deleteSymptomsBySymptomIds(symptomIds);
    }

    /**
     * 删除症状及体征信息
     * 
     * @param symptomId 症状及体征主键
     * @return 结果
     */
    @Override
    public int deleteSymptomsBySymptomId(Long symptomId)
    {
        return symptomsMapper.deleteSymptomsBySymptomId(symptomId);
    }
}
