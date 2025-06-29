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
import com.ruoyi.BiobankSys.domain.SpecimenQc;
import com.ruoyi.BiobankSys.service.ISpecimenQcService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 样本质量控制Controller
 * 
 * @author ruoyi
 * @date 2025-06-29
 */
@RestController
@RequestMapping("/BiobankSys/qc")
public class SpecimenQcController extends BaseController
{
    @Autowired
    private ISpecimenQcService specimenQcService;

    /**
     * 查询样本质量控制列表
     */
    @PreAuthorize("@ss.hasPermi('BiobankSys:qc:list')")
    @GetMapping("/list")
    public TableDataInfo list(SpecimenQc specimenQc)
    {
        startPage();
        List<SpecimenQc> list = specimenQcService.selectSpecimenQcList(specimenQc);
        return getDataTable(list);
    }

    /**
     * 导出样本质量控制列表
     */
    @PreAuthorize("@ss.hasPermi('BiobankSys:qc:export')")
    @Log(title = "样本质量控制", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, SpecimenQc specimenQc)
    {
        List<SpecimenQc> list = specimenQcService.selectSpecimenQcList(specimenQc);
        ExcelUtil<SpecimenQc> util = new ExcelUtil<SpecimenQc>(SpecimenQc.class);
        util.exportExcel(response, list, "样本质量控制数据");
    }

    /**
     * 获取样本质量控制详细信息
     */
    @PreAuthorize("@ss.hasPermi('BiobankSys:qc:query')")
    @GetMapping(value = "/{qcId}")
    public AjaxResult getInfo(@PathVariable("qcId") Long qcId)
    {
        return success(specimenQcService.selectSpecimenQcByQcId(qcId));
    }

    /**
     * 新增样本质量控制
     */
    @PreAuthorize("@ss.hasPermi('BiobankSys:qc:add')")
    @Log(title = "样本质量控制", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody SpecimenQc specimenQc)
    {
        return toAjax(specimenQcService.insertSpecimenQc(specimenQc));
    }

    /**
     * 修改样本质量控制
     */
    @PreAuthorize("@ss.hasPermi('BiobankSys:qc:edit')")
    @Log(title = "样本质量控制", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody SpecimenQc specimenQc)
    {
        return toAjax(specimenQcService.updateSpecimenQc(specimenQc));
    }

    /**
     * 删除样本质量控制
     */
    @PreAuthorize("@ss.hasPermi('BiobankSys:qc:remove')")
    @Log(title = "样本质量控制", businessType = BusinessType.DELETE)
	@DeleteMapping("/{qcIds}")
    public AjaxResult remove(@PathVariable Long[] qcIds)
    {
        return toAjax(specimenQcService.deleteSpecimenQcByQcIds(qcIds));
    }
}
