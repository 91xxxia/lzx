package com.ruoyi.BiobankSys.service;

import java.util.List;
import com.ruoyi.BiobankSys.domain.GenomicData;

/**
 * 基因组数据Service接口
 * 
 * @author ruoyi
 * @date 2025-06-29
 */
public interface IGenomicDataService 
{
    /**
     * 查询基因组数据
     * 
     * @param genomicId 基因组数据主键
     * @return 基因组数据
     */
    public GenomicData selectGenomicDataByGenomicId(Long genomicId);

    /**
     * 查询基因组数据列表
     * 
     * @param genomicData 基因组数据
     * @return 基因组数据集合
     */
    public List<GenomicData> selectGenomicDataList(GenomicData genomicData);

    /**
     * 新增基因组数据
     * 
     * @param genomicData 基因组数据
     * @return 结果
     */
    public int insertGenomicData(GenomicData genomicData);

    /**
     * 修改基因组数据
     * 
     * @param genomicData 基因组数据
     * @return 结果
     */
    public int updateGenomicData(GenomicData genomicData);

    /**
     * 批量删除基因组数据
     * 
     * @param genomicIds 需要删除的基因组数据主键集合
     * @return 结果
     */
    public int deleteGenomicDataByGenomicIds(Long[] genomicIds);

    /**
     * 删除基因组数据信息
     * 
     * @param genomicId 基因组数据主键
     * @return 结果
     */
    public int deleteGenomicDataByGenomicId(Long genomicId);
}
