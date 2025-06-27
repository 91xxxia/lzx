package com.ruoyi.ClinicalSys.mapper;

import java.util.List;
import com.ruoyi.ClinicalSys.domain.FollowupNotes;

/**
 * 随访信息Mapper接口
 * 
 * @author ruoyi
 * @date 2025-06-27
 */
public interface FollowupNotesMapper 
{
    /**
     * 查询随访信息
     * 
     * @param followupId 随访信息主键
     * @return 随访信息
     */
    public FollowupNotes selectFollowupNotesByFollowupId(Long followupId);

    /**
     * 查询随访信息列表
     * 
     * @param followupNotes 随访信息
     * @return 随访信息集合
     */
    public List<FollowupNotes> selectFollowupNotesList(FollowupNotes followupNotes);

    /**
     * 新增随访信息
     * 
     * @param followupNotes 随访信息
     * @return 结果
     */
    public int insertFollowupNotes(FollowupNotes followupNotes);

    /**
     * 修改随访信息
     * 
     * @param followupNotes 随访信息
     * @return 结果
     */
    public int updateFollowupNotes(FollowupNotes followupNotes);

    /**
     * 删除随访信息
     * 
     * @param followupId 随访信息主键
     * @return 结果
     */
    public int deleteFollowupNotesByFollowupId(Long followupId);

    /**
     * 批量删除随访信息
     * 
     * @param followupIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteFollowupNotesByFollowupIds(Long[] followupIds);
}
