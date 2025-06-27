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
import com.ruoyi.ClinicalSys.domain.LabTests;
import com.ruoyi.ClinicalSys.service.ILabTestsService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 实验室检查Controller
 * 
 * @author ruoyi
 * @date 2025-06-27
 */
@RestController
@RequestMapping("/ClinicalSys/lab_tests")
public class LabTestsController extends BaseController
{
    @Autowired
    private ILabTestsService labTestsService;

    /**
     * 查询实验室检查列表
     */
    @PreAuthorize("@ss.hasPermi('ClinicalSys:lab_tests:list')")
    @GetMapping("/list")
    public TableDataInfo list(LabTests labTests)
    {
        startPage();
        List<LabTests> list = labTestsService.selectLabTestsList(labTests);
        return getDataTable(list);
    }

    /**
     * 导出实验室检查列表
     */
    @PreAuthorize("@ss.hasPermi('ClinicalSys:lab_tests:export')")
    @Log(title = "实验室检查", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, LabTests labTests)
    {
        List<LabTests> list = labTestsService.selectLabTestsList(labTests);
        ExcelUtil<LabTests> util = new ExcelUtil<LabTests>(LabTests.class);
        util.exportExcel(response, list, "实验室检查数据");
    }

    /**
     * 获取实验室检查详细信息
     */
    @PreAuthorize("@ss.hasPermi('ClinicalSys:lab_tests:query')")
    @GetMapping(value = "/{testId}")
    public AjaxResult getInfo(@PathVariable("testId") Long testId)
    {
        return success(labTestsService.selectLabTestsByTestId(testId));
    }

    /**
     * 新增实验室检查
     */
    @PreAuthorize("@ss.hasPermi('ClinicalSys:lab_tests:add')")
    @Log(title = "实验室检查", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody LabTests labTests)
    {
        return toAjax(labTestsService.insertLabTests(labTests));
    }

    /**
     * 修改实验室检查
     */
    @PreAuthorize("@ss.hasPermi('ClinicalSys:lab_tests:edit')")
    @Log(title = "实验室检查", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody LabTests labTests)
    {
        return toAjax(labTestsService.updateLabTests(labTests));
    }

    /**
     * 删除实验室检查
     */
    @PreAuthorize("@ss.hasPermi('ClinicalSys:lab_tests:remove')")
    @Log(title = "实验室检查", businessType = BusinessType.DELETE)
	@DeleteMapping("/{testIds}")
    public AjaxResult remove(@PathVariable Long[] testIds)
    {
        return toAjax(labTestsService.deleteLabTestsByTestIds(testIds));
    }
}
