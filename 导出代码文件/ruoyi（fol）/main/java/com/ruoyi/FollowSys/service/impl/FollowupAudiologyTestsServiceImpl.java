package com.ruoyi.FollowSys.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.FollowSys.mapper.FollowupAudiologyTestsMapper;
import com.ruoyi.FollowSys.domain.FollowupAudiologyTests;
import com.ruoyi.FollowSys.service.IFollowupAudiologyTestsService;

/**
 * 听力检查Service业务层处理
 * 
 * @author ruoyi
 * @date 2025-06-28
 */
@Service
public class FollowupAudiologyTestsServiceImpl implements IFollowupAudiologyTestsService 
{
    @Autowired
    private FollowupAudiologyTestsMapper followupAudiologyTestsMapper;

    /**
     * 查询听力检查
     * 
     * @param audioId 听力检查主键
     * @return 听力检查
     */
    @Override
    public FollowupAudiologyTests selectFollowupAudiologyTestsByAudioId(Long audioId)
    {
        return followupAudiologyTestsMapper.selectFollowupAudiologyTestsByAudioId(audioId);
    }

    /**
     * 查询听力检查列表
     * 
     * @param followupAudiologyTests 听力检查
     * @return 听力检查
     */
    @Override
    public List<FollowupAudiologyTests> selectFollowupAudiologyTestsList(FollowupAudiologyTests followupAudiologyTests)
    {
        return followupAudiologyTestsMapper.selectFollowupAudiologyTestsList(followupAudiologyTests);
    }

    /**
     * 新增听力检查
     * 
     * @param followupAudiologyTests 听力检查
     * @return 结果
     */
    @Override
    public int insertFollowupAudiologyTests(FollowupAudiologyTests followupAudiologyTests)
    {
        return followupAudiologyTestsMapper.insertFollowupAudiologyTests(followupAudiologyTests);
    }

    /**
     * 修改听力检查
     * 
     * @param followupAudiologyTests 听力检查
     * @return 结果
     */
    @Override
    public int updateFollowupAudiologyTests(FollowupAudiologyTests followupAudiologyTests)
    {
        return followupAudiologyTestsMapper.updateFollowupAudiologyTests(followupAudiologyTests);
    }

    /**
     * 批量删除听力检查
     * 
     * @param audioIds 需要删除的听力检查主键
     * @return 结果
     */
    @Override
    public int deleteFollowupAudiologyTestsByAudioIds(Long[] audioIds)
    {
        return followupAudiologyTestsMapper.deleteFollowupAudiologyTestsByAudioIds(audioIds);
    }

    /**
     * 删除听力检查信息
     * 
     * @param audioId 听力检查主键
     * @return 结果
     */
    @Override
    public int deleteFollowupAudiologyTestsByAudioId(Long audioId)
    {
        return followupAudiologyTestsMapper.deleteFollowupAudiologyTestsByAudioId(audioId);
    }
}
