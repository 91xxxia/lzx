package com.ruoyi.BiobankSys.mapper;

import java.util.List;
import com.ruoyi.BiobankSys.domain.Biospecimens;

/**
 * 样本采集主表Mapper接口
 * 
 * @author ruoyi
 * @date 2025-06-29
 */
public interface BiospecimensMapper 
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
     * 删除样本采集主表
     * 
     * @param specimenId 样本采集主表主键
     * @return 结果
     */
    public int deleteBiospecimensBySpecimenId(String specimenId);

    /**
     * 批量删除样本采集主表
     * 
     * @param specimenIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteBiospecimensBySpecimenIds(String[] specimenIds);
}
