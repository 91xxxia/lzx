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
import com.ruoyi.ClinicalSys.domain.FollowupNotes;
import com.ruoyi.ClinicalSys.service.IFollowupNotesService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 随访信息Controller
 * 
 * @author ruoyi
 * @date 2025-06-27
 */
@RestController
@RequestMapping("/ClinicalSys/notes")
public class FollowupNotesController extends BaseController
{
    @Autowired
    private IFollowupNotesService followupNotesService;

    /**
     * 查询随访信息列表
     */
    @PreAuthorize("@ss.hasPermi('ClinicalSys:notes:list')")
    @GetMapping("/list")
    public TableDataInfo list(FollowupNotes followupNotes)
    {
        startPage();
        List<FollowupNotes> list = followupNotesService.selectFollowupNotesList(followupNotes);
        return getDataTable(list);
    }

    /**
     * 导出随访信息列表
     */
    @PreAuthorize("@ss.hasPermi('ClinicalSys:notes:export')")
    @Log(title = "随访信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, FollowupNotes followupNotes)
    {
        List<FollowupNotes> list = followupNotesService.selectFollowupNotesList(followupNotes);
        ExcelUtil<FollowupNotes> util = new ExcelUtil<FollowupNotes>(FollowupNotes.class);
        util.exportExcel(response, list, "随访信息数据");
    }

    /**
     * 获取随访信息详细信息
     */
    @PreAuthorize("@ss.hasPermi('ClinicalSys:notes:query')")
    @GetMapping(value = "/{followupId}")
    public AjaxResult getInfo(@PathVariable("followupId") Long followupId)
    {
        return success(followupNotesService.selectFollowupNotesByFollowupId(followupId));
    }

    /**
     * 新增随访信息
     */
    @PreAuthorize("@ss.hasPermi('ClinicalSys:notes:add')")
    @Log(title = "随访信息", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody FollowupNotes followupNotes)
    {
        return toAjax(followupNotesService.insertFollowupNotes(followupNotes));
    }

    /**
     * 修改随访信息
     */
    @PreAuthorize("@ss.hasPermi('ClinicalSys:notes:edit')")
    @Log(title = "随访信息", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody FollowupNotes followupNotes)
    {
        return toAjax(followupNotesService.updateFollowupNotes(followupNotes));
    }

    /**
     * 删除随访信息
     */
    @PreAuthorize("@ss.hasPermi('ClinicalSys:notes:remove')")
    @Log(title = "随访信息", businessType = BusinessType.DELETE)
	@DeleteMapping("/{followupIds}")
    public AjaxResult remove(@PathVariable Long[] followupIds)
    {
        return toAjax(followupNotesService.deleteFollowupNotesByFollowupIds(followupIds));
    }
}
