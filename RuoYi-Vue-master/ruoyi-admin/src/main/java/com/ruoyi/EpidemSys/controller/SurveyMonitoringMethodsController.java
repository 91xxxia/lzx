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
import com.ruoyi.EpidemSys.domain.SurveyMonitoringMethods;
import com.ruoyi.EpidemSys.service.ISurveyMonitoringMethodsService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 环境监测方法Controller
 * 
 * @author ruoyi
 * @date 2025-06-28
 */
@RestController
@RequestMapping("/EpidemSys/methods")
public class SurveyMonitoringMethodsController extends BaseController
{
    @Autowired
    private ISurveyMonitoringMethodsService surveyMonitoringMethodsService;

    /**
     * 查询环境监测方法列表
     */
    @PreAuthorize("@ss.hasPermi('EpidemSys:methods:list')")
    @GetMapping("/list")
    public TableDataInfo list(SurveyMonitoringMethods surveyMonitoringMethods)
    {
        startPage();
        List<SurveyMonitoringMethods> list = surveyMonitoringMethodsService.selectSurveyMonitoringMethodsList(surveyMonitoringMethods);
        return getDataTable(list);
    }

    /**
     * 导出环境监测方法列表
     */
    @PreAuthorize("@ss.hasPermi('EpidemSys:methods:export')")
    @Log(title = "环境监测方法", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, SurveyMonitoringMethods surveyMonitoringMethods)
    {
        List<SurveyMonitoringMethods> list = surveyMonitoringMethodsService.selectSurveyMonitoringMethodsList(surveyMonitoringMethods);
        ExcelUtil<SurveyMonitoringMethods> util = new ExcelUtil<SurveyMonitoringMethods>(SurveyMonitoringMethods.class);
        util.exportExcel(response, list, "环境监测方法数据");
    }

    /**
     * 获取环境监测方法详细信息
     */
    @PreAuthorize("@ss.hasPermi('EpidemSys:methods:query')")
    @GetMapping(value = "/{methodId}")
    public AjaxResult getInfo(@PathVariable("methodId") Long methodId)
    {
        return success(surveyMonitoringMethodsService.selectSurveyMonitoringMethodsByMethodId(methodId));
    }

    /**
     * 新增环境监测方法
     */
    @PreAuthorize("@ss.hasPermi('EpidemSys:methods:add')")
    @Log(title = "环境监测方法", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody SurveyMonitoringMethods surveyMonitoringMethods)
    {
        return toAjax(surveyMonitoringMethodsService.insertSurveyMonitoringMethods(surveyMonitoringMethods));
    }

    /**
     * 修改环境监测方法
     */
    @PreAuthorize("@ss.hasPermi('EpidemSys:methods:edit')")
    @Log(title = "环境监测方法", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody SurveyMonitoringMethods surveyMonitoringMethods)
    {
        return toAjax(surveyMonitoringMethodsService.updateSurveyMonitoringMethods(surveyMonitoringMethods));
    }

    /**
     * 删除环境监测方法
     */
    @PreAuthorize("@ss.hasPermi('EpidemSys:methods:remove')")
    @Log(title = "环境监测方法", businessType = BusinessType.DELETE)
	@DeleteMapping("/{methodIds}")
    public AjaxResult remove(@PathVariable Long[] methodIds)
    {
        return toAjax(surveyMonitoringMethodsService.deleteSurveyMonitoringMethodsByMethodIds(methodIds));
    }
}
