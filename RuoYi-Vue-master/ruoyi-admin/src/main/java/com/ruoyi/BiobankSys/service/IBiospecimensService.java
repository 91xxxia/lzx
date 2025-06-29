package com.ruoyi.BiobankSys.service;

import java.util.List;
import com.ruoyi.BiobankSys.domain.Biospecimens;

/**
 * 样本采集主表Service接口
 * 
 * @author ruoyi
 * @date 2025-06-29
 */
public interface IBiospecimensService 
{
    /**
     * 查询样本采集主表
     * 
     * @param specimenId 样本采集主表主键
     * @return 样本采集主表
     */
    public Biospecimens selectBiospecimensBySpecimenId(String specimenId);

    /**
     * 查询样本采集主表列表
     * 
     * @param biospecimens 样本采集主表
     * @return 样本采集主表集合
     */
    public List<Biospecimens> selectBiospecimensList(Biospecimens biospecimens);

    /**
     * 新增样本采集主表
     * 
     * @param biospecimens 样本采集主表
     * @return 结果
     */
    public int insertBiospecimens(Biospecimens biospecimens);

    /**
     * 修改样本采集主表
     * 
     * @param biospecimens 样本采集主表
     * @return 结果
     */
    public int updateBiospecimens(Biospecimens biospecimens);

    /**
     * 批量删除样本采集主表
     * 
     * @param specimenIds 需要删除的样本采集主表主键集合
     * @return 结果
     */
    public int deleteBiospecimensBySpecimenIds(String[] specimenIds);

    /**
     * 删除样本采集主表信息
     * 
     * @param specimenId 样本采集主表主键
     * @return 结果
     */
    public int deleteBiospecimensBySpecimenId(String specimenId);
}
