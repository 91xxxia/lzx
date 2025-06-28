package com.ruoyi.BiobankSys.service;

import java.util.List;
import com.ruoyi.BiobankSys.domain.MetabolomicData;

/**
 * 代谢组数据Service接口
 * 
 * @author ruoyi
 * @date 2025-06-27
 */
public interface IMetabolomicDataService 
{
    /**
     * 查询代谢组数据
     * 
     * @param metabolomicId 代谢组数据主键
     * @return 代谢组数据
     */
    public MetabolomicData selectMetabolomicDataByMetabolomicId(Long metabolomicId);

    /**
     * 查询代谢组数据列表
     * 
     * @param metabolomicData 代谢组数据
     * @return 代谢组数据集合
     */
    public List<MetabolomicData> selectMetabolomicDataList(MetabolomicData metabolomicData);

    /**
     * 新增代谢组数据
     * 
     * @param metabolomicData 代谢组数据
     * @return 结果
     */
    public int insertMetabolomicData(MetabolomicData metabolomicData);

    /**
     * 修改代谢组数据
     * 
     * @param metabolomicData 代谢组数据
     * @return 结果
     */
    public int updateMetabolomicData(MetabolomicData metabolomicData);

    /**
     * 批量删除代谢组数据
     * 
     * @param metabolomicIds 需要删除的代谢组数据主键集合
     * @return 结果
     */
    public int deleteMetabolomicDataByMetabolomicIds(Long[] metabolomicIds);

    /**
     * 删除代谢组数据信息
     * 
     * @param metabolomicId 代谢组数据主键
     * @return 结果
     */
    public int deleteMetabolomicDataByMetabolomicId(Long metabolomicId);
}
