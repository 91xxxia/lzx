package com.ruoyi.FollowSys.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.FollowSys.mapper.FollowupVisitsMapper;
import com.ruoyi.FollowSys.domain.FollowupVisits;
import com.ruoyi.FollowSys.service.IFollowupVisitsService;

/**
 * 随访记录Service业务层处理
 * 
 * @author ruoyi
 * @date 2025-06-28
 */
@Service
public class FollowupVisitsServiceImpl implements IFollowupVisitsService 
{
    @Autowired
    private FollowupVisitsMapper followupVisitsMapper;

    /**
     * 查询随访记录
     * 
     * @param followupId 随访记录主键
     * @return 随访记录
     */
    @Override
    public FollowupVisits selectFollowupVisitsByFollowupId(Long followupId)
    {
        return followupVisitsMapper.selectFollowupVisitsByFollowupId(followupId);
    }

    /**
     * 查询随访记录列表
     * 
     * @param followupVisits 随访记录
     * @return 随访记录
     */
    @Override
    public List<FollowupVisits> selectFollowupVisitsList(FollowupVisits followupVisits)
    {
        return followupVisitsMapper.selectFollowupVisitsList(followupVisits);
    }

    /**
     * 新增随访记录
     * 
     * @param followupVisits 随访记录
     * @return 结果
     */
    @Override
    public int insertFollowupVisits(FollowupVisits followupVisits)
    {
        return followupVisitsMapper.insertFollowupVisits(followupVisits);
    }

    /**
     * 修改随访记录
     * 
     * @param followupVisits 随访记录
     * @return 结果
     */
    @Override
    public int updateFollowupVisits(FollowupVisits followupVisits)
    {
        return followupVisitsMapper.updateFollowupVisits(followupVisits);
    }

    /**
     * 批量删除随访记录
     * 
     * @param followupIds 需要删除的随访记录主键
     * @return 结果
     */
    @Override
    public int deleteFollowupVisitsByFollowupIds(Long[] followupIds)
    {
        return followupVisitsMapper.deleteFollowupVisitsByFollowupIds(followupIds);
    }

    /**
     * 删除随访记录信息
     * 
     * @param followupId 随访记录主键
     * @return 结果
     */
    @Override
    public int deleteFollowupVisitsByFollowupId(Long followupId)
    {
        return followupVisitsMapper.deleteFollowupVisitsByFollowupId(followupId);
    }
}
