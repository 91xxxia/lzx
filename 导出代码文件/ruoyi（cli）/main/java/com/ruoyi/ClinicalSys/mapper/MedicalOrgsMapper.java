package com.ruoyi.ClinicalSys.mapper;

import java.util.List;
import com.ruoyi.ClinicalSys.domain.MedicalOrgs;

/**
 * 医疗服务机构标识信息Mapper接口
 * 
 * @author ruoyi
 * @date 2025-06-27
 */
public interface MedicalOrgsMapper 
{
    /**
     * 查询医疗服务机构标识信息
     * 
     * @param orgId 医疗服务机构标识信息主键
     * @return 医疗服务机构标识信息
     */
    public MedicalOrgs selectMedicalOrgsByOrgId(Long orgId);

    /**
     * 查询医疗服务机构标识信息列表
     * 
     * @param medicalOrgs 医疗服务机构标识信息
     * @return 医疗服务机构标识信息集合
     */
    public List<MedicalOrgs> selectMedicalOrgsList(MedicalOrgs medicalOrgs);

    /**
     * 新增医疗服务机构标识信息
     * 
     * @param medicalOrgs 医疗服务机构标识信息
     * @return 结果
     */
    public int insertMedicalOrgs(MedicalOrgs medicalOrgs);

    /**
     * 修改医疗服务机构标识信息
     * 
     * @param medicalOrgs 医疗服务机构标识信息
     * @return 结果
     */
    public int updateMedicalOrgs(MedicalOrgs medicalOrgs);

    /**
     * 删除医疗服务机构标识信息
     * 
     * @param orgId 医疗服务机构标识信息主键
     * @return 结果
     */
    public int deleteMedicalOrgsByOrgId(Long orgId);

    /**
     * 批量删除医疗服务机构标识信息
     * 
     * @param orgIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteMedicalOrgsByOrgIds(Long[] orgIds);
}
