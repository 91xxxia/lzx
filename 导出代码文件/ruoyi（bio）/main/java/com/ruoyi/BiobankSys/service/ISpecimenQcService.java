package com.ruoyi.BiobankSys.service;

import java.util.List;
import com.ruoyi.BiobankSys.domain.SpecimenQc;

/**
 * 样本质量控制Service接口
 * 
 * @author ruoyi
 * @date 2025-06-29
 */
public interface ISpecimenQcService 
{
    /**
     * 查询样本质量控制
     * 
     * @param qcId 样本质量控制主键
     * @return 样本质量控制
     */
    public SpecimenQc selectSpecimenQcByQcId(Long qcId);

    /**
     * 查询样本质量控制列表
     * 
     * @param specimenQc 样本质量控制
     * @return 样本质量控制集合
     */
    public List<SpecimenQc> selectSpecimenQcList(SpecimenQc specimenQc);

    /**
     * 新增样本质量控制
     * 
     * @param specimenQc 样本质量控制
     * @return 结果
     */
    public int insertSpecimenQc(SpecimenQc specimenQc);

    /**
     * 修改样本质量控制
     * 
     * @param specimenQc 样本质量控制
     * @return 结果
     */
    public int updateSpecimenQc(SpecimenQc specimenQc);

    /**
     * 批量删除样本质量控制
     * 
     * @param qcIds 需要删除的样本质量控制主键集合
     * @return 结果
     */
    public int deleteSpecimenQcByQcIds(Long[] qcIds);

    /**
     * 删除样本质量控制信息
     * 
     * @param qcId 样本质量控制主键
     * @return 结果
     */
    public int deleteSpecimenQcByQcId(Long qcId);
}
