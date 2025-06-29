package com.ruoyi.FollowSys.mapper;

import java.util.List;
import com.ruoyi.FollowSys.domain.FollowupPhysicalExam;

/**
 * 体征Mapper接口
 * 
 * @author ruoyi
 * @date 2025-06-28
 */
public interface FollowupPhysicalExamMapper 
{
    /**
     * 查询体征
     * 
     * @param examId 体征主键
     * @return 体征
     */
    public FollowupPhysicalExam selectFollowupPhysicalExamByExamId(Long examId);

    /**
     * 查询体征列表
     * 
     * @param followupPhysicalExam 体征
     * @return 体征集合
     */
    public List<FollowupPhysicalExam> selectFollowupPhysicalExamList(FollowupPhysicalExam followupPhysicalExam);

    /**
     * 新增体征
     * 
     * @param followupPhysicalExam 体征
     * @return 结果
     */
    public int insertFollowupPhysicalExam(FollowupPhysicalExam followupPhysicalExam);

    /**
     * 修改体征
     * 
     * @param followupPhysicalExam 体征
     * @return 结果
     */
    public int updateFollowupPhysicalExam(FollowupPhysicalExam followupPhysicalExam);

    /**
     * 删除体征
     * 
     * @param examId 体征主键
     * @return 结果
     */
    public int deleteFollowupPhysicalExamByExamId(Long examId);

    /**
     * 批量删除体征
     * 
     * @param examIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteFollowupPhysicalExamByExamIds(Long[] examIds);
}
