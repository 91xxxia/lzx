package com.ruoyi.BiobankSys.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.BiobankSys.mapper.MetabolomicDataMapper;
import com.ruoyi.BiobankSys.domain.MetabolomicData;
import com.ruoyi.BiobankSys.service.IMetabolomicDataService;

/**
 * 代谢组数据Service业务层处理
 * 
 * @author ruoyi
 * @date 2025-06-27
 */
@Service
public class MetabolomicDataServiceImpl implements IMetabolomicDataService 
{
    @Autowired
    private MetabolomicDataMapper metabolomicDataMapper;

    /**
     * 查询代谢组数据
     * 
     * @param metabolomicId 代谢组数据主键
     * @return 代谢组数据
     */
    @Override
    public MetabolomicData selectMetabolomicDataByMetabolomicId(Long metabolomicId)
    {
        return metabolomicDataMapper.selectMetabolomicDataByMetabolomicId(metabolomicId);
    }

    /**
     * 查询代谢组数据列表
     * 
     * @param metabolomicData 代谢组数据
     * @return 代谢组数据
     */
    @Override
    public List<MetabolomicData> selectMetabolomicDataList(MetabolomicData metabolomicData)
    {
        return metabolomicDataMapper.selectMetabolomicDataList(metabolomicData);
    }

    /**
     * 新增代谢组数据
     * 
     * @param metabolomicData 代谢组数据
     * @return 结果
     */
    @Override
    public int insertMetabolomicData(MetabolomicData metabolomicData)
    {
        return metabolomicDataMapper.insertMetabolomicData(metabolomicData);
    }

    /**
     * 修改代谢组数据
     * 
     * @param metabolomicData 代谢组数据
     * @return 结果
     */
    @Override
    public int updateMetabolomicData(MetabolomicData metabolomicData)
    {
        return metabolomicDataMapper.updateMetabolomicData(metabolomicData);
    }

    /**
     * 批量删除代谢组数据
     * 
     * @param metabolomicIds 需要删除的代谢组数据主键
     * @return 结果
     */
    @Override
    public int deleteMetabolomicDataByMetabolomicIds(Long[] metabolomicIds)
    {
        return metabolomicDataMapper.deleteMetabolomicDataByMetabolomicIds(metabolomicIds);
    }

    /**
     * 删除代谢组数据信息
     * 
     * @param metabolomicId 代谢组数据主键
     * @return 结果
     */
    @Override
    public int deleteMetabolomicDataByMetabolomicId(Long metabolomicId)
    {
        return metabolomicDataMapper.deleteMetabolomicDataByMetabolomicId(metabolomicId);
    }
}
