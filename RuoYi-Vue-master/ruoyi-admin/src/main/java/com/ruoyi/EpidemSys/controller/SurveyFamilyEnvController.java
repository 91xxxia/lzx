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
import com.ruoyi.EpidemSys.domain.SurveyFamilyEnv;
import com.ruoyi.EpidemSys.service.ISurveyFamilyEnvService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 家族环境居住相似性Controller
 * 
 * @author ruoyi
 * @date 2025-06-28
 */
@RestController
@RequestMapping("/EpidemSys/SFenv")
public class SurveyFamilyEnvController extends BaseController
{
    @Autowired
    private ISurveyFamilyEnvService surveyFamilyEnvService;

    /**
     * 查询家族环境居住相似性列表
     */
    @PreAuthorize("@ss.hasPermi('EpidemSys:SFenv:list')")
    @GetMapping("/list")
    public TableDataInfo list(SurveyFamilyEnv surveyFamilyEnv)
    {
        startPage();
        List<SurveyFamilyEnv> list = surveyFamilyEnvService.selectSurveyFamilyEnvList(surveyFamilyEnv);
        return getDataTable(list);
    }

    /**
     * 导出家族环境居住相似性列表
     */
    @PreAuthorize("@ss.hasPermi('EpidemSys:SFenv:export')")
    @Log(title = "家族环境居住相似性", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, SurveyFamilyEnv surveyFamilyEnv)
    {
        List<SurveyFamilyEnv> list = surveyFamilyEnvService.selectSurveyFamilyEnvList(surveyFamilyEnv);
        ExcelUtil<SurveyFamilyEnv> util = new ExcelUtil<SurveyFamilyEnv>(SurveyFamilyEnv.class);
        util.exportExcel(response, list, "家族环境居住相似性数据");
    }

    /**
     * 获取家族环境居住相似性详细信息
     */
    @PreAuthorize("@ss.hasPermi('EpidemSys:SFenv:query')")
    @GetMapping(value = "/{familyEnvId}")
    public AjaxResult getInfo(@PathVariable("familyEnvId") Long familyEnvId)
    {
        return success(surveyFamilyEnvService.selectSurveyFamilyEnvByFamilyEnvId(familyEnvId));
    }

    /**
     * 新增家族环境居住相似性
     */
    @PreAuthorize("@ss.hasPermi('EpidemSys:SFenv:add')")
    @Log(title = "家族环境居住相似性", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody SurveyFamilyEnv surveyFamilyEnv)
    {
        return toAjax(surveyFamilyEnvService.insertSurveyFamilyEnv(surveyFamilyEnv));
    }

    /**
     * 修改家族环境居住相似性
     */
    @PreAuthorize("@ss.hasPermi('EpidemSys:SFenv:edit')")
    @Log(title = "家族环境居住相似性", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody SurveyFamilyEnv surveyFamilyEnv)
    {
        return toAjax(surveyFamilyEnvService.updateSurveyFamilyEnv(surveyFamilyEnv));
    }

    /**
     * 删除家族环境居住相似性
     */
    @PreAuthorize("@ss.hasPermi('EpidemSys:SFenv:remove')")
    @Log(title = "家族环境居住相似性", businessType = BusinessType.DELETE)
	@DeleteMapping("/{familyEnvIds}")
    public AjaxResult remove(@PathVariable Long[] familyEnvIds)
    {
        return toAjax(surveyFamilyEnvService.deleteSurveyFamilyEnvByFamilyEnvIds(familyEnvIds));
    }
}
