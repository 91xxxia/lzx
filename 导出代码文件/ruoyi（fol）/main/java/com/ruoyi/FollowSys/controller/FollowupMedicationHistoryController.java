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
import com.ruoyi.FollowSys.domain.FollowupMedicationHistory;
import com.ruoyi.FollowSys.service.IFollowupMedicationHistoryService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 既往用药史Controller
 * 
 * @author ruoyi
 * @date 2025-06-28
 */
@RestController
@RequestMapping("/FollowSys/medicinehistory")
public class FollowupMedicationHistoryController extends BaseController
{
    @Autowired
    private IFollowupMedicationHistoryService followupMedicationHistoryService;

    /**
     * 查询既往用药史列表
     */
    @PreAuthorize("@ss.hasPermi('FollowSys:medicinehistory:list')")
    @GetMapping("/list")
    public TableDataInfo list(FollowupMedicationHistory followupMedicationHistory)
    {
        startPage();
        List<FollowupMedicationHistory> list = followupMedicationHistoryService.selectFollowupMedicationHistoryList(followupMedicationHistory);
        return getDataTable(list);
    }

    /**
     * 导出既往用药史列表
     */
    @PreAuthorize("@ss.hasPermi('FollowSys:medicinehistory:export')")
    @Log(title = "既往用药史", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, FollowupMedicationHistory followupMedicationHistory)
    {
        List<FollowupMedicationHistory> list = followupMedicationHistoryService.selectFollowupMedicationHistoryList(followupMedicationHistory);
        ExcelUtil<FollowupMedicationHistory> util = new ExcelUtil<FollowupMedicationHistory>(FollowupMedicationHistory.class);
        util.exportExcel(response, list, "既往用药史数据");
    }

    /**
     * 获取既往用药史详细信息
     */
    @PreAuthorize("@ss.hasPermi('FollowSys:medicinehistory:query')")
    @GetMapping(value = "/{medHistId}")
    public AjaxResult getInfo(@PathVariable("medHistId") Long medHistId)
    {
        return success(followupMedicationHistoryService.selectFollowupMedicationHistoryByMedHistId(medHistId));
    }

    /**
     * 新增既往用药史
     */
    @PreAuthorize("@ss.hasPermi('FollowSys:medicinehistory:add')")
    @Log(title = "既往用药史", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody FollowupMedicationHistory followupMedicationHistory)
    {
        return toAjax(followupMedicationHistoryService.insertFollowupMedicationHistory(followupMedicationHistory));
    }

    /**
     * 修改既往用药史
     */
    @PreAuthorize("@ss.hasPermi('FollowSys:medicinehistory:edit')")
    @Log(title = "既往用药史", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody FollowupMedicationHistory followupMedicationHistory)
    {
        return toAjax(followupMedicationHistoryService.updateFollowupMedicationHistory(followupMedicationHistory));
    }

    /**
     * 删除既往用药史
     */
    @PreAuthorize("@ss.hasPermi('FollowSys:medicinehistory:remove')")
    @Log(title = "既往用药史", businessType = BusinessType.DELETE)
	@DeleteMapping("/{medHistIds}")
    public AjaxResult remove(@PathVariable Long[] medHistIds)
    {
        return toAjax(followupMedicationHistoryService.deleteFollowupMedicationHistoryByMedHistIds(medHistIds));
    }
}
