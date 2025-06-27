package com.ruoyi.ClinicalSys.service.impl;

import java.util.List;

import com.ruoyi.common.exception.ServiceException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.ClinicalSys.mapper.PatientsMapper;
import com.ruoyi.ClinicalSys.domain.Patients;
import com.ruoyi.ClinicalSys.service.IPatientsService;

/**
 * 患者基本信息Service业务层处理
 *
 * @author ruoyi
 * @date 2025-06-27
 */
@Service
public class PatientsServiceImpl implements IPatientsService
{
    @Autowired
    private PatientsMapper patientsMapper;

    /**
     * 查询患者基本信息
     *
     * @param patientId 患者基本信息主键
     * @return 患者基本信息
     */
    @Override
    public Patients selectPatientsByPatientId(String patientId)
    {
        return patientsMapper.selectPatientsByPatientId(patientId);
    }

    /**
     * 查询患者基本信息列表
     *
     * @param patients 患者基本信息
     * @return 患者基本信息
     */
    @Override
    public List<Patients> selectPatientsList(Patients patients)
    {
        return patientsMapper.selectPatientsList(patients);
    }

    /**
     * 新增患者基本信息
     *
     * @param patients 患者基本信息
     * @return 结果
     */
    @Override
    public int insertPatients(Patients patients) {
        // 检查病人号是否已存在
        if (patientsMapper.selectPatientsByPatientId(patients.getPatientId()) != null) {
            throw new ServiceException("病人号 " + patients.getPatientId() + " 已存在");
        }
        return patientsMapper.insertPatients(patients);
    }

    /**
     * 修改患者基本信息
     *
     * @param patients 患者基本信息
     * @return 结果
     */
    @Override
    public int updatePatients(Patients patients) {
        // 确保病人存在
        Patients existing = patientsMapper.selectPatientsByPatientId(patients.getPatientId());
        if (existing == null) {
            throw new ServiceException("病人号 " + patients.getPatientId() + " 不存在");
        }
        return patientsMapper.updatePatients(patients);
    }

    /**
     * 批量删除患者基本信息
     *
     * @param patientIds 需要删除的患者基本信息主键
     * @return 结果
     */
    @Override
    public int deletePatientsByPatientIds(String[] patientIds)
    {
        return patientsMapper.deletePatientsByPatientIds(patientIds);
    }

    /**
     * 删除患者基本信息信息
     *
     * @param patientId 患者基本信息主键
     * @return 结果
     */
    @Override
    public int deletePatientsByPatientId(String patientId)
    {
        return patientsMapper.deletePatientsByPatientId(patientId);
    }
}
