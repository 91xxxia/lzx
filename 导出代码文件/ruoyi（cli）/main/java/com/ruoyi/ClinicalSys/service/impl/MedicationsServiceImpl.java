package com.ruoyi.ClinicalSys.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.ClinicalSys.mapper.MedicationsMapper;
import com.ruoyi.ClinicalSys.domain.Medications;
import com.ruoyi.ClinicalSys.service.IMedicationsService;

/**
 * 用药Service业务层处理
 * 
 * @author ruoyi
 * @date 2025-06-27
 */
@Service
public class MedicationsServiceImpl implements IMedicationsService 
{
    @Autowired
    private MedicationsMapper medicationsMapper;

    /**
     * 查询用药
     * 
     * @param medId 用药主键
     * @return 用药
     */
    @Override
    public Medications selectMedicationsByMedId(Long medId)
    {
        return medicationsMapper.selectMedicationsByMedId(medId);
    }

    /**
     * 查询用药列表
     * 
     * @param medications 用药
     * @return 用药
     */
    @Override
    public List<Medications> selectMedicationsList(Medications medications)
    {
        return medicationsMapper.selectMedicationsList(medications);
    }

    /**
     * 新增用药
     * 
     * @param medications 用药
     * @return 结果
     */
    @Override
    public int insertMedications(Medications medications)
    {
        return medicationsMapper.insertMedications(medications);
    }

    /**
     * 修改用药
     * 
     * @param medications 用药
     * @return 结果
     */
    @Override
    public int updateMedications(Medications medications)
    {
        return medicationsMapper.updateMedications(medications);
    }

    /**
     * 批量删除用药
     * 
     * @param medIds 需要删除的用药主键
     * @return 结果
     */
    @Override
    public int deleteMedicationsByMedIds(Long[] medIds)
    {
        return medicationsMapper.deleteMedicationsByMedIds(medIds);
    }

    /**
     * 删除用药信息
     * 
     * @param medId 用药主键
     * @return 结果
     */
    @Override
    public int deleteMedicationsByMedId(Long medId)
    {
        return medicationsMapper.deleteMedicationsByMedId(medId);
    }
}
