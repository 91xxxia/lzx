package com.ruoyi.BiobankSys.mapper;

import java.util.List;
import com.ruoyi.BiobankSys.domain.SpecimenClinicalLink;

/**
 * 样本-临床关联Mapper接口
 * 
 * @author ruoyi
 * @date 2025-06-27
 */
public interface SpecimenClinicalLinkMapper 
{
    /**
     * 查询样本-临床关联
     * 
     * @param linkId 样本-临床关联主键
     * @return 样本-临床关联
     */
    public SpecimenClinicalLink selectSpecimenClinicalLinkByLinkId(Long linkId);

    /**
     * 查询样本-临床关联列表
     * 
     * @param specimenClinicalLink 样本-临床关联
     * @return 样本-临床关联集合
     */
    public List<SpecimenClinicalLink> selectSpecimenClinicalLinkList(SpecimenClinicalLink specimenClinicalLink);

    /**
     * 新增样本-临床关联
     * 
     * @param specimenClinicalLink 样本-临床关联
     * @return 结果
     */
    public int insertSpecimenClinicalLink(SpecimenClinicalLink specimenClinicalLink);

    /**
     * 修改样本-临床关联
     * 
     * @param specimenClinicalLink 样本-临床关联
     * @return 结果
     */
    public int updateSpecimenClinicalLink(SpecimenClinicalLink specimenClinicalLink);

    /**
     * 删除样本-临床关联
     * 
     * @param linkId 样本-临床关联主键
     * @return 结果
     */
    public int deleteSpecimenClinicalLinkByLinkId(Long linkId);

    /**
     * 批量删除样本-临床关联
     * 
     * @param linkIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteSpecimenClinicalLinkByLinkIds(Long[] linkIds);
}
