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
import com.ruoyi.FollowSys.domain.FollowupQuestionnaireScores;
import com.ruoyi.FollowSys.service.IFollowupQuestionnaireScoresService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 调查问卷Controller
 * 
 * @author ruoyi
 * @date 2025-06-28
 */
@RestController
@RequestMapping("/FollowSys/scores")
public class FollowupQuestionnaireScoresController extends BaseController
{
    @Autowired
    private IFollowupQuestionnaireScoresService followupQuestionnaireScoresService;

    /**
     * 查询调查问卷列表
     */
    @PreAuthorize("@ss.hasPermi('FollowSys:scores:list')")
    @GetMapping("/list")
    public TableDataInfo list(FollowupQuestionnaireScores followupQuestionnaireScores)
    {
        startPage();
        List<FollowupQuestionnaireScores> list = followupQuestionnaireScoresService.selectFollowupQuestionnaireScoresList(followupQuestionnaireScores);
        return getDataTable(list);
    }

    /**
     * 导出调查问卷列表
     */
    @PreAuthorize("@ss.hasPermi('FollowSys:scores:export')")
    @Log(title = "调查问卷", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, FollowupQuestionnaireScores followupQuestionnaireScores)
    {
        List<FollowupQuestionnaireScores> list = followupQuestionnaireScoresService.selectFollowupQuestionnaireScoresList(followupQuestionnaireScores);
        ExcelUtil<FollowupQuestionnaireScores> util = new ExcelUtil<FollowupQuestionnaireScores>(FollowupQuestionnaireScores.class);
        util.exportExcel(response, list, "调查问卷数据");
    }

    /**
     * 获取调查问卷详细信息
     */
    @PreAuthorize("@ss.hasPermi('FollowSys:scores:query')")
    @GetMapping(value = "/{questionnaireId}")
    public AjaxResult getInfo(@PathVariable("questionnaireId") Long questionnaireId)
    {
        return success(followupQuestionnaireScoresService.selectFollowupQuestionnaireScoresByQuestionnaireId(questionnaireId));
    }

    /**
     * 新增调查问卷
     */
    @PreAuthorize("@ss.hasPermi('FollowSys:scores:add')")
    @Log(title = "调查问卷", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody FollowupQuestionnaireScores followupQuestionnaireScores)
    {
        return toAjax(followupQuestionnaireScoresService.insertFollowupQuestionnaireScores(followupQuestionnaireScores));
    }

    /**
     * 修改调查问卷
     */
    @PreAuthorize("@ss.hasPermi('FollowSys:scores:edit')")
    @Log(title = "调查问卷", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody FollowupQuestionnaireScores followupQuestionnaireScores)
    {
        return toAjax(followupQuestionnaireScoresService.updateFollowupQuestionnaireScores(followupQuestionnaireScores));
    }

    /**
     * 删除调查问卷
     */
    @PreAuthorize("@ss.hasPermi('FollowSys:scores:remove')")
    @Log(title = "调查问卷", businessType = BusinessType.DELETE)
	@DeleteMapping("/{questionnaireIds}")
    public AjaxResult remove(@PathVariable Long[] questionnaireIds)
    {
        return toAjax(followupQuestionnaireScoresService.deleteFollowupQuestionnaireScoresByQuestionnaireIds(questionnaireIds));
    }
}
