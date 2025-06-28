package com.ruoyi.BiobankSys.mapper;

import java.util.List;
import com.ruoyi.BiobankSys.domain.Biospecimens;

/**
 * 生物样本主表Mapper接口
 * 
 * @author ruoyi
 * @date 2025-06-27
 */
public interface BiospecimensMapper 
{
    /**
     * 查询生物样本主表
     * 
     * @param specimenId 生物样本主表主键
     * @return 生物样本主表
     */
    public Biospecimens selectBiospecimensBySpecimenId(String specimenId);

    /**
     * 查询生物样本主表列表
     * 
     * @param biospecimens 生物样本主表
     * @return 生物样本主表集合
     */
    public List<Biospecimens> selectBiospecimensList(Biospecimens biospecimens);

    /**
     * 新增生物样本主表
     * 
     * @param biospecimens 生物样本主表
     * @return 结果
     */
    public int insertBiospecimens(Biospecimens biospecimens);

    /**
     * 修改生物样本主表
     * 
     * @param biospecimens 生物样本主表
     * @return 结果
     */
    public int updateBiospecimens(Biospecimens biospecimens);

    /**
     * 删除生物样本主表
     * 
     * @param specimenId 生物样本主表主键
     * @return 结果
     */
    public int deleteBiospecimensBySpecimenId(String specimenId);

    /**
     * 批量删除生物样本主表
     * 
     * @param specimenIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteBiospecimensBySpecimenIds(String[] specimenIds);
}
