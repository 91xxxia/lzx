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
import com.ruoyi.ClinicalSys.domain.MedicationsHistory;
import com.ruoyi.ClinicalSys.service.IMedicationsHistoryService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 既往用药史Controller
 * 
 * @author ruoyi
 * @date 2025-06-27
 */
@RestController
@RequestMapping("/ClinicalSys/medications_history")
public class MedicationsHistoryController extends BaseController
{
    @Autowired
    private IMedicationsHistoryService medicationsHistoryService;

    /**
     * 查询既往用药史列表
     */
    @PreAuthorize("@ss.hasPermi('ClinicalSys:medications_history:list')")
    @GetMapping("/list")
    public TableDataInfo list(MedicationsHistory medicationsHistory)
    {
        startPage();
        List<MedicationsHistory> list = medicationsHistoryService.selectMedicationsHistoryList(medicationsHistory);
        return getDataTable(list);
    }

    /**
     * 导出既往用药史列表
     */
    @PreAuthorize("@ss.hasPermi('ClinicalSys:medications_history:export')")
    @Log(title = "既往用药史", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, MedicationsHistory medicationsHistory)
    {
        List<MedicationsHistory> list = medicationsHistoryService.selectMedicationsHistoryList(medicationsHistory);
        ExcelUtil<MedicationsHistory> util = new ExcelUtil<MedicationsHistory>(MedicationsHistory.class);
        util.exportExcel(response, list, "既往用药史数据");
    }

    /**
     * 获取既往用药史详细信息
     */
    @PreAuthorize("@ss.hasPermi('ClinicalSys:medications_history:query')")
    @GetMapping(value = "/{medHisId}")
    public AjaxResult getInfo(@PathVariable("medHisId") Long medHisId)
    {
        return success(medicationsHistoryService.selectMedicationsHistoryByMedHisId(medHisId));
    }

    /**
     * 新增既往用药史
     */
    @PreAuthorize("@ss.hasPermi('ClinicalSys:medications_history:add')")
    @Log(title = "既往用药史", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody MedicationsHistory medicationsHistory)
    {
        return toAjax(medicationsHistoryService.insertMedicationsHistory(medicationsHistory));
    }

    /**
     * 修改既往用药史
     */
    @PreAuthorize("@ss.hasPermi('ClinicalSys:medications_history:edit')")
    @Log(title = "既往用药史", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody MedicationsHistory medicationsHistory)
    {
        return toAjax(medicationsHistoryService.updateMedicationsHistory(medicationsHistory));
    }

    /**
     * 删除既往用药史
     */
    @PreAuthorize("@ss.hasPermi('ClinicalSys:medications_history:remove')")
    @Log(title = "既往用药史", businessType = BusinessType.DELETE)
	@DeleteMapping("/{medHisIds}")
    public AjaxResult remove(@PathVariable Long[] medHisIds)
    {
        return toAjax(medicationsHistoryService.deleteMedicationsHistoryByMedHisIds(medHisIds));
    }
}
