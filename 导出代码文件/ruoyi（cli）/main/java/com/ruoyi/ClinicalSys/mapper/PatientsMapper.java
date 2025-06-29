package com.ruoyi.ClinicalSys.mapper;

import java.util.List;
import com.ruoyi.ClinicalSys.domain.Patients;

/**
 * 患者基本信息Mapper接口
 * 
 * @author ruoyi
 * @date 2025-06-27
 */
public interface PatientsMapper 
{
    /**
     * 查询患者基本信息
     * 
     * @param patientId 患者基本信息主键
     * @return 患者基本信息
     */
    public Patients selectPatientsByPatientId(String patientId);

    /**
     * 查询患者基本信息列表
     * 
     * @param patients 患者基本信息
     * @return 患者基本信息集合
     */
    public List<Patients> selectPatientsList(Patients patients);

    /**
     * 新增患者基本信息
     * 
     * @param patients 患者基本信息
     * @return 结果
     */
    public int insertPatients(Patients patients);

    /**
     * 修改患者基本信息
     * 
     * @param patients 患者基本信息
     * @return 结果
     */
    public int updatePatients(Patients patients);

    /**
     * 删除患者基本信息
     * 
     * @param patientId 患者基本信息主键
     * @return 结果
     */
    public int deletePatientsByPatientId(String patientId);

    /**
     * 批量删除患者基本信息
     * 
     * @param patientIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deletePatientsByPatientIds(String[] patientIds);
}
