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
import com.ruoyi.BiobankSys.domain.GenomicData;
import com.ruoyi.BiobankSys.service.IGenomicDataService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 基因组数据Controller
 * 
 * @author ruoyi
 * @date 2025-06-29
 */
@RestController
@RequestMapping("/BiobankSys/genodata")
public class GenomicDataController extends BaseController
{
    @Autowired
    private IGenomicDataService genomicDataService;

    /**
     * 查询基因组数据列表
     */
    @PreAuthorize("@ss.hasPermi('BiobankSys:genodata:list')")
    @GetMapping("/list")
    public TableDataInfo list(GenomicData genomicData)
    {
        startPage();
        List<GenomicData> list = genomicDataService.selectGenomicDataList(genomicData);
        return getDataTable(list);
    }

    /**
     * 导出基因组数据列表
     */
    @PreAuthorize("@ss.hasPermi('BiobankSys:genodata:export')")
    @Log(title = "基因组数据", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, GenomicData genomicData)
    {
        List<GenomicData> list = genomicDataService.selectGenomicDataList(genomicData);
        ExcelUtil<GenomicData> util = new ExcelUtil<GenomicData>(GenomicData.class);
        util.exportExcel(response, list, "基因组数据数据");
    }

    /**
     * 获取基因组数据详细信息
     */
    @PreAuthorize("@ss.hasPermi('BiobankSys:genodata:query')")
    @GetMapping(value = "/{genomicId}")
    public AjaxResult getInfo(@PathVariable("genomicId") Long genomicId)
    {
        return success(genomicDataService.selectGenomicDataByGenomicId(genomicId));
    }

    /**
     * 新增基因组数据
     */
    @PreAuthorize("@ss.hasPermi('BiobankSys:genodata:add')")
    @Log(title = "基因组数据", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody GenomicData genomicData)
    {
        return toAjax(genomicDataService.insertGenomicData(genomicData));
    }

    /**
     * 修改基因组数据
     */
    @PreAuthorize("@ss.hasPermi('BiobankSys:genodata:edit')")
    @Log(title = "基因组数据", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody GenomicData genomicData)
    {
        return toAjax(genomicDataService.updateGenomicData(genomicData));
    }

    /**
     * 删除基因组数据
     */
    @PreAuthorize("@ss.hasPermi('BiobankSys:genodata:remove')")
    @Log(title = "基因组数据", businessType = BusinessType.DELETE)
	@DeleteMapping("/{genomicIds}")
    public AjaxResult remove(@PathVariable Long[] genomicIds)
    {
        return toAjax(genomicDataService.deleteGenomicDataByGenomicIds(genomicIds));
    }
}
