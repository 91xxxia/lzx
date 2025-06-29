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
import com.ruoyi.FollowSys.domain.FollowupPhysicalExam;
import com.ruoyi.FollowSys.service.IFollowupPhysicalExamService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 体征Controller
 * 
 * @author ruoyi
 * @date 2025-06-28
 */
@RestController
@RequestMapping("/FollowSys/exam")
public class FollowupPhysicalExamController extends BaseController
{
    @Autowired
    private IFollowupPhysicalExamService followupPhysicalExamService;

    /**
     * 查询体征列表
     */
    @PreAuthorize("@ss.hasPermi('FollowSys:exam:list')")
    @GetMapping("/list")
    public TableDataInfo list(FollowupPhysicalExam followupPhysicalExam)
    {
        startPage();
        List<FollowupPhysicalExam> list = followupPhysicalExamService.selectFollowupPhysicalExamList(followupPhysicalExam);
        return getDataTable(list);
    }

    /**
     * 导出体征列表
     */
    @PreAuthorize("@ss.hasPermi('FollowSys:exam:export')")
    @Log(title = "体征", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, FollowupPhysicalExam followupPhysicalExam)
    {
        List<FollowupPhysicalExam> list = followupPhysicalExamService.selectFollowupPhysicalExamList(followupPhysicalExam);
        ExcelUtil<FollowupPhysicalExam> util = new ExcelUtil<FollowupPhysicalExam>(FollowupPhysicalExam.class);
        util.exportExcel(response, list, "体征数据");
    }

    /**
     * 获取体征详细信息
     */
    @PreAuthorize("@ss.hasPermi('FollowSys:exam:query')")
    @GetMapping(value = "/{examId}")
    public AjaxResult getInfo(@PathVariable("examId") Long examId)
    {
        return success(followupPhysicalExamService.selectFollowupPhysicalExamByExamId(examId));
    }

    /**
     * 新增体征
     */
    @PreAuthorize("@ss.hasPermi('FollowSys:exam:add')")
    @Log(title = "体征", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody FollowupPhysicalExam followupPhysicalExam)
    {
        return toAjax(followupPhysicalExamService.insertFollowupPhysicalExam(followupPhysicalExam));
    }

    /**
     * 修改体征
     */
    @PreAuthorize("@ss.hasPermi('FollowSys:exam:edit')")
    @Log(title = "体征", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody FollowupPhysicalExam followupPhysicalExam)
    {
        return toAjax(followupPhysicalExamService.updateFollowupPhysicalExam(followupPhysicalExam));
    }

    /**
     * 删除体征
     */
    @PreAuthorize("@ss.hasPermi('FollowSys:exam:remove')")
    @Log(title = "体征", businessType = BusinessType.DELETE)
	@DeleteMapping("/{examIds}")
    public AjaxResult remove(@PathVariable Long[] examIds)
    {
        return toAjax(followupPhysicalExamService.deleteFollowupPhysicalExamByExamIds(examIds));
    }
}
