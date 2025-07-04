package com.ruoyi.BiobankSys.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.BiobankSys.mapper.SpecimenQcMapper;
import com.ruoyi.BiobankSys.domain.SpecimenQc;
import com.ruoyi.BiobankSys.service.ISpecimenQcService;

/**
 * 样本质量控制Service业务层处理
 * 
 * @author ruoyi
 * @date 2025-06-29
 */
@Service
public class SpecimenQcServiceImpl implements ISpecimenQcService 
{
    @Autowired
    private SpecimenQcMapper specimenQcMapper;

    /**
     * 查询样本质量控制
     * 
     * @param qcId 样本质量控制主键
     * @return 样本质量控制
     */
    @Override
    public SpecimenQc selectSpecimenQcByQcId(Long qcId)
    {
        return specimenQcMapper.selectSpecimenQcByQcId(qcId);
    }

    /**
     * 查询样本质量控制列表
     * 
     * @param specimenQc 样本质量控制
     * @return 样本质量控制
     */
    @Override
    public List<SpecimenQc> selectSpecimenQcList(SpecimenQc specimenQc)
    {
        return specimenQcMapper.selectSpecimenQcList(specimenQc);
    }

    /**
     * 新增样本质量控制
     * 
     * @param specimenQc 样本质量控制
     * @return 结果
     */
    @Override
    public int insertSpecimenQc(SpecimenQc specimenQc)
    {
        return specimenQcMapper.insertSpecimenQc(specimenQc);
    }

    /**
     * 修改样本质量控制
     * 
     * @param specimenQc 样本质量控制
     * @return 结果
     */
    @Override
    public int updateSpecimenQc(SpecimenQc specimenQc)
    {
        return specimenQcMapper.updateSpecimenQc(specimenQc);
    }

    /**
     * 批量删除样本质量控制
     * 
     * @param qcIds 需要删除的样本质量控制主键
     * @return 结果
     */
    @Override
    public int deleteSpecimenQcByQcIds(Long[] qcIds)
    {
        return specimenQcMapper.deleteSpecimenQcByQcIds(qcIds);
    }

    /**
     * 删除样本质量控制信息
     * 
     * @param qcId 样本质量控制主键
     * @return 结果
     */
    @Override
    public int deleteSpecimenQcByQcId(Long qcId)
    {
        return specimenQcMapper.deleteSpecimenQcByQcId(qcId);
    }
}
