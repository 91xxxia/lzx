package com.ruoyi.EpidemSys.service;

import java.util.List;
import com.ruoyi.EpidemSys.domain.SurveyFamilyEnv;

/**
 * 家族环境Service接口
 * 
 * @author ruoyi
 * @date 2025-06-27
 */
public interface ISurveyFamilyEnvService 
{
    /**
     * 查询家族环境
     * 
     * @param familyEnvId 家族环境主键
     * @return 家族环境
     */
    public SurveyFamilyEnv selectSurveyFamilyEnvByFamilyEnvId(Long familyEnvId);

    /**
     * 查询家族环境列表
     * 
     * @param surveyFamilyEnv 家族环境
     * @return 家族环境集合
     */
    public List<SurveyFamilyEnv> selectSurveyFamilyEnvList(SurveyFamilyEnv surveyFamilyEnv);

    /**
     * 新增家族环境
     * 
     * @param surveyFamilyEnv 家族环境
     * @return 结果
     */
    public int insertSurveyFamilyEnv(SurveyFamilyEnv surveyFamilyEnv);

    /**
     * 修改家族环境
     * 
     * @param surveyFamilyEnv 家族环境
     * @return 结果
     */
    public int updateSurveyFamilyEnv(SurveyFamilyEnv surveyFamilyEnv);

    /**
     * 批量删除家族环境
     * 
     * @param familyEnvIds 需要删除的家族环境主键集合
     * @return 结果
     */
    public int deleteSurveyFamilyEnvByFamilyEnvIds(Long[] familyEnvIds);

    /**
     * 删除家族环境信息
     * 
     * @param familyEnvId 家族环境主键
     * @return 结果
     */
    public int deleteSurveyFamilyEnvByFamilyEnvId(Long familyEnvId);
}
