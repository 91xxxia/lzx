package com.ruoyi.BiobankSys.controller;

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
import com.ruoyi.BiobankSys.domain.DataChangeLog;
import com.ruoyi.BiobankSys.service.IDataChangeLogService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 数据变更日志Controller
 * 
 * @author ruoyi
 * @date 2025-06-27
 */
@RestController
@RequestMapping("/BiobankSys/log")
public class DataChangeLogController extends BaseController
{
    @Autowired
    private IDataChangeLogService dataChangeLogService;

    /**
     * 查询数据变更日志列表
     */
    @PreAuthorize("@ss.hasPermi('BiobankSys:log:list')")
    @GetMapping("/list")
    public TableDataInfo list(DataChangeLog dataChangeLog)
    {
        startPage();
        List<DataChangeLog> list = dataChangeLogService.selectDataChangeLogList(dataChangeLog);
        return getDataTable(list);
    }

    /**
     * 导出数据变更日志列表
     */
    @PreAuthorize("@ss.hasPermi('BiobankSys:log:export')")
    @Log(title = "数据变更日志", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, DataChangeLog dataChangeLog)
    {
        List<DataChangeLog> list = dataChangeLogService.selectDataChangeLogList(dataChangeLog);
        ExcelUtil<DataChangeLog> util = new ExcelUtil<DataChangeLog>(DataChangeLog.class);
        util.exportExcel(response, list, "数据变更日志数据");
    }

    /**
     * 获取数据变更日志详细信息
     */
    @PreAuthorize("@ss.hasPermi('BiobankSys:log:query')")
    @GetMapping(value = "/{logId}")
    public AjaxResult getInfo(@PathVariable("logId") Long logId)
    {
        return success(dataChangeLogService.selectDataChangeLogByLogId(logId));
    }

    /**
     * 新增数据变更日志
     */
    @PreAuthorize("@ss.hasPermi('BiobankSys:log:add')")
    @Log(title = "数据变更日志", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody DataChangeLog dataChangeLog)
    {
        return toAjax(dataChangeLogService.insertDataChangeLog(dataChangeLog));
    }

    /**
     * 修改数据变更日志
     */
    @PreAuthorize("@ss.hasPermi('BiobankSys:log:edit')")
    @Log(title = "数据变更日志", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody DataChangeLog dataChangeLog)
    {
        return toAjax(dataChangeLogService.updateDataChangeLog(dataChangeLog));
    }

    /**
     * 删除数据变更日志
     */
    @PreAuthorize("@ss.hasPermi('BiobankSys:log:remove')")
    @Log(title = "数据变更日志", businessType = BusinessType.DELETE)
	@DeleteMapping("/{logIds}")
    public AjaxResult remove(@PathVariable Long[] logIds)
    {
        return toAjax(dataChangeLogService.deleteDataChangeLogByLogIds(logIds));
    }
}
