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
import com.ruoyi.FollowSys.domain.FollowupSummary;
import com.ruoyi.FollowSys.service.IFollowupSummaryService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 随访信息Controller
 * 
 * @author ruoyi
 * @date 2025-06-28
 */
@RestController
@RequestMapping("/FollowSys/summary")
public class FollowupSummaryController extends BaseController
{
    @Autowired
    private IFollowupSummaryService followupSummaryService;

    /**
     * 查询随访信息列表
     */
    @PreAuthorize("@ss.hasPermi('FollowSys:summary:list')")
    @GetMapping("/list")
    public TableDataInfo list(FollowupSummary followupSummary)
    {
        startPage();
        List<FollowupSummary> list = followupSummaryService.selectFollowupSummaryList(followupSummary);
        return getDataTable(list);
    }

    /**
     * 导出随访信息列表
     */
    @PreAuthorize("@ss.hasPermi('FollowSys:summary:export')")
    @Log(title = "随访信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, FollowupSummary followupSummary)
    {
        List<FollowupSummary> list = followupSummaryService.selectFollowupSummaryList(followupSummary);
        ExcelUtil<FollowupSummary> util = new ExcelUtil<FollowupSummary>(FollowupSummary.class);
        util.exportExcel(response, list, "随访信息数据");
    }

    /**
     * 获取随访信息详细信息
     */
    @PreAuthorize("@ss.hasPermi('FollowSys:summary:query')")
    @GetMapping(value = "/{summaryId}")
    public AjaxResult getInfo(@PathVariable("summaryId") Long summaryId)
    {
        return success(followupSummaryService.selectFollowupSummaryBySummaryId(summaryId));
    }

    /**
     * 新增随访信息
     */
    @PreAuthorize("@ss.hasPermi('FollowSys:summary:add')")
    @Log(title = "随访信息", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody FollowupSummary followupSummary)
    {
        return toAjax(followupSummaryService.insertFollowupSummary(followupSummary));
    }

    /**
     * 修改随访信息
     */
    @PreAuthorize("@ss.hasPermi('FollowSys:summary:edit')")
    @Log(title = "随访信息", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody FollowupSummary followupSummary)
    {
        return toAjax(followupSummaryService.updateFollowupSummary(followupSummary));
    }

    /**
     * 删除随访信息
     */
    @PreAuthorize("@ss.hasPermi('FollowSys:summary:remove')")
    @Log(title = "随访信息", businessType = BusinessType.DELETE)
	@DeleteMapping("/{summaryIds}")
    public AjaxResult remove(@PathVariable Long[] summaryIds)
    {
        return toAjax(followupSummaryService.deleteFollowupSummaryBySummaryIds(summaryIds));
    }
}
