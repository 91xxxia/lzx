package com.ruoyi.BiobankSys.mapper;

import java.util.List;
import com.ruoyi.BiobankSys.domain.CrfSampleCollection;

/**
 * 样本采集CRFMapper接口
 * 
 * @author ruoyi
 * @date 2025-06-27
 */
public interface CrfSampleCollectionMapper 
{
    /**
     * 查询样本采集CRF
     * 
     * @param crfId 样本采集CRF主键
     * @return 样本采集CRF
     */
    public CrfSampleCollection selectCrfSampleCollectionByCrfId(Long crfId);

    /**
     * 查询样本采集CRF列表
     * 
     * @param crfSampleCollection 样本采集CRF
     * @return 样本采集CRF集合
     */
    public List<CrfSampleCollection> selectCrfSampleCollectionList(CrfSampleCollection crfSampleCollection);

    /**
     * 新增样本采集CRF
     * 
     * @param crfSampleCollection 样本采集CRF
     * @return 结果
     */
    public int insertCrfSampleCollection(CrfSampleCollection crfSampleCollection);

    /**
     * 修改样本采集CRF
     * 
     * @param crfSampleCollection 样本采集CRF
     * @return 结果
     */
    public int updateCrfSampleCollection(CrfSampleCollection crfSampleCollection);

    /**
     * 删除样本采集CRF
     * 
     * @param crfId 样本采集CRF主键
     * @return 结果
     */
    public int deleteCrfSampleCollectionByCrfId(Long crfId);

    /**
     * 批量删除样本采集CRF
     * 
     * @param crfIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteCrfSampleCollectionByCrfIds(Long[] crfIds);
}
