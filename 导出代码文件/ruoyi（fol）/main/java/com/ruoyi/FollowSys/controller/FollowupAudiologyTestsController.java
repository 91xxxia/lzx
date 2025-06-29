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
import com.ruoyi.FollowSys.domain.FollowupAudiologyTests;
import com.ruoyi.FollowSys.service.IFollowupAudiologyTestsService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 听力检查Controller
 * 
 * @author ruoyi
 * @date 2025-06-28
 */
@RestController
@RequestMapping("/FollowSys/audiotests")
public class FollowupAudiologyTestsController extends BaseController
{
    @Autowired
    private IFollowupAudiologyTestsService followupAudiologyTestsService;

    /**
     * 查询听力检查列表
     */
    @PreAuthorize("@ss.hasPermi('FollowSys:audiotests:list')")
    @GetMapping("/list")
    public TableDataInfo list(FollowupAudiologyTests followupAudiologyTests)
    {
        startPage();
        List<FollowupAudiologyTests> list = followupAudiologyTestsService.selectFollowupAudiologyTestsList(followupAudiologyTests);
        return getDataTable(list);
    }

    /**
     * 导出听力检查列表
     */
    @PreAuthorize("@ss.hasPermi('FollowSys:audiotests:export')")
    @Log(title = "听力检查", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, FollowupAudiologyTests followupAudiologyTests)
    {
        List<FollowupAudiologyTests> list = followupAudiologyTestsService.selectFollowupAudiologyTestsList(followupAudiologyTests);
        ExcelUtil<FollowupAudiologyTests> util = new ExcelUtil<FollowupAudiologyTests>(FollowupAudiologyTests.class);
        util.exportExcel(response, list, "听力检查数据");
    }

    /**
     * 获取听力检查详细信息
     */
    @PreAuthorize("@ss.hasPermi('FollowSys:audiotests:query')")
    @GetMapping(value = "/{audioId}")
    public AjaxResult getInfo(@PathVariable("audioId") Long audioId)
    {
        return success(followupAudiologyTestsService.selectFollowupAudiologyTestsByAudioId(audioId));
    }

    /**
     * 新增听力检查
     */
    @PreAuthorize("@ss.hasPermi('FollowSys:audiotests:add')")
    @Log(title = "听力检查", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody FollowupAudiologyTests followupAudiologyTests)
    {
        return toAjax(followupAudiologyTestsService.insertFollowupAudiologyTests(followupAudiologyTests));
    }

    /**
     * 修改听力检查
     */
    @PreAuthorize("@ss.hasPermi('FollowSys:audiotests:edit')")
    @Log(title = "听力检查", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody FollowupAudiologyTests followupAudiologyTests)
    {
        return toAjax(followupAudiologyTestsService.updateFollowupAudiologyTests(followupAudiologyTests));
    }

    /**
     * 删除听力检查
     */
    @PreAuthorize("@ss.hasPermi('FollowSys:audiotests:remove')")
    @Log(title = "听力检查", businessType = BusinessType.DELETE)
	@DeleteMapping("/{audioIds}")
    public AjaxResult remove(@PathVariable Long[] audioIds)
    {
        return toAjax(followupAudiologyTestsService.deleteFollowupAudiologyTestsByAudioIds(audioIds));
    }
}
