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
import com.ruoyi.EpidemSys.domain.SurveyConfoundingFactors;
import com.ruoyi.EpidemSys.service.ISurveyConfoundingFactorsService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 其他潜在混杂因素Controller
 * 
 * @author ruoyi
 * @date 2025-06-28
 */
@RestController
@RequestMapping("/EpidemSys/factors")
public class SurveyConfoundingFactorsController extends BaseController
{
    @Autowired
    private ISurveyConfoundingFactorsService surveyConfoundingFactorsService;

    /**
     * 查询其他潜在混杂因素列表
     */
    @PreAuthorize("@ss.hasPermi('EpidemSys:factors:list')")
    @GetMapping("/list")
    public TableDataInfo list(SurveyConfoundingFactors surveyConfoundingFactors)
    {
        startPage();
        List<SurveyConfoundingFactors> list = surveyConfoundingFactorsService.selectSurveyConfoundingFactorsList(surveyConfoundingFactors);
        return getDataTable(list);
    }

    /**
     * 导出其他潜在混杂因素列表
     */
    @PreAuthorize("@ss.hasPermi('EpidemSys:factors:export')")
    @Log(title = "其他潜在混杂因素", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, SurveyConfoundingFactors surveyConfoundingFactors)
    {
        List<SurveyConfoundingFactors> list = surveyConfoundingFactorsService.selectSurveyConfoundingFactorsList(surveyConfoundingFactors);
        ExcelUtil<SurveyConfoundingFactors> util = new ExcelUtil<SurveyConfoundingFactors>(SurveyConfoundingFactors.class);
        util.exportExcel(response, list, "其他潜在混杂因素数据");
    }

    /**
     * 获取其他潜在混杂因素详细信息
     */
    @PreAuthorize("@ss.hasPermi('EpidemSys:factors:query')")
    @GetMapping(value = "/{confoundId}")
    public AjaxResult getInfo(@PathVariable("confoundId") Long confoundId)
    {
        return success(surveyConfoundingFactorsService.selectSurveyConfoundingFactorsByConfoundId(confoundId));
    }

    /**
     * 新增其他潜在混杂因素
     */
    @PreAuthorize("@ss.hasPermi('EpidemSys:factors:add')")
    @Log(title = "其他潜在混杂因素", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody SurveyConfoundingFactors surveyConfoundingFactors)
    {
        return toAjax(surveyConfoundingFactorsService.insertSurveyConfoundingFactors(surveyConfoundingFactors));
    }

    /**
     * 修改其他潜在混杂因素
     */
    @PreAuthorize("@ss.hasPermi('EpidemSys:factors:edit')")
    @Log(title = "其他潜在混杂因素", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody SurveyConfoundingFactors surveyConfoundingFactors)
    {
        return toAjax(surveyConfoundingFactorsService.updateSurveyConfoundingFactors(surveyConfoundingFactors));
    }

    /**
     * 删除其他潜在混杂因素
     */
    @PreAuthorize("@ss.hasPermi('EpidemSys:factors:remove')")
    @Log(title = "其他潜在混杂因素", businessType = BusinessType.DELETE)
	@DeleteMapping("/{confoundIds}")
    public AjaxResult remove(@PathVariable Long[] confoundIds)
    {
        return toAjax(surveyConfoundingFactorsService.deleteSurveyConfoundingFactorsByConfoundIds(confoundIds));
    }
}
