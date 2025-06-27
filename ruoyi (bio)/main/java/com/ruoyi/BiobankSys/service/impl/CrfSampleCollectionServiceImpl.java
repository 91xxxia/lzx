package com.ruoyi.BiobankSys.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.BiobankSys.mapper.CrfSampleCollectionMapper;
import com.ruoyi.BiobankSys.domain.CrfSampleCollection;
import com.ruoyi.BiobankSys.service.ICrfSampleCollectionService;

/**
 * 样本采集CRFService业务层处理
 * 
 * @author ruoyi
 * @date 2025-06-27
 */
@Service
public class CrfSampleCollectionServiceImpl implements ICrfSampleCollectionService 
{
    @Autowired
    private CrfSampleCollectionMapper crfSampleCollectionMapper;

    /**
     * 查询样本采集CRF
     * 
     * @param crfId 样本采集CRF主键
     * @return 样本采集CRF
     */
    @Override
    public CrfSampleCollection selectCrfSampleCollectionByCrfId(Long crfId)
    {
        return crfSampleCollectionMapper.selectCrfSampleCollectionByCrfId(crfId);
    }

    /**
     * 查询样本采集CRF列表
     * 
     * @param crfSampleCollection 样本采集CRF
     * @return 样本采集CRF
     */
    @Override
    public List<CrfSampleCollection> selectCrfSampleCollectionList(CrfSampleCollection crfSampleCollection)
    {
        return crfSampleCollectionMapper.selectCrfSampleCollectionList(crfSampleCollection);
    }

    /**
     * 新增样本采集CRF
     * 
     * @param crfSampleCollection 样本采集CRF
     * @return 结果
     */
    @Override
    public int insertCrfSampleCollection(CrfSampleCollection crfSampleCollection)
    {
        return crfSampleCollectionMapper.insertCrfSampleCollection(crfSampleCollection);
    }

    /**
     * 修改样本采集CRF
     * 
     * @param crfSampleCollection 样本采集CRF
     * @return 结果
     */
    @Override
    public int updateCrfSampleCollection(CrfSampleCollection crfSampleCollection)
    {
        return crfSampleCollectionMapper.updateCrfSampleCollection(crfSampleCollection);
    }

    /**
     * 批量删除样本采集CRF
     * 
     * @param crfIds 需要删除的样本采集CRF主键
     * @return 结果
     */
    @Override
    public int deleteCrfSampleCollectionByCrfIds(Long[] crfIds)
    {
        return crfSampleCollectionMapper.deleteCrfSampleCollectionByCrfIds(crfIds);
    }

    /**
     * 删除样本采集CRF信息
     * 
     * @param crfId 样本采集CRF主键
     * @return 结果
     */
    @Override
    public int deleteCrfSampleCollectionByCrfId(Long crfId)
    {
        return crfSampleCollectionMapper.deleteCrfSampleCollectionByCrfId(crfId);
    }
}
