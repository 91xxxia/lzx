package com.ruoyi.FollowSys.mapper;

import java.util.List;
import com.ruoyi.FollowSys.domain.FollowupMedications;

/**
 * 用药Mapper接口
 * 
 * @author ruoyi
 * @date 2025-06-28
 */
public interface FollowupMedicationsMapper 
{
    /**
     * 查询用药
     * 
     * @param medId 用药主键
     * @return 用药
     */
    public FollowupMedications selectFollowupMedicationsByMedId(Long medId);

    /**
     * 查询用药列表
     * 
     * @param followupMedications 用药
     * @return 用药集合
     */
    public List<FollowupMedications> selectFollowupMedicationsList(FollowupMedications followupMedications);

    /**
     * 新增用药
     * 
     * @param followupMedications 用药
     * @return 结果
     */
    public int insertFollowupMedications(FollowupMedications followupMedications);

    /**
     * 修改用药
     * 
     * @param followupMedications 用药
     * @return 结果
     */
    public int updateFollowupMedications(FollowupMedications followupMedications);

    /**
     * 删除用药
     * 
     * @param medId 用药主键
     * @return 结果
     */
    public int deleteFollowupMedicationsByMedId(Long medId);

    /**
     * 批量删除用药
     * 
     * @param medIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteFollowupMedicationsByMedIds(Long[] medIds);
}
