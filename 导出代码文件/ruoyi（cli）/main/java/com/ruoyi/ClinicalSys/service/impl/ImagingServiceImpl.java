package com.ruoyi.ClinicalSys.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.ClinicalSys.mapper.ImagingMapper;
import com.ruoyi.ClinicalSys.domain.Imaging;
import com.ruoyi.ClinicalSys.service.IImagingService;

/**
 * 影像学检查Service业务层处理
 * 
 * @author ruoyi
 * @date 2025-06-27
 */
@Service
public class ImagingServiceImpl implements IImagingService 
{
    @Autowired
    private ImagingMapper imagingMapper;

    /**
     * 查询影像学检查
     * 
     * @param imagingId 影像学检查主键
     * @return 影像学检查
     */
    @Override
    public Imaging selectImagingByImagingId(Long imagingId)
    {
        return imagingMapper.selectImagingByImagingId(imagingId);
    }

    /**
     * 查询影像学检查列表
     * 
     * @param imaging 影像学检查
     * @return 影像学检查
     */
    @Override
    public List<Imaging> selectImagingList(Imaging imaging)
    {
        return imagingMapper.selectImagingList(imaging);
    }

    /**
     * 新增影像学检查
     * 
     * @param imaging 影像学检查
     * @return 结果
     */
    @Override
    public int insertImaging(Imaging imaging)
    {
        return imagingMapper.insertImaging(imaging);
    }

    /**
     * 修改影像学检查
     * 
     * @param imaging 影像学检查
     * @return 结果
     */
    @Override
    public int updateImaging(Imaging imaging)
    {
        return imagingMapper.updateImaging(imaging);
    }

    /**
     * 批量删除影像学检查
     * 
     * @param imagingIds 需要删除的影像学检查主键
     * @return 结果
     */
    @Override
    public int deleteImagingByImagingIds(Long[] imagingIds)
    {
        return imagingMapper.deleteImagingByImagingIds(imagingIds);
    }

    /**
     * 删除影像学检查信息
     * 
     * @param imagingId 影像学检查主键
     * @return 结果
     */
    @Override
    public int deleteImagingByImagingId(Long imagingId)
    {
        return imagingMapper.deleteImagingByImagingId(imagingId);
    }
}
