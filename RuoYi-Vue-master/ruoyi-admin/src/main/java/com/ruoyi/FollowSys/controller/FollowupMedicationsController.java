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
import com.ruoyi.FollowSys.domain.FollowupMedications;
import com.ruoyi.FollowSys.service.IFollowupMedicationsService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 用药Controller
 * 
 * @author ruoyi
 * @date 2025-06-28
 */
@RestController
@RequestMapping("/FollowSys/medications")
public class FollowupMedicationsController extends BaseController
{
    @Autowired
    private IFollowupMedicationsService followupMedicationsService;

    /**
     * 查询用药列表
     */
    @PreAuthorize("@ss.hasPermi('FollowSys:medications:list')")
    @GetMapping("/list")
    public TableDataInfo list(FollowupMedications followupMedications)
    {
        startPage();
        List<FollowupMedications> list = followupMedicationsService.selectFollowupMedicationsList(followupMedications);
        return getDataTable(list);
    }

    /**
     * 导出用药列表
     */
    @PreAuthorize("@ss.hasPermi('FollowSys:medications:export')")
    @Log(title = "用药", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, FollowupMedications followupMedications)
    {
        List<FollowupMedications> list = followupMedicationsService.selectFollowupMedicationsList(followupMedications);
        ExcelUtil<FollowupMedications> util = new ExcelUtil<FollowupMedications>(FollowupMedications.class);
        util.exportExcel(response, list, "用药数据");
    }

    /**
     * 获取用药详细信息
     */
    @PreAuthorize("@ss.hasPermi('FollowSys:medications:query')")
    @GetMapping(value = "/{medId}")
    public AjaxResult getInfo(@PathVariable("medId") Long medId)
    {
        return success(followupMedicationsService.selectFollowupMedicationsByMedId(medId));
    }

    /**
     * 新增用药
     */
    @PreAuthorize("@ss.hasPermi('FollowSys:medications:add')")
    @Log(title = "用药", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody FollowupMedications followupMedications)
    {
        return toAjax(followupMedicationsService.insertFollowupMedications(followupMedications));
    }

    /**
     * 修改用药
     */
    @PreAuthorize("@ss.hasPermi('FollowSys:medications:edit')")
    @Log(title = "用药", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody FollowupMedications followupMedications)
    {
        return toAjax(followupMedicationsService.updateFollowupMedications(followupMedications));
    }

    /**
     * 删除用药
     */
    @PreAuthorize("@ss.hasPermi('FollowSys:medications:remove')")
    @Log(title = "用药", businessType = BusinessType.DELETE)
	@DeleteMapping("/{medIds}")
    public AjaxResult remove(@PathVariable Long[] medIds)
    {
        return toAjax(followupMedicationsService.deleteFollowupMedicationsByMedIds(medIds));
    }
}
