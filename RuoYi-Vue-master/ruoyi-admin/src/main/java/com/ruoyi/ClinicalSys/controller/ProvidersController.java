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
import com.ruoyi.ClinicalSys.domain.Providers;
import com.ruoyi.ClinicalSys.service.IProvidersService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 医疗服务者标识信息Controller
 * 
 * @author ruoyi
 * @date 2025-06-27
 */
@RestController
@RequestMapping("/ClinicalSys/providers")
public class ProvidersController extends BaseController
{
    @Autowired
    private IProvidersService providersService;

    /**
     * 查询医疗服务者标识信息列表
     */
    @PreAuthorize("@ss.hasPermi('ClinicalSys:providers:list')")
    @GetMapping("/list")
    public TableDataInfo list(Providers providers)
    {
        startPage();
        List<Providers> list = providersService.selectProvidersList(providers);
        return getDataTable(list);
    }

    /**
     * 导出医疗服务者标识信息列表
     */
    @PreAuthorize("@ss.hasPermi('ClinicalSys:providers:export')")
    @Log(title = "医疗服务者标识信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Providers providers)
    {
        List<Providers> list = providersService.selectProvidersList(providers);
        ExcelUtil<Providers> util = new ExcelUtil<Providers>(Providers.class);
        util.exportExcel(response, list, "医疗服务者标识信息数据");
    }

    /**
     * 获取医疗服务者标识信息详细信息
     */
    @PreAuthorize("@ss.hasPermi('ClinicalSys:providers:query')")
    @GetMapping(value = "/{providerId}")
    public AjaxResult getInfo(@PathVariable("providerId") Long providerId)
    {
        return success(providersService.selectProvidersByProviderId(providerId));
    }

    /**
     * 新增医疗服务者标识信息
     */
    @PreAuthorize("@ss.hasPermi('ClinicalSys:providers:add')")
    @Log(title = "医疗服务者标识信息", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Providers providers)
    {
        return toAjax(providersService.insertProviders(providers));
    }

    /**
     * 修改医疗服务者标识信息
     */
    @PreAuthorize("@ss.hasPermi('ClinicalSys:providers:edit')")
    @Log(title = "医疗服务者标识信息", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Providers providers)
    {
        return toAjax(providersService.updateProviders(providers));
    }

    /**
     * 删除医疗服务者标识信息
     */
    @PreAuthorize("@ss.hasPermi('ClinicalSys:providers:remove')")
    @Log(title = "医疗服务者标识信息", businessType = BusinessType.DELETE)
	@DeleteMapping("/{providerIds}")
    public AjaxResult remove(@PathVariable Long[] providerIds)
    {
        return toAjax(providersService.deleteProvidersByProviderIds(providerIds));
    }
}
