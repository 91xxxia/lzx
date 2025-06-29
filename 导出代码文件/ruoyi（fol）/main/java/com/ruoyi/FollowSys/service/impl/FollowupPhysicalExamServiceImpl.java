package com.ruoyi.FollowSys.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.FollowSys.mapper.FollowupPhysicalExamMapper;
import com.ruoyi.FollowSys.domain.FollowupPhysicalExam;
import com.ruoyi.FollowSys.service.IFollowupPhysicalExamService;

/**
 * 体征Service业务层处理
 * 
 * @author ruoyi
 * @date 2025-06-28
 */
@Service
public class FollowupPhysicalExamServiceImpl implements IFollowupPhysicalExamService 
{
    @Autowired
    private FollowupPhysicalExamMapper followupPhysicalExamMapper;

    /**
     * 查询体征
     * 
     * @param examId 体征主键
     * @return 体征
     */
    @Override
    public FollowupPhysicalExam selectFollowupPhysicalExamByExamId(Long examId)
    {
        return followupPhysicalExamMapper.selectFollowupPhysicalExamByExamId(examId);
    }

    /**
     * 查询体征列表
     * 
     * @param followupPhysicalExam 体征
     * @return 体征
     */
    @Override
    public List<FollowupPhysicalExam> selectFollowupPhysicalExamList(FollowupPhysicalExam followupPhysicalExam)
    {
        return followupPhysicalExamMapper.selectFollowupPhysicalExamList(followupPhysicalExam);
    }

    /**
     * 新增体征
     * 
     * @param followupPhysicalExam 体征
     * @return 结果
     */
    @Override
    public int insertFollowupPhysicalExam(FollowupPhysicalExam followupPhysicalExam)
    {
        return followupPhysicalExamMapper.insertFollowupPhysicalExam(followupPhysicalExam);
    }

    /**
     * 修改体征
     * 
     * @param followupPhysicalExam 体征
     * @return 结果
     */
    @Override
    public int updateFollowupPhysicalExam(FollowupPhysicalExam followupPhysicalExam)
    {
        return followupPhysicalExamMapper.updateFollowupPhysicalExam(followupPhysicalExam);
    }

    /**
     * 批量删除体征
     * 
     * @param examIds 需要删除的体征主键
     * @return 结果
     */
    @Override
    public int deleteFollowupPhysicalExamByExamIds(Long[] examIds)
    {
        return followupPhysicalExamMapper.deleteFollowupPhysicalExamByExamIds(examIds);
    }

    /**
     * 删除体征信息
     * 
     * @param examId 体征主键
     * @return 结果
     */
    @Override
    public int deleteFollowupPhysicalExamByExamId(Long examId)
    {
        return followupPhysicalExamMapper.deleteFollowupPhysicalExamByExamId(examId);
    }
}
