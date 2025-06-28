package com.ruoyi.FollowSys.mapper;

import java.util.List;
import com.ruoyi.FollowSys.domain.FollowupImaging;

/**
 * 影像学检查Mapper接口
 * 
 * @author ruoyi
 * @date 2025-06-28
 */
public interface FollowupImagingMapper 
{
    /**
     * 查询影像学检查
     * 
     * @param imagingId 影像学检查主键
     * @return 影像学检查
     */
    public FollowupImaging selectFollowupImagingByImagingId(Long imagingId);

    /**
     * 查询影像学检查列表
     * 
     * @param followupImaging 影像学检查
     * @return 影像学检查集合
     */
    public List<FollowupImaging> selectFollowupImagingList(FollowupImaging followupImaging);

    /**
     * 新增影像学检查
     * 
     * @param followupImaging 影像学检查
     * @return 结果
     */
    public int insertFollowupImaging(FollowupImaging followupImaging);

    /**
     * 修改影像学检查
     * 
     * @param followupImaging 影像学检查
     * @return 结果
     */
    public int updateFollowupImaging(FollowupImaging followupImaging);

    /**
     * 删除影像学检查
     * 
     * @param imagingId 影像学检查主键
     * @return 结果
     */
    public int deleteFollowupImagingByImagingId(Long imagingId);

    /**
     * 批量删除影像学检查
     * 
     * @param imagingIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteFollowupImagingByImagingIds(Long[] imagingIds);
}
