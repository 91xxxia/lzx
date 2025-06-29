package com.ruoyi.BiobankSys.mapper;

import java.util.List;
import com.ruoyi.BiobankSys.domain.SpecimenStorage;

/**
 * 样本存储Mapper接口
 * 
 * @author ruoyi
 * @date 2025-06-29
 */
public interface SpecimenStorageMapper 
{
    /**
     * 查询样本存储
     * 
     * @param storageId 样本存储主键
     * @return 样本存储
     */
    public SpecimenStorage selectSpecimenStorageByStorageId(Long storageId);

    /**
     * 查询样本存储列表
     * 
     * @param specimenStorage 样本存储
     * @return 样本存储集合
     */
    public List<SpecimenStorage> selectSpecimenStorageList(SpecimenStorage specimenStorage);

    /**
     * 新增样本存储
     * 
     * @param specimenStorage 样本存储
     * @return 结果
     */
    public int insertSpecimenStorage(SpecimenStorage specimenStorage);

    /**
     * 修改样本存储
     * 
     * @param specimenStorage 样本存储
     * @return 结果
     */
    public int updateSpecimenStorage(SpecimenStorage specimenStorage);

    /**
     * 删除样本存储
     * 
     * @param storageId 样本存储主键
     * @return 结果
     */
    public int deleteSpecimenStorageByStorageId(Long storageId);

    /**
     * 批量删除样本存储
     * 
     * @param storageIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteSpecimenStorageByStorageIds(Long[] storageIds);
}
