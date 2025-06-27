package com.ruoyi.ClinicalSys.controller;

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
import com.ruoyi.ClinicalSys.domain.InsuranceInfo;
import com.ruoyi.ClinicalSys.service.IInsuranceInfoService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 医保情况Controller
 * 
 * @author ruoyi
 * @date 2025-06-27
 */
@RestController
@RequestMapping("/ClinicalSys/info")
public class InsuranceInfoController extends BaseController
{
    @Autowired
    private IInsuranceInfoService insuranceInfoService;

    /**
     * 查询医保情况列表
     */
    @PreAuthorize("@ss.hasPermi('ClinicalSys:info:list')")
    @GetMapping("/list")
    public TableDataInfo list(InsuranceInfo insuranceInfo)
    {
        startPage();
        List<InsuranceInfo> list = insuranceInfoService.selectInsuranceInfoList(insuranceInfo);
        return getDataTable(list);
    }

    /**
     * 导出医保情况列表
     */
    @PreAuthorize("@ss.hasPermi('ClinicalSys:info:export')")
    @Log(title = "医保情况", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, InsuranceInfo insuranceInfo)
    {
        List<InsuranceInfo> list = insuranceInfoService.selectInsuranceInfoList(insuranceInfo);
        ExcelUtil<InsuranceInfo> util = new ExcelUtil<InsuranceInfo>(InsuranceInfo.class);
        util.exportExcel(response, list, "医保情况数据");
    }

    /**
     * 获取医保情况详细信息
     */
    @PreAuthorize("@ss.hasPermi('ClinicalSys:info:query')")
    @GetMapping(value = "/{insuranceId}")
    public AjaxResult getInfo(@PathVariable("insuranceId") Long insuranceId)
    {
        return success(insuranceInfoService.selectInsuranceInfoByInsuranceId(insuranceId));
    }

    /**
     * 新增医保情况
     */
    @PreAuthorize("@ss.hasPermi('ClinicalSys:info:add')")
    @Log(title = "医保情况", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody InsuranceInfo insuranceInfo)
    {
        return toAjax(insuranceInfoService.insertInsuranceInfo(insuranceInfo));
    }

    /**
     * 修改医保情况
     */
    @PreAuthorize("@ss.hasPermi('ClinicalSys:info:edit')")
    @Log(title = "医保情况", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody InsuranceInfo insuranceInfo)
    {
        return toAjax(insuranceInfoService.updateInsuranceInfo(insuranceInfo));
    }

    /**
     * 删除医保情况
     */
    @PreAuthorize("@ss.hasPermi('ClinicalSys:info:remove')")
    @Log(title = "医保情况", businessType = BusinessType.DELETE)
	@DeleteMapping("/{insuranceIds}")
    public AjaxResult remove(@PathVariable Long[] insuranceIds)
    {
        return toAjax(insuranceInfoService.deleteInsuranceInfoByInsuranceIds(insuranceIds));
    }
}
