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
import com.ruoyi.ClinicalSys.domain.LungTests;
import com.ruoyi.ClinicalSys.service.ILungTestsService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 肺功能检查Controller
 * 
 * @author ruoyi
 * @date 2025-06-27
 */
@RestController
@RequestMapping("/ClinicalSys/lung_tests")
public class LungTestsController extends BaseController
{
    @Autowired
    private ILungTestsService lungTestsService;

    /**
     * 查询肺功能检查列表
     */
    @PreAuthorize("@ss.hasPermi('ClinicalSys:lung_tests:list')")
    @GetMapping("/list")
    public TableDataInfo list(LungTests lungTests)
    {
        startPage();
        List<LungTests> list = lungTestsService.selectLungTestsList(lungTests);
        return getDataTable(list);
    }

    /**
     * 导出肺功能检查列表
     */
    @PreAuthorize("@ss.hasPermi('ClinicalSys:lung_tests:export')")
    @Log(title = "肺功能检查", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, LungTests lungTests)
    {
        List<LungTests> list = lungTestsService.selectLungTestsList(lungTests);
        ExcelUtil<LungTests> util = new ExcelUtil<LungTests>(LungTests.class);
        util.exportExcel(response, list, "肺功能检查数据");
    }

    /**
     * 获取肺功能检查详细信息
     */
    @PreAuthorize("@ss.hasPermi('ClinicalSys:lung_tests:query')")
    @GetMapping(value = "/{lungId}")
    public AjaxResult getInfo(@PathVariable("lungId") Long lungId)
    {
        return success(lungTestsService.selectLungTestsByLungId(lungId));
    }

    /**
     * 新增肺功能检查
     */
    @PreAuthorize("@ss.hasPermi('ClinicalSys:lung_tests:add')")
    @Log(title = "肺功能检查", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody LungTests lungTests)
    {
        return toAjax(lungTestsService.insertLungTests(lungTests));
    }

    /**
     * 修改肺功能检查
     */
    @PreAuthorize("@ss.hasPermi('ClinicalSys:lung_tests:edit')")
    @Log(title = "肺功能检查", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody LungTests lungTests)
    {
        return toAjax(lungTestsService.updateLungTests(lungTests));
    }

    /**
     * 删除肺功能检查
     */
    @PreAuthorize("@ss.hasPermi('ClinicalSys:lung_tests:remove')")
    @Log(title = "肺功能检查", businessType = BusinessType.DELETE)
	@DeleteMapping("/{lungIds}")
    public AjaxResult remove(@PathVariable Long[] lungIds)
    {
        return toAjax(lungTestsService.deleteLungTestsByLungIds(lungIds));
    }
}
