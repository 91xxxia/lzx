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
import com.ruoyi.BiobankSys.domain.ProteomicData;
import com.ruoyi.BiobankSys.service.IProteomicDataService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 蛋白质组数据Controller
 * 
 * @author ruoyi
 * @date 2025-06-29
 */
@RestController
@RequestMapping("/BiobankSys/prodata")
public class ProteomicDataController extends BaseController
{
    @Autowired
    private IProteomicDataService proteomicDataService;

    /**
     * 查询蛋白质组数据列表
     */
    @PreAuthorize("@ss.hasPermi('BiobankSys:prodata:list')")
    @GetMapping("/list")
    public TableDataInfo list(ProteomicData proteomicData)
    {
        startPage();
        List<ProteomicData> list = proteomicDataService.selectProteomicDataList(proteomicData);
        return getDataTable(list);
    }

    /**
     * 导出蛋白质组数据列表
     */
    @PreAuthorize("@ss.hasPermi('BiobankSys:prodata:export')")
    @Log(title = "蛋白质组数据", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, ProteomicData proteomicData)
    {
        List<ProteomicData> list = proteomicDataService.selectProteomicDataList(proteomicData);
        ExcelUtil<ProteomicData> util = new ExcelUtil<ProteomicData>(ProteomicData.class);
        util.exportExcel(response, list, "蛋白质组数据数据");
    }

    /**
     * 获取蛋白质组数据详细信息
     */
    @PreAuthorize("@ss.hasPermi('BiobankSys:prodata:query')")
    @GetMapping(value = "/{proteomicId}")
    public AjaxResult getInfo(@PathVariable("proteomicId") Long proteomicId)
    {
        return success(proteomicDataService.selectProteomicDataByProteomicId(proteomicId));
    }

    /**
     * 新增蛋白质组数据
     */
    @PreAuthorize("@ss.hasPermi('BiobankSys:prodata:add')")
    @Log(title = "蛋白质组数据", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody ProteomicData proteomicData)
    {
        return toAjax(proteomicDataService.insertProteomicData(proteomicData));
    }

    /**
     * 修改蛋白质组数据
     */
    @PreAuthorize("@ss.hasPermi('BiobankSys:prodata:edit')")
    @Log(title = "蛋白质组数据", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody ProteomicData proteomicData)
    {
        return toAjax(proteomicDataService.updateProteomicData(proteomicData));
    }

    /**
     * 删除蛋白质组数据
     */
    @PreAuthorize("@ss.hasPermi('BiobankSys:prodata:remove')")
    @Log(title = "蛋白质组数据", businessType = BusinessType.DELETE)
	@DeleteMapping("/{proteomicIds}")
    public AjaxResult remove(@PathVariable Long[] proteomicIds)
    {
        return toAjax(proteomicDataService.deleteProteomicDataByProteomicIds(proteomicIds));
    }
}
