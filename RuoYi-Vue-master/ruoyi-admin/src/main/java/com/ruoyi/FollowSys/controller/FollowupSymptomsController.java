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
import com.ruoyi.FollowSys.domain.FollowupSymptoms;
import com.ruoyi.FollowSys.service.IFollowupSymptomsService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 症状Controller
 * 
 * @author ruoyi
 * @date 2025-06-28
 */
@RestController
@RequestMapping("/FollowSys/symptoms")
public class FollowupSymptomsController extends BaseController
{
    @Autowired
    private IFollowupSymptomsService followupSymptomsService;

    /**
     * 查询症状列表
     */
    @PreAuthorize("@ss.hasPermi('FollowSys:symptoms:list')")
    @GetMapping("/list")
    public TableDataInfo list(FollowupSymptoms followupSymptoms)
    {
        startPage();
        List<FollowupSymptoms> list = followupSymptomsService.selectFollowupSymptomsList(followupSymptoms);
        return getDataTable(list);
    }

    /**
     * 导出症状列表
     */
    @PreAuthorize("@ss.hasPermi('FollowSys:symptoms:export')")
    @Log(title = "症状", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, FollowupSymptoms followupSymptoms)
    {
        List<FollowupSymptoms> list = followupSymptomsService.selectFollowupSymptomsList(followupSymptoms);
        ExcelUtil<FollowupSymptoms> util = new ExcelUtil<FollowupSymptoms>(FollowupSymptoms.class);
        util.exportExcel(response, list, "症状数据");
    }

    /**
     * 获取症状详细信息
     */
    @PreAuthorize("@ss.hasPermi('FollowSys:symptoms:query')")
    @GetMapping(value = "/{symptomId}")
    public AjaxResult getInfo(@PathVariable("symptomId") Long symptomId)
    {
        return success(followupSymptomsService.selectFollowupSymptomsBySymptomId(symptomId));
    }

    /**
     * 新增症状
     */
    @PreAuthorize("@ss.hasPermi('FollowSys:symptoms:add')")
    @Log(title = "症状", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody FollowupSymptoms followupSymptoms)
    {
        return toAjax(followupSymptomsService.insertFollowupSymptoms(followupSymptoms));
    }

    /**
     * 修改症状
     */
    @PreAuthorize("@ss.hasPermi('FollowSys:symptoms:edit')")
    @Log(title = "症状", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody FollowupSymptoms followupSymptoms)
    {
        return toAjax(followupSymptomsService.updateFollowupSymptoms(followupSymptoms));
    }

    /**
     * 删除症状
     */
    @PreAuthorize("@ss.hasPermi('FollowSys:symptoms:remove')")
    @Log(title = "症状", businessType = BusinessType.DELETE)
	@DeleteMapping("/{symptomIds}")
    public AjaxResult remove(@PathVariable Long[] symptomIds)
    {
        return toAjax(followupSymptomsService.deleteFollowupSymptomsBySymptomIds(symptomIds));
    }
}
