package com.ruoyi.ClinicalSys.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.ClinicalSys.mapper.LungTestsMapper;
import com.ruoyi.ClinicalSys.domain.LungTests;
import com.ruoyi.ClinicalSys.service.ILungTestsService;

/**
 * 肺功能检查Service业务层处理
 * 
 * @author ruoyi
 * @date 2025-06-27
 */
@Service
public class LungTestsServiceImpl implements ILungTestsService 
{
    @Autowired
    private LungTestsMapper lungTestsMapper;

    /**
     * 查询肺功能检查
     * 
     * @param lungId 肺功能检查主键
     * @return 肺功能检查
     */
    @Override
    public LungTests selectLungTestsByLungId(Long lungId)
    {
        return lungTestsMapper.selectLungTestsByLungId(lungId);
    }

    /**
     * 查询肺功能检查列表
     * 
     * @param lungTests 肺功能检查
     * @return 肺功能检查
     */
    @Override
    public List<LungTests> selectLungTestsList(LungTests lungTests)
    {
        return lungTestsMapper.selectLungTestsList(lungTests);
    }

    /**
     * 新增肺功能检查
     * 
     * @param lungTests 肺功能检查
     * @return 结果
     */
    @Override
    public int insertLungTests(LungTests lungTests)
    {
        return lungTestsMapper.insertLungTests(lungTests);
    }

    /**
     * 修改肺功能检查
     * 
     * @param lungTests 肺功能检查
     * @return 结果
     */
    @Override
    public int updateLungTests(LungTests lungTests)
    {
        return lungTestsMapper.updateLungTests(lungTests);
    }

    /**
     * 批量删除肺功能检查
     * 
     * @param lungIds 需要删除的肺功能检查主键
     * @return 结果
     */
    @Override
    public int deleteLungTestsByLungIds(Long[] lungIds)
    {
        return lungTestsMapper.deleteLungTestsByLungIds(lungIds);
    }

    /**
     * 删除肺功能检查信息
     * 
     * @param lungId 肺功能检查主键
     * @return 结果
     */
    @Override
    public int deleteLungTestsByLungId(Long lungId)
    {
        return lungTestsMapper.deleteLungTestsByLungId(lungId);
    }
}
