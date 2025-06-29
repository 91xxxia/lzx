package com.ruoyi.FollowSys.service;

import java.util.List;
import com.ruoyi.FollowSys.domain.FollowupPhysicalExam;

/**
 * 体征Service接口
 * 
 * @author ruoyi
 * @date 2025-06-28
 */
public interface IFollowupPhysicalExamService 
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
     * 批量删除体征
     * 
     * @param examIds 需要删除的体征主键集合
     * @return 结果
     */
    public int deleteFollowupPhysicalExamByExamIds(Long[] examIds);

    /**
     * 删除体征信息
     * 
     * @param examId 体征主键
     * @return 结果
     */
    public int deleteFollowupPhysicalExamByExamId(Long examId);
}
