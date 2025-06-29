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
import com.ruoyi.FollowSys.domain.FollowupEndoscopy;
import com.ruoyi.FollowSys.service.IFollowupEndoscopyService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 电子鼻咽喉镜Controller
 * 
 * @author ruoyi
 * @date 2025-06-28
 */
@RestController
@RequestMapping("/FollowSys/endoscopy")
public class FollowupEndoscopyController extends BaseController
{
    @Autowired
    private IFollowupEndoscopyService followupEndoscopyService;

    /**
     * 查询电子鼻咽喉镜列表
     */
    @PreAuthorize("@ss.hasPermi('FollowSys:endoscopy:list')")
    @GetMapping("/list")
    public TableDataInfo list(FollowupEndoscopy followupEndoscopy)
    {
        startPage();
        List<FollowupEndoscopy> list = followupEndoscopyService.selectFollowupEndoscopyList(followupEndoscopy);
        return getDataTable(list);
    }

    /**
     * 导出电子鼻咽喉镜列表
     */
    @PreAuthorize("@ss.hasPermi('FollowSys:endoscopy:export')")
    @Log(title = "电子鼻咽喉镜", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, FollowupEndoscopy followupEndoscopy)
    {
        List<FollowupEndoscopy> list = followupEndoscopyService.selectFollowupEndoscopyList(followupEndoscopy);
        ExcelUtil<FollowupEndoscopy> util = new ExcelUtil<FollowupEndoscopy>(FollowupEndoscopy.class);
        util.exportExcel(response, list, "电子鼻咽喉镜数据");
    }

    /**
     * 获取电子鼻咽喉镜详细信息
     */
    @PreAuthorize("@ss.hasPermi('FollowSys:endoscopy:query')")
    @GetMapping(value = "/{endoscopyId}")
    public AjaxResult getInfo(@PathVariable("endoscopyId") Long endoscopyId)
    {
        return success(followupEndoscopyService.selectFollowupEndoscopyByEndoscopyId(endoscopyId));
    }

    /**
     * 新增电子鼻咽喉镜
     */
    @PreAuthorize("@ss.hasPermi('FollowSys:endoscopy:add')")
    @Log(title = "电子鼻咽喉镜", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody FollowupEndoscopy followupEndoscopy)
    {
        return toAjax(followupEndoscopyService.insertFollowupEndoscopy(followupEndoscopy));
    }

    /**
     * 修改电子鼻咽喉镜
     */
    @PreAuthorize("@ss.hasPermi('FollowSys:endoscopy:edit')")
    @Log(title = "电子鼻咽喉镜", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody FollowupEndoscopy followupEndoscopy)
    {
        return toAjax(followupEndoscopyService.updateFollowupEndoscopy(followupEndoscopy));
    }

    /**
     * 删除电子鼻咽喉镜
     */
    @PreAuthorize("@ss.hasPermi('FollowSys:endoscopy:remove')")
    @Log(title = "电子鼻咽喉镜", businessType = BusinessType.DELETE)
	@DeleteMapping("/{endoscopyIds}")
    public AjaxResult remove(@PathVariable Long[] endoscopyIds)
    {
        return toAjax(followupEndoscopyService.deleteFollowupEndoscopyByEndoscopyIds(endoscopyIds));
    }
}
