package com.ruoyi.BiobankSys.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.BiobankSys.mapper.BiospecimensMapper;
import com.ruoyi.BiobankSys.domain.Biospecimens;
import com.ruoyi.BiobankSys.service.IBiospecimensService;

/**
 * 样本采集主表Service业务层处理
 * 
 * @author ruoyi
 * @date 2025-06-29
 */
@Service
public class BiospecimensServiceImpl implements IBiospecimensService 
{
    @Autowired
    private BiospecimensMapper biospecimensMapper;

    /**
     * 查询样本采集主表
     * 
     * @param specimenId 样本采集主表主键
     * @return 样本采集主表
     */
    @Override
    public Biospecimens selectBiospecimensBySpecimenId(String specimenId)
    {
        return biospecimensMapper.selectBiospecimensBySpecimenId(specimenId);
    }

    /**
     * 查询样本采集主表列表
     * 
     * @param biospecimens 样本采集主表
     * @return 样本采集主表
     */
    @Override
    public List<Biospecimens> selectBiospecimensList(Biospecimens biospecimens)
    {
        return biospecimensMapper.selectBiospecimensList(biospecimens);
    }

    /**
     * 新增样本采集主表
     * 
     * @param biospecimens 样本采集主表
     * @return 结果
     */
    @Override
    public int insertBiospecimens(Biospecimens biospecimens)
    {
        return biospecimensMapper.insertBiospecimens(biospecimens);
    }

    /**
     * 修改样本采集主表
     * 
     * @param biospecimens 样本采集主表
     * @return 结果
     */
    @Override
    public int updateBiospecimens(Biospecimens biospecimens)
    {
        return biospecimensMapper.updateBiospecimens(biospecimens);
    }

    /**
     * 批量删除样本采集主表
     * 
     * @param specimenIds 需要删除的样本采集主表主键
     * @return 结果
     */
    @Override
    public int deleteBiospecimensBySpecimenIds(String[] specimenIds)
    {
        return biospecimensMapper.deleteBiospecimensBySpecimenIds(specimenIds);
    }

    /**
     * 删除样本采集主表信息
     * 
     * @param specimenId 样本采集主表主键
     * @return 结果
     */
    @Override
    public int deleteBiospecimensBySpecimenId(String specimenId)
    {
        return biospecimensMapper.deleteBiospecimensBySpecimenId(specimenId);
    }
}
