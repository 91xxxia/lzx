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
import com.ruoyi.BiobankSys.domain.MetabolomicData;
import com.ruoyi.BiobankSys.service.IMetabolomicDataService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 代谢组数据Controller
 * 
 * @author ruoyi
 * @date 2025-06-27
 */
@RestController
@RequestMapping("/BiobankSys/metadata")
public class MetabolomicDataController extends BaseController
{
    @Autowired
    private IMetabolomicDataService metabolomicDataService;

    /**
     * 查询代谢组数据列表
     */
    @PreAuthorize("@ss.hasPermi('BiobankSys:metadata:list')")
    @GetMapping("/list")
    public TableDataInfo list(MetabolomicData metabolomicData)
    {
        startPage();
        List<MetabolomicData> list = metabolomicDataService.selectMetabolomicDataList(metabolomicData);
        return getDataTable(list);
    }

    /**
     * 导出代谢组数据列表
     */
    @PreAuthorize("@ss.hasPermi('BiobankSys:metadata:export')")
    @Log(title = "代谢组数据", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, MetabolomicData metabolomicData)
    {
        List<MetabolomicData> list = metabolomicDataService.selectMetabolomicDataList(metabolomicData);
        ExcelUtil<MetabolomicData> util = new ExcelUtil<MetabolomicData>(MetabolomicData.class);
        util.exportExcel(response, list, "代谢组数据数据");
    }

    /**
     * 获取代谢组数据详细信息
     */
    @PreAuthorize("@ss.hasPermi('BiobankSys:metadata:query')")
    @GetMapping(value = "/{metabolomicId}")
    public AjaxResult getInfo(@PathVariable("metabolomicId") Long metabolomicId)
    {
        return success(metabolomicDataService.selectMetabolomicDataByMetabolomicId(metabolomicId));
    }

    /**
     * 新增代谢组数据
     */
    @PreAuthorize("@ss.hasPermi('BiobankSys:metadata:add')")
    @Log(title = "代谢组数据", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody MetabolomicData metabolomicData)
    {
        return toAjax(metabolomicDataService.insertMetabolomicData(metabolomicData));
    }

    /**
     * 修改代谢组数据
     */
    @PreAuthorize("@ss.hasPermi('BiobankSys:metadata:edit')")
    @Log(title = "代谢组数据", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody MetabolomicData metabolomicData)
    {
        return toAjax(metabolomicDataService.updateMetabolomicData(metabolomicData));
    }

    /**
     * 删除代谢组数据
     */
    @PreAuthorize("@ss.hasPermi('BiobankSys:metadata:remove')")
    @Log(title = "代谢组数据", businessType = BusinessType.DELETE)
	@DeleteMapping("/{metabolomicIds}")
    public AjaxResult remove(@PathVariable Long[] metabolomicIds)
    {
        return toAjax(metabolomicDataService.deleteMetabolomicDataByMetabolomicIds(metabolomicIds));
    }
}
