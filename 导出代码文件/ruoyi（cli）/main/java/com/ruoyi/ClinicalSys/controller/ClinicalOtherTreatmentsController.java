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
import com.ruoyi.ClinicalSys.domain.ClinicalOtherTreatments;
import com.ruoyi.ClinicalSys.service.IClinicalOtherTreatmentsService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 其他辅助治疗Controller
 * 
 * @author ruoyi
 * @date 2025-06-27
 */
@RestController
@RequestMapping("/ClinicalSys/treatments")
public class ClinicalOtherTreatmentsController extends BaseController
{
    @Autowired
    private IClinicalOtherTreatmentsService clinicalOtherTreatmentsService;

    /**
     * 查询其他辅助治疗列表
     */
    @PreAuthorize("@ss.hasPermi('ClinicalSys:treatments:list')")
    @GetMapping("/list")
    public TableDataInfo list(ClinicalOtherTreatments clinicalOtherTreatments)
    {
        startPage();
        List<ClinicalOtherTreatments> list = clinicalOtherTreatmentsService.selectClinicalOtherTreatmentsList(clinicalOtherTreatments);
        return getDataTable(list);
    }

    /**
     * 导出其他辅助治疗列表
     */
    @PreAuthorize("@ss.hasPermi('ClinicalSys:treatments:export')")
    @Log(title = "其他辅助治疗", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, ClinicalOtherTreatments clinicalOtherTreatments)
    {
        List<ClinicalOtherTreatments> list = clinicalOtherTreatmentsService.selectClinicalOtherTreatmentsList(clinicalOtherTreatments);
        ExcelUtil<ClinicalOtherTreatments> util = new ExcelUtil<ClinicalOtherTreatments>(ClinicalOtherTreatments.class);
        util.exportExcel(response, list, "其他辅助治疗数据");
    }

    /**
     * 获取其他辅助治疗详细信息
     */
    @PreAuthorize("@ss.hasPermi('ClinicalSys:treatments:query')")
    @GetMapping(value = "/{treatmentId}")
    public AjaxResult getInfo(@PathVariable("treatmentId") Long treatmentId)
    {
        return success(clinicalOtherTreatmentsService.selectClinicalOtherTreatmentsByTreatmentId(treatmentId));
    }

    /**
     * 新增其他辅助治疗
     */
    @PreAuthorize("@ss.hasPermi('ClinicalSys:treatments:add')")
    @Log(title = "其他辅助治疗", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody ClinicalOtherTreatments clinicalOtherTreatments)
    {
        return toAjax(clinicalOtherTreatmentsService.insertClinicalOtherTreatments(clinicalOtherTreatments));
    }

    /**
     * 修改其他辅助治疗
     */
    @PreAuthorize("@ss.hasPermi('ClinicalSys:treatments:edit')")
    @Log(title = "其他辅助治疗", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody ClinicalOtherTreatments clinicalOtherTreatments)
    {
        return toAjax(clinicalOtherTreatmentsService.updateClinicalOtherTreatments(clinicalOtherTreatments));
    }

    /**
     * 删除其他辅助治疗
     */
    @PreAuthorize("@ss.hasPermi('ClinicalSys:treatments:remove')")
    @Log(title = "其他辅助治疗", businessType = BusinessType.DELETE)
	@DeleteMapping("/{treatmentIds}")
    public AjaxResult remove(@PathVariable Long[] treatmentIds)
    {
        return toAjax(clinicalOtherTreatmentsService.deleteClinicalOtherTreatmentsByTreatmentIds(treatmentIds));
    }
}
