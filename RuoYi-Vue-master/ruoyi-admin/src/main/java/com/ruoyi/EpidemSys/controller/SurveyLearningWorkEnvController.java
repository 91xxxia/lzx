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
import com.ruoyi.EpidemSys.domain.SurveyLearningWorkEnv;
import com.ruoyi.EpidemSys.service.ISurveyLearningWorkEnvService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 学习/工作环境信息Controller
 * 
 * @author ruoyi
 * @date 2025-06-28
 */
@RestController
@RequestMapping("/EpidemSys/StudyLearnenv")
public class SurveyLearningWorkEnvController extends BaseController
{
    @Autowired
    private ISurveyLearningWorkEnvService surveyLearningWorkEnvService;

    /**
     * 查询学习/工作环境信息列表
     */
    @PreAuthorize("@ss.hasPermi('EpidemSys:StudyLearnenv:list')")
    @GetMapping("/list")
    public TableDataInfo list(SurveyLearningWorkEnv surveyLearningWorkEnv)
    {
        startPage();
        List<SurveyLearningWorkEnv> list = surveyLearningWorkEnvService.selectSurveyLearningWorkEnvList(surveyLearningWorkEnv);
        return getDataTable(list);
    }

    /**
     * 导出学习/工作环境信息列表
     */
    @PreAuthorize("@ss.hasPermi('EpidemSys:StudyLearnenv:export')")
    @Log(title = "学习/工作环境信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, SurveyLearningWorkEnv surveyLearningWorkEnv)
    {
        List<SurveyLearningWorkEnv> list = surveyLearningWorkEnvService.selectSurveyLearningWorkEnvList(surveyLearningWorkEnv);
        ExcelUtil<SurveyLearningWorkEnv> util = new ExcelUtil<SurveyLearningWorkEnv>(SurveyLearningWorkEnv.class);
        util.exportExcel(response, list, "学习/工作环境信息数据");
    }

    /**
     * 获取学习/工作环境信息详细信息
     */
    @PreAuthorize("@ss.hasPermi('EpidemSys:StudyLearnenv:query')")
    @GetMapping(value = "/{learnEnvId}")
    public AjaxResult getInfo(@PathVariable("learnEnvId") Long learnEnvId)
    {
        return success(surveyLearningWorkEnvService.selectSurveyLearningWorkEnvByLearnEnvId(learnEnvId));
    }

    /**
     * 新增学习/工作环境信息
     */
    @PreAuthorize("@ss.hasPermi('EpidemSys:StudyLearnenv:add')")
    @Log(title = "学习/工作环境信息", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody SurveyLearningWorkEnv surveyLearningWorkEnv)
    {
        return toAjax(surveyLearningWorkEnvService.insertSurveyLearningWorkEnv(surveyLearningWorkEnv));
    }

    /**
     * 修改学习/工作环境信息
     */
    @PreAuthorize("@ss.hasPermi('EpidemSys:StudyLearnenv:edit')")
    @Log(title = "学习/工作环境信息", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody SurveyLearningWorkEnv surveyLearningWorkEnv)
    {
        return toAjax(surveyLearningWorkEnvService.updateSurveyLearningWorkEnv(surveyLearningWorkEnv));
    }

    /**
     * 删除学习/工作环境信息
     */
    @PreAuthorize("@ss.hasPermi('EpidemSys:StudyLearnenv:remove')")
    @Log(title = "学习/工作环境信息", businessType = BusinessType.DELETE)
	@DeleteMapping("/{learnEnvIds}")
    public AjaxResult remove(@PathVariable Long[] learnEnvIds)
    {
        return toAjax(surveyLearningWorkEnvService.deleteSurveyLearningWorkEnvByLearnEnvIds(learnEnvIds));
    }
}
