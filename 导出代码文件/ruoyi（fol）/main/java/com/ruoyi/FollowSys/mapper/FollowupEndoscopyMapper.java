package com.ruoyi.FollowSys.mapper;

import java.util.List;
import com.ruoyi.FollowSys.domain.FollowupEndoscopy;

/**
 * 电子鼻咽喉镜Mapper接口
 * 
 * @author ruoyi
 * @date 2025-06-28
 */
public interface FollowupEndoscopyMapper 
{
    /**
     * 查询电子鼻咽喉镜
     * 
     * @param endoscopyId 电子鼻咽喉镜主键
     * @return 电子鼻咽喉镜
     */
    public FollowupEndoscopy selectFollowupEndoscopyByEndoscopyId(Long endoscopyId);

    /**
     * 查询电子鼻咽喉镜列表
     * 
     * @param followupEndoscopy 电子鼻咽喉镜
     * @return 电子鼻咽喉镜集合
     */
    public List<FollowupEndoscopy> selectFollowupEndoscopyList(FollowupEndoscopy followupEndoscopy);

    /**
     * 新增电子鼻咽喉镜
     * 
     * @param followupEndoscopy 电子鼻咽喉镜
     * @return 结果
     */
    public int insertFollowupEndoscopy(FollowupEndoscopy followupEndoscopy);

    /**
     * 修改电子鼻咽喉镜
     * 
     * @param followupEndoscopy 电子鼻咽喉镜
     * @return 结果
     */
    public int updateFollowupEndoscopy(FollowupEndoscopy followupEndoscopy);

    /**
     * 删除电子鼻咽喉镜
     * 
     * @param endoscopyId 电子鼻咽喉镜主键
     * @return 结果
     */
    public int deleteFollowupEndoscopyByEndoscopyId(Long endoscopyId);

    /**
     * 批量删除电子鼻咽喉镜
     * 
     * @param endoscopyIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteFollowupEndoscopyByEndoscopyIds(Long[] endoscopyIds);
}
