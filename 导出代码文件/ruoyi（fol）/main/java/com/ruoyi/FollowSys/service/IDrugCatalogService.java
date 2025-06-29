package com.ruoyi.FollowSys.service;

import java.util.List;
import com.ruoyi.FollowSys.domain.DrugCatalog;

/**
 * 药物记录Service接口
 * 
 * @author ruoyi
 * @date 2025-06-28
 */
public interface IDrugCatalogService 
{
    /**
     * 查询药物记录
     * 
     * @param drugId 药物记录主键
     * @return 药物记录
     */
    public DrugCatalog selectDrugCatalogByDrugId(Long drugId);

    /**
     * 查询药物记录列表
     * 
     * @param drugCatalog 药物记录
     * @return 药物记录集合
     */
    public List<DrugCatalog> selectDrugCatalogList(DrugCatalog drugCatalog);

    /**
     * 新增药物记录
     * 
     * @param drugCatalog 药物记录
     * @return 结果
     */
    public int insertDrugCatalog(DrugCatalog drugCatalog);

    /**
     * 修改药物记录
     * 
     * @param drugCatalog 药物记录
     * @return 结果
     */
    public int updateDrugCatalog(DrugCatalog drugCatalog);

    /**
     * 批量删除药物记录
     * 
     * @param drugIds 需要删除的药物记录主键集合
     * @return 结果
     */
    public int deleteDrugCatalogByDrugIds(Long[] drugIds);

    /**
     * 删除药物记录信息
     * 
     * @param drugId 药物记录主键
     * @return 结果
     */
    public int deleteDrugCatalogByDrugId(Long drugId);
}
