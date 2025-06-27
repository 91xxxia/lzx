package com.ruoyi.ClinicalSys.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.ClinicalSys.mapper.MedicationsHistoryMapper;
import com.ruoyi.ClinicalSys.domain.MedicationsHistory;
import com.ruoyi.ClinicalSys.service.IMedicationsHistoryService;

/**
 * 既往用药史Service业务层处理
 * 
 * @author ruoyi
 * @date 2025-06-27
 */
@Service
public class MedicationsHistoryServiceImpl implements IMedicationsHistoryService 
{
    @Autowired
    private MedicationsHistoryMapper medicationsHistoryMapper;

    /**
     * 查询既往用药史
     * 
     * @param medHisId 既往用药史主键
     * @return 既往用药史
     */
    @Override
    public MedicationsHistory selectMedicationsHistoryByMedHisId(Long medHisId)
    {
        return medicationsHistoryMapper.selectMedicationsHistoryByMedHisId(medHisId);
    }

    /**
     * 查询既往用药史列表
     * 
     * @param medicationsHistory 既往用药史
     * @return 既往用药史
     */
    @Override
    public List<MedicationsHistory> selectMedicationsHistoryList(MedicationsHistory medicationsHistory)
    {
        return medicationsHistoryMapper.selectMedicationsHistoryList(medicationsHistory);
    }

    /**
     * 新增既往用药史
     * 
     * @param medicationsHistory 既往用药史
     * @return 结果
     */
    @Override
    public int insertMedicationsHistory(MedicationsHistory medicationsHistory)
    {
        return medicationsHistoryMapper.insertMedicationsHistory(medicationsHistory);
    }

    /**
     * 修改既往用药史
     * 
     * @param medicationsHistory 既往用药史
     * @return 结果
     */
    @Override
    public int updateMedicationsHistory(MedicationsHistory medicationsHistory)
    {
        return medicationsHistoryMapper.updateMedicationsHistory(medicationsHistory);
    }

    /**
     * 批量删除既往用药史
     * 
     * @param medHisIds 需要删除的既往用药史主键
     * @return 结果
     */
    @Override
    public int deleteMedicationsHistoryByMedHisIds(Long[] medHisIds)
    {
        return medicationsHistoryMapper.deleteMedicationsHistoryByMedHisIds(medHisIds);
    }

    /**
     * 删除既往用药史信息
     * 
     * @param medHisId 既往用药史主键
     * @return 结果
     */
    @Override
    public int deleteMedicationsHistoryByMedHisId(Long medHisId)
    {
        return medicationsHistoryMapper.deleteMedicationsHistoryByMedHisId(medHisId);
    }
}
