package com.ruoyi.FollowSys.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.FollowSys.mapper.FollowupImagingMapper;
import com.ruoyi.FollowSys.domain.FollowupImaging;
import com.ruoyi.FollowSys.service.IFollowupImagingService;

/**
 * 影像学检查Service业务层处理
 * 
 * @author ruoyi
 * @date 2025-06-28
 */
@Service
public class FollowupImagingServiceImpl implements IFollowupImagingService 
{
    @Autowired
    private FollowupImagingMapper followupImagingMapper;

    /**
     * 查询影像学检查
     * 
     * @param imagingId 影像学检查主键
     * @return 影像学检查
     */
    @Override
    public FollowupImaging selectFollowupImagingByImagingId(Long imagingId)
    {
        return followupImagingMapper.selectFollowupImagingByImagingId(imagingId);
    }

    /**
     * 查询影像学检查列表
     * 
     * @param followupImaging 影像学检查
     * @return 影像学检查
     */
    @Override
    public List<FollowupImaging> selectFollowupImagingList(FollowupImaging followupImaging)
    {
        return followupImagingMapper.selectFollowupImagingList(followupImaging);
    }

    /**
     * 新增影像学检查
     * 
     * @param followupImaging 影像学检查
     * @return 结果
     */
    @Override
    public int insertFollowupImaging(FollowupImaging followupImaging)
    {
        return followupImagingMapper.insertFollowupImaging(followupImaging);
    }

    /**
     * 修改影像学检查
     * 
     * @param followupImaging 影像学检查
     * @return 结果
     */
    @Override
    public int updateFollowupImaging(FollowupImaging followupImaging)
    {
        return followupImagingMapper.updateFollowupImaging(followupImaging);
    }

    /**
     * 批量删除影像学检查
     * 
     * @param imagingIds 需要删除的影像学检查主键
     * @return 结果
     */
    @Override
    public int deleteFollowupImagingByImagingIds(Long[] imagingIds)
    {
        return followupImagingMapper.deleteFollowupImagingByImagingIds(imagingIds);
    }

    /**
     * 删除影像学检查信息
     * 
     * @param imagingId 影像学检查主键
     * @return 结果
     */
    @Override
    public int deleteFollowupImagingByImagingId(Long imagingId)
    {
        return followupImagingMapper.deleteFollowupImagingByImagingId(imagingId);
    }
}
