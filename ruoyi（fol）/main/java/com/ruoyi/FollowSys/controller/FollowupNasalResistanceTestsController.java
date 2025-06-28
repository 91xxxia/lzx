package com.ruoyi.FollowSys.controller;

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
import com.ruoyi.FollowSys.domain.FollowupNasalResistanceTests;
import com.ruoyi.FollowSys.service.IFollowupNasalResistanceTestsService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 鼻阻力Controller
 * 
 * @author ruoyi
 * @date 2025-06-28
 */
@RestController
@RequestMapping("/FollowSys/nasaltests")
public class FollowupNasalResistanceTestsController extends BaseController
{
    @Autowired
    private IFollowupNasalResistanceTestsService followupNasalResistanceTestsService;

    /**
     * 查询鼻阻力列表
     */
    @PreAuthorize("@ss.hasPermi('FollowSys:nasaltests:list')")
    @GetMapping("/list")
    public TableDataInfo list(FollowupNasalResistanceTests followupNasalResistanceTests)
    {
        startPage();
        List<FollowupNasalResistanceTests> list = followupNasalResistanceTestsService.selectFollowupNasalResistanceTestsList(followupNasalResistanceTests);
        return getDataTable(list);
    }

    /**
     * 导出鼻阻力列表
     */
    @PreAuthorize("@ss.hasPermi('FollowSys:nasaltests:export')")
    @Log(title = "鼻阻力", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, FollowupNasalResistanceTests followupNasalResistanceTests)
    {
        List<FollowupNasalResistanceTests> list = followupNasalResistanceTestsService.selectFollowupNasalResistanceTestsList(followupNasalResistanceTests);
        ExcelUtil<FollowupNasalResistanceTests> util = new ExcelUtil<FollowupNasalResistanceTests>(FollowupNasalResistanceTests.class);
        util.exportExcel(response, list, "鼻阻力数据");
    }

    /**
     * 获取鼻阻力详细信息
     */
    @PreAuthorize("@ss.hasPermi('FollowSys:nasaltests:query')")
    @GetMapping(value = "/{nasalId}")
    public AjaxResult getInfo(@PathVariable("nasalId") Long nasalId)
    {
        return success(followupNasalResistanceTestsService.selectFollowupNasalResistanceTestsByNasalId(nasalId));
    }

    /**
     * 新增鼻阻力
     */
    @PreAuthorize("@ss.hasPermi('FollowSys:nasaltests:add')")
    @Log(title = "鼻阻力", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody FollowupNasalResistanceTests followupNasalResistanceTests)
    {
        return toAjax(followupNasalResistanceTestsService.insertFollowupNasalResistanceTests(followupNasalResistanceTests));
    }

    /**
     * 修改鼻阻力
     */
    @PreAuthorize("@ss.hasPermi('FollowSys:nasaltests:edit')")
    @Log(title = "鼻阻力", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody FollowupNasalResistanceTests followupNasalResistanceTests)
    {
        return toAjax(followupNasalResistanceTestsService.updateFollowupNasalResistanceTests(followupNasalResistanceTests));
    }

    /**
     * 删除鼻阻力
     */
    @PreAuthorize("@ss.hasPermi('FollowSys:nasaltests:remove')")
    @Log(title = "鼻阻力", businessType = BusinessType.DELETE)
	@DeleteMapping("/{nasalIds}")
    public AjaxResult remove(@PathVariable Long[] nasalIds)
    {
        return toAjax(followupNasalResistanceTestsService.deleteFollowupNasalResistanceTestsByNasalIds(nasalIds));
    }
}
