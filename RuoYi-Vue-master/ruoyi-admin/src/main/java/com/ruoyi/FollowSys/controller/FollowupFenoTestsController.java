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
import com.ruoyi.FollowSys.domain.FollowupFenoTests;
import com.ruoyi.FollowSys.service.IFollowupFenoTestsService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 呼出气一氧化氮检测Controller
 * 
 * @author ruoyi
 * @date 2025-06-28
 */
@RestController
@RequestMapping("/FollowSys/fenotests")
public class FollowupFenoTestsController extends BaseController
{
    @Autowired
    private IFollowupFenoTestsService followupFenoTestsService;

    /**
     * 查询呼出气一氧化氮检测列表
     */
    @PreAuthorize("@ss.hasPermi('FollowSys:fenotests:list')")
    @GetMapping("/list")
    public TableDataInfo list(FollowupFenoTests followupFenoTests)
    {
        startPage();
        List<FollowupFenoTests> list = followupFenoTestsService.selectFollowupFenoTestsList(followupFenoTests);
        return getDataTable(list);
    }

    /**
     * 导出呼出气一氧化氮检测列表
     */
    @PreAuthorize("@ss.hasPermi('FollowSys:fenotests:export')")
    @Log(title = "呼出气一氧化氮检测", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, FollowupFenoTests followupFenoTests)
    {
        List<FollowupFenoTests> list = followupFenoTestsService.selectFollowupFenoTestsList(followupFenoTests);
        ExcelUtil<FollowupFenoTests> util = new ExcelUtil<FollowupFenoTests>(FollowupFenoTests.class);
        util.exportExcel(response, list, "呼出气一氧化氮检测数据");
    }

    /**
     * 获取呼出气一氧化氮检测详细信息
     */
    @PreAuthorize("@ss.hasPermi('FollowSys:fenotests:query')")
    @GetMapping(value = "/{fenoId}")
    public AjaxResult getInfo(@PathVariable("fenoId") Long fenoId)
    {
        return success(followupFenoTestsService.selectFollowupFenoTestsByFenoId(fenoId));
    }

    /**
     * 新增呼出气一氧化氮检测
     */
    @PreAuthorize("@ss.hasPermi('FollowSys:fenotests:add')")
    @Log(title = "呼出气一氧化氮检测", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody FollowupFenoTests followupFenoTests)
    {
        return toAjax(followupFenoTestsService.insertFollowupFenoTests(followupFenoTests));
    }

    /**
     * 修改呼出气一氧化氮检测
     */
    @PreAuthorize("@ss.hasPermi('FollowSys:fenotests:edit')")
    @Log(title = "呼出气一氧化氮检测", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody FollowupFenoTests followupFenoTests)
    {
        return toAjax(followupFenoTestsService.updateFollowupFenoTests(followupFenoTests));
    }

    /**
     * 删除呼出气一氧化氮检测
     */
    @PreAuthorize("@ss.hasPermi('FollowSys:fenotests:remove')")
    @Log(title = "呼出气一氧化氮检测", businessType = BusinessType.DELETE)
	@DeleteMapping("/{fenoIds}")
    public AjaxResult remove(@PathVariable Long[] fenoIds)
    {
        return toAjax(followupFenoTestsService.deleteFollowupFenoTestsByFenoIds(fenoIds));
    }
}
