package com.ruoyi.BiobankSys.controller;

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
import com.ruoyi.BiobankSys.domain.SpecimenStorage;
import com.ruoyi.BiobankSys.service.ISpecimenStorageService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 样本存储条件Controller
 * 
 * @author ruoyi
 * @date 2025-06-27
 */
@RestController
@RequestMapping("/BiobankSys/storage")
public class SpecimenStorageController extends BaseController
{
    @Autowired
    private ISpecimenStorageService specimenStorageService;

    /**
     * 查询样本存储条件列表
     */
    @PreAuthorize("@ss.hasPermi('BiobankSys:storage:list')")
    @GetMapping("/list")
    public TableDataInfo list(SpecimenStorage specimenStorage)
    {
        startPage();
        List<SpecimenStorage> list = specimenStorageService.selectSpecimenStorageList(specimenStorage);
        return getDataTable(list);
    }

    /**
     * 导出样本存储条件列表
     */
    @PreAuthorize("@ss.hasPermi('BiobankSys:storage:export')")
    @Log(title = "样本存储条件", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, SpecimenStorage specimenStorage)
    {
        List<SpecimenStorage> list = specimenStorageService.selectSpecimenStorageList(specimenStorage);
        ExcelUtil<SpecimenStorage> util = new ExcelUtil<SpecimenStorage>(SpecimenStorage.class);
        util.exportExcel(response, list, "样本存储条件数据");
    }

    /**
     * 获取样本存储条件详细信息
     */
    @PreAuthorize("@ss.hasPermi('BiobankSys:storage:query')")
    @GetMapping(value = "/{storageId}")
    public AjaxResult getInfo(@PathVariable("storageId") Long storageId)
    {
        return success(specimenStorageService.selectSpecimenStorageByStorageId(storageId));
    }

    /**
     * 新增样本存储条件
     */
    @PreAuthorize("@ss.hasPermi('BiobankSys:storage:add')")
    @Log(title = "样本存储条件", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody SpecimenStorage specimenStorage)
    {
        return toAjax(specimenStorageService.insertSpecimenStorage(specimenStorage));
    }

    /**
     * 修改样本存储条件
     */
    @PreAuthorize("@ss.hasPermi('BiobankSys:storage:edit')")
    @Log(title = "样本存储条件", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody SpecimenStorage specimenStorage)
    {
        return toAjax(specimenStorageService.updateSpecimenStorage(specimenStorage));
    }

    /**
     * 删除样本存储条件
     */
    @PreAuthorize("@ss.hasPermi('BiobankSys:storage:remove')")
    @Log(title = "样本存储条件", businessType = BusinessType.DELETE)
	@DeleteMapping("/{storageIds}")
    public AjaxResult remove(@PathVariable Long[] storageIds)
    {
        return toAjax(specimenStorageService.deleteSpecimenStorageByStorageIds(storageIds));
    }
}
