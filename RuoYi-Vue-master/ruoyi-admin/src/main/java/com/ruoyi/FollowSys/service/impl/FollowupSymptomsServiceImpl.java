package com.ruoyi.FollowSys.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.FollowSys.mapper.FollowupSymptomsMapper;
import com.ruoyi.FollowSys.domain.FollowupSymptoms;
import com.ruoyi.FollowSys.service.IFollowupSymptomsService;

/**
 * 症状Service业务层处理
 * 
 * @author ruoyi
 * @date 2025-06-28
 */
@Service
public class FollowupSymptomsServiceImpl implements IFollowupSymptomsService 
{
    @Autowired
    private FollowupSymptomsMapper followupSymptomsMapper;

    /**
     * 查询症状
     * 
     * @param symptomId 症状主键
     * @return 症状
     */
    @Override
    public FollowupSymptoms selectFollowupSymptomsBySymptomId(Long symptomId)
    {
        return followupSymptomsMapper.selectFollowupSymptomsBySymptomId(symptomId);
    }

    /**
     * 查询症状列表
     * 
     * @param followupSymptoms 症状
     * @return 症状
     */
    @Override
    public List<FollowupSymptoms> selectFollowupSymptomsList(FollowupSymptoms followupSymptoms)
    {
        return followupSymptomsMapper.selectFollowupSymptomsList(followupSymptoms);
    }

    /**
     * 新增症状
     * 
     * @param followupSymptoms 症状
     * @return 结果
     */
    @Override
    public int insertFollowupSymptoms(FollowupSymptoms followupSymptoms)
    {
        return followupSymptomsMapper.insertFollowupSymptoms(followupSymptoms);
    }

    /**
     * 修改症状
     * 
     * @param followupSymptoms 症状
     * @return 结果
     */
    @Override
    public int updateFollowupSymptoms(FollowupSymptoms followupSymptoms)
    {
        return followupSymptomsMapper.updateFollowupSymptoms(followupSymptoms);
    }

    /**
     * 批量删除症状
     * 
     * @param symptomIds 需要删除的症状主键
     * @return 结果
     */
    @Override
    public int deleteFollowupSymptomsBySymptomIds(Long[] symptomIds)
    {
        return followupSymptomsMapper.deleteFollowupSymptomsBySymptomIds(symptomIds);
    }

    /**
     * 删除症状信息
     * 
     * @param symptomId 症状主键
     * @return 结果
     */
    @Override
    public int deleteFollowupSymptomsBySymptomId(Long symptomId)
    {
        return followupSymptomsMapper.deleteFollowupSymptomsBySymptomId(symptomId);
    }
}
