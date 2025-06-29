package com.ruoyi.BiobankSys.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.BiobankSys.mapper.GenomicDataMapper;
import com.ruoyi.BiobankSys.domain.GenomicData;
import com.ruoyi.BiobankSys.service.IGenomicDataService;

/**
 * 基因组数据Service业务层处理
 * 
 * @author ruoyi
 * @date 2025-06-29
 */
@Service
public class GenomicDataServiceImpl implements IGenomicDataService 
{
    @Autowired
    private GenomicDataMapper genomicDataMapper;

    /**
     * 查询基因组数据
     * 
     * @param genomicId 基因组数据主键
     * @return 基因组数据
     */
    @Override
    public GenomicData selectGenomicDataByGenomicId(Long genomicId)
    {
        return genomicDataMapper.selectGenomicDataByGenomicId(genomicId);
    }

    /**
     * 查询基因组数据列表
     * 
     * @param genomicData 基因组数据
     * @return 基因组数据
     */
    @Override
    public List<GenomicData> selectGenomicDataList(GenomicData genomicData)
    {
        return genomicDataMapper.selectGenomicDataList(genomicData);
    }

    /**
     * 新增基因组数据
     * 
     * @param genomicData 基因组数据
     * @return 结果
     */
    @Override
    public int insertGenomicData(GenomicData genomicData)
    {
        return genomicDataMapper.insertGenomicData(genomicData);
    }

    /**
     * 修改基因组数据
     * 
     * @param genomicData 基因组数据
     * @return 结果
     */
    @Override
    public int updateGenomicData(GenomicData genomicData)
    {
        return genomicDataMapper.updateGenomicData(genomicData);
    }

    /**
     * 批量删除基因组数据
     * 
     * @param genomicIds 需要删除的基因组数据主键
     * @return 结果
     */
    @Override
    public int deleteGenomicDataByGenomicIds(Long[] genomicIds)
    {
        return genomicDataMapper.deleteGenomicDataByGenomicIds(genomicIds);
    }

    /**
     * 删除基因组数据信息
     * 
     * @param genomicId 基因组数据主键
     * @return 结果
     */
    @Override
    public int deleteGenomicDataByGenomicId(Long genomicId)
    {
        return genomicDataMapper.deleteGenomicDataByGenomicId(genomicId);
    }
}
