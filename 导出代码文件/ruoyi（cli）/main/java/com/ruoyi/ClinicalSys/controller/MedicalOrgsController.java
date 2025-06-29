package com.ruoyi.ClinicalSys.controller;

import java.util.List;
import javax.servlet.http.HttpServletResponse;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.ClinicalSys.domain.MedicalOrgs;
import com.ruoyi.ClinicalSys.service.IMedicalOrgsService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 医疗服务机构标识信息Controller
 * 
 * @author ruoyi
 * @date 2025-06-27
 */
@RestController
@RequestMapping("/ClinicalSys/orgs")
public class MedicalOrgsController extends BaseController
{
    @Autowired
    private IMedicalOrgsService medicalOrgsService;

    /**
     * 查询医疗服务机构标识信息列表
     */
    @PreAuthorize("@ss.hasPermi('ClinicalSys:orgs:list')")
    @GetMapping("/list")
    public TableDataInfo list(MedicalOrgs medicalOrgs)
    {
        startPage();
        List<MedicalOrgs> list = medicalOrgsService.selectMedicalOrgsList(medicalOrgs);
        return getDataTable(list);
    }

    /**
     * 导出医疗服务机构标识信息列表
     */
    @PreAuthorize("@ss.hasPermi('ClinicalSys:orgs:export')")
    @Log(title = "医疗服务机构标识信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, MedicalOrgs medicalOrgs)
    {
        List<MedicalOrgs> list = medicalOrgsService.selectMedicalOrgsList(medicalOrgs);
        ExcelUtil<MedicalOrgs> util = new ExcelUtil<MedicalOrgs>(MedicalOrgs.class);
        util.exportExcel(response, list, "医疗服务机构标识信息数据");
    }

    /**
     * 获取医疗服务机构标识信息详细信息
     */
    @PreAuthorize("@ss.hasPermi('ClinicalSys:orgs:query')")
    @GetMapping(value = "/{orgId}")
    public AjaxResult getInfo(@PathVariable("orgId") Long orgId)
    {
        return success(medicalOrgsService.selectMedicalOrgsByOrgId(orgId));
    }

    /**
     * 新增医疗服务机构标识信息
     */
    @PreAuthorize("@ss.hasPermi('ClinicalSys:orgs:add')")
    @Log(title = "医疗服务机构标识信息", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody MedicalOrgs medicalOrgs)
    {
        return toAjax(medicalOrgsService.insertMedicalOrgs(medicalOrgs));
    }

    /**
     * 修改医疗服务机构标识信息
     */
    @PreAuthorize("@ss.hasPermi('ClinicalSys:orgs:edit')")
    @Log(title = "医疗服务机构标识信息", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody MedicalOrgs medicalOrgs)
    {
        return toAjax(medicalOrgsService.updateMedicalOrgs(medicalOrgs));
    }

    /**
     * 删除医疗服务机构标识信息
     */
    @PreAuthorize("@ss.hasPermi('ClinicalSys:orgs:remove')")
    @Log(title = "医疗服务机构标识信息", businessType = BusinessType.DELETE)
	@DeleteMapping("/{orgIds}")
    public AjaxResult remove(@PathVariable Long[] orgIds)
    {
        return toAjax(medicalOrgsService.deleteMedicalOrgsByOrgIds(orgIds));
    }
}
