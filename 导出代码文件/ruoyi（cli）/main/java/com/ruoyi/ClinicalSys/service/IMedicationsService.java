package com.ruoyi.ClinicalSys.service;

import java.util.List;
import com.ruoyi.ClinicalSys.domain.Medications;

/**
 * 用药Service接口
 * 
 * @author ruoyi
 * @date 2025-06-27
 */
public interface IMedicationsService 
{
    /**
     * 查询用药
     * 
     * @param medId 用药主键
     * @return 用药
     */
    public Medications selectMedicationsByMedId(Long medId);

    /**
     * 查询用药列表
     * 
     * @param medications 用药
     * @return 用药集合
     */
    public List<Medications> selectMedicationsList(Medications medications);

    /**
     * 新增用药
     * 
     * @param medications 用药
     * @return 结果
     */
    public int insertMedications(Medications medications);

    /**
     * 修改用药
     * 
     * @param medications 用药
     * @return 结果
     */
    public int updateMedications(Medications medications);

    /**
     * 批量删除用药
     * 
     * @param medIds 需要删除的用药主键集合
     * @return 结果
     */
    public int deleteMedicationsByMedIds(Long[] medIds);

    /**
     * 删除用药信息
     * 
     * @param medId 用药主键
     * @return 结果
     */
    public int deleteMedicationsByMedId(Long medId);
}
