package com.ruoyi.BiobankSys.service;

import java.util.List;
import com.ruoyi.BiobankSys.domain.CrfSampleCollection;

/**
 * CRF表格Service接口
 * 
 * @author ruoyi
 * @date 2025-06-29
 */
public interface ICrfSampleCollectionService 
{
    /**
     * 查询CRF表格
     * 
     * @param crfId CRF表格主键
     * @return CRF表格
     */
    public CrfSampleCollection selectCrfSampleCollectionByCrfId(Long crfId);

    /**
     * 查询CRF表格列表
     * 
     * @param crfSampleCollection CRF表格
     * @return CRF表格集合
     */
    public List<CrfSampleCollection> selectCrfSampleCollectionList(CrfSampleCollection crfSampleCollection);

    /**
     * 新增CRF表格
     * 
     * @param crfSampleCollection CRF表格
     * @return 结果
     */
    public int insertCrfSampleCollection(CrfSampleCollection crfSampleCollection);

    /**
     * 修改CRF表格
     * 
     * @param crfSampleCollection CRF表格
     * @return 结果
     */
    public int updateCrfSampleCollection(CrfSampleCollection crfSampleCollection);

    /**
     * 批量删除CRF表格
     * 
     * @param crfIds 需要删除的CRF表格主键集合
     * @return 结果
     */
    public int deleteCrfSampleCollectionByCrfIds(Long[] crfIds);

    /**
     * 删除CRF表格信息
     * 
     * @param crfId CRF表格主键
     * @return 结果
     */
    public int deleteCrfSampleCollectionByCrfId(Long crfId);
}
