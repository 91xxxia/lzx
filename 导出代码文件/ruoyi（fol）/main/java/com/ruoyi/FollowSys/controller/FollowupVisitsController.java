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
import com.ruoyi.FollowSys.domain.FollowupVisits;
import com.ruoyi.FollowSys.service.IFollowupVisitsService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 随访记录Controller
 * 
 * @author ruoyi
 * @date 2025-06-28
 */
@RestController
@RequestMapping("/FollowSys/visits")
public class FollowupVisitsController extends BaseController
{
    @Autowired
    private IFollowupVisitsService followupVisitsService;

    /**
     * 查询随访记录列表
     */
    @PreAuthorize("@ss.hasPermi('FollowSys:visits:list')")
    @GetMapping("/list")
    public TableDataInfo list(FollowupVisits followupVisits)
    {
        startPage();
        List<FollowupVisits> list = followupVisitsService.selectFollowupVisitsList(followupVisits);
        return getDataTable(list);
    }

    /**
     * 导出随访记录列表
     */
    @PreAuthorize("@ss.hasPermi('FollowSys:visits:export')")
    @Log(title = "随访记录", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, FollowupVisits followupVisits)
    {
        List<FollowupVisits> list = followupVisitsService.selectFollowupVisitsList(followupVisits);
        ExcelUtil<FollowupVisits> util = new ExcelUtil<FollowupVisits>(FollowupVisits.class);
        util.exportExcel(response, list, "随访记录数据");
    }

    /**
     * 获取随访记录详细信息
     */
    @PreAuthorize("@ss.hasPermi('FollowSys:visits:query')")
    @GetMapping(value = "/{followupId}")
    public AjaxResult getInfo(@PathVariable("followupId") Long followupId)
    {
        return success(followupVisitsService.selectFollowupVisitsByFollowupId(followupId));
    }

    /**
     * 新增随访记录
     */
    @PreAuthorize("@ss.hasPermi('FollowSys:visits:add')")
    @Log(title = "随访记录", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody FollowupVisits followupVisits)
    {
        return toAjax(followupVisitsService.insertFollowupVisits(followupVisits));
    }

    /**
     * 修改随访记录
     */
    @PreAuthorize("@ss.hasPermi('FollowSys:visits:edit')")
    @Log(title = "随访记录", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody FollowupVisits followupVisits)
    {
        return toAjax(followupVisitsService.updateFollowupVisits(followupVisits));
    }

    /**
     * 删除随访记录
     */
    @PreAuthorize("@ss.hasPermi('FollowSys:visits:remove')")
    @Log(title = "随访记录", businessType = BusinessType.DELETE)
	@DeleteMapping("/{followupIds}")
    public AjaxResult remove(@PathVariable Long[] followupIds)
    {
        return toAjax(followupVisitsService.deleteFollowupVisitsByFollowupIds(followupIds));
    }
}
