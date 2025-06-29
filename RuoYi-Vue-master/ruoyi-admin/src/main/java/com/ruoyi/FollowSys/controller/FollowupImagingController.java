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
import com.ruoyi.FollowSys.domain.FollowupImaging;
import com.ruoyi.FollowSys.service.IFollowupImagingService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 影像学检查Controller
 * 
 * @author ruoyi
 * @date 2025-06-28
 */
@RestController
@RequestMapping("/FollowSys/imaging")
public class FollowupImagingController extends BaseController
{
    @Autowired
    private IFollowupImagingService followupImagingService;

    /**
     * 查询影像学检查列表
     */
    @PreAuthorize("@ss.hasPermi('FollowSys:imaging:list')")
    @GetMapping("/list")
    public TableDataInfo list(FollowupImaging followupImaging)
    {
        startPage();
        List<FollowupImaging> list = followupImagingService.selectFollowupImagingList(followupImaging);
        return getDataTable(list);
    }

    /**
     * 导出影像学检查列表
     */
    @PreAuthorize("@ss.hasPermi('FollowSys:imaging:export')")
    @Log(title = "影像学检查", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, FollowupImaging followupImaging)
    {
        List<FollowupImaging> list = followupImagingService.selectFollowupImagingList(followupImaging);
        ExcelUtil<FollowupImaging> util = new ExcelUtil<FollowupImaging>(FollowupImaging.class);
        util.exportExcel(response, list, "影像学检查数据");
    }

    /**
     * 获取影像学检查详细信息
     */
    @PreAuthorize("@ss.hasPermi('FollowSys:imaging:query')")
    @GetMapping(value = "/{imagingId}")
    public AjaxResult getInfo(@PathVariable("imagingId") Long imagingId)
    {
        return success(followupImagingService.selectFollowupImagingByImagingId(imagingId));
    }

    /**
     * 新增影像学检查
     */
    @PreAuthorize("@ss.hasPermi('FollowSys:imaging:add')")
    @Log(title = "影像学检查", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody FollowupImaging followupImaging)
    {
        return toAjax(followupImagingService.insertFollowupImaging(followupImaging));
    }

    /**
     * 修改影像学检查
     */
    @PreAuthorize("@ss.hasPermi('FollowSys:imaging:edit')")
    @Log(title = "影像学检查", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody FollowupImaging followupImaging)
    {
        return toAjax(followupImagingService.updateFollowupImaging(followupImaging));
    }

    /**
     * 删除影像学检查
     */
    @PreAuthorize("@ss.hasPermi('FollowSys:imaging:remove')")
    @Log(title = "影像学检查", businessType = BusinessType.DELETE)
	@DeleteMapping("/{imagingIds}")
    public AjaxResult remove(@PathVariable Long[] imagingIds)
    {
        return toAjax(followupImagingService.deleteFollowupImagingByImagingIds(imagingIds));
    }
}
