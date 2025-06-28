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
import com.ruoyi.EpidemSys.domain.SurveyAreaEnvironment;
import com.ruoyi.EpidemSys.service.ISurveyAreaEnvironmentService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 城乡环境监测数据Controller
 * 
 * @author ruoyi
 * @date 2025-06-28
 */
@RestController
@RequestMapping("/EpidemSys/SAenvironment")
public class SurveyAreaEnvironmentController extends BaseController
{
    @Autowired
    private ISurveyAreaEnvironmentService surveyAreaEnvironmentService;

    /**
     * 查询城乡环境监测数据列表
     */
    @PreAuthorize("@ss.hasPermi('EpidemSys:SAenvironment:list')")
    @GetMapping("/list")
    public TableDataInfo list(SurveyAreaEnvironment surveyAreaEnvironment)
    {
        startPage();
        List<SurveyAreaEnvironment> list = surveyAreaEnvironmentService.selectSurveyAreaEnvironmentList(surveyAreaEnvironment);
        return getDataTable(list);
    }

    /**
     * 导出城乡环境监测数据列表
     */
    @PreAuthorize("@ss.hasPermi('EpidemSys:SAenvironment:export')")
    @Log(title = "城乡环境监测数据", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, SurveyAreaEnvironment surveyAreaEnvironment)
    {
        List<SurveyAreaEnvironment> list = surveyAreaEnvironmentService.selectSurveyAreaEnvironmentList(surveyAreaEnvironment);
        ExcelUtil<SurveyAreaEnvironment> util = new ExcelUtil<SurveyAreaEnvironment>(SurveyAreaEnvironment.class);
        util.exportExcel(response, list, "城乡环境监测数据数据");
    }

    /**
     * 获取城乡环境监测数据详细信息
     */
    @PreAuthorize("@ss.hasPermi('EpidemSys:SAenvironment:query')")
    @GetMapping(value = "/{envAreaId}")
    public AjaxResult getInfo(@PathVariable("envAreaId") Long envAreaId)
    {
        return success(surveyAreaEnvironmentService.selectSurveyAreaEnvironmentByEnvAreaId(envAreaId));
    }

    /**
     * 新增城乡环境监测数据
     */
    @PreAuthorize("@ss.hasPermi('EpidemSys:SAenvironment:add')")
    @Log(title = "城乡环境监测数据", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody SurveyAreaEnvironment surveyAreaEnvironment)
    {
        return toAjax(surveyAreaEnvironmentService.insertSurveyAreaEnvironment(surveyAreaEnvironment));
    }

    /**
     * 修改城乡环境监测数据
     */
    @PreAuthorize("@ss.hasPermi('EpidemSys:SAenvironment:edit')")
    @Log(title = "城乡环境监测数据", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody SurveyAreaEnvironment surveyAreaEnvironment)
    {
        return toAjax(surveyAreaEnvironmentService.updateSurveyAreaEnvironment(surveyAreaEnvironment));
    }

    /**
     * 删除城乡环境监测数据
     */
    @PreAuthorize("@ss.hasPermi('EpidemSys:SAenvironment:remove')")
    @Log(title = "城乡环境监测数据", businessType = BusinessType.DELETE)
	@DeleteMapping("/{envAreaIds}")
    public AjaxResult remove(@PathVariable Long[] envAreaIds)
    {
        return toAjax(surveyAreaEnvironmentService.deleteSurveyAreaEnvironmentByEnvAreaIds(envAreaIds));
    }
}
