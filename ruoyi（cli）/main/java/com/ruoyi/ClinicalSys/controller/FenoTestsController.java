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
import com.ruoyi.ClinicalSys.domain.FenoTests;
import com.ruoyi.ClinicalSys.service.IFenoTestsService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 呼出气一氧化氮检测Controller
 * 
 * @author ruoyi
 * @date 2025-06-27
 */
@RestController
@RequestMapping("/ClinicalSys/tests")
public class FenoTestsController extends BaseController
{
    @Autowired
    private IFenoTestsService fenoTestsService;

    /**
     * 查询呼出气一氧化氮检测列表
     */
    @PreAuthorize("@ss.hasPermi('ClinicalSys:tests:list')")
    @GetMapping("/list")
    public TableDataInfo list(FenoTests fenoTests)
    {
        startPage();
        List<FenoTests> list = fenoTestsService.selectFenoTestsList(fenoTests);
        return getDataTable(list);
    }

    /**
     * 导出呼出气一氧化氮检测列表
     */
    @PreAuthorize("@ss.hasPermi('ClinicalSys:tests:export')")
    @Log(title = "呼出气一氧化氮检测", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, FenoTests fenoTests)
    {
        List<FenoTests> list = fenoTestsService.selectFenoTestsList(fenoTests);
        ExcelUtil<FenoTests> util = new ExcelUtil<FenoTests>(FenoTests.class);
        util.exportExcel(response, list, "呼出气一氧化氮检测数据");
    }

    /**
     * 获取呼出气一氧化氮检测详细信息
     */
    @PreAuthorize("@ss.hasPermi('ClinicalSys:tests:query')")
    @GetMapping(value = "/{fenoId}")
    public AjaxResult getInfo(@PathVariable("fenoId") Long fenoId)
    {
        return success(fenoTestsService.selectFenoTestsByFenoId(fenoId));
    }

    /**
     * 新增呼出气一氧化氮检测
     */
    @PreAuthorize("@ss.hasPermi('ClinicalSys:tests:add')")
    @Log(title = "呼出气一氧化氮检测", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody FenoTests fenoTests)
    {
        return toAjax(fenoTestsService.insertFenoTests(fenoTests));
    }

    /**
     * 修改呼出气一氧化氮检测
     */
    @PreAuthorize("@ss.hasPermi('ClinicalSys:tests:edit')")
    @Log(title = "呼出气一氧化氮检测", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody FenoTests fenoTests)
    {
        return toAjax(fenoTestsService.updateFenoTests(fenoTests));
    }

    /**
     * 删除呼出气一氧化氮检测
     */
    @PreAuthorize("@ss.hasPermi('ClinicalSys:tests:remove')")
    @Log(title = "呼出气一氧化氮检测", businessType = BusinessType.DELETE)
	@DeleteMapping("/{fenoIds}")
    public AjaxResult remove(@PathVariable Long[] fenoIds)
    {
        return toAjax(fenoTestsService.deleteFenoTestsByFenoIds(fenoIds));
    }
}
