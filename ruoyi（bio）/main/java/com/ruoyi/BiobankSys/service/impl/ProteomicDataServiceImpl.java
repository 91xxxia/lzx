package com.ruoyi.BiobankSys.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.BiobankSys.mapper.ProteomicDataMapper;
import com.ruoyi.BiobankSys.domain.ProteomicData;
import com.ruoyi.BiobankSys.service.IProteomicDataService;

/**
 * 蛋白质组数据Service业务层处理
 * 
 * @author ruoyi
 * @date 2025-06-29
 */
@Service
public class ProteomicDataServiceImpl implements IProteomicDataService 
{
    @Autowired
    private ProteomicDataMapper proteomicDataMapper;

    /**
     * 查询蛋白质组数据
     * 
     * @param proteomicId 蛋白质组数据主键
     * @return 蛋白质组数据
     */
    @Override
    public ProteomicData selectProteomicDataByProteomicId(Long proteomicId)
    {
        return proteomicDataMapper.selectProteomicDataByProteomicId(proteomicId);
    }

    /**
     * 查询蛋白质组数据列表
     * 
     * @param proteomicData 蛋白质组数据
     * @return 蛋白质组数据
     */
    @Override
    public List<ProteomicData> selectProteomicDataList(ProteomicData proteomicData)
    {
        return proteomicDataMapper.selectProteomicDataList(proteomicData);
    }

    /**
     * 新增蛋白质组数据
     * 
     * @param proteomicData 蛋白质组数据
     * @return 结果
     */
    @Override
    public int insertProteomicData(ProteomicData proteomicData)
    {
        return proteomicDataMapper.insertProteomicData(proteomicData);
    }

    /**
     * 修改蛋白质组数据
     * 
     * @param proteomicData 蛋白质组数据
     * @return 结果
     */
    @Override
    public int updateProteomicData(ProteomicData proteomicData)
    {
        return proteomicDataMapper.updateProteomicData(proteomicData);
    }

    /**
     * 批量删除蛋白质组数据
     * 
     * @param proteomicIds 需要删除的蛋白质组数据主键
     * @return 结果
     */
    @Override
    public int deleteProteomicDataByProteomicIds(Long[] proteomicIds)
    {
        return proteomicDataMapper.deleteProteomicDataByProteomicIds(proteomicIds);
    }

    /**
     * 删除蛋白质组数据信息
     * 
     * @param proteomicId 蛋白质组数据主键
     * @return 结果
     */
    @Override
    public int deleteProteomicDataByProteomicId(Long proteomicId)
    {
        return proteomicDataMapper.deleteProteomicDataByProteomicId(proteomicId);
    }
}
