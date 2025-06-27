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
import com.ruoyi.ClinicalSys.domain.FamilyHistory;
import com.ruoyi.ClinicalSys.service.IFamilyHistoryService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 家族史Controller
 * 
 * @author ruoyi
 * @date 2025-06-27
 */
@RestController
@RequestMapping("/ClinicalSys/family_history")
public class FamilyHistoryController extends BaseController
{
    @Autowired
    private IFamilyHistoryService familyHistoryService;

    /**
     * 查询家族史列表
     */
    @PreAuthorize("@ss.hasPermi('ClinicalSys:family_history:list')")
    @GetMapping("/list")
    public TableDataInfo list(FamilyHistory familyHistory)
    {
        startPage();
        List<FamilyHistory> list = familyHistoryService.selectFamilyHistoryList(familyHistory);
        return getDataTable(list);
    }

    /**
     * 导出家族史列表
     */
    @PreAuthorize("@ss.hasPermi('ClinicalSys:family_history:export')")
    @Log(title = "家族史", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, FamilyHistory familyHistory)
    {
        List<FamilyHistory> list = familyHistoryService.selectFamilyHistoryList(familyHistory);
        ExcelUtil<FamilyHistory> util = new ExcelUtil<FamilyHistory>(FamilyHistory.class);
        util.exportExcel(response, list, "家族史数据");
    }

    /**
     * 获取家族史详细信息
     */
    @PreAuthorize("@ss.hasPermi('ClinicalSys:family_history:query')")
    @GetMapping(value = "/{famId}")
    public AjaxResult getInfo(@PathVariable("famId") Long famId)
    {
        return success(familyHistoryService.selectFamilyHistoryByFamId(famId));
    }

    /**
     * 新增家族史
     */
    @PreAuthorize("@ss.hasPermi('ClinicalSys:family_history:add')")
    @Log(title = "家族史", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody FamilyHistory familyHistory)
    {
        return toAjax(familyHistoryService.insertFamilyHistory(familyHistory));
    }

    /**
     * 修改家族史
     */
    @PreAuthorize("@ss.hasPermi('ClinicalSys:family_history:edit')")
    @Log(title = "家族史", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody FamilyHistory familyHistory)
    {
        return toAjax(familyHistoryService.updateFamilyHistory(familyHistory));
    }

    /**
     * 删除家族史
     */
    @PreAuthorize("@ss.hasPermi('ClinicalSys:family_history:remove')")
    @Log(title = "家族史", businessType = BusinessType.DELETE)
	@DeleteMapping("/{famIds}")
    public AjaxResult remove(@PathVariable Long[] famIds)
    {
        return toAjax(familyHistoryService.deleteFamilyHistoryByFamIds(famIds));
    }
}
