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
import com.ruoyi.ClinicalSys.domain.Symptoms;
import com.ruoyi.ClinicalSys.service.ISymptomsService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 症状及体征Controller
 * 
 * @author ruoyi
 * @date 2025-06-27
 */
@RestController
@RequestMapping("/ClinicalSys/symptoms")
public class SymptomsController extends BaseController
{
    @Autowired
    private ISymptomsService symptomsService;

    /**
     * 查询症状及体征列表
     */
    @PreAuthorize("@ss.hasPermi('ClinicalSys:symptoms:list')")
    @GetMapping("/list")
    public TableDataInfo list(Symptoms symptoms)
    {
        startPage();
        List<Symptoms> list = symptomsService.selectSymptomsList(symptoms);
        return getDataTable(list);
    }

    /**
     * 导出症状及体征列表
     */
    @PreAuthorize("@ss.hasPermi('ClinicalSys:symptoms:export')")
    @Log(title = "症状及体征", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Symptoms symptoms)
    {
        List<Symptoms> list = symptomsService.selectSymptomsList(symptoms);
        ExcelUtil<Symptoms> util = new ExcelUtil<Symptoms>(Symptoms.class);
        util.exportExcel(response, list, "症状及体征数据");
    }

    /**
     * 获取症状及体征详细信息
     */
    @PreAuthorize("@ss.hasPermi('ClinicalSys:symptoms:query')")
    @GetMapping(value = "/{symptomId}")
    public AjaxResult getInfo(@PathVariable("symptomId") Long symptomId)
    {
        return success(symptomsService.selectSymptomsBySymptomId(symptomId));
    }

    /**
     * 新增症状及体征
     */
    @PreAuthorize("@ss.hasPermi('ClinicalSys:symptoms:add')")
    @Log(title = "症状及体征", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Symptoms symptoms)
    {
        return toAjax(symptomsService.insertSymptoms(symptoms));
    }

    /**
     * 修改症状及体征
     */
    @PreAuthorize("@ss.hasPermi('ClinicalSys:symptoms:edit')")
    @Log(title = "症状及体征", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Symptoms symptoms)
    {
        return toAjax(symptomsService.updateSymptoms(symptoms));
    }

    /**
     * 删除症状及体征
     */
    @PreAuthorize("@ss.hasPermi('ClinicalSys:symptoms:remove')")
    @Log(title = "症状及体征", businessType = BusinessType.DELETE)
	@DeleteMapping("/{symptomIds}")
    public AjaxResult remove(@PathVariable Long[] symptomIds)
    {
        return toAjax(symptomsService.deleteSymptomsBySymptomIds(symptomIds));
    }
}
