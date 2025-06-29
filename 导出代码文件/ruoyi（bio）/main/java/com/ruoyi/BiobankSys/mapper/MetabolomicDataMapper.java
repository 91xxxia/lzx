package com.ruoyi.BiobankSys.mapper;

import java.util.List;
import com.ruoyi.BiobankSys.domain.MetabolomicData;

/**
 * 代谢组数据Mapper接口
 * 
 * @author ruoyi
 * @date 2025-06-29
 */
public interface MetabolomicDataMapper 
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
     * 删除代谢组数据
     * 
     * @param metabolomicId 代谢组数据主键
     * @return 结果
     */
    public int deleteMetabolomicDataByMetabolomicId(Long metabolomicId);

    /**
     * 批量删除代谢组数据
     * 
     * @param metabolomicIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteMetabolomicDataByMetabolomicIds(Long[] metabolomicIds);
}
