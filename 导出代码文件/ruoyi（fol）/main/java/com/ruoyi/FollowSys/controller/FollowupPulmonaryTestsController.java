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
import com.ruoyi.FollowSys.domain.FollowupPulmonaryTests;
import com.ruoyi.FollowSys.service.IFollowupPulmonaryTestsService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 肺功能检查Controller
 * 
 * @author ruoyi
 * @date 2025-06-28
 */
@RestController
@RequestMapping("/FollowSys/pultests")
public class FollowupPulmonaryTestsController extends BaseController
{
    @Autowired
    private IFollowupPulmonaryTestsService followupPulmonaryTestsService;

    /**
     * 查询肺功能检查列表
     */
    @PreAuthorize("@ss.hasPermi('FollowSys:pultests:list')")
    @GetMapping("/list")
    public TableDataInfo list(FollowupPulmonaryTests followupPulmonaryTests)
    {
        startPage();
        List<FollowupPulmonaryTests> list = followupPulmonaryTestsService.selectFollowupPulmonaryTestsList(followupPulmonaryTests);
        return getDataTable(list);
    }

    /**
     * 导出肺功能检查列表
     */
    @PreAuthorize("@ss.hasPermi('FollowSys:pultests:export')")
    @Log(title = "肺功能检查", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, FollowupPulmonaryTests followupPulmonaryTests)
    {
        List<FollowupPulmonaryTests> list = followupPulmonaryTestsService.selectFollowupPulmonaryTestsList(followupPulmonaryTests);
        ExcelUtil<FollowupPulmonaryTests> util = new ExcelUtil<FollowupPulmonaryTests>(FollowupPulmonaryTests.class);
        util.exportExcel(response, list, "肺功能检查数据");
    }

    /**
     * 获取肺功能检查详细信息
     */
    @PreAuthorize("@ss.hasPermi('FollowSys:pultests:query')")
    @GetMapping(value = "/{testId}")
    public AjaxResult getInfo(@PathVariable("testId") Long testId)
    {
        return success(followupPulmonaryTestsService.selectFollowupPulmonaryTestsByTestId(testId));
    }

    /**
     * 新增肺功能检查
     */
    @PreAuthorize("@ss.hasPermi('FollowSys:pultests:add')")
    @Log(title = "肺功能检查", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody FollowupPulmonaryTests followupPulmonaryTests)
    {
        return toAjax(followupPulmonaryTestsService.insertFollowupPulmonaryTests(followupPulmonaryTests));
    }

    /**
     * 修改肺功能检查
     */
    @PreAuthorize("@ss.hasPermi('FollowSys:pultests:edit')")
    @Log(title = "肺功能检查", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody FollowupPulmonaryTests followupPulmonaryTests)
    {
        return toAjax(followupPulmonaryTestsService.updateFollowupPulmonaryTests(followupPulmonaryTests));
    }

    /**
     * 删除肺功能检查
     */
    @PreAuthorize("@ss.hasPermi('FollowSys:pultests:remove')")
    @Log(title = "肺功能检查", businessType = BusinessType.DELETE)
	@DeleteMapping("/{testIds}")
    public AjaxResult remove(@PathVariable Long[] testIds)
    {
        return toAjax(followupPulmonaryTestsService.deleteFollowupPulmonaryTestsByTestIds(testIds));
    }
}
