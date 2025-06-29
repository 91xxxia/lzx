package com.ruoyi.FollowSys.mapper;

import java.util.List;
import com.ruoyi.FollowSys.domain.FollowupSymptoms;

/**
 * 症状Mapper接口
 * 
 * @author ruoyi
 * @date 2025-06-28
 */
public interface FollowupSymptomsMapper 
{
    /**
     * 查询症状
     * 
     * @param symptomId 症状主键
     * @return 症状
     */
    public FollowupSymptoms selectFollowupSymptomsBySymptomId(Long symptomId);

    /**
     * 查询症状列表
     * 
     * @param followupSymptoms 症状
     * @return 症状集合
     */
    public List<FollowupSymptoms> selectFollowupSymptomsList(FollowupSymptoms followupSymptoms);

    /**
     * 新增症状
     * 
     * @param followupSymptoms 症状
     * @return 结果
     */
    public int insertFollowupSymptoms(FollowupSymptoms followupSymptoms);

    /**
     * 修改症状
     * 
     * @param followupSymptoms 症状
     * @return 结果
     */
    public int updateFollowupSymptoms(FollowupSymptoms followupSymptoms);

    /**
     * 删除症状
     * 
     * @param symptomId 症状主键
     * @return 结果
     */
    public int deleteFollowupSymptomsBySymptomId(Long symptomId);

    /**
     * 批量删除症状
     * 
     * @param symptomIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteFollowupSymptomsBySymptomIds(Long[] symptomIds);
}
