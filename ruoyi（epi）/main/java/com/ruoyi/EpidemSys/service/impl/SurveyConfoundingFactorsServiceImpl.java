package com.ruoyi.EpidemSys.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.EpidemSys.mapper.SurveyConfoundingFactorsMapper;
import com.ruoyi.EpidemSys.domain.SurveyConfoundingFactors;
import com.ruoyi.EpidemSys.service.ISurveyConfoundingFactorsService;

/**
 * 其他潜在混杂因素Service业务层处理
 * 
 * @author ruoyi
 * @date 2025-06-28
 */
@Service
public class SurveyConfoundingFactorsServiceImpl implements ISurveyConfoundingFactorsService 
{
    @Autowired
    private SurveyConfoundingFactorsMapper surveyConfoundingFactorsMapper;

    /**
     * 查询其他潜在混杂因素
     * 
     * @param confoundId 其他潜在混杂因素主键
     * @return 其他潜在混杂因素
     */
    @Override
    public SurveyConfoundingFactors selectSurveyConfoundingFactorsByConfoundId(Long confoundId)
    {
        return surveyConfoundingFactorsMapper.selectSurveyConfoundingFactorsByConfoundId(confoundId);
    }

    /**
     * 查询其他潜在混杂因素列表
     * 
     * @param surveyConfoundingFactors 其他潜在混杂因素
     * @return 其他潜在混杂因素
     */
    @Override
    public List<SurveyConfoundingFactors> selectSurveyConfoundingFactorsList(SurveyConfoundingFactors surveyConfoundingFactors)
    {
        return surveyConfoundingFactorsMapper.selectSurveyConfoundingFactorsList(surveyConfoundingFactors);
    }

    /**
     * 新增其他潜在混杂因素
     * 
     * @param surveyConfoundingFactors 其他潜在混杂因素
     * @return 结果
     */
    @Override
    public int insertSurveyConfoundingFactors(SurveyConfoundingFactors surveyConfoundingFactors)
    {
        return surveyConfoundingFactorsMapper.insertSurveyConfoundingFactors(surveyConfoundingFactors);
    }

    /**
     * 修改其他潜在混杂因素
     * 
     * @param surveyConfoundingFactors 其他潜在混杂因素
     * @return 结果
     */
    @Override
    public int updateSurveyConfoundingFactors(SurveyConfoundingFactors surveyConfoundingFactors)
    {
        return surveyConfoundingFactorsMapper.updateSurveyConfoundingFactors(surveyConfoundingFactors);
    }

    /**
     * 批量删除其他潜在混杂因素
     * 
     * @param confoundIds 需要删除的其他潜在混杂因素主键
     * @return 结果
     */
    @Override
    public int deleteSurveyConfoundingFactorsByConfoundIds(Long[] confoundIds)
    {
        return surveyConfoundingFactorsMapper.deleteSurveyConfoundingFactorsByConfoundIds(confoundIds);
    }

    /**
     * 删除其他潜在混杂因素信息
     * 
     * @param confoundId 其他潜在混杂因素主键
     * @return 结果
     */
    @Override
    public int deleteSurveyConfoundingFactorsByConfoundId(Long confoundId)
    {
        return surveyConfoundingFactorsMapper.deleteSurveyConfoundingFactorsByConfoundId(confoundId);
    }
}
