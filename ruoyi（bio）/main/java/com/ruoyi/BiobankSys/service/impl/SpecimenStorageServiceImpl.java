package com.ruoyi.BiobankSys.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.BiobankSys.mapper.SpecimenStorageMapper;
import com.ruoyi.BiobankSys.domain.SpecimenStorage;
import com.ruoyi.BiobankSys.service.ISpecimenStorageService;

/**
 * 样本存储Service业务层处理
 * 
 * @author ruoyi
 * @date 2025-06-29
 */
@Service
public class SpecimenStorageServiceImpl implements ISpecimenStorageService 
{
    @Autowired
    private SpecimenStorageMapper specimenStorageMapper;

    /**
     * 查询样本存储
     * 
     * @param storageId 样本存储主键
     * @return 样本存储
     */
    @Override
    public SpecimenStorage selectSpecimenStorageByStorageId(Long storageId)
    {
        return specimenStorageMapper.selectSpecimenStorageByStorageId(storageId);
    }

    /**
     * 查询样本存储列表
     * 
     * @param specimenStorage 样本存储
     * @return 样本存储
     */
    @Override
    public List<SpecimenStorage> selectSpecimenStorageList(SpecimenStorage specimenStorage)
    {
        return specimenStorageMapper.selectSpecimenStorageList(specimenStorage);
    }

    /**
     * 新增样本存储
     * 
     * @param specimenStorage 样本存储
     * @return 结果
     */
    @Override
    public int insertSpecimenStorage(SpecimenStorage specimenStorage)
    {
        return specimenStorageMapper.insertSpecimenStorage(specimenStorage);
    }

    /**
     * 修改样本存储
     * 
     * @param specimenStorage 样本存储
     * @return 结果
     */
    @Override
    public int updateSpecimenStorage(SpecimenStorage specimenStorage)
    {
        return specimenStorageMapper.updateSpecimenStorage(specimenStorage);
    }

    /**
     * 批量删除样本存储
     * 
     * @param storageIds 需要删除的样本存储主键
     * @return 结果
     */
    @Override
    public int deleteSpecimenStorageByStorageIds(Long[] storageIds)
    {
        return specimenStorageMapper.deleteSpecimenStorageByStorageIds(storageIds);
    }

    /**
     * 删除样本存储信息
     * 
     * @param storageId 样本存储主键
     * @return 结果
     */
    @Override
    public int deleteSpecimenStorageByStorageId(Long storageId)
    {
        return specimenStorageMapper.deleteSpecimenStorageByStorageId(storageId);
    }
}
