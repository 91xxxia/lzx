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
import com.ruoyi.ClinicalSys.domain.Diagnoses;
import com.ruoyi.ClinicalSys.service.IDiagnosesService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 疾病诊断Controller
 * 
 * @author ruoyi
 * @date 2025-06-27
 */
@RestController
@RequestMapping("/ClinicalSys/diagnoses")
public class DiagnosesController extends BaseController
{
    @Autowired
    private IDiagnosesService diagnosesService;

    /**
     * 查询疾病诊断列表
     */
    @PreAuthorize("@ss.hasPermi('ClinicalSys:diagnoses:list')")
    @GetMapping("/list")
    public TableDataInfo list(Diagnoses diagnoses)
    {
        startPage();
        List<Diagnoses> list = diagnosesService.selectDiagnosesList(diagnoses);
        return getDataTable(list);
    }

    /**
     * 导出疾病诊断列表
     */
    @PreAuthorize("@ss.hasPermi('ClinicalSys:diagnoses:export')")
    @Log(title = "疾病诊断", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Diagnoses diagnoses)
    {
        List<Diagnoses> list = diagnosesService.selectDiagnosesList(diagnoses);
        ExcelUtil<Diagnoses> util = new ExcelUtil<Diagnoses>(Diagnoses.class);
        util.exportExcel(response, list, "疾病诊断数据");
    }

    /**
     * 获取疾病诊断详细信息
     */
    @PreAuthorize("@ss.hasPermi('ClinicalSys:diagnoses:query')")
    @GetMapping(value = "/{diagnosisId}")
    public AjaxResult getInfo(@PathVariable("diagnosisId") Long diagnosisId)
    {
        return success(diagnosesService.selectDiagnosesByDiagnosisId(diagnosisId));
    }

    /**
     * 新增疾病诊断
     */
    @PreAuthorize("@ss.hasPermi('ClinicalSys:diagnoses:add')")
    @Log(title = "疾病诊断", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Diagnoses diagnoses)
    {
        return toAjax(diagnosesService.insertDiagnoses(diagnoses));
    }

    /**
     * 修改疾病诊断
     */
    @PreAuthorize("@ss.hasPermi('ClinicalSys:diagnoses:edit')")
    @Log(title = "疾病诊断", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Diagnoses diagnoses)
    {
        return toAjax(diagnosesService.updateDiagnoses(diagnoses));
    }

    /**
     * 删除疾病诊断
     */
    @PreAuthorize("@ss.hasPermi('ClinicalSys:diagnoses:remove')")
    @Log(title = "疾病诊断", businessType = BusinessType.DELETE)
	@DeleteMapping("/{diagnosisIds}")
    public AjaxResult remove(@PathVariable Long[] diagnosisIds)
    {
        return toAjax(diagnosesService.deleteDiagnosesByDiagnosisIds(diagnosisIds));
    }
}
