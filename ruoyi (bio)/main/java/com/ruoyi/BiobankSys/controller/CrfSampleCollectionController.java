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
import com.ruoyi.BiobankSys.domain.CrfSampleCollection;
import com.ruoyi.BiobankSys.service.ICrfSampleCollectionService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 样本采集CRFController
 * 
 * @author ruoyi
 * @date 2025-06-27
 */
@RestController
@RequestMapping("/BiobankSys/collection")
public class CrfSampleCollectionController extends BaseController
{
    @Autowired
    private ICrfSampleCollectionService crfSampleCollectionService;

    /**
     * 查询样本采集CRF列表
     */
    @PreAuthorize("@ss.hasPermi('BiobankSys:collection:list')")
    @GetMapping("/list")
    public TableDataInfo list(CrfSampleCollection crfSampleCollection)
    {
        startPage();
        List<CrfSampleCollection> list = crfSampleCollectionService.selectCrfSampleCollectionList(crfSampleCollection);
        return getDataTable(list);
    }

    /**
     * 导出样本采集CRF列表
     */
    @PreAuthorize("@ss.hasPermi('BiobankSys:collection:export')")
    @Log(title = "样本采集CRF", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, CrfSampleCollection crfSampleCollection)
    {
        List<CrfSampleCollection> list = crfSampleCollectionService.selectCrfSampleCollectionList(crfSampleCollection);
        ExcelUtil<CrfSampleCollection> util = new ExcelUtil<CrfSampleCollection>(CrfSampleCollection.class);
        util.exportExcel(response, list, "样本采集CRF数据");
    }

    /**
     * 获取样本采集CRF详细信息
     */
    @PreAuthorize("@ss.hasPermi('BiobankSys:collection:query')")
    @GetMapping(value = "/{crfId}")
    public AjaxResult getInfo(@PathVariable("crfId") Long crfId)
    {
        return success(crfSampleCollectionService.selectCrfSampleCollectionByCrfId(crfId));
    }

    /**
     * 新增样本采集CRF
     */
    @PreAuthorize("@ss.hasPermi('BiobankSys:collection:add')")
    @Log(title = "样本采集CRF", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody CrfSampleCollection crfSampleCollection)
    {
        return toAjax(crfSampleCollectionService.insertCrfSampleCollection(crfSampleCollection));
    }

    /**
     * 修改样本采集CRF
     */
    @PreAuthorize("@ss.hasPermi('BiobankSys:collection:edit')")
    @Log(title = "样本采集CRF", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody CrfSampleCollection crfSampleCollection)
    {
        return toAjax(crfSampleCollectionService.updateCrfSampleCollection(crfSampleCollection));
    }

    /**
     * 删除样本采集CRF
     */
    @PreAuthorize("@ss.hasPermi('BiobankSys:collection:remove')")
    @Log(title = "样本采集CRF", businessType = BusinessType.DELETE)
	@DeleteMapping("/{crfIds}")
    public AjaxResult remove(@PathVariable Long[] crfIds)
    {
        return toAjax(crfSampleCollectionService.deleteCrfSampleCollectionByCrfIds(crfIds));
    }
}
