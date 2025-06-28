package com.ruoyi.BiobankSys.mapper;

import java.util.List;
import com.ruoyi.BiobankSys.domain.MicrobiomeData;

/**
 * 微生物组数据Mapper接口
 * 
 * @author ruoyi
 * @date 2025-06-27
 */
public interface MicrobiomeDataMapper 
{
    /**
     * 查询微生物组数据
     * 
     * @param microbiomeId 微生物组数据主键
     * @return 微生物组数据
     */
    public MicrobiomeData selectMicrobiomeDataByMicrobiomeId(Long microbiomeId);

    /**
     * 查询微生物组数据列表
     * 
     * @param microbiomeData 微生物组数据
     * @return 微生物组数据集合
     */
    public List<MicrobiomeData> selectMicrobiomeDataList(MicrobiomeData microbiomeData);

    /**
     * 新增微生物组数据
     * 
     * @param microbiomeData 微生物组数据
     * @return 结果
     */
    public int insertMicrobiomeData(MicrobiomeData microbiomeData);

    /**
     * 修改微生物组数据
     * 
     * @param microbiomeData 微生物组数据
     * @return 结果
     */
    public int updateMicrobiomeData(MicrobiomeData microbiomeData);

    /**
     * 删除微生物组数据
     * 
     * @param microbiomeId 微生物组数据主键
     * @return 结果
     */
    public int deleteMicrobiomeDataByMicrobiomeId(Long microbiomeId);

    /**
     * 批量删除微生物组数据
     * 
     * @param microbiomeIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteMicrobiomeDataByMicrobiomeIds(Long[] microbiomeIds);
}
