package com.ruoyi.BiobankSys.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.BiobankSys.mapper.CrfSampleCollectionMapper;
import com.ruoyi.BiobankSys.domain.CrfSampleCollection;
import com.ruoyi.BiobankSys.service.ICrfSampleCollectionService;

/**
 * CRF表格Service业务层处理
 * 
 * @author ruoyi
 * @date 2025-06-29
 */
@Service
public class CrfSampleCollectionServiceImpl implements ICrfSampleCollectionService 
{
    @Autowired
    private CrfSampleCollectionMapper crfSampleCollectionMapper;

    /**
     * 查询CRF表格
     * 
     * @param crfId CRF表格主键
     * @return CRF表格
     */
    @Override
    public CrfSampleCollection selectCrfSampleCollectionByCrfId(Long crfId)
    {
        return crfSampleCollectionMapper.selectCrfSampleCollectionByCrfId(crfId);
    }

    /**
     * 查询CRF表格列表
     * 
     * @param crfSampleCollection CRF表格
     * @return CRF表格
     */
    @Override
    public List<CrfSampleCollection> selectCrfSampleCollectionList(CrfSampleCollection crfSampleCollection)
    {
        return crfSampleCollectionMapper.selectCrfSampleCollectionList(crfSampleCollection);
    }

    /**
     * 新增CRF表格
     * 
     * @param crfSampleCollection CRF表格
     * @return 结果
     */
    @Override
    public int insertCrfSampleCollection(CrfSampleCollection crfSampleCollection)
    {
        return crfSampleCollectionMapper.insertCrfSampleCollection(crfSampleCollection);
    }

    /**
     * 修改CRF表格
     * 
     * @param crfSampleCollection CRF表格
     * @return 结果
     */
    @Override
    public int updateCrfSampleCollection(CrfSampleCollection crfSampleCollection)
    {
        return crfSampleCollectionMapper.updateCrfSampleCollection(crfSampleCollection);
    }

    /**
     * 批量删除CRF表格
     * 
     * @param crfIds 需要删除的CRF表格主键
     * @return 结果
     */
    @Override
    public int deleteCrfSampleCollectionByCrfIds(Long[] crfIds)
    {
        return crfSampleCollectionMapper.deleteCrfSampleCollectionByCrfIds(crfIds);
    }

    /**
     * 删除CRF表格信息
     * 
     * @param crfId CRF表格主键
     * @return 结果
     */
    @Override
    public int deleteCrfSampleCollectionByCrfId(Long crfId)
    {
        return crfSampleCollectionMapper.deleteCrfSampleCollectionByCrfId(crfId);
    }
}
