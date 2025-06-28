package com.ruoyi.BiobankSys.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.BiobankSys.mapper.SpecimenClinicalLinkMapper;
import com.ruoyi.BiobankSys.domain.SpecimenClinicalLink;
import com.ruoyi.BiobankSys.service.ISpecimenClinicalLinkService;

/**
 * 样本-临床关联Service业务层处理
 * 
 * @author ruoyi
 * @date 2025-06-27
 */
@Service
public class SpecimenClinicalLinkServiceImpl implements ISpecimenClinicalLinkService 
{
    @Autowired
    private SpecimenClinicalLinkMapper specimenClinicalLinkMapper;

    /**
     * 查询样本-临床关联
     * 
     * @param linkId 样本-临床关联主键
     * @return 样本-临床关联
     */
    @Override
    public SpecimenClinicalLink selectSpecimenClinicalLinkByLinkId(Long linkId)
    {
        return specimenClinicalLinkMapper.selectSpecimenClinicalLinkByLinkId(linkId);
    }

    /**
     * 查询样本-临床关联列表
     * 
     * @param specimenClinicalLink 样本-临床关联
     * @return 样本-临床关联
     */
    @Override
    public List<SpecimenClinicalLink> selectSpecimenClinicalLinkList(SpecimenClinicalLink specimenClinicalLink)
    {
        return specimenClinicalLinkMapper.selectSpecimenClinicalLinkList(specimenClinicalLink);
    }

    /**
     * 新增样本-临床关联
     * 
     * @param specimenClinicalLink 样本-临床关联
     * @return 结果
     */
    @Override
    public int insertSpecimenClinicalLink(SpecimenClinicalLink specimenClinicalLink)
    {
        return specimenClinicalLinkMapper.insertSpecimenClinicalLink(specimenClinicalLink);
    }

    /**
     * 修改样本-临床关联
     * 
     * @param specimenClinicalLink 样本-临床关联
     * @return 结果
     */
    @Override
    public int updateSpecimenClinicalLink(SpecimenClinicalLink specimenClinicalLink)
    {
        return specimenClinicalLinkMapper.updateSpecimenClinicalLink(specimenClinicalLink);
    }

    /**
     * 批量删除样本-临床关联
     * 
     * @param linkIds 需要删除的样本-临床关联主键
     * @return 结果
     */
    @Override
    public int deleteSpecimenClinicalLinkByLinkIds(Long[] linkIds)
    {
        return specimenClinicalLinkMapper.deleteSpecimenClinicalLinkByLinkIds(linkIds);
    }

    /**
     * 删除样本-临床关联信息
     * 
     * @param linkId 样本-临床关联主键
     * @return 结果
     */
    @Override
    public int deleteSpecimenClinicalLinkByLinkId(Long linkId)
    {
        return specimenClinicalLinkMapper.deleteSpecimenClinicalLinkByLinkId(linkId);
    }
}
