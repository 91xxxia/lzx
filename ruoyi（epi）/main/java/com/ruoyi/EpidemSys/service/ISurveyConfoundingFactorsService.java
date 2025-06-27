package com.ruoyi.EpidemSys.service;

import java.util.List;
import com.ruoyi.EpidemSys.domain.SurveyConfoundingFactors;

/**
 * 其他潜在混杂因素Service接口
 * 
 * @author ruoyi
 * @date 2025-06-27
 */
public interface ISurveyConfoundingFactorsService 
{
    /**
     * 查询其他潜在混杂因素
     * 
     * @param confoundId 其他潜在混杂因素主键
     * @return 其他潜在混杂因素
     */
    public SurveyConfoundingFactors selectSurveyConfoundingFactorsByConfoundId(Long confoundId);

    /**
     * 查询其他潜在混杂因素列表
     * 
     * @param surveyConfoundingFactors 其他潜在混杂因素
     * @return 其他潜在混杂因素集合
     */
    public List<SurveyConfoundingFactors> selectSurveyConfoundingFactorsList(SurveyConfoundingFactors surveyConfoundingFactors);

    /**
     * 新增其他潜在混杂因素
     * 
     * @param surveyConfoundingFactors 其他潜在混杂因素
     * @return 结果
     */
    public int insertSurveyConfoundingFactors(SurveyConfoundingFactors surveyConfoundingFactors);

    /**
     * 修改其他潜在混杂因素
     * 
     * @param surveyConfoundingFactors 其他潜在混杂因素
     * @return 结果
     */
    public int updateSurveyConfoundingFactors(SurveyConfoundingFactors surveyConfoundingFactors);

    /**
     * 批量删除其他潜在混杂因素
     * 
     * @param confoundIds 需要删除的其他潜在混杂因素主键集合
     * @return 结果
     */
    public int deleteSurveyConfoundingFactorsByConfoundIds(Long[] confoundIds);

    /**
     * 删除其他潜在混杂因素信息
     * 
     * @param confoundId 其他潜在混杂因素主键
     * @return 结果
     */
    public int deleteSurveyConfoundingFactorsByConfoundId(Long confoundId);
}
