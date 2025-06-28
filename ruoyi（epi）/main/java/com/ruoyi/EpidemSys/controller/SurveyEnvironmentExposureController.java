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
import com.ruoyi.EpidemSys.domain.SurveyEnvironmentExposure;
import com.ruoyi.EpidemSys.service.ISurveyEnvironmentExposureService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 家庭环境暴露信息Controller
 * 
 * @author ruoyi
 * @date 2025-06-28
 */
@RestController
@RequestMapping("/EpidemSys/exposure")
public class SurveyEnvironmentExposureController extends BaseController
{
    @Autowired
    private ISurveyEnvironmentExposureService surveyEnvironmentExposureService;

    /**
     * 查询家庭环境暴露信息列表
     */
    @PreAuthorize("@ss.hasPermi('EpidemSys:exposure:list')")
    @GetMapping("/list")
    public TableDataInfo list(SurveyEnvironmentExposure surveyEnvironmentExposure)
    {
        startPage();
        List<SurveyEnvironmentExposure> list = surveyEnvironmentExposureService.selectSurveyEnvironmentExposureList(surveyEnvironmentExposure);
        return getDataTable(list);
    }

    /**
     * 导出家庭环境暴露信息列表
     */
    @PreAuthorize("@ss.hasPermi('EpidemSys:exposure:export')")
    @Log(title = "家庭环境暴露信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, SurveyEnvironmentExposure surveyEnvironmentExposure)
    {
        List<SurveyEnvironmentExposure> list = surveyEnvironmentExposureService.selectSurveyEnvironmentExposureList(surveyEnvironmentExposure);
        ExcelUtil<SurveyEnvironmentExposure> util = new ExcelUtil<SurveyEnvironmentExposure>(SurveyEnvironmentExposure.class);
        util.exportExcel(response, list, "家庭环境暴露信息数据");
    }

    /**
     * 获取家庭环境暴露信息详细信息
     */
    @PreAuthorize("@ss.hasPermi('EpidemSys:exposure:query')")
    @GetMapping(value = "/{envId}")
    public AjaxResult getInfo(@PathVariable("envId") Long envId)
    {
        return success(surveyEnvironmentExposureService.selectSurveyEnvironmentExposureByEnvId(envId));
    }

    /**
     * 新增家庭环境暴露信息
     */
    @PreAuthorize("@ss.hasPermi('EpidemSys:exposure:add')")
    @Log(title = "家庭环境暴露信息", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody SurveyEnvironmentExposure surveyEnvironmentExposure)
    {
        return toAjax(surveyEnvironmentExposureService.insertSurveyEnvironmentExposure(surveyEnvironmentExposure));
    }

    /**
     * 修改家庭环境暴露信息
     */
    @PreAuthorize("@ss.hasPermi('EpidemSys:exposure:edit')")
    @Log(title = "家庭环境暴露信息", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody SurveyEnvironmentExposure surveyEnvironmentExposure)
    {
        return toAjax(surveyEnvironmentExposureService.updateSurveyEnvironmentExposure(surveyEnvironmentExposure));
    }

    /**
     * 删除家庭环境暴露信息
     */
    @PreAuthorize("@ss.hasPermi('EpidemSys:exposure:remove')")
    @Log(title = "家庭环境暴露信息", businessType = BusinessType.DELETE)
	@DeleteMapping("/{envIds}")
    public AjaxResult remove(@PathVariable Long[] envIds)
    {
        return toAjax(surveyEnvironmentExposureService.deleteSurveyEnvironmentExposureByEnvIds(envIds));
    }
}
