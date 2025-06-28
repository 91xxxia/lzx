package com.ruoyi.FollowSys.mapper;

import java.util.List;
import com.ruoyi.FollowSys.domain.FollowupInfo;

/**
 * 随访基本信息Mapper接口
 * 
 * @author ruoyi
 * @date 2025-06-28
 */
public interface FollowupInfoMapper 
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
     * 删除随访基本信息
     * 
     * @param followupId 随访基本信息主键
     * @return 结果
     */
    public int deleteFollowupInfoByFollowupId(Long followupId);

    /**
     * 批量删除随访基本信息
     * 
     * @param followupIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteFollowupInfoByFollowupIds(Long[] followupIds);
}
