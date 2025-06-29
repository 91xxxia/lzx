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
import com.ruoyi.EpidemSys.domain.FamilyHistorySecondary;
import com.ruoyi.EpidemSys.service.IFamilyHistorySecondaryService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 二级亲属过敏史Controller
 * 
 * @author ruoyi
 * @date 2025-06-28
 */
@RestController
@RequestMapping("/EpidemSys/secondary")
public class FamilyHistorySecondaryController extends BaseController
{
    @Autowired
    private IFamilyHistorySecondaryService familyHistorySecondaryService;

    /**
     * 查询二级亲属过敏史列表
     */
    @PreAuthorize("@ss.hasPermi('EpidemSys:secondary:list')")
    @GetMapping("/list")
    public TableDataInfo list(FamilyHistorySecondary familyHistorySecondary)
    {
        startPage();
        List<FamilyHistorySecondary> list = familyHistorySecondaryService.selectFamilyHistorySecondaryList(familyHistorySecondary);
        return getDataTable(list);
    }

    /**
     * 导出二级亲属过敏史列表
     */
    @PreAuthorize("@ss.hasPermi('EpidemSys:secondary:export')")
    @Log(title = "二级亲属过敏史", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, FamilyHistorySecondary familyHistorySecondary)
    {
        List<FamilyHistorySecondary> list = familyHistorySecondaryService.selectFamilyHistorySecondaryList(familyHistorySecondary);
        ExcelUtil<FamilyHistorySecondary> util = new ExcelUtil<FamilyHistorySecondary>(FamilyHistorySecondary.class);
        util.exportExcel(response, list, "二级亲属过敏史数据");
    }

    /**
     * 获取二级亲属过敏史详细信息
     */
    @PreAuthorize("@ss.hasPermi('EpidemSys:secondary:query')")
    @GetMapping(value = "/{secId}")
    public AjaxResult getInfo(@PathVariable("secId") Long secId)
    {
        return success(familyHistorySecondaryService.selectFamilyHistorySecondaryBySecId(secId));
    }

    /**
     * 新增二级亲属过敏史
     */
    @PreAuthorize("@ss.hasPermi('EpidemSys:secondary:add')")
    @Log(title = "二级亲属过敏史", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody FamilyHistorySecondary familyHistorySecondary)
    {
        return toAjax(familyHistorySecondaryService.insertFamilyHistorySecondary(familyHistorySecondary));
    }

    /**
     * 修改二级亲属过敏史
     */
    @PreAuthorize("@ss.hasPermi('EpidemSys:secondary:edit')")
    @Log(title = "二级亲属过敏史", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody FamilyHistorySecondary familyHistorySecondary)
    {
        return toAjax(familyHistorySecondaryService.updateFamilyHistorySecondary(familyHistorySecondary));
    }

    /**
     * 删除二级亲属过敏史
     */
    @PreAuthorize("@ss.hasPermi('EpidemSys:secondary:remove')")
    @Log(title = "二级亲属过敏史", businessType = BusinessType.DELETE)
	@DeleteMapping("/{secIds}")
    public AjaxResult remove(@PathVariable Long[] secIds)
    {
        return toAjax(familyHistorySecondaryService.deleteFamilyHistorySecondaryBySecIds(secIds));
    }
}
