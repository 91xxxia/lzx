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
import com.ruoyi.ClinicalSys.domain.Imaging;
import com.ruoyi.ClinicalSys.service.IImagingService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 影像学检查Controller
 * 
 * @author ruoyi
 * @date 2025-06-27
 */
@RestController
@RequestMapping("/ClinicalSys/imaging")
public class ImagingController extends BaseController
{
    @Autowired
    private IImagingService imagingService;

    /**
     * 查询影像学检查列表
     */
    @PreAuthorize("@ss.hasPermi('ClinicalSys:imaging:list')")
    @GetMapping("/list")
    public TableDataInfo list(Imaging imaging)
    {
        startPage();
        List<Imaging> list = imagingService.selectImagingList(imaging);
        return getDataTable(list);
    }

    /**
     * 导出影像学检查列表
     */
    @PreAuthorize("@ss.hasPermi('ClinicalSys:imaging:export')")
    @Log(title = "影像学检查", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Imaging imaging)
    {
        List<Imaging> list = imagingService.selectImagingList(imaging);
        ExcelUtil<Imaging> util = new ExcelUtil<Imaging>(Imaging.class);
        util.exportExcel(response, list, "影像学检查数据");
    }

    /**
     * 获取影像学检查详细信息
     */
    @PreAuthorize("@ss.hasPermi('ClinicalSys:imaging:query')")
    @GetMapping(value = "/{imagingId}")
    public AjaxResult getInfo(@PathVariable("imagingId") Long imagingId)
    {
        return success(imagingService.selectImagingByImagingId(imagingId));
    }

    /**
     * 新增影像学检查
     */
    @PreAuthorize("@ss.hasPermi('ClinicalSys:imaging:add')")
    @Log(title = "影像学检查", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Imaging imaging)
    {
        return toAjax(imagingService.insertImaging(imaging));
    }

    /**
     * 修改影像学检查
     */
    @PreAuthorize("@ss.hasPermi('ClinicalSys:imaging:edit')")
    @Log(title = "影像学检查", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Imaging imaging)
    {
        return toAjax(imagingService.updateImaging(imaging));
    }

    /**
     * 删除影像学检查
     */
    @PreAuthorize("@ss.hasPermi('ClinicalSys:imaging:remove')")
    @Log(title = "影像学检查", businessType = BusinessType.DELETE)
	@DeleteMapping("/{imagingIds}")
    public AjaxResult remove(@PathVariable Long[] imagingIds)
    {
        return toAjax(imagingService.deleteImagingByImagingIds(imagingIds));
    }
}
