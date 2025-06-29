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
import com.ruoyi.ClinicalSys.domain.History;
import com.ruoyi.ClinicalSys.service.IHistoryService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 既往史Controller
 * 
 * @author ruoyi
 * @date 2025-06-27
 */
@RestController
@RequestMapping("/ClinicalSys/history")
public class HistoryController extends BaseController
{
    @Autowired
    private IHistoryService historyService;

    /**
     * 查询既往史列表
     */
    @PreAuthorize("@ss.hasPermi('ClinicalSys:history:list')")
    @GetMapping("/list")
    public TableDataInfo list(History history)
    {
        startPage();
        List<History> list = historyService.selectHistoryList(history);
        return getDataTable(list);
    }

    /**
     * 导出既往史列表
     */
    @PreAuthorize("@ss.hasPermi('ClinicalSys:history:export')")
    @Log(title = "既往史", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, History history)
    {
        List<History> list = historyService.selectHistoryList(history);
        ExcelUtil<History> util = new ExcelUtil<History>(History.class);
        util.exportExcel(response, list, "既往史数据");
    }

    /**
     * 获取既往史详细信息
     */
    @PreAuthorize("@ss.hasPermi('ClinicalSys:history:query')")
    @GetMapping(value = "/{historyId}")
    public AjaxResult getInfo(@PathVariable("historyId") Long historyId)
    {
        return success(historyService.selectHistoryByHistoryId(historyId));
    }

    /**
     * 新增既往史
     */
    @PreAuthorize("@ss.hasPermi('ClinicalSys:history:add')")
    @Log(title = "既往史", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody History history)
    {
        return toAjax(historyService.insertHistory(history));
    }

    /**
     * 修改既往史
     */
    @PreAuthorize("@ss.hasPermi('ClinicalSys:history:edit')")
    @Log(title = "既往史", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody History history)
    {
        return toAjax(historyService.updateHistory(history));
    }

    /**
     * 删除既往史
     */
    @PreAuthorize("@ss.hasPermi('ClinicalSys:history:remove')")
    @Log(title = "既往史", businessType = BusinessType.DELETE)
	@DeleteMapping("/{historyIds}")
    public AjaxResult remove(@PathVariable Long[] historyIds)
    {
        return toAjax(historyService.deleteHistoryByHistoryIds(historyIds));
    }
}
