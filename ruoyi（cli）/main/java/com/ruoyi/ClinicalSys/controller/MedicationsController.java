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
import com.ruoyi.ClinicalSys.domain.Medications;
import com.ruoyi.ClinicalSys.service.IMedicationsService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 用药Controller
 * 
 * @author ruoyi
 * @date 2025-06-27
 */
@RestController
@RequestMapping("/ClinicalSys/medications")
public class MedicationsController extends BaseController
{
    @Autowired
    private IMedicationsService medicationsService;

    /**
     * 查询用药列表
     */
    @PreAuthorize("@ss.hasPermi('ClinicalSys:medications:list')")
    @GetMapping("/list")
    public TableDataInfo list(Medications medications)
    {
        startPage();
        List<Medications> list = medicationsService.selectMedicationsList(medications);
        return getDataTable(list);
    }

    /**
     * 导出用药列表
     */
    @PreAuthorize("@ss.hasPermi('ClinicalSys:medications:export')")
    @Log(title = "用药", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Medications medications)
    {
        List<Medications> list = medicationsService.selectMedicationsList(medications);
        ExcelUtil<Medications> util = new ExcelUtil<Medications>(Medications.class);
        util.exportExcel(response, list, "用药数据");
    }

    /**
     * 获取用药详细信息
     */
    @PreAuthorize("@ss.hasPermi('ClinicalSys:medications:query')")
    @GetMapping(value = "/{medId}")
    public AjaxResult getInfo(@PathVariable("medId") Long medId)
    {
        return success(medicationsService.selectMedicationsByMedId(medId));
    }

    /**
     * 新增用药
     */
    @PreAuthorize("@ss.hasPermi('ClinicalSys:medications:add')")
    @Log(title = "用药", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Medications medications)
    {
        return toAjax(medicationsService.insertMedications(medications));
    }

    /**
     * 修改用药
     */
    @PreAuthorize("@ss.hasPermi('ClinicalSys:medications:edit')")
    @Log(title = "用药", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Medications medications)
    {
        return toAjax(medicationsService.updateMedications(medications));
    }

    /**
     * 删除用药
     */
    @PreAuthorize("@ss.hasPermi('ClinicalSys:medications:remove')")
    @Log(title = "用药", businessType = BusinessType.DELETE)
	@DeleteMapping("/{medIds}")
    public AjaxResult remove(@PathVariable Long[] medIds)
    {
        return toAjax(medicationsService.deleteMedicationsByMedIds(medIds));
    }
}
