package com.ruoyi.EpidemSys.service;

import java.util.List;
import com.ruoyi.EpidemSys.domain.SurveyFamilyEnv;

/**
 * 家族环境居住相似性Service接口
 * 
 * @author ruoyi
 * @date 2025-06-28
 */
public interface ISurveyFamilyEnvService 
{
    /**
     * 查询家族环境居住相似性
     * 
     * @param familyEnvId 家族环境居住相似性主键
     * @return 家族环境居住相似性
     */
    public SurveyFamilyEnv selectSurveyFamilyEnvByFamilyEnvId(Long familyEnvId);

    /**
     * 查询家族环境居住相似性列表
     * 
     * @param surveyFamilyEnv 家族环境居住相似性
     * @return 家族环境居住相似性集合
     */
    public List<SurveyFamilyEnv> selectSurveyFamilyEnvList(SurveyFamilyEnv surveyFamilyEnv);

    /**
     * 新增家族环境居住相似性
     * 
     * @param surveyFamilyEnv 家族环境居住相似性
     * @return 结果
     */
    public int insertSurveyFamilyEnv(SurveyFamilyEnv surveyFamilyEnv);

    /**
     * 修改家族环境居住相似性
     * 
     * @param surveyFamilyEnv 家族环境居住相似性
     * @return 结果
     */
    public int updateSurveyFamilyEnv(SurveyFamilyEnv surveyFamilyEnv);

    /**
     * 批量删除家族环境居住相似性
     * 
     * @param familyEnvIds 需要删除的家族环境居住相似性主键集合
     * @return 结果
     */
    public int deleteSurveyFamilyEnvByFamilyEnvIds(Long[] familyEnvIds);

    /**
     * 删除家族环境居住相似性信息
     * 
     * @param familyEnvId 家族环境居住相似性主键
     * @return 结果
     */
    public int deleteSurveyFamilyEnvByFamilyEnvId(Long familyEnvId);
}
