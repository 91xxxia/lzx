package com.ruoyi.ClinicalSys.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.ClinicalSys.mapper.FollowupNotesMapper;
import com.ruoyi.ClinicalSys.domain.FollowupNotes;
import com.ruoyi.ClinicalSys.service.IFollowupNotesService;

/**
 * 随访信息Service业务层处理
 * 
 * @author ruoyi
 * @date 2025-06-27
 */
@Service
public class FollowupNotesServiceImpl implements IFollowupNotesService 
{
    @Autowired
    private FollowupNotesMapper followupNotesMapper;

    /**
     * 查询随访信息
     * 
     * @param followupId 随访信息主键
     * @return 随访信息
     */
    @Override
    public FollowupNotes selectFollowupNotesByFollowupId(Long followupId)
    {
        return followupNotesMapper.selectFollowupNotesByFollowupId(followupId);
    }

    /**
     * 查询随访信息列表
     * 
     * @param followupNotes 随访信息
     * @return 随访信息
     */
    @Override
    public List<FollowupNotes> selectFollowupNotesList(FollowupNotes followupNotes)
    {
        return followupNotesMapper.selectFollowupNotesList(followupNotes);
    }

    /**
     * 新增随访信息
     * 
     * @param followupNotes 随访信息
     * @return 结果
     */
    @Override
    public int insertFollowupNotes(FollowupNotes followupNotes)
    {
        return followupNotesMapper.insertFollowupNotes(followupNotes);
    }

    /**
     * 修改随访信息
     * 
     * @param followupNotes 随访信息
     * @return 结果
     */
    @Override
    public int updateFollowupNotes(FollowupNotes followupNotes)
    {
        return followupNotesMapper.updateFollowupNotes(followupNotes);
    }

    /**
     * 批量删除随访信息
     * 
     * @param followupIds 需要删除的随访信息主键
     * @return 结果
     */
    @Override
    public int deleteFollowupNotesByFollowupIds(Long[] followupIds)
    {
        return followupNotesMapper.deleteFollowupNotesByFollowupIds(followupIds);
    }

    /**
     * 删除随访信息信息
     * 
     * @param followupId 随访信息主键
     * @return 结果
     */
    @Override
    public int deleteFollowupNotesByFollowupId(Long followupId)
    {
        return followupNotesMapper.deleteFollowupNotesByFollowupId(followupId);
    }
}
