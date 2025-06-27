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
import com.ruoyi.BiobankSys.domain.MicrobiomeData;
import com.ruoyi.BiobankSys.service.IMicrobiomeDataService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 微生物组数据Controller
 * 
 * @author ruoyi
 * @date 2025-06-27
 */
@RestController
@RequestMapping("/BiobankSys/microdata")
public class MicrobiomeDataController extends BaseController
{
    @Autowired
    private IMicrobiomeDataService microbiomeDataService;

    /**
     * 查询微生物组数据列表
     */
    @PreAuthorize("@ss.hasPermi('BiobankSys:microdata:list')")
    @GetMapping("/list")
    public TableDataInfo list(MicrobiomeData microbiomeData)
    {
        startPage();
        List<MicrobiomeData> list = microbiomeDataService.selectMicrobiomeDataList(microbiomeData);
        return getDataTable(list);
    }

    /**
     * 导出微生物组数据列表
     */
    @PreAuthorize("@ss.hasPermi('BiobankSys:microdata:export')")
    @Log(title = "微生物组数据", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, MicrobiomeData microbiomeData)
    {
        List<MicrobiomeData> list = microbiomeDataService.selectMicrobiomeDataList(microbiomeData);
        ExcelUtil<MicrobiomeData> util = new ExcelUtil<MicrobiomeData>(MicrobiomeData.class);
        util.exportExcel(response, list, "微生物组数据数据");
    }

    /**
     * 获取微生物组数据详细信息
     */
    @PreAuthorize("@ss.hasPermi('BiobankSys:microdata:query')")
    @GetMapping(value = "/{microbiomeId}")
    public AjaxResult getInfo(@PathVariable("microbiomeId") Long microbiomeId)
    {
        return success(microbiomeDataService.selectMicrobiomeDataByMicrobiomeId(microbiomeId));
    }

    /**
     * 新增微生物组数据
     */
    @PreAuthorize("@ss.hasPermi('BiobankSys:microdata:add')")
    @Log(title = "微生物组数据", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody MicrobiomeData microbiomeData)
    {
        return toAjax(microbiomeDataService.insertMicrobiomeData(microbiomeData));
    }

    /**
     * 修改微生物组数据
     */
    @PreAuthorize("@ss.hasPermi('BiobankSys:microdata:edit')")
    @Log(title = "微生物组数据", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody MicrobiomeData microbiomeData)
    {
        return toAjax(microbiomeDataService.updateMicrobiomeData(microbiomeData));
    }

    /**
     * 删除微生物组数据
     */
    @PreAuthorize("@ss.hasPermi('BiobankSys:microdata:remove')")
    @Log(title = "微生物组数据", businessType = BusinessType.DELETE)
	@DeleteMapping("/{microbiomeIds}")
    public AjaxResult remove(@PathVariable Long[] microbiomeIds)
    {
        return toAjax(microbiomeDataService.deleteMicrobiomeDataByMicrobiomeIds(microbiomeIds));
    }
}
