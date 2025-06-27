package com.ruoyi.ClinicalSys.mapper;

import java.util.List;
import com.ruoyi.ClinicalSys.domain.MedicationsHistory;

/**
 * 既往用药史Mapper接口
 * 
 * @author ruoyi
 * @date 2025-06-27
 */
public interface MedicationsHistoryMapper 
{
    /**
     * 查询既往用药史
     * 
     * @param medHisId 既往用药史主键
     * @return 既往用药史
     */
    public MedicationsHistory selectMedicationsHistoryByMedHisId(Long medHisId);

    /**
     * 查询既往用药史列表
     * 
     * @param medicationsHistory 既往用药史
     * @return 既往用药史集合
     */
    public List<MedicationsHistory> selectMedicationsHistoryList(MedicationsHistory medicationsHistory);

    /**
     * 新增既往用药史
     * 
     * @param medicationsHistory 既往用药史
     * @return 结果
     */
    public int insertMedicationsHistory(MedicationsHistory medicationsHistory);

    /**
     * 修改既往用药史
     * 
     * @param medicationsHistory 既往用药史
     * @return 结果
     */
    public int updateMedicationsHistory(MedicationsHistory medicationsHistory);

    /**
     * 删除既往用药史
     * 
     * @param medHisId 既往用药史主键
     * @return 结果
     */
    public int deleteMedicationsHistoryByMedHisId(Long medHisId);

    /**
     * 批量删除既往用药史
     * 
     * @param medHisIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteMedicationsHistoryByMedHisIds(Long[] medHisIds);
}
