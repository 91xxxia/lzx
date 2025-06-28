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
import com.ruoyi.FollowSys.domain.DrugCatalog;
import com.ruoyi.FollowSys.service.IDrugCatalogService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 药物记录Controller
 * 
 * @author ruoyi
 * @date 2025-06-28
 */
@RestController
@RequestMapping("/FollowSys/catalog")
public class DrugCatalogController extends BaseController
{
    @Autowired
    private IDrugCatalogService drugCatalogService;

    /**
     * 查询药物记录列表
     */
    @PreAuthorize("@ss.hasPermi('FollowSys:catalog:list')")
    @GetMapping("/list")
    public TableDataInfo list(DrugCatalog drugCatalog)
    {
        startPage();
        List<DrugCatalog> list = drugCatalogService.selectDrugCatalogList(drugCatalog);
        return getDataTable(list);
    }

    /**
     * 导出药物记录列表
     */
    @PreAuthorize("@ss.hasPermi('FollowSys:catalog:export')")
    @Log(title = "药物记录", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, DrugCatalog drugCatalog)
    {
        List<DrugCatalog> list = drugCatalogService.selectDrugCatalogList(drugCatalog);
        ExcelUtil<DrugCatalog> util = new ExcelUtil<DrugCatalog>(DrugCatalog.class);
        util.exportExcel(response, list, "药物记录数据");
    }

    /**
     * 获取药物记录详细信息
     */
    @PreAuthorize("@ss.hasPermi('FollowSys:catalog:query')")
    @GetMapping(value = "/{drugId}")
    public AjaxResult getInfo(@PathVariable("drugId") Long drugId)
    {
        return success(drugCatalogService.selectDrugCatalogByDrugId(drugId));
    }

    /**
     * 新增药物记录
     */
    @PreAuthorize("@ss.hasPermi('FollowSys:catalog:add')")
    @Log(title = "药物记录", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody DrugCatalog drugCatalog)
    {
        return toAjax(drugCatalogService.insertDrugCatalog(drugCatalog));
    }

    /**
     * 修改药物记录
     */
    @PreAuthorize("@ss.hasPermi('FollowSys:catalog:edit')")
    @Log(title = "药物记录", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody DrugCatalog drugCatalog)
    {
        return toAjax(drugCatalogService.updateDrugCatalog(drugCatalog));
    }

    /**
     * 删除药物记录
     */
    @PreAuthorize("@ss.hasPermi('FollowSys:catalog:remove')")
    @Log(title = "药物记录", businessType = BusinessType.DELETE)
	@DeleteMapping("/{drugIds}")
    public AjaxResult remove(@PathVariable Long[] drugIds)
    {
        return toAjax(drugCatalogService.deleteDrugCatalogByDrugIds(drugIds));
    }
}
