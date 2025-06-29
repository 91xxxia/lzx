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
import com.ruoyi.EpidemSys.domain.FamilyHistoryPrimary;
import com.ruoyi.EpidemSys.service.IFamilyHistoryPrimaryService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 一级亲属过敏史Controller
 * 
 * @author ruoyi
 * @date 2025-06-28
 */
@RestController
@RequestMapping("/EpidemSys/primary")
public class FamilyHistoryPrimaryController extends BaseController
{
    @Autowired
    private IFamilyHistoryPrimaryService familyHistoryPrimaryService;

    /**
     * 查询一级亲属过敏史列表
     */
    @PreAuthorize("@ss.hasPermi('EpidemSys:primary:list')")
    @GetMapping("/list")
    public TableDataInfo list(FamilyHistoryPrimary familyHistoryPrimary)
    {
        startPage();
        List<FamilyHistoryPrimary> list = familyHistoryPrimaryService.selectFamilyHistoryPrimaryList(familyHistoryPrimary);
        return getDataTable(list);
    }

    /**
     * 导出一级亲属过敏史列表
     */
    @PreAuthorize("@ss.hasPermi('EpidemSys:primary:export')")
    @Log(title = "一级亲属过敏史", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, FamilyHistoryPrimary familyHistoryPrimary)
    {
        List<FamilyHistoryPrimary> list = familyHistoryPrimaryService.selectFamilyHistoryPrimaryList(familyHistoryPrimary);
        ExcelUtil<FamilyHistoryPrimary> util = new ExcelUtil<FamilyHistoryPrimary>(FamilyHistoryPrimary.class);
        util.exportExcel(response, list, "一级亲属过敏史数据");
    }

    /**
     * 获取一级亲属过敏史详细信息
     */
    @PreAuthorize("@ss.hasPermi('EpidemSys:primary:query')")
    @GetMapping(value = "/{primId}")
    public AjaxResult getInfo(@PathVariable("primId") Long primId)
    {
        return success(familyHistoryPrimaryService.selectFamilyHistoryPrimaryByPrimId(primId));
    }

    /**
     * 新增一级亲属过敏史
     */
    @PreAuthorize("@ss.hasPermi('EpidemSys:primary:add')")
    @Log(title = "一级亲属过敏史", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody FamilyHistoryPrimary familyHistoryPrimary)
    {
        return toAjax(familyHistoryPrimaryService.insertFamilyHistoryPrimary(familyHistoryPrimary));
    }

    /**
     * 修改一级亲属过敏史
     */
    @PreAuthorize("@ss.hasPermi('EpidemSys:primary:edit')")
    @Log(title = "一级亲属过敏史", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody FamilyHistoryPrimary familyHistoryPrimary)
    {
        return toAjax(familyHistoryPrimaryService.updateFamilyHistoryPrimary(familyHistoryPrimary));
    }

    /**
     * 删除一级亲属过敏史
     */
    @PreAuthorize("@ss.hasPermi('EpidemSys:primary:remove')")
    @Log(title = "一级亲属过敏史", businessType = BusinessType.DELETE)
	@DeleteMapping("/{primIds}")
    public AjaxResult remove(@PathVariable Long[] primIds)
    {
        return toAjax(familyHistoryPrimaryService.deleteFamilyHistoryPrimaryByPrimIds(primIds));
    }
}
