package com.ruoyi.FollowSys.mapper;

import java.util.List;
import com.ruoyi.FollowSys.domain.FollowupAudiologyTests;

/**
 * 听力检查Mapper接口
 * 
 * @author ruoyi
 * @date 2025-06-28
 */
public interface FollowupAudiologyTestsMapper 
{
    /**
     * 查询听力检查
     * 
     * @param audioId 听力检查主键
     * @return 听力检查
     */
    public FollowupAudiologyTests selectFollowupAudiologyTestsByAudioId(Long audioId);

    /**
     * 查询听力检查列表
     * 
     * @param followupAudiologyTests 听力检查
     * @return 听力检查集合
     */
    public List<FollowupAudiologyTests> selectFollowupAudiologyTestsList(FollowupAudiologyTests followupAudiologyTests);

    /**
     * 新增听力检查
     * 
     * @param followupAudiologyTests 听力检查
     * @return 结果
     */
    public int insertFollowupAudiologyTests(FollowupAudiologyTests followupAudiologyTests);

    /**
     * 修改听力检查
     * 
     * @param followupAudiologyTests 听力检查
     * @return 结果
     */
    public int updateFollowupAudiologyTests(FollowupAudiologyTests followupAudiologyTests);

    /**
     * 删除听力检查
     * 
     * @param audioId 听力检查主键
     * @return 结果
     */
    public int deleteFollowupAudiologyTestsByAudioId(Long audioId);

    /**
     * 批量删除听力检查
     * 
     * @param audioIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteFollowupAudiologyTestsByAudioIds(Long[] audioIds);
}
