package com.ruoyi.FollowSys.mapper;

import java.util.List;
import com.ruoyi.FollowSys.domain.FollowupPulmonaryTests;

/**
 * 肺功能检查Mapper接口
 * 
 * @author ruoyi
 * @date 2025-06-28
 */
public interface FollowupPulmonaryTestsMapper 
{
    /**
     * 查询肺功能检查
     * 
     * @param testId 肺功能检查主键
     * @return 肺功能检查
     */
    public FollowupPulmonaryTests selectFollowupPulmonaryTestsByTestId(Long testId);

    /**
     * 查询肺功能检查列表
     * 
     * @param followupPulmonaryTests 肺功能检查
     * @return 肺功能检查集合
     */
    public List<FollowupPulmonaryTests> selectFollowupPulmonaryTestsList(FollowupPulmonaryTests followupPulmonaryTests);

    /**
     * 新增肺功能检查
     * 
     * @param followupPulmonaryTests 肺功能检查
     * @return 结果
     */
    public int insertFollowupPulmonaryTests(FollowupPulmonaryTests followupPulmonaryTests);

    /**
     * 修改肺功能检查
     * 
     * @param followupPulmonaryTests 肺功能检查
     * @return 结果
     */
    public int updateFollowupPulmonaryTests(FollowupPulmonaryTests followupPulmonaryTests);

    /**
     * 删除肺功能检查
     * 
     * @param testId 肺功能检查主键
     * @return 结果
     */
    public int deleteFollowupPulmonaryTestsByTestId(Long testId);

    /**
     * 批量删除肺功能检查
     * 
     * @param testIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteFollowupPulmonaryTestsByTestIds(Long[] testIds);
}
