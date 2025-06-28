package com.ruoyi.FollowSys.service;

import java.util.List;
import com.ruoyi.FollowSys.domain.FollowupInfo;

/**
 * 随访基本信息Service接口
 * 
 * @author ruoyi
 * @date 2025-06-28
 */
public interface IFollowupInfoService 
{
    /**
     * 查询随访基本信息
     * 
     * @param followupId 随访基本信息主键
     * @return 随访基本信息
     */
    public FollowupInfo selectFollowupInfoByFollowupId(Long followupId);

    /**
     * 查询随访基本信息列表
     * 
     * @param followupInfo 随访基本信息
     * @return 随访基本信息集合
     */
    public List<FollowupInfo> selectFollowupInfoList(FollowupInfo followupInfo);

    /**
     * 新增随访基本信息
     * 
     * @param followupInfo 随访基本信息
     * @return 结果
     */
    public int insertFollowupInfo(FollowupInfo followupInfo);

    /**
     * 修改随访基本信息
     * 
     * @param followupInfo 随访基本信息
     * @return 结果
     */
    public int updateFollowupInfo(FollowupInfo followupInfo);

    /**
     * 批量删除随访基本信息
     * 
     * @param followupIds 需要删除的随访基本信息主键集合
     * @return 结果
     */
    public int deleteFollowupInfoByFollowupIds(Long[] followupIds);

    /**
     * 删除随访基本信息信息
     * 
     * @param followupId 随访基本信息主键
     * @return 结果
     */
    public int deleteFollowupInfoByFollowupId(Long followupId);
}
