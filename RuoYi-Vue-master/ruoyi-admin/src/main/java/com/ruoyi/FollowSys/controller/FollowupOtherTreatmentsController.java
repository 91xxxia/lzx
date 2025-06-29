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
import com.ruoyi.FollowSys.domain.FollowupOtherTreatments;
import com.ruoyi.FollowSys.service.IFollowupOtherTreatmentsService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 其他辅助治疗Controller
 * 
 * @author ruoyi
 * @date 2025-06-28
 */
@RestController
@RequestMapping("/FollowSys/othertreatments")
public class FollowupOtherTreatmentsController extends BaseController
{
    @Autowired
    private IFollowupOtherTreatmentsService followupOtherTreatmentsService;

    /**
     * 查询其他辅助治疗列表
     */
    @PreAuthorize("@ss.hasPermi('FollowSys:othertreatments:list')")
    @GetMapping("/list")
    public TableDataInfo list(FollowupOtherTreatments followupOtherTreatments)
    {
        startPage();
        List<FollowupOtherTreatments> list = followupOtherTreatmentsService.selectFollowupOtherTreatmentsList(followupOtherTreatments);
        return getDataTable(list);
    }

    /**
     * 导出其他辅助治疗列表
     */
    @PreAuthorize("@ss.hasPermi('FollowSys:othertreatments:export')")
    @Log(title = "其他辅助治疗", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, FollowupOtherTreatments followupOtherTreatments)
    {
        List<FollowupOtherTreatments> list = followupOtherTreatmentsService.selectFollowupOtherTreatmentsList(followupOtherTreatments);
        ExcelUtil<FollowupOtherTreatments> util = new ExcelUtil<FollowupOtherTreatments>(FollowupOtherTreatments.class);
        util.exportExcel(response, list, "其他辅助治疗数据");
    }

    /**
     * 获取其他辅助治疗详细信息
     */
    @PreAuthorize("@ss.hasPermi('FollowSys:othertreatments:query')")
    @GetMapping(value = "/{treatmentId}")
    public AjaxResult getInfo(@PathVariable("treatmentId") Long treatmentId)
    {
        return success(followupOtherTreatmentsService.selectFollowupOtherTreatmentsByTreatmentId(treatmentId));
    }

    /**
     * 新增其他辅助治疗
     */
    @PreAuthorize("@ss.hasPermi('FollowSys:othertreatments:add')")
    @Log(title = "其他辅助治疗", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody FollowupOtherTreatments followupOtherTreatments)
    {
        return toAjax(followupOtherTreatmentsService.insertFollowupOtherTreatments(followupOtherTreatments));
    }

    /**
     * 修改其他辅助治疗
     */
    @PreAuthorize("@ss.hasPermi('FollowSys:othertreatments:edit')")
    @Log(title = "其他辅助治疗", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody FollowupOtherTreatments followupOtherTreatments)
    {
        return toAjax(followupOtherTreatmentsService.updateFollowupOtherTreatments(followupOtherTreatments));
    }

    /**
     * 删除其他辅助治疗
     */
    @PreAuthorize("@ss.hasPermi('FollowSys:othertreatments:remove')")
    @Log(title = "其他辅助治疗", businessType = BusinessType.DELETE)
	@DeleteMapping("/{treatmentIds}")
    public AjaxResult remove(@PathVariable Long[] treatmentIds)
    {
        return toAjax(followupOtherTreatmentsService.deleteFollowupOtherTreatmentsByTreatmentIds(treatmentIds));
    }
}
