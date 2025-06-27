package com.ruoyi.EpidemSys.mapper;

import java.util.List;
import com.ruoyi.EpidemSys.domain.SurveyFamilyEnv;

/**
 * 家族环境Mapper接口
 * 
 * @author ruoyi
 * @date 2025-06-27
 */
public interface SurveyFamilyEnvMapper 
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
     * 删除家族环境
     * 
     * @param familyEnvId 家族环境主键
     * @return 结果
     */
    public int deleteSurveyFamilyEnvByFamilyEnvId(Long familyEnvId);

    /**
     * 批量删除家族环境
     * 
     * @param familyEnvIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteSurveyFamilyEnvByFamilyEnvIds(Long[] familyEnvIds);
}
