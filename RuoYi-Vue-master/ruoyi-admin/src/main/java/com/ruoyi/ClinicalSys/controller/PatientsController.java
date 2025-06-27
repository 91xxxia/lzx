package com.ruoyi.ClinicalSys.controller;

import java.util.List;
import javax.servlet.http.HttpServletResponse;

import com.ruoyi.common.exception.ServiceException;
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
import com.ruoyi.ClinicalSys.domain.Patients;
import com.ruoyi.ClinicalSys.service.IPatientsService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 患者基本信息Controller
 *
 * @author ruoyi
 * @date 2025-06-27
 */
@RestController
@RequestMapping("/ClinicalSys/patients")
public class PatientsController extends BaseController
{
    @Autowired
    private IPatientsService patientsService;

    /**
     * 查询患者基本信息列表
     */
    @PreAuthorize("@ss.hasPermi('ClinicalSys:patients:list')")
    @GetMapping("/list")
    public TableDataInfo list(Patients patients)
    {
        startPage();
        List<Patients> list = patientsService.selectPatientsList(patients);
        return getDataTable(list);
    }

    /**
     * 导出患者基本信息列表
     */
    @PreAuthorize("@ss.hasPermi('ClinicalSys:patients:export')")
    @Log(title = "患者基本信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Patients patients)
    {
        List<Patients> list = patientsService.selectPatientsList(patients);
        ExcelUtil<Patients> util = new ExcelUtil<Patients>(Patients.class);
        util.exportExcel(response, list, "患者基本信息数据");
    }

    /**
     * 获取患者基本信息详细信息
     */
    @PreAuthorize("@ss.hasPermi('ClinicalSys:patients:query')")
    @GetMapping(value = "/{patientId}")
    public AjaxResult getInfo(@PathVariable("patientId") String patientId)
    {
        return success(patientsService.selectPatientsByPatientId(patientId));
    }

    /**
     * 新增患者基本信息
     */
    @PreAuthorize("@ss.hasPermi('ClinicalSys:patients:add')")
    @Log(title = "患者基本信息", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Patients patients) {
        try {
            return toAjax(patientsService.insertPatients(patients));
        } catch (ServiceException e) {
            return AjaxResult.error(e.getMessage());
        }
    }

    /**
     * 修改患者基本信息
     */
    @PreAuthorize("@ss.hasPermi('ClinicalSys:patients:edit')")
    @Log(title = "患者基本信息", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Patients patients) {
        try {
            return toAjax(patientsService.updatePatients(patients));
        } catch (ServiceException e) {
            return AjaxResult.error(e.getMessage());
        }
    }

    /**
     * 删除患者基本信息
     */
    @PreAuthorize("@ss.hasPermi('ClinicalSys:patients:remove')")
    @Log(title = "患者基本信息", businessType = BusinessType.DELETE)
    @DeleteMapping("/{patientIds}")
    public AjaxResult remove(@PathVariable String[] patientIds)
    {
        return toAjax(patientsService.deletePatientsByPatientIds(patientIds));
    }
}
