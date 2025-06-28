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
import com.ruoyi.FollowSys.domain.FollowupAdverseReactions;
import com.ruoyi.FollowSys.service.IFollowupAdverseReactionsService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 药物不良反应Controller
 * 
 * @author ruoyi
 * @date 2025-06-28
 */
@RestController
@RequestMapping("/FollowSys/reactions")
public class FollowupAdverseReactionsController extends BaseController
{
    @Autowired
    private IFollowupAdverseReactionsService followupAdverseReactionsService;

    /**
     * 查询药物不良反应列表
     */
    @PreAuthorize("@ss.hasPermi('FollowSys:reactions:list')")
    @GetMapping("/list")
    public TableDataInfo list(FollowupAdverseReactions followupAdverseReactions)
    {
        startPage();
        List<FollowupAdverseReactions> list = followupAdverseReactionsService.selectFollowupAdverseReactionsList(followupAdverseReactions);
        return getDataTable(list);
    }

    /**
     * 导出药物不良反应列表
     */
    @PreAuthorize("@ss.hasPermi('FollowSys:reactions:export')")
    @Log(title = "药物不良反应", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, FollowupAdverseReactions followupAdverseReactions)
    {
        List<FollowupAdverseReactions> list = followupAdverseReactionsService.selectFollowupAdverseReactionsList(followupAdverseReactions);
        ExcelUtil<FollowupAdverseReactions> util = new ExcelUtil<FollowupAdverseReactions>(FollowupAdverseReactions.class);
        util.exportExcel(response, list, "药物不良反应数据");
    }

    /**
     * 获取药物不良反应详细信息
     */
    @PreAuthorize("@ss.hasPermi('FollowSys:reactions:query')")
    @GetMapping(value = "/{reactionId}")
    public AjaxResult getInfo(@PathVariable("reactionId") Long reactionId)
    {
        return success(followupAdverseReactionsService.selectFollowupAdverseReactionsByReactionId(reactionId));
    }

    /**
     * 新增药物不良反应
     */
    @PreAuthorize("@ss.hasPermi('FollowSys:reactions:add')")
    @Log(title = "药物不良反应", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody FollowupAdverseReactions followupAdverseReactions)
    {
        return toAjax(followupAdverseReactionsService.insertFollowupAdverseReactions(followupAdverseReactions));
    }

    /**
     * 修改药物不良反应
     */
    @PreAuthorize("@ss.hasPermi('FollowSys:reactions:edit')")
    @Log(title = "药物不良反应", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody FollowupAdverseReactions followupAdverseReactions)
    {
        return toAjax(followupAdverseReactionsService.updateFollowupAdverseReactions(followupAdverseReactions));
    }

    /**
     * 删除药物不良反应
     */
    @PreAuthorize("@ss.hasPermi('FollowSys:reactions:remove')")
    @Log(title = "药物不良反应", businessType = BusinessType.DELETE)
	@DeleteMapping("/{reactionIds}")
    public AjaxResult remove(@PathVariable Long[] reactionIds)
    {
        return toAjax(followupAdverseReactionsService.deleteFollowupAdverseReactionsByReactionIds(reactionIds));
    }
}
