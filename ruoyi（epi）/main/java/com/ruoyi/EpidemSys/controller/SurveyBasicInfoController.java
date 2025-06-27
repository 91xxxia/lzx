package com.ruoyi.EpidemSys.controller;

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
import com.ruoyi.EpidemSys.domain.SurveyBasicInfo;
import com.ruoyi.EpidemSys.service.ISurveyBasicInfoService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 患儿基本信息Controller
 * 
 * @author ruoyi
 * @date 2025-06-27
 */
@RestController
@RequestMapping("/EpidemSys/info")
public class SurveyBasicInfoController extends BaseController
{
    @Autowired
    private ISurveyBasicInfoService surveyBasicInfoService;

    /**
     * 查询患儿基本信息列表
     */
    @PreAuthorize("@ss.hasPermi('EpidemSys:info:list')")
    @GetMapping("/list")
    public TableDataInfo list(SurveyBasicInfo surveyBasicInfo)
    {
        startPage();
        List<SurveyBasicInfo> list = surveyBasicInfoService.selectSurveyBasicInfoList(surveyBasicInfo);
        return getDataTable(list);
    }

    /**
     * 导出患儿基本信息列表
     */
    @PreAuthorize("@ss.hasPermi('EpidemSys:info:export')")
    @Log(title = "患儿基本信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, SurveyBasicInfo surveyBasicInfo)
    {
        List<SurveyBasicInfo> list = surveyBasicInfoService.selectSurveyBasicInfoList(surveyBasicInfo);
        ExcelUtil<SurveyBasicInfo> util = new ExcelUtil<SurveyBasicInfo>(SurveyBasicInfo.class);
        util.exportExcel(response, list, "患儿基本信息数据");
    }

    /**
     * 获取患儿基本信息详细信息
     */
    @PreAuthorize("@ss.hasPermi('EpidemSys:info:query')")
    @GetMapping(value = "/{surveyId}")
    public AjaxResult getInfo(@PathVariable("surveyId") Long surveyId)
    {
        return success(surveyBasicInfoService.selectSurveyBasicInfoBySurveyId(surveyId));
    }

    /**
     * 新增患儿基本信息
     */
    @PreAuthorize("@ss.hasPermi('EpidemSys:info:add')")
    @Log(title = "患儿基本信息", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody SurveyBasicInfo surveyBasicInfo)
    {
        return toAjax(surveyBasicInfoService.insertSurveyBasicInfo(surveyBasicInfo));
    }

    /**
     * 修改患儿基本信息
     */
    @PreAuthorize("@ss.hasPermi('EpidemSys:info:edit')")
    @Log(title = "患儿基本信息", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody SurveyBasicInfo surveyBasicInfo)
    {
        return toAjax(surveyBasicInfoService.updateSurveyBasicInfo(surveyBasicInfo));
    }

    /**
     * 删除患儿基本信息
     */
    @PreAuthorize("@ss.hasPermi('EpidemSys:info:remove')")
    @Log(title = "患儿基本信息", businessType = BusinessType.DELETE)
	@DeleteMapping("/{surveyIds}")
    public AjaxResult remove(@PathVariable Long[] surveyIds)
    {
        return toAjax(surveyBasicInfoService.deleteSurveyBasicInfoBySurveyIds(surveyIds));
    }
}
