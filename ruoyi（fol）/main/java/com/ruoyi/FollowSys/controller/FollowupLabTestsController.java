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
import com.ruoyi.FollowSys.domain.FollowupLabTests;
import com.ruoyi.FollowSys.service.IFollowupLabTestsService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 实验室检查Controller
 * 
 * @author ruoyi
 * @date 2025-06-28
 */
@RestController
@RequestMapping("/FollowSys/labtests")
public class FollowupLabTestsController extends BaseController
{
    @Autowired
    private IFollowupLabTestsService followupLabTestsService;

    /**
     * 查询实验室检查列表
     */
    @PreAuthorize("@ss.hasPermi('FollowSys:labtests:list')")
    @GetMapping("/list")
    public TableDataInfo list(FollowupLabTests followupLabTests)
    {
        startPage();
        List<FollowupLabTests> list = followupLabTestsService.selectFollowupLabTestsList(followupLabTests);
        return getDataTable(list);
    }

    /**
     * 导出实验室检查列表
     */
    @PreAuthorize("@ss.hasPermi('FollowSys:labtests:export')")
    @Log(title = "实验室检查", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, FollowupLabTests followupLabTests)
    {
        List<FollowupLabTests> list = followupLabTestsService.selectFollowupLabTestsList(followupLabTests);
        ExcelUtil<FollowupLabTests> util = new ExcelUtil<FollowupLabTests>(FollowupLabTests.class);
        util.exportExcel(response, list, "实验室检查数据");
    }

    /**
     * 获取实验室检查详细信息
     */
    @PreAuthorize("@ss.hasPermi('FollowSys:labtests:query')")
    @GetMapping(value = "/{labtestId}")
    public AjaxResult getInfo(@PathVariable("labtestId") Long labtestId)
    {
        return success(followupLabTestsService.selectFollowupLabTestsByLabtestId(labtestId));
    }

    /**
     * 新增实验室检查
     */
    @PreAuthorize("@ss.hasPermi('FollowSys:labtests:add')")
    @Log(title = "实验室检查", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody FollowupLabTests followupLabTests)
    {
        return toAjax(followupLabTestsService.insertFollowupLabTests(followupLabTests));
    }

    /**
     * 修改实验室检查
     */
    @PreAuthorize("@ss.hasPermi('FollowSys:labtests:edit')")
    @Log(title = "实验室检查", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody FollowupLabTests followupLabTests)
    {
        return toAjax(followupLabTestsService.updateFollowupLabTests(followupLabTests));
    }

    /**
     * 删除实验室检查
     */
    @PreAuthorize("@ss.hasPermi('FollowSys:labtests:remove')")
    @Log(title = "实验室检查", businessType = BusinessType.DELETE)
	@DeleteMapping("/{labtestIds}")
    public AjaxResult remove(@PathVariable Long[] labtestIds)
    {
        return toAjax(followupLabTestsService.deleteFollowupLabTestsByLabtestIds(labtestIds));
    }
}
