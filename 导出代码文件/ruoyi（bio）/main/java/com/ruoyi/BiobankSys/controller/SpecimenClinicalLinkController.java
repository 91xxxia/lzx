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
import com.ruoyi.BiobankSys.domain.SpecimenClinicalLink;
import com.ruoyi.BiobankSys.service.ISpecimenClinicalLinkService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 样本临床关联Controller
 * 
 * @author ruoyi
 * @date 2025-06-29
 */
@RestController
@RequestMapping("/BiobankSys/link")
public class SpecimenClinicalLinkController extends BaseController
{
    @Autowired
    private ISpecimenClinicalLinkService specimenClinicalLinkService;

    /**
     * 查询样本临床关联列表
     */
    @PreAuthorize("@ss.hasPermi('BiobankSys:link:list')")
    @GetMapping("/list")
    public TableDataInfo list(SpecimenClinicalLink specimenClinicalLink)
    {
        startPage();
        List<SpecimenClinicalLink> list = specimenClinicalLinkService.selectSpecimenClinicalLinkList(specimenClinicalLink);
        return getDataTable(list);
    }

    /**
     * 导出样本临床关联列表
     */
    @PreAuthorize("@ss.hasPermi('BiobankSys:link:export')")
    @Log(title = "样本临床关联", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, SpecimenClinicalLink specimenClinicalLink)
    {
        List<SpecimenClinicalLink> list = specimenClinicalLinkService.selectSpecimenClinicalLinkList(specimenClinicalLink);
        ExcelUtil<SpecimenClinicalLink> util = new ExcelUtil<SpecimenClinicalLink>(SpecimenClinicalLink.class);
        util.exportExcel(response, list, "样本临床关联数据");
    }

    /**
     * 获取样本临床关联详细信息
     */
    @PreAuthorize("@ss.hasPermi('BiobankSys:link:query')")
    @GetMapping(value = "/{linkId}")
    public AjaxResult getInfo(@PathVariable("linkId") Long linkId)
    {
        return success(specimenClinicalLinkService.selectSpecimenClinicalLinkByLinkId(linkId));
    }

    /**
     * 新增样本临床关联
     */
    @PreAuthorize("@ss.hasPermi('BiobankSys:link:add')")
    @Log(title = "样本临床关联", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody SpecimenClinicalLink specimenClinicalLink)
    {
        return toAjax(specimenClinicalLinkService.insertSpecimenClinicalLink(specimenClinicalLink));
    }

    /**
     * 修改样本临床关联
     */
    @PreAuthorize("@ss.hasPermi('BiobankSys:link:edit')")
    @Log(title = "样本临床关联", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody SpecimenClinicalLink specimenClinicalLink)
    {
        return toAjax(specimenClinicalLinkService.updateSpecimenClinicalLink(specimenClinicalLink));
    }

    /**
     * 删除样本临床关联
     */
    @PreAuthorize("@ss.hasPermi('BiobankSys:link:remove')")
    @Log(title = "样本临床关联", businessType = BusinessType.DELETE)
	@DeleteMapping("/{linkIds}")
    public AjaxResult remove(@PathVariable Long[] linkIds)
    {
        return toAjax(specimenClinicalLinkService.deleteSpecimenClinicalLinkByLinkIds(linkIds));
    }
}
