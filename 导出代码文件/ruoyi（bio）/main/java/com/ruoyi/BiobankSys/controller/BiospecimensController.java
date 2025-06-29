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
import com.ruoyi.BiobankSys.domain.Biospecimens;
import com.ruoyi.BiobankSys.service.IBiospecimensService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 样本采集主表Controller
 * 
 * @author ruoyi
 * @date 2025-06-29
 */
@RestController
@RequestMapping("/BiobankSys/biospecimens")
public class BiospecimensController extends BaseController
{
    @Autowired
    private IBiospecimensService biospecimensService;

    /**
     * 查询样本采集主表列表
     */
    @PreAuthorize("@ss.hasPermi('BiobankSys:biospecimens:list')")
    @GetMapping("/list")
    public TableDataInfo list(Biospecimens biospecimens)
    {
        startPage();
        List<Biospecimens> list = biospecimensService.selectBiospecimensList(biospecimens);
        return getDataTable(list);
    }

    /**
     * 导出样本采集主表列表
     */
    @PreAuthorize("@ss.hasPermi('BiobankSys:biospecimens:export')")
    @Log(title = "样本采集主表", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Biospecimens biospecimens)
    {
        List<Biospecimens> list = biospecimensService.selectBiospecimensList(biospecimens);
        ExcelUtil<Biospecimens> util = new ExcelUtil<Biospecimens>(Biospecimens.class);
        util.exportExcel(response, list, "样本采集主表数据");
    }

    /**
     * 获取样本采集主表详细信息
     */
    @PreAuthorize("@ss.hasPermi('BiobankSys:biospecimens:query')")
    @GetMapping(value = "/{specimenId}")
    public AjaxResult getInfo(@PathVariable("specimenId") String specimenId)
    {
        return success(biospecimensService.selectBiospecimensBySpecimenId(specimenId));
    }

    /**
     * 新增样本采集主表
     */
    @PreAuthorize("@ss.hasPermi('BiobankSys:biospecimens:add')")
    @Log(title = "样本采集主表", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Biospecimens biospecimens)
    {
        return toAjax(biospecimensService.insertBiospecimens(biospecimens));
    }

    /**
     * 修改样本采集主表
     */
    @PreAuthorize("@ss.hasPermi('BiobankSys:biospecimens:edit')")
    @Log(title = "样本采集主表", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Biospecimens biospecimens)
    {
        return toAjax(biospecimensService.updateBiospecimens(biospecimens));
    }

    /**
     * 删除样本采集主表
     */
    @PreAuthorize("@ss.hasPermi('BiobankSys:biospecimens:remove')")
    @Log(title = "样本采集主表", businessType = BusinessType.DELETE)
	@DeleteMapping("/{specimenIds}")
    public AjaxResult remove(@PathVariable String[] specimenIds)
    {
        return toAjax(biospecimensService.deleteBiospecimensBySpecimenIds(specimenIds));
    }
}
