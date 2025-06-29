package com.ruoyi.EpidemSys.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.EpidemSys.mapper.SurveyFamilyEnvMapper;
import com.ruoyi.EpidemSys.domain.SurveyFamilyEnv;
import com.ruoyi.EpidemSys.service.ISurveyFamilyEnvService;

/**
 * 家族环境居住相似性Service业务层处理
 * 
 * @author ruoyi
 * @date 2025-06-28
 */
@Service
public class SurveyFamilyEnvServiceImpl implements ISurveyFamilyEnvService 
{
    @Autowired
    private SurveyFamilyEnvMapper surveyFamilyEnvMapper;

    /**
     * 查询家族环境居住相似性
     * 
     * @param familyEnvId 家族环境居住相似性主键
     * @return 家族环境居住相似性
     */
    @Override
    public SurveyFamilyEnv selectSurveyFamilyEnvByFamilyEnvId(Long familyEnvId)
    {
        return surveyFamilyEnvMapper.selectSurveyFamilyEnvByFamilyEnvId(familyEnvId);
    }

    /**
     * 查询家族环境居住相似性列表
     * 
     * @param surveyFamilyEnv 家族环境居住相似性
     * @return 家族环境居住相似性
     */
    @Override
    public List<SurveyFamilyEnv> selectSurveyFamilyEnvList(SurveyFamilyEnv surveyFamilyEnv)
    {
        return surveyFamilyEnvMapper.selectSurveyFamilyEnvList(surveyFamilyEnv);
    }

    /**
     * 新增家族环境居住相似性
     * 
     * @param surveyFamilyEnv 家族环境居住相似性
     * @return 结果
     */
    @Override
    public int insertSurveyFamilyEnv(SurveyFamilyEnv surveyFamilyEnv)
    {
        return surveyFamilyEnvMapper.insertSurveyFamilyEnv(surveyFamilyEnv);
    }

    /**
     * 修改家族环境居住相似性
     * 
     * @param surveyFamilyEnv 家族环境居住相似性
     * @return 结果
     */
    @Override
    public int updateSurveyFamilyEnv(SurveyFamilyEnv surveyFamilyEnv)
    {
        return surveyFamilyEnvMapper.updateSurveyFamilyEnv(surveyFamilyEnv);
    }

    /**
     * 批量删除家族环境居住相似性
     * 
     * @param familyEnvIds 需要删除的家族环境居住相似性主键
     * @return 结果
     */
    @Override
    public int deleteSurveyFamilyEnvByFamilyEnvIds(Long[] familyEnvIds)
    {
        return surveyFamilyEnvMapper.deleteSurveyFamilyEnvByFamilyEnvIds(familyEnvIds);
    }

    /**
     * 删除家族环境居住相似性信息
     * 
     * @param familyEnvId 家族环境居住相似性主键
     * @return 结果
     */
    @Override
    public int deleteSurveyFamilyEnvByFamilyEnvId(Long familyEnvId)
    {
        return surveyFamilyEnvMapper.deleteSurveyFamilyEnvByFamilyEnvId(familyEnvId);
    }
}
