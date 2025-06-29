package com.ruoyi.EpidemSys.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.EpidemSys.mapper.SurveyBasicInfoMapper;
import com.ruoyi.EpidemSys.domain.SurveyBasicInfo;
import com.ruoyi.EpidemSys.service.ISurveyBasicInfoService;

/**
 * 患儿基本信息Service业务层处理
 * 
 * @author ruoyi
 * @date 2025-06-28
 */
@Service
public class SurveyBasicInfoServiceImpl implements ISurveyBasicInfoService 
{
    @Autowired
    private SurveyBasicInfoMapper surveyBasicInfoMapper;

    /**
     * 查询患儿基本信息
     * 
     * @param surveyId 患儿基本信息主键
     * @return 患儿基本信息
     */
    @Override
    public SurveyBasicInfo selectSurveyBasicInfoBySurveyId(Long surveyId)
    {
        return surveyBasicInfoMapper.selectSurveyBasicInfoBySurveyId(surveyId);
    }

    /**
     * 查询患儿基本信息列表
     * 
     * @param surveyBasicInfo 患儿基本信息
     * @return 患儿基本信息
     */
    @Override
    public List<SurveyBasicInfo> selectSurveyBasicInfoList(SurveyBasicInfo surveyBasicInfo)
    {
        return surveyBasicInfoMapper.selectSurveyBasicInfoList(surveyBasicInfo);
    }

    /**
     * 新增患儿基本信息
     * 
     * @param surveyBasicInfo 患儿基本信息
     * @return 结果
     */
    @Override
    public int insertSurveyBasicInfo(SurveyBasicInfo surveyBasicInfo)
    {
        return surveyBasicInfoMapper.insertSurveyBasicInfo(surveyBasicInfo);
    }

    /**
     * 修改患儿基本信息
     * 
     * @param surveyBasicInfo 患儿基本信息
     * @return 结果
     */
    @Override
    public int updateSurveyBasicInfo(SurveyBasicInfo surveyBasicInfo)
    {
        return surveyBasicInfoMapper.updateSurveyBasicInfo(surveyBasicInfo);
    }

    /**
     * 批量删除患儿基本信息
     * 
     * @param surveyIds 需要删除的患儿基本信息主键
     * @return 结果
     */
    @Override
    public int deleteSurveyBasicInfoBySurveyIds(Long[] surveyIds)
    {
        return surveyBasicInfoMapper.deleteSurveyBasicInfoBySurveyIds(surveyIds);
    }

    /**
     * 删除患儿基本信息信息
     * 
     * @param surveyId 患儿基本信息主键
     * @return 结果
     */
    @Override
    public int deleteSurveyBasicInfoBySurveyId(Long surveyId)
    {
        return surveyBasicInfoMapper.deleteSurveyBasicInfoBySurveyId(surveyId);
    }
}
