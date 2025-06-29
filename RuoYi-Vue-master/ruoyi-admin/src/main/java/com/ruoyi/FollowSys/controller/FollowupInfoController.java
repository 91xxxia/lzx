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
import com.ruoyi.FollowSys.domain.FollowupInfo;
import com.ruoyi.FollowSys.service.IFollowupInfoService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 随访基本信息Controller
 * 
 * @author ruoyi
 * @date 2025-06-28
 */
@RestController
@RequestMapping("/FollowSys/info")
public class FollowupInfoController extends BaseController
{
    @Autowired
    private IFollowupInfoService followupInfoService;

    /**
     * 查询随访基本信息列表
     */
    @PreAuthorize("@ss.hasPermi('FollowSys:info:list')")
    @GetMapping("/list")
    public TableDataInfo list(FollowupInfo followupInfo)
    {
        startPage();
        List<FollowupInfo> list = followupInfoService.selectFollowupInfoList(followupInfo);
        return getDataTable(list);
    }

    /**
     * 导出随访基本信息列表
     */
    @PreAuthorize("@ss.hasPermi('FollowSys:info:export')")
    @Log(title = "随访基本信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, FollowupInfo followupInfo)
    {
        List<FollowupInfo> list = followupInfoService.selectFollowupInfoList(followupInfo);
        ExcelUtil<FollowupInfo> util = new ExcelUtil<FollowupInfo>(FollowupInfo.class);
        util.exportExcel(response, list, "随访基本信息数据");
    }

    /**
     * 获取随访基本信息详细信息
     */
    @PreAuthorize("@ss.hasPermi('FollowSys:info:query')")
    @GetMapping(value = "/{followupId}")
    public AjaxResult getInfo(@PathVariable("followupId") Long followupId)
    {
        return success(followupInfoService.selectFollowupInfoByFollowupId(followupId));
    }

    /**
     * 新增随访基本信息
     */
    @PreAuthorize("@ss.hasPermi('FollowSys:info:add')")
    @Log(title = "随访基本信息", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody FollowupInfo followupInfo)
    {
        return toAjax(followupInfoService.insertFollowupInfo(followupInfo));
    }

    /**
     * 修改随访基本信息
     */
    @PreAuthorize("@ss.hasPermi('FollowSys:info:edit')")
    @Log(title = "随访基本信息", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody FollowupInfo followupInfo)
    {
        return toAjax(followupInfoService.updateFollowupInfo(followupInfo));
    }

    /**
     * 删除随访基本信息
     */
    @PreAuthorize("@ss.hasPermi('FollowSys:info:remove')")
    @Log(title = "随访基本信息", businessType = BusinessType.DELETE)
	@DeleteMapping("/{followupIds}")
    public AjaxResult remove(@PathVariable Long[] followupIds)
    {
        return toAjax(followupInfoService.deleteFollowupInfoByFollowupIds(followupIds));
    }
}
