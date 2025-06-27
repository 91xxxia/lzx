package com.ruoyi.BiobankSys.service;

import java.util.List;
import com.ruoyi.BiobankSys.domain.ProteomicData;

/**
 * 蛋白质组数据Service接口
 * 
 * @author ruoyi
 * @date 2025-06-27
 */
public interface IProteomicDataService 
{
    /**
     * 查询蛋白质组数据
     * 
     * @param proteomicId 蛋白质组数据主键
     * @return 蛋白质组数据
     */
    public ProteomicData selectProteomicDataByProteomicId(Long proteomicId);

    /**
     * 查询蛋白质组数据列表
     * 
     * @param proteomicData 蛋白质组数据
     * @return 蛋白质组数据集合
     */
    public List<ProteomicData> selectProteomicDataList(ProteomicData proteomicData);

    /**
     * 新增蛋白质组数据
     * 
     * @param proteomicData 蛋白质组数据
     * @return 结果
     */
    public int insertProteomicData(ProteomicData proteomicData);

    /**
     * 修改蛋白质组数据
     * 
     * @param proteomicData 蛋白质组数据
     * @return 结果
     */
    public int updateProteomicData(ProteomicData proteomicData);

    /**
     * 批量删除蛋白质组数据
     * 
     * @param proteomicIds 需要删除的蛋白质组数据主键集合
     * @return 结果
     */
    public int deleteProteomicDataByProteomicIds(Long[] proteomicIds);

    /**
     * 删除蛋白质组数据信息
     * 
     * @param proteomicId 蛋白质组数据主键
     * @return 结果
     */
    public int deleteProteomicDataByProteomicId(Long proteomicId);
}
