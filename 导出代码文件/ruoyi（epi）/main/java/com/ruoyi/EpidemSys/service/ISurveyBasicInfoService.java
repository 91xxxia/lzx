package com.ruoyi.EpidemSys.service;

import java.util.List;
import com.ruoyi.EpidemSys.domain.SurveyBasicInfo;

/**
 * 患儿基本信息Service接口
 * 
 * @author ruoyi
 * @date 2025-06-28
 */
public interface ISurveyBasicInfoService 
{
    /**
     * 查询患儿基本信息
     * 
     * @param surveyId 患儿基本信息主键
     * @return 患儿基本信息
     */
    public SurveyBasicInfo selectSurveyBasicInfoBySurveyId(Long surveyId);

    /**
     * 查询患儿基本信息列表
     * 
     * @param surveyBasicInfo 患儿基本信息
     * @return 患儿基本信息集合
     */
    public List<SurveyBasicInfo> selectSurveyBasicInfoList(SurveyBasicInfo surveyBasicInfo);

    /**
     * 新增患儿基本信息
     * 
     * @param surveyBasicInfo 患儿基本信息
     * @return 结果
     */
    public int insertSurveyBasicInfo(SurveyBasicInfo surveyBasicInfo);

    /**
     * 修改患儿基本信息
     * 
     * @param surveyBasicInfo 患儿基本信息
     * @return 结果
     */
    public int updateSurveyBasicInfo(SurveyBasicInfo surveyBasicInfo);

    /**
     * 批量删除患儿基本信息
     * 
     * @param surveyIds 需要删除的患儿基本信息主键集合
     * @return 结果
     */
    public int deleteSurveyBasicInfoBySurveyIds(Long[] surveyIds);

    /**
     * 删除患儿基本信息信息
     * 
     * @param surveyId 患儿基本信息主键
     * @return 结果
     */
    public int deleteSurveyBasicInfoBySurveyId(Long surveyId);
}
