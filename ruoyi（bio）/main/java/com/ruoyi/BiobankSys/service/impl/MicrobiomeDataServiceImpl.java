package com.ruoyi.BiobankSys.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.BiobankSys.mapper.MicrobiomeDataMapper;
import com.ruoyi.BiobankSys.domain.MicrobiomeData;
import com.ruoyi.BiobankSys.service.IMicrobiomeDataService;

/**
 * 微生物组数据Service业务层处理
 * 
 * @author ruoyi
 * @date 2025-06-29
 */
@Service
public class MicrobiomeDataServiceImpl implements IMicrobiomeDataService 
{
    @Autowired
    private MicrobiomeDataMapper microbiomeDataMapper;

    /**
     * 查询微生物组数据
     * 
     * @param microbiomeId 微生物组数据主键
     * @return 微生物组数据
     */
    @Override
    public MicrobiomeData selectMicrobiomeDataByMicrobiomeId(Long microbiomeId)
    {
        return microbiomeDataMapper.selectMicrobiomeDataByMicrobiomeId(microbiomeId);
    }

    /**
     * 查询微生物组数据列表
     * 
     * @param microbiomeData 微生物组数据
     * @return 微生物组数据
     */
    @Override
    public List<MicrobiomeData> selectMicrobiomeDataList(MicrobiomeData microbiomeData)
    {
        return microbiomeDataMapper.selectMicrobiomeDataList(microbiomeData);
    }

    /**
     * 新增微生物组数据
     * 
     * @param microbiomeData 微生物组数据
     * @return 结果
     */
    @Override
    public int insertMicrobiomeData(MicrobiomeData microbiomeData)
    {
        return microbiomeDataMapper.insertMicrobiomeData(microbiomeData);
    }

    /**
     * 修改微生物组数据
     * 
     * @param microbiomeData 微生物组数据
     * @return 结果
     */
    @Override
    public int updateMicrobiomeData(MicrobiomeData microbiomeData)
    {
        return microbiomeDataMapper.updateMicrobiomeData(microbiomeData);
    }

    /**
     * 批量删除微生物组数据
     * 
     * @param microbiomeIds 需要删除的微生物组数据主键
     * @return 结果
     */
    @Override
    public int deleteMicrobiomeDataByMicrobiomeIds(Long[] microbiomeIds)
    {
        return microbiomeDataMapper.deleteMicrobiomeDataByMicrobiomeIds(microbiomeIds);
    }

    /**
     * 删除微生物组数据信息
     * 
     * @param microbiomeId 微生物组数据主键
     * @return 结果
     */
    @Override
    public int deleteMicrobiomeDataByMicrobiomeId(Long microbiomeId)
    {
        return microbiomeDataMapper.deleteMicrobiomeDataByMicrobiomeId(microbiomeId);
    }
}
