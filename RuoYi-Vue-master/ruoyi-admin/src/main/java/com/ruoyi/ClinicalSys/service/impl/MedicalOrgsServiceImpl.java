package com.ruoyi.ClinicalSys.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.ClinicalSys.mapper.MedicalOrgsMapper;
import com.ruoyi.ClinicalSys.domain.MedicalOrgs;
import com.ruoyi.ClinicalSys.service.IMedicalOrgsService;

/**
 * 医疗服务机构标识信息Service业务层处理
 * 
 * @author ruoyi
 * @date 2025-06-27
 */
@Service
public class MedicalOrgsServiceImpl implements IMedicalOrgsService 
{
    @Autowired
    private MedicalOrgsMapper medicalOrgsMapper;

    /**
     * 查询医疗服务机构标识信息
     * 
     * @param orgId 医疗服务机构标识信息主键
     * @return 医疗服务机构标识信息
     */
    @Override
    public MedicalOrgs selectMedicalOrgsByOrgId(Long orgId)
    {
        return medicalOrgsMapper.selectMedicalOrgsByOrgId(orgId);
    }

    /**
     * 查询医疗服务机构标识信息列表
     * 
     * @param medicalOrgs 医疗服务机构标识信息
     * @return 医疗服务机构标识信息
     */
    @Override
    public List<MedicalOrgs> selectMedicalOrgsList(MedicalOrgs medicalOrgs)
    {
        return medicalOrgsMapper.selectMedicalOrgsList(medicalOrgs);
    }

    /**
     * 新增医疗服务机构标识信息
     * 
     * @param medicalOrgs 医疗服务机构标识信息
     * @return 结果
     */
    @Override
    public int insertMedicalOrgs(MedicalOrgs medicalOrgs)
    {
        return medicalOrgsMapper.insertMedicalOrgs(medicalOrgs);
    }

    /**
     * 修改医疗服务机构标识信息
     * 
     * @param medicalOrgs 医疗服务机构标识信息
     * @return 结果
     */
    @Override
    public int updateMedicalOrgs(MedicalOrgs medicalOrgs)
    {
        return medicalOrgsMapper.updateMedicalOrgs(medicalOrgs);
    }

    /**
     * 批量删除医疗服务机构标识信息
     * 
     * @param orgIds 需要删除的医疗服务机构标识信息主键
     * @return 结果
     */
    @Override
    public int deleteMedicalOrgsByOrgIds(Long[] orgIds)
    {
        return medicalOrgsMapper.deleteMedicalOrgsByOrgIds(orgIds);
    }

    /**
     * 删除医疗服务机构标识信息信息
     * 
     * @param orgId 医疗服务机构标识信息主键
     * @return 结果
     */
    @Override
    public int deleteMedicalOrgsByOrgId(Long orgId)
    {
        return medicalOrgsMapper.deleteMedicalOrgsByOrgId(orgId);
    }
}
