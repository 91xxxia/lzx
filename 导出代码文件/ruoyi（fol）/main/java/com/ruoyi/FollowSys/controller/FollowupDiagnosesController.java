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
import com.ruoyi.FollowSys.domain.FollowupDiagnoses;
import com.ruoyi.FollowSys.service.IFollowupDiagnosesService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 疾病诊断Controller
 * 
 * @author ruoyi
 * @date 2025-06-28
 */
@RestController
@RequestMapping("/FollowSys/diagnoses")
public class FollowupDiagnosesController extends BaseController
{
    @Autowired
    private IFollowupDiagnosesService followupDiagnosesService;

    /**
     * 查询疾病诊断列表
     */
    @PreAuthorize("@ss.hasPermi('FollowSys:diagnoses:list')")
    @GetMapping("/list")
    public TableDataInfo list(FollowupDiagnoses followupDiagnoses)
    {
        startPage();
        List<FollowupDiagnoses> list = followupDiagnosesService.selectFollowupDiagnosesList(followupDiagnoses);
        return getDataTable(list);
    }

    /**
     * 导出疾病诊断列表
     */
    @PreAuthorize("@ss.hasPermi('FollowSys:diagnoses:export')")
    @Log(title = "疾病诊断", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, FollowupDiagnoses followupDiagnoses)
    {
        List<FollowupDiagnoses> list = followupDiagnosesService.selectFollowupDiagnosesList(followupDiagnoses);
        ExcelUtil<FollowupDiagnoses> util = new ExcelUtil<FollowupDiagnoses>(FollowupDiagnoses.class);
        util.exportExcel(response, list, "疾病诊断数据");
    }

    /**
     * 获取疾病诊断详细信息
     */
    @PreAuthorize("@ss.hasPermi('FollowSys:diagnoses:query')")
    @GetMapping(value = "/{diagnosisId}")
    public AjaxResult getInfo(@PathVariable("diagnosisId") Long diagnosisId)
    {
        return success(followupDiagnosesService.selectFollowupDiagnosesByDiagnosisId(diagnosisId));
    }

    /**
     * 新增疾病诊断
     */
    @PreAuthorize("@ss.hasPermi('FollowSys:diagnoses:add')")
    @Log(title = "疾病诊断", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody FollowupDiagnoses followupDiagnoses)
    {
        return toAjax(followupDiagnosesService.insertFollowupDiagnoses(followupDiagnoses));
    }

    /**
     * 修改疾病诊断
     */
    @PreAuthorize("@ss.hasPermi('FollowSys:diagnoses:edit')")
    @Log(title = "疾病诊断", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody FollowupDiagnoses followupDiagnoses)
    {
        return toAjax(followupDiagnosesService.updateFollowupDiagnoses(followupDiagnoses));
    }

    /**
     * 删除疾病诊断
     */
    @PreAuthorize("@ss.hasPermi('FollowSys:diagnoses:remove')")
    @Log(title = "疾病诊断", businessType = BusinessType.DELETE)
	@DeleteMapping("/{diagnosisIds}")
    public AjaxResult remove(@PathVariable Long[] diagnosisIds)
    {
        return toAjax(followupDiagnosesService.deleteFollowupDiagnosesByDiagnosisIds(diagnosisIds));
    }
}
