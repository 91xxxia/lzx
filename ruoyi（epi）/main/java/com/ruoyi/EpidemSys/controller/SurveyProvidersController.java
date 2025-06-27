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
import com.ruoyi.EpidemSys.domain.SurveyProviders;
import com.ruoyi.EpidemSys.service.ISurveyProvidersService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 医疗调查服务者标识信息Controller
 * 
 * @author ruoyi
 * @date 2025-06-27
 */
@RestController
@RequestMapping("/EpidemSys/providers")
public class SurveyProvidersController extends BaseController
{
    @Autowired
    private ISurveyProvidersService surveyProvidersService;

    /**
     * 查询医疗调查服务者标识信息列表
     */
    @PreAuthorize("@ss.hasPermi('EpidemSys:providers:list')")
    @GetMapping("/list")
    public TableDataInfo list(SurveyProviders surveyProviders)
    {
        startPage();
        List<SurveyProviders> list = surveyProvidersService.selectSurveyProvidersList(surveyProviders);
        return getDataTable(list);
    }

    /**
     * 导出医疗调查服务者标识信息列表
     */
    @PreAuthorize("@ss.hasPermi('EpidemSys:providers:export')")
    @Log(title = "医疗调查服务者标识信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, SurveyProviders surveyProviders)
    {
        List<SurveyProviders> list = surveyProvidersService.selectSurveyProvidersList(surveyProviders);
        ExcelUtil<SurveyProviders> util = new ExcelUtil<SurveyProviders>(SurveyProviders.class);
        util.exportExcel(response, list, "医疗调查服务者标识信息数据");
    }

    /**
     * 获取医疗调查服务者标识信息详细信息
     */
    @PreAuthorize("@ss.hasPermi('EpidemSys:providers:query')")
    @GetMapping(value = "/{providerId}")
    public AjaxResult getInfo(@PathVariable("providerId") Long providerId)
    {
        return success(surveyProvidersService.selectSurveyProvidersByProviderId(providerId));
    }

    /**
     * 新增医疗调查服务者标识信息
     */
    @PreAuthorize("@ss.hasPermi('EpidemSys:providers:add')")
    @Log(title = "医疗调查服务者标识信息", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody SurveyProviders surveyProviders)
    {
        return toAjax(surveyProvidersService.insertSurveyProviders(surveyProviders));
    }

    /**
     * 修改医疗调查服务者标识信息
     */
    @PreAuthorize("@ss.hasPermi('EpidemSys:providers:edit')")
    @Log(title = "医疗调查服务者标识信息", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody SurveyProviders surveyProviders)
    {
        return toAjax(surveyProvidersService.updateSurveyProviders(surveyProviders));
    }

    /**
     * 删除医疗调查服务者标识信息
     */
    @PreAuthorize("@ss.hasPermi('EpidemSys:providers:remove')")
    @Log(title = "医疗调查服务者标识信息", businessType = BusinessType.DELETE)
	@DeleteMapping("/{providerIds}")
    public AjaxResult remove(@PathVariable Long[] providerIds)
    {
        return toAjax(surveyProvidersService.deleteSurveyProvidersByProviderIds(providerIds));
    }
}
