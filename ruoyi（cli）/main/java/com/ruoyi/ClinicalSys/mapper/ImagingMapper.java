package com.ruoyi.ClinicalSys.mapper;

import java.util.List;
import com.ruoyi.ClinicalSys.domain.Imaging;

/**
 * 影像学检查Mapper接口
 * 
 * @author ruoyi
 * @date 2025-06-27
 */
public interface ImagingMapper 
{
    /**
     * 查询影像学检查
     * 
     * @param imagingId 影像学检查主键
     * @return 影像学检查
     */
    public Imaging selectImagingByImagingId(Long imagingId);

    /**
     * 查询影像学检查列表
     * 
     * @param imaging 影像学检查
     * @return 影像学检查集合
     */
    public List<Imaging> selectImagingList(Imaging imaging);

    /**
     * 新增影像学检查
     * 
     * @param imaging 影像学检查
     * @return 结果
     */
    public int insertImaging(Imaging imaging);

    /**
     * 修改影像学检查
     * 
     * @param imaging 影像学检查
     * @return 结果
     */
    public int updateImaging(Imaging imaging);

    /**
     * 删除影像学检查
     * 
     * @param imagingId 影像学检查主键
     * @return 结果
     */
    public int deleteImagingByImagingId(Long imagingId);

    /**
     * 批量删除影像学检查
     * 
     * @param imagingIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteImagingByImagingIds(Long[] imagingIds);
}
