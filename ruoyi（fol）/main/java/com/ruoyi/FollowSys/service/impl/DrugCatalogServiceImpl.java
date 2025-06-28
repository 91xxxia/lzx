package com.ruoyi.FollowSys.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.FollowSys.mapper.DrugCatalogMapper;
import com.ruoyi.FollowSys.domain.DrugCatalog;
import com.ruoyi.FollowSys.service.IDrugCatalogService;

/**
 * 药物记录Service业务层处理
 * 
 * @author ruoyi
 * @date 2025-06-28
 */
@Service
public class DrugCatalogServiceImpl implements IDrugCatalogService 
{
    @Autowired
    private DrugCatalogMapper drugCatalogMapper;

    /**
     * 查询药物记录
     * 
     * @param drugId 药物记录主键
     * @return 药物记录
     */
    @Override
    public DrugCatalog selectDrugCatalogByDrugId(Long drugId)
    {
        return drugCatalogMapper.selectDrugCatalogByDrugId(drugId);
    }

    /**
     * 查询药物记录列表
     * 
     * @param drugCatalog 药物记录
     * @return 药物记录
     */
    @Override
    public List<DrugCatalog> selectDrugCatalogList(DrugCatalog drugCatalog)
    {
        return drugCatalogMapper.selectDrugCatalogList(drugCatalog);
    }

    /**
     * 新增药物记录
     * 
     * @param drugCatalog 药物记录
     * @return 结果
     */
    @Override
    public int insertDrugCatalog(DrugCatalog drugCatalog)
    {
        return drugCatalogMapper.insertDrugCatalog(drugCatalog);
    }

    /**
     * 修改药物记录
     * 
     * @param drugCatalog 药物记录
     * @return 结果
     */
    @Override
    public int updateDrugCatalog(DrugCatalog drugCatalog)
    {
        return drugCatalogMapper.updateDrugCatalog(drugCatalog);
    }

    /**
     * 批量删除药物记录
     * 
     * @param drugIds 需要删除的药物记录主键
     * @return 结果
     */
    @Override
    public int deleteDrugCatalogByDrugIds(Long[] drugIds)
    {
        return drugCatalogMapper.deleteDrugCatalogByDrugIds(drugIds);
    }

    /**
     * 删除药物记录信息
     * 
     * @param drugId 药物记录主键
     * @return 结果
     */
    @Override
    public int deleteDrugCatalogByDrugId(Long drugId)
    {
        return drugCatalogMapper.deleteDrugCatalogByDrugId(drugId);
    }
}
