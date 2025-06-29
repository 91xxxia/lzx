package com.ruoyi.FollowSys.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.FollowSys.mapper.FollowupInfoMapper;
import com.ruoyi.FollowSys.domain.FollowupInfo;
import com.ruoyi.FollowSys.service.IFollowupInfoService;

/**
 * 随访基本信息Service业务层处理
 * 
 * @author ruoyi
 * @date 2025-06-28
 */
@Service
public class FollowupInfoServiceImpl implements IFollowupInfoService 
{
    @Autowired
    private FollowupInfoMapper followupInfoMapper;

    /**
     * 查询随访基本信息
     * 
     * @param followupId 随访基本信息主键
     * @return 随访基本信息
     */
    @Override
    public FollowupInfo selectFollowupInfoByFollowupId(Long followupId)
    {
        return followupInfoMapper.selectFollowupInfoByFollowupId(followupId);
    }

    /**
     * 查询随访基本信息列表
     * 
     * @param followupInfo 随访基本信息
     * @return 随访基本信息
     */
    @Override
    public List<FollowupInfo> selectFollowupInfoList(FollowupInfo followupInfo)
    {
        return followupInfoMapper.selectFollowupInfoList(followupInfo);
    }

    /**
     * 新增随访基本信息
     * 
     * @param followupInfo 随访基本信息
     * @return 结果
     */
    @Override
    public int insertFollowupInfo(FollowupInfo followupInfo)
    {
        return followupInfoMapper.insertFollowupInfo(followupInfo);
    }

    /**
     * 修改随访基本信息
     * 
     * @param followupInfo 随访基本信息
     * @return 结果
     */
    @Override
    public int updateFollowupInfo(FollowupInfo followupInfo)
    {
        return followupInfoMapper.updateFollowupInfo(followupInfo);
    }

    /**
     * 批量删除随访基本信息
     * 
     * @param followupIds 需要删除的随访基本信息主键
     * @return 结果
     */
    @Override
    public int deleteFollowupInfoByFollowupIds(Long[] followupIds)
    {
        return followupInfoMapper.deleteFollowupInfoByFollowupIds(followupIds);
    }

    /**
     * 删除随访基本信息信息
     * 
     * @param followupId 随访基本信息主键
     * @return 结果
     */
    @Override
    public int deleteFollowupInfoByFollowupId(Long followupId)
    {
        return followupInfoMapper.deleteFollowupInfoByFollowupId(followupId);
    }
}
